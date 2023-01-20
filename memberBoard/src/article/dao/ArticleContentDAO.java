package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import article.model.ArticleContent;
import jdbc.JdbcUtil;

//article_content와 관련된 DB 작업 관련 Content
public class ArticleContentDAO {

	
	public ArticleContent selectById(Connection conn, int no) throws SQLException { //int no는 상세조회할 글번호
		PreparedStatement psmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		ArticleContent content = null;
		
		sql.append("select article_no, content");
		sql.append(" from article_content");
		sql.append(" where article_no = ?");
		
		try {
			psmt = conn.prepareCall(sql.toString());
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				content = new ArticleContent(rs.getInt("article_no"), rs.getString("content"));
			}
			return content;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(psmt);
		}
	} //selectById의 끝

	public void update(Connection conn, int articleNumber, String content) {
		PreparedStatement psmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("update article_content"); 
		sql.append(" set content = ?"); 
		sql.append(" where article_no = ?");
		
		try {
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, content);
			psmt.setInt(2, articleNumber);
			int result = psmt.executeUpdate();
			System.out.println(result+"행 업데이트 완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	public int deleteArticle(Connection conn, int no) {
		PreparedStatement psmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("delete"); 
		sql.append(" from article_content"); 
		sql.append(" where article_no = ?");
		
		try {
			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, no);
			int result = psmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
			return 0;
		}
	}
	
	//articleContent Table에 insert하는 쿼리
	//content = user가 입력한 정보
	public ArticleContent insert(Connection conn, ArticleContent content) {
		PreparedStatement psmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("insert into article_content(article_no, content)"); 
		sql.append(" values(?,?)");
		
		try {
			psmt = conn.prepareStatement(sql.toString());
			psmt.setLong(1, content.getArticle_no());
			psmt.setString(2, content.getContent());
			int result = psmt.executeUpdate();
			
			if(result != 0) { //insert가 성공이 되었다면
				System.out.println(result+"개의 내용이 Articlecontent에 저장되었습니다");
				return content;
			} else {
				return null;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("articleContent의 insert 메서드 수행 실패");
			return null;
		} finally {
			JdbcUtil.close(psmt);
		}
		
	}
}
