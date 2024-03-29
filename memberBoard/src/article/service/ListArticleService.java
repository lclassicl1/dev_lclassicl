package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import article.dao.ArticleDAO;
import article.model.Article;
import jdbc.conn.ConnectionProvider;

public class ListArticleService {
	private ArticleDAO articleDAO = new ArticleDAO(); 
	
	//pagNo 매개변수는 controller에서 넘어온 user가 선택한 Page번호
	//목록조회 + 페이징처리 관련 메소드
	public ArticlePage getArticlePage(int size, int pageNo) {
		try {
			Connection conn = ConnectionProvider.getConnection();
			int total = articleDAO.selectCount(conn);
			System.out.println("total의 수"+total);
			
			List<Article> list = articleDAO.select(conn, size, (pageNo -1)*size);
			System.out.println("pageno:"+pageNo);
			return new ArticlePage(total, pageNo, size, list);
		
		} catch(SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
		
	}
}
