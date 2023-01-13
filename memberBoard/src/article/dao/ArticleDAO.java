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
		sql.append(" order by regdate desc limit 0,?");
		try {
			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, listSize);
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
	
}
