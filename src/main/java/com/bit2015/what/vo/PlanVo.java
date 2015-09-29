package com.bit2015.what.vo;

public class PlanVo {
	
	private long plan_no;
	private long member_no;
	private String planName;
	private String memberName;
	private String message;
	private String planDate;
	public long getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(long plan_no) {
		this.plan_no = plan_no;
	}
	public long getMember_no() {
		return member_no;
	}
	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
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
	public String getPlanDate() {
		return planDate;
	}
	public void setPlanDate(String planDate) {
		this.planDate = planDate;
	}
	@Override
	public String toString() {
		return "PlanVo [plan_no=" + plan_no + ", member_no=" + member_no
				+ ", planName=" + planName + ", memberName=" + memberName
				+ ", message=" + message + ", planDate=" + planDate + "]";
	}

	

}
