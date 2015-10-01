package com.bit2015.what.vo;

public class GoodPlanVo {
	private long goodPlan_no;
	private long plan_no;
	private long member_no;
	private String memberName;
	private String planName;
	public long getGoodPlan_no() {
		return goodPlan_no;
	}
	public void setGoodPlan_no(long goodPlan_no) {
		this.goodPlan_no = goodPlan_no;
	}
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
	@Override
	public String toString() {
		return "GoodPlanVo [goodPlan_no=" + goodPlan_no + ", plan_no="
				+ plan_no + ", member_no=" + member_no + ", memberName="
				+ memberName + ", planName=" + planName + "]";
	}

	
}
