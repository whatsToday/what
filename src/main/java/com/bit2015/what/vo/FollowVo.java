package com.bit2015.what.vo;

public class FollowVo {
	private long follow_no;
	private long member_no;
	private long followNum;
	private String memberName;
	private String followName;
	
	
	public long getFollow_no() {
		return follow_no;
	}

	public void setFollow_no(long follow_no) {
		this.follow_no = follow_no;
	}

	public long getMember_no() {
		return member_no;
	}

	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}

	public long getFollowNum() {
		return followNum;
	}

	public void setFollowNum(long followNum) {
		this.followNum = followNum;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getFollowName() {
		return followName;
	}

	public void setFollowName(String followName) {
		this.followName = followName;
	}

	@Override
	public String toString() {
		return "FollwVo [follow_no=" + follow_no + ", member_no=" + member_no
				+ ", followNum=" + followNum + ", memberName=" + memberName
				+ ", followName=" + followName + "]";
	}

}
