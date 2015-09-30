package com.bit2015.what.vo;

public class GoodPlanVo {
	private long good_no;
	private long plan_no;
	private long member_no;
	private String memberName;
	private String planName;

	public long getGood_no() {
		return good_no;
	}

	public void setGood_no(long good_no) {
		this.good_no = good_no;
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
		return "GoodPlanVo [good_no=" + good_no + ", plan_no=" + plan_no
				+ ", member_no=" + member_no + ", memberName=" + memberName
				+ ", planName=" + planName + "]";
	}

}
