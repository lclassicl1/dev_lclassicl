package member.model;

import java.util.Date;

//model 클래스 회원관련 데이터저장, 제공등의 기능
public class Member {
	
	private int memberno;
	private String memberid;
	private String membername;
    private String memberpwd;
    private String email;
    private Date regdate;
    private int grade;
	
    
    public Member() {
    	
    }
    
    
    public Member(int memberno, String memberid, String membername, String memberpwd, String email, Date regdate, int grade) {
    	this.memberno = memberno;
		this.memberid = memberid;
		this.membername = membername;
		this.memberpwd = memberpwd;
		this.email = email;
		this.regdate = regdate;
		this.grade = grade;
	}
    
    public int getMemberNo() {
    	return memberno;
    }

	public String getMemberId() {
    	return memberid;
    }
    
    public String getMemberName() {
    	return membername;
    }
    
    public String getMemberPwd() {
    	return memberpwd;
    }
    
    public String getEmail() {
    	return email;
    }
    
    public Date getRegdate() {
    	return regdate;
    }
    
    public int getGrade() {
    	return grade;
    }
    
    //비밀번호 매칭
    //매개변수 pwd로 받은 비밀번호값과 memberpwd의 문자열을 비교, 일치하면 true 아니면 false를 리턴
    public boolean matchPassword(String pwd) {
    	return memberpwd.equals(pwd);
    }


	@Override
	public String toString() {
		return "Member [memberno=" + memberno + ", memberid=" + memberid + ", membername=" + membername + ", memberpwd="
				+ memberpwd + ", email=" + email + ", regdate=" + regdate + ", grade=" + grade + "]";
	}
    
}
