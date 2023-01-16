package article.service;

import java.util.Map;

//글 수정을 위한 수정하는 사용자 id, 수정할글번호,. 수정할 제목, 수정할 내용
//유효성 검사 기능을 제공하는 클래스
public class ModifyRequest {
	private String userId;
	private int articleNumber;
	private String title;
	private String content;
	private String userName;
	
	
		
	public ModifyRequest(String userId, int articleNumber, String userName, String title, String content) {
		this.userId = userId;
		this.articleNumber = articleNumber;
		this.title = title;
		this.content = content;
		this.userName = userName;
	}
	
	
	public String getUserId() {
		return userId;
	}
	public int getArticleNumber() {
		return articleNumber;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	
	public String getUserName() {
		return userName;
	}




	//제목이 비어있는지에 대한 유효성 검사
	public void validate(Map<String, Boolean> errors) {
		if(title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}


	@Override
	public String toString() {
		return "ModifyRequest [userId=" + userId + ", articleNumber=" + articleNumber + ", title=" + title
				+ ", content=" + content + ", userName=" + userName + ", getUserId()=" + getUserId()
				+ ", getArticleNumber()=" + getArticleNumber() + ", getTitle()=" + getTitle() + ", getContent()="
				+ getContent() + ", getUserName()=" + getUserName() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

	

}
