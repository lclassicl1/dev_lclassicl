package article.model;

//작성자의 정보를 담고있는 클래스
public class Writer {
	private String writerid;
	private String writername;
	
	//기본생성자
	Writer(){}
	
	
	//id와 name값을 매개변수로 받는 생성자, id와 name은 외부에서 받아온다
	Writer(String id, String name) {
		this.writerid = id;
		this.writername = name;
	}
	
	
	public String getId() {
		return writerid;
	}
	
	public String getName() {
		return writername;
	}
}
