package com.bit2015.what.vo;

public class SearchListVo {
	private long searchList_no;
	private long member_no;
	private String memberName;
	private String search;
	private String searchDate;
	private String latitude;
	private String longitude;
	public long getSearchList_no() {
		return searchList_no;
	}
	public void setSearchList_no(long searchList_no) {
		this.searchList_no = searchList_no;
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
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	@Override
	public String toString() {
		return "SearchListVo [searchList_no=" + searchList_no + ", member_no="
				+ member_no + ", memberName=" + memberName + ", search="
				+ search + ", searchDate=" + searchDate + ", latitude="
				+ latitude + ", longitude=" + longitude + "]";
	}

	
}
