package com.bit2015.what.vo;

public class MemberVo {

	private long member_no;
	private String email;
	private String password;
	private String imageUrl;
	private String memberGrade;
	private String memberName;
	public long getMember_no() {
		return member_no;
	}
	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	@Override
	public String toString() {
		return "MemberVo [member_no=" + member_no + ", email=" + email
				+ ", password=" + password + ", imageUrl=" + imageUrl
				+ ", memberGrade=" + memberGrade + ", memberName=" + memberName
				+ "]";
	}
	
	
	
}
