package member.service;

import java.util.Map;

//member 회원정보를 담고있는 class
public class JoinRequest {
	private int memberno;
	private String memberid;
	private String membername;
    private String memberpwd;
    private String re_memberpwd;
    private String email_id;
    private String email_domain;
    private String email;
    
    
    
    
    
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getMemberpwd() {
		return memberpwd;
	}
	public void setMemberpwd(String memberpwd) {
		this.memberpwd = memberpwd;
	}
	public String getRe_memberpwd() {
		return re_memberpwd;
	}
	public void setRe_memberpwd(String re_memberpwd) {
		this.re_memberpwd = re_memberpwd;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getEmail_domain() {
		return email_domain;
	}
	public void setEmail_domain(String email_domain) {
		this.email_domain = email_domain;
	}
	
	//필수 입력 check 메서드
	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		if(value == null || value.isEmpty()) {
			
			//user가 입력(선택)한 값이 value로, key는 회원가입form의 text필드명
			errors.put(fieldName, Boolean.TRUE);
		}
	}
	
	
	public void validate(Map<String, Boolean> errors) {
		//필수입력 체크 메서드,
		checkEmpty(errors, this.memberid, "memberid");
		checkEmpty(errors, this.membername, "membername");
		checkEmpty(errors, this.memberpwd, "memberpwd");
		checkEmpty(errors, this.re_memberpwd, "re_memberpwd");
		
		//비밀번호가 일치하지 않을때
		if(!errors.containsKey(re_memberpwd)) {
			if(!isPasswordEqual()) { //비밀번호 검증 메서드, 비밀번호가 Null이 아니고, memberpwd와 re_memberpwd가 같다면 true가 남어오지만 ! 처리되므로 false가 된다.
									//따라서 비밀번호 검증 메서드가 false일시 error에 put으로 keyt와 value를 넣어준다
				errors.put("notMach", Boolean.TRUE);
			}
		}
	}
	
	//비밀번호 검증(true, false로 리턴됨)
	public boolean isPasswordEqual() { //true나 false를 리턴
		return memberpwd != null && memberpwd.equals(re_memberpwd);
	}
	
	@Override
	public String toString() {
		return "JoinRequest [memberno=" + memberno + ", memberid=" + memberid + ", membername=" + membername
				+ ", memberpwd=" + memberpwd + ", re_memberpwd=" + re_memberpwd + ", email_id=" + email_id
				+ ", email_domain=" + email_domain + "]";
	}
	
}