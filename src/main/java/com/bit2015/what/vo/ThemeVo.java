package com.bit2015.what.vo;

public class ThemeVo {
	
	private long theme_no;
	private String themeName;
	private String imageUrl;
	public long getTheme_no() {
		return theme_no;
	}
	public void setTheme_no(long theme_no) {
		this.theme_no = theme_no;
	}
	public String getThemeName() {
		return themeName;
	}
	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	@Override
	public String toString() {
		return "ThemeVo [theme_no=" + theme_no + ", themeName=" + themeName
				+ ", imageUrl=" + imageUrl + "]";
	}
	
	
	

}
