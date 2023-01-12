package article.model;

//작성자의 정보를 담고있는 클래스
public class Writer {
	private String writer_id;
	private String writer_name;
	
	//기본생성자
	Writer(){}
	
	
	//id와 name값을 매개변수로 받는 생성자, id와 name은 외부에서 받아온다
	public Writer(String id, String name) {
		this.writer_id = id;
		this.writer_name = name;
	}
	
	
	public String getId() {
		return writer_id;
	}
	
	public String getName() {
		return writer_name;
	}


	@Override
	public String toString() {
		return "Writer [writer_id=" + writer_id + ", writer_name=" + writer_name + "]";
	}
	
	
	
}
