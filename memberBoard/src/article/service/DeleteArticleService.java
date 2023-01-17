package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleContentDAO;
import article.dao.ArticleDAO;
import jdbc.JdbcUtil;
import jdbc.conn.ConnectionProvider;

//deleteHandler에서 호출받은 Serivce 각종 DB 관련 기능을 담당(현재는 삭제용)
public class DeleteArticleService {
	//update는 isshow를 담당하는 articleDAO만 필요
	private ArticleDAO articleDAO = new ArticleDAO();
	private ArticleContentDAO contentDAO = new ArticleContentDAO();
	
	
	
	
	
	//삭제(update) 쿼리이용, 매개변수로 글번호를받음
	public int deleteArticle2(int no) {
		Connection conn = null;
		int result = 0;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			result = articleDAO.deleteArticle2(conn, no);
			
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		} return result;
		
	}
	
	
	//삭제(delete) 쿼리이용
	public int deleteArticle(int no) {
		Connection conn = null;
		int result = 0;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			result = contentDAO.deleteArticle(conn, no);
			
			if(result == 0) {
				throw new ArticleContentNotFoundException();
			}
			
			if(result != 0) {
				result = articleDAO.deleteArticle(conn, no);
			}
			
			conn.commit();
			return result;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		} return result;
	}
}
