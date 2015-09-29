package com.bit2015.what.vo;

public class ContentVo {

	private long content_no;
	private String phone;
	private String newAddress;
	private String imageUrl;
	private String direction;
	private String zipcode;
	private String placeUrl;
	private String id;
	private String title;
	private String category;
	private String address;
	private String longitude;
	private String latitude;
	private String addressBCode;
	public long getContent_no() {
		return content_no;
	}
	public void setContent_no(long content_no) {
		this.content_no = content_no;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNewAddress() {
		return newAddress;
	}
	public void setNewAddress(String newAddress) {
		this.newAddress = newAddress;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getPlaceUrl() {
		return placeUrl;
	}
	public void setPlaceUrl(String placeUrl) {
		this.placeUrl = placeUrl;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getAddressBCode() {
		return addressBCode;
	}
	public void setAddressBCode(String addressBCode) {
		this.addressBCode = addressBCode;
	}
	@Override
	public String toString() {
		return "ContentVo [content_no=" + content_no + ", phone=" + phone
				+ ", newAddress=" + newAddress + ", imageUrl=" + imageUrl
				+ ", direction=" + direction + ", zipcode=" + zipcode
				+ ", placeUrl=" + placeUrl + ", id=" + id + ", title=" + title
				+ ", category=" + category + ", address=" + address
				+ ", longitude=" + longitude + ", latitude=" + latitude
				+ ", addressBCode=" + addressBCode + "]";
	}

	
	
}
