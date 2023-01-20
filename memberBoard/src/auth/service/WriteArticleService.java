package auth.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import article.dao.ArticleContentDAO;
import article.dao.ArticleDAO;
import article.model.Article;
import article.model.ArticleContent;
import article.service.WriteRequest;
import jdbc.JdbcUtil;
import jdbc.conn.ConnectionProvider;

public class WriteArticleService {
	//필드
	private ArticleDAO articleDAO = new ArticleDAO();
	private ArticleContentDAO contentDAO = new ArticleContentDAO();
	
	
	//글 입력 메소드
	//리턴유형 integer : article table에 insert된 글의 글번호를 리턴
	public Integer write(WriteRequest writeReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			//writeReq는 로그인한 유저의 아이디와 이름(Writer)을 가지고 있고, 입력받은 title과 content를 가지고있다.
			Article article = toArticle(writeReq);
			
			Article savedArticle = articleDAO.insert(conn, article); //article 테이블에 insert
			
			if(savedArticle == null) {
				throw new RuntimeException("Service 클래스에 savedArticle에 담긴 정보가 없습니다");
			}
			
			ArticleContent content = new ArticleContent(savedArticle.getArticle_no(), writeReq.getContent());
			
			//Article테이블에 마지막 insert한 ID를 가져온후
			
			ArticleContent savedContent = contentDAO.insert(conn, content); //articleContent 테이블에 insert
			
			if(savedContent == null) {
				throw new RuntimeException("savedcontent가 비어있습니다");
			}
			
			conn.commit();
			
			return savedArticle.getArticle_no();
		} catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} catch (RuntimeException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}


	//리턴유형 Article:WriteRequest에 입력일, 마지막수정일 추가
	private Article toArticle(WriteRequest writeReq) {
		//입력일 추가
		Date now = new Date();
		//마지막 수정일 추가
		return new Article(0, writeReq.getWriter(), writeReq.getTitle(), now, now, 0, "Y");
	}

}
