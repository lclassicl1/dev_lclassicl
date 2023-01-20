package article.service;

import java.util.Map;

import article.model.Writer;

//글쓰기 요청시 사용하는 메소드를 구현하는 클래스 + 유효성검사
public class WriteRequest {
	//필드
	private String title;
	private String content;
	private Writer writer; //Writer 클래스의 writer_id, writer_name이 들어가있다.
	
	
	//writer의 정보, 제목, 작성자를 매개변수로 받는 생성자
	public WriteRequest(Writer writer,String title, String content) {
		this.writer = writer;
		this.title = title;
		this.content = content;
	}
	
	
	
	
	
	public String getTitle() {
		return title;
	}





	public String getContent() {
		return content;
	}





	public Writer getWriter() {
		return writer;
	}





	@Override
	public String toString() {
		return "WriteRequest [title=" + title + ", content=" + content + ", writer=" + writer + "]";
	}





	//유효성 검사 메서드 제목과 내용이 비어있는지 검사
	public void validate(Map<String,Boolean> errors) {
		if(title == null || title.isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
		
		if(content == null || content.isEmpty()) {
			errors.put("content", Boolean.TRUE);
		}
	}
}
