package com.bit2015.what.vo;

public class ContentBoxVo {
	
	private long contentBox_no;
	private long plan_no;
	private long content_no;
	private String planName;
	public long getContentBox_no() {
		return contentBox_no;
	}
	public void setContentBox_no(long contentBox_no) {
		this.contentBox_no = contentBox_no;
	}
	public long getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(long plan_no) {
		this.plan_no = plan_no;
	}
	public long getContent_no() {
		return content_no;
	}
	public void setContent_no(long content_no) {
		this.content_no = content_no;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	@Override
	public String toString() {
		return "ContentBoxVo [contentBox_no=" + contentBox_no + ", plan_no="
				+ plan_no + ", content_no=" + content_no + ", planName="
				+ planName + "]";
	}
	
	


}
