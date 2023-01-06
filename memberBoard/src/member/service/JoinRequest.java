package member.service;

//member 회원정보를 담고있는 class
public class JoinRequest {
	private int memberno;
	private String memberid;
	private String membername;
    private String memberpwd;
    private String re_memberpwd;
    private String email_id;
    private String email_domain;
    
    
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