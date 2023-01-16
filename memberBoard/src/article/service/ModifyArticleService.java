package article.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import article.command.PermissionDeniedException;
import article.dao.ArticleContentDAO;
import article.dao.ArticleDAO;
import article.model.Article;
import jdbc.JdbcUtil;
import jdbc.conn.ConnectionProvider;

//이 클래스는 update 쿼리문을 수행하는 Service 클래스이다.
public class ModifyArticleService {
	private ArticleDAO articleDAO = new ArticleDAO();
	private ArticleContentDAO contentDAO = new ArticleContentDAO();
	
	//modifyrequest에는 글수정을 위한 수정하는 사용자id, 수정할글번호, 수정할제목, 수정할 내용이 담겨있다.
	public void modify(ModifyRequest modReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			//특정 글번호에 해당하는 변경전 데이터를 가져옴. 가져와서 Article에 담아준다
			Article article = articleDAO.selectById(conn, modReq.getArticleNumber());
			
			if(article == null) {
				throw new ArticleNotFoundException();
			}
			
			//수정하려는 사용자의 id와 작성자의 id가 다르다면 예외처리
			if(!canModify(modReq.getUserId(), article)) {
				throw new PermissionDeniedException();
			}
			
			articleDAO.update(conn, modReq.getArticleNumber(), modReq.getTitle());
			contentDAO.update(conn, modReq.getArticleNumber(), modReq.getContent());
			conn.commit();
			

		} catch (SQLException e) {
			JdbcUtil.close(conn);
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch(PermissionDeniedException e) {
			JdbcUtil.rollback(conn);
		} finally {
			JdbcUtil.close(conn);
		}
		
		
	}
	
	/*
	 * String userId : 수정하려는 사용자의 id 
	 * Article article : 특정 글번호에 해당하는 변겅전 데이터들
	 */
	private boolean canModify(String userId, Article article) {
		return article.getWriter().getId().equals(userId);
	}
	
}
