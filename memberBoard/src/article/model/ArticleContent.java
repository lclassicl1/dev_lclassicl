package article.model;

public class ArticleContent {
	private int article_no;
	private String content;
	
	
	//글번호no와 내용 content를 매개변수로 받는 생성자
	public ArticleContent(int no, String content) {
		this.article_no = no;
		this.content = content;
	}


	public int getArticle_no() {
		return article_no;
	}


	public String getContent() {
		return content;
	}


	@Override
	public String toString() {
		return "ArticleContent [article_no=" + article_no + ", content=" + content + "]";
	}
	
	
}
