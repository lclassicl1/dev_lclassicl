package auth.service;

//user가 로그인에 성공했을때 조회되는 정보들
public class User {
	private int memberno;
	private String memberid;
	private String memberpwd;
	private String re_memberpwd;
	private String membername;
	private String email;
	private int grade;
	
	public User() {}
	
	
	public User(int memberno, String memberid, String memberpwd, String re_memberpwd, String membername, String email,
			int grade) {
		super();
		this.memberno = memberno;
		this.memberid = memberid;
		this.memberpwd = memberpwd;
		this.re_memberpwd = re_memberpwd;
		this.membername = membername;
		this.email = email;
		this.grade = grade;
	}


	public User(int memberno, String memberid, String membername, int grade) {
		this.memberno = memberno;
		this.memberid = memberid;
		this.membername = membername;
		this.grade = grade;
	}
	
	public String getmemberpwd() {
		return memberpwd;
	}


	public int getMemberno() {
		return memberno;
	}

	public String getMemberid() {
		return memberid;
	}

	public String getMembername() {
		return membername;
	}

	public int getGrade() {
		return grade;
	}
	
	

}
