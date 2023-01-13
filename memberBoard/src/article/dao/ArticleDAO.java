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
	
}
