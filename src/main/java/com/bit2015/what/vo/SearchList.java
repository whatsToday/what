package com.bit2015.what.vo;

public class SearchList {
	private long searchList_no;
	private long member_no;
	private String memberName;
	private String search;
	private String date;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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
		return "SearchList [searchList_no=" + searchList_no + ", member_no="
				+ member_no + ", memberName=" + memberName + ", search="
				+ search + ", date=" + date + ", latitude=" + latitude
				+ ", longitude=" + longitude + "]";
	}

}
