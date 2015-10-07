package com.bit2015.what.vo;

public class PlanReplyVo {
	private Long planReply_no;
	private Long member_no;
	private Long planComments_no;
	private String memberName;
	private String message;
	private String regDate;
	public Long getPlanReply_no() {
		return planReply_no;
	}
	public void setPlanReply_no(Long planReply_no) {
		this.planReply_no = planReply_no;
	}
	public Long getMember_no() {
		return member_no;
	}
	public void setMember_no(Long member_no) {
		this.member_no = member_no;
	}
	public Long getPlanComments_no() {
		return planComments_no;
	}
	public void setPlanComments_no(Long planComments_no) {
		this.planComments_no = planComments_no;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "PlanReplyVo [planReply_no=" + planReply_no + ", member_no="
				+ member_no + ", planComments_no=" + planComments_no
				+ ", memberName=" + memberName + ", message=" + message
				+ ", regDate=" + regDate + "]";
	}
	
	
	

}
