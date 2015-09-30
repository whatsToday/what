package com.bit2015.what.vo;

public class PlanImgVo {
	private long planImg_no;
	private long plan_no;
	private String planName;
	private String imageUrl;

	public long getPlanImg_no() {
		return planImg_no;
	}

	public void setPlanImg_no(long planImg_no) {
		this.planImg_no = planImg_no;
	}

	public long getPlan_no() {
		return plan_no;
	}

	public void setPlan_no(long plan_no) {
		this.plan_no = plan_no;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		return "PlanImgVo [planImg_no=" + planImg_no + ", plan_no=" + plan_no
				+ ", planName=" + planName + ", imageUrl=" + imageUrl + "]";
	}

}
