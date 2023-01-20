package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import article.model.Article;
import article.model.Writer;
import article.service.WriteRequest;
import jdbc.JdbcUtil;

public class ArticleDAO {
	
	
	//insert
	
	//select
	public List<Article> select(Connection conn, int listSize, int pageNo) {
		StringBuffer sql = new StringBuffer();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		sql.append("select article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, isshow");
		sql.append(" from article");
		sql.append(" where isshow='Y'");
		sql.append(" order by regdate desc limit ?,?");
		try {
			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, pageNo);
			psmt.setInt(2, listSize);
			rs = psmt.executeQuery();
			List<Article> list = new ArrayList<>();

			while(rs.next()) {
				
				list.add(convertArticle(rs));
			}
			
			return list;
			
		} catch (SQLException e) {
			System.out.println("catch절 오류발생");
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(psmt);
		}
		
	}
	
	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(
							rs.getInt("article_no"),
							new Writer(rs.getString("writer_id"),rs.getString("writer_name")),
							rs.getString("title"), 
							toDate(rs.getTimestamp("regdate")), 
							toDate(rs.getTimestamp("moddate")),
							rs.getInt("read_cnt"), 
							rs.getString("isshow"));
		
	}
	
	//timestamp -> date 객체로 변환하기:p648
	
	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}
	
	//전체 게시글수 조회하는 count 메서드
	public int selectCount(Connection conn) throws SQLException {
		StringBuffer sql = new StringBuffer();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		sql.append("select count(article_no)");
		sql.append(" from article");
		sql.append(" where isshow='Y'");
		
		try {
			psmt = conn.prepareStatement(sql.toString());
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1); //count 함수를 이용하였기때문에 count(article_no)는 존재하지않는컬럼, 따라서 인덱스 번호를 던진것
			}
			return 0;
		}  finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(psmt);
		}
		
	}
	
	//리턴유형 Article : article.model의 article의 정보를 담고 있다
	public Article selectById(Connection conn, int no) throws SQLException { //int no는 상세조회할 글번호
		PreparedStatement psmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		Article article = null;
		
		sql.append("select article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, isshow");
		sql.append(" from  article");
		sql.append(" where isshow='Y' and article_no = ?");
		
		try {
			psmt = conn.prepareCall(sql.toString());
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				article = convertArticle(rs);
			}
			return article;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(psmt);
		}
	} //selectById의 끝
	
	
	//조회수 증가
	
	public void increaseReadCount(Connection conn, int no) {
		PreparedStatement psmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append("update article"); 
		sql.append(" set read_cnt = read_cnt+1"); 
		sql.append(" where article_no = ? and isshow='Y'");
		
		try {
			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, no);
			int result = psmt.executeUpdate();
			if(result != 0) {
				System.out.println(result+"행 조회수 증가 쿼리 실행 완료");
			} else if(result == 0) {
				System.out.println("조회수 증가 쿼리 실행 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void update(Connection conn, int articleNumber, String title) {
		PreparedStatement psmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("update article");
		sql.append(" set title=?, moddate = now()");
		sql.append(" where article_no = ? and isshow='Y'");
		
		try {
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, title);
			psmt.setInt(2, articleNumber);
			int result = psmt.executeUpdate();
			System.out.println(result+"행 업데이트 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	//삭제기능이지만 update를 이용
	public int deleteArticle2(Connection conn, int no) {
		PreparedStatement psmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("update article"); 
		sql.append(" set isshow='N'");
		sql.append(" where article_no=?");
		
		try {
			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, no);
			int result = psmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("삭제(update)도중 실패");
		} finally {
			JdbcUtil.close(psmt);
		}
		return 0;
				
	}
	
	
	//delete
	public int deleteArticle(Connection conn, int no) {
		PreparedStatement psmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("delete"); 
		sql.append(" from article"); 
		sql.append(" where article_no =?");
		
		try {
			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, no);
			int result = psmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("삭제(delete)도중 실패");
		} finally {
			JdbcUtil.close(psmt);
		}
		return 0;
				
	}
	
	//글쓰기
	//writeReq는 로그인한 유저의 아이디와 이름(Writer)을 가지고 있고, 입력받은 title과 content를 가지고있다.
	public Article insert(Connection conn, Article article) {
		PreparedStatement psmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("insert into article(writer_id, writer_name, title, regdate, moddate, read_cnt, isshow)");
		sql.append(" values(?,?,?,?,?,0,'Y')");
		try {
			psmt = conn.prepareStatement(sql.toString());
			
			//writeReq에 담겨있는내용들을 하나하나 대입해준다. id와 name은 writeReq안에 Write안에 있으니 두번 접근해서 꺼내야한다
			psmt.setString(1, article.getWriter().getId());
			psmt.setString(2, article.getWriter().getName());
			psmt.setString(3, article.getTitle());
			psmt.setTimestamp(4, toTimestamp(article.getRegdate()));
			psmt.setTimestamp(5, toTimestamp(article.getModdate()));
			int result = psmt.executeUpdate();
			
			if(result != 0) { //insert가 성공했을때
				psmt = conn.prepareStatement("select last_insert_id() from article");
				rs = psmt.executeQuery();
				if(rs.next()) {
					Integer newNum = rs.getInt(1);
					return new Article(newNum, article.getWriter(), article.getTitle(), article.getRegdate(), article.getModdate(), 0,"Y");
					
				}
			}
			
			System.out.println(result+"개 작성 완료");
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(psmt);
		}
		return article;
		
		
	}
	
	
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
	
}
