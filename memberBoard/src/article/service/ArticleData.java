package article.service;

import article.model.Article;
import article.model.ArticleContent;

//readArticleService 클래스에 구현할 getArticle의 메서드의 리턴타입
//Article 객체와 ArticleContent 객체를 한 객체에 담기위한 용도
public class ArticleData {
	private Article article;
	private ArticleContent content;
	
	ArticleData(Article article, ArticleContent content) {
		this.article = article;
		this.content = content;
	}

	public Article getArticle() {
		return article;
	}

	public String getArticleContent() {
		return content.getContent();
	}

	@Override
	public String toString() {
		return "ArticleData [article=" + article + ", content=" + content + "]";
	}
	
	
}
