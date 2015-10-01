package com.bit2015.what.vo;

public class GoodContentVo {
	private long goodContent_no;
	private long content_no;
	private long member_no;
	private String memberName;
	private String title;
	public long getGoodContent_no() {
		return goodContent_no;
	}
	public void setGoodContent_no(long goodContent_no) {
		this.goodContent_no = goodContent_no;
	}
	public long getContent_no() {
		return content_no;
	}
	public void setContent_no(long content_no) {
		this.content_no = content_no;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "GoodContentVo [goodContent_no=" + goodContent_no
				+ ", content_no=" + content_no + ", member_no=" + member_no
				+ ", memberName=" + memberName + ", title=" + title + "]";
	}

	
}
