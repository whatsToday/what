package com.bit2015.what.vo;

public class PlanCommentsVo {
	private long planComments_no;
	private long member_no;
	private long plan_no;
	private String imageUrl;
	private String memberName;
	private String planName;
	private String message;
	private String regDate;
	public long getPlanComments_no() {
		return planComments_no;
	}
	public void setPlanComments_no(long planComments_no) {
		this.planComments_no = planComments_no;
	}
	public long getMember_no() {
		return member_no;
	}
	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}
	public long getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(long plan_no) {
		this.plan_no = plan_no;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
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
		return "PlanCommentsVo [planComments_no=" + planComments_no
				+ ", member_no=" + member_no + ", plan_no=" + plan_no
				+ ", imageUrl=" + imageUrl + ", memberName=" + memberName
				+ ", planName=" + planName + ", message=" + message
				+ ", regDate=" + regDate + "]";
	}

	
}
