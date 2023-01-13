package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleContentDAO;
import article.dao.ArticleDAO;
import article.model.Article;
import article.model.ArticleContent;
import jdbc.conn.ConnectionProvider;

public class ReadArticleService {
	private ArticleDAO articleDAO = new ArticleDAO();
	private ArticleContentDAO articleContentDAO = new ArticleContentDAO();
	
	//article Num = 글번호
	//boolean은 조회수를 늘려주기 위한 매개변수
	public ArticleData getAticle(int no) {
		try {
			Connection conn = ConnectionProvider.getConnection();
			Article article = articleDAO.selectById(conn, no);
			
			//article 변수에 담긴 정보가 없다면
			if(article == null) {
				System.out.println("article에 담긴 정보가 없습니다 ReadArticleService클래스로 와서 확인해주세요");
				throw new ArticleNotFoundException();
			}
			
			ArticleContent content = articleContentDAO.selectById(conn, no);
			//articlecontent 참조변수에 담긴 정보가없다면
			if(content == null) {
				System.out.println("articleConent에 담긴 정보가없습니다, ReadArticleService클래스로 와서 확인해주세요");
				throw new ArticleContentNotFoundException();
			}
			
			//특정글 조회사 조회수 증가 관련 메서드 추가예정
			
			return new ArticleData(article, content);
		} catch (SQLException | ArticleNotFoundException | ArticleContentNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
}
