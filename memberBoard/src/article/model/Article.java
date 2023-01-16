package article.model;

import java.util.Date;

public class Article {
	private Integer article_no;
	private Writer writer;
	private String title;
	private Date regdate;
	private Date moddate;
	private int read_cnt;
	private String isshow;
	
	
	
	public Article(Integer article_no, Writer writer, String title, Date regdate, Date moddate, int read_cnt, String isshow) {
		this.article_no = article_no;
		this.writer = writer;
		this.title = title;
		this.regdate = regdate;
		this.moddate = moddate;
		this.read_cnt = read_cnt;
		this.isshow = isshow;
	}
	
	public int getArticle_no() {
		return article_no;
	}
	public Writer getWriter() {
		return writer;
	}
	public String getTitle() {
		return title;
	}
	public Date getRegdate() {
		return regdate;
	}
	public Date getModdate() {
		return moddate;
	}
	public int getRead_cnt() {
		return read_cnt;
	}
	public String getIsshow() {
		return isshow;
	}

	@Override
	public String toString() {
		return "Article [article_no=" + article_no + ", writer=" + writer + ", title=" + title + ", regdate=" + regdate
				+ ", moddate=" + moddate + ", read_cnt=" + read_cnt + ", isshow=" + isshow + "]";
	}
	
	
}
