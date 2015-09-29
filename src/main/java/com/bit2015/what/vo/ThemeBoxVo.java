package com.bit2015.what.vo;

public class ThemeBoxVo {
	
	private long themeBox_no;
	private long member_no;
	private long theme_no;
	private String ThemeName;
	public long getThemeBox_no() {
		return themeBox_no;
	}
	public void setThemeBox_no(long themeBox_no) {
		this.themeBox_no = themeBox_no;
	}
	public long getMember_no() {
		return member_no;
	}
	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}
	public long getTheme_no() {
		return theme_no;
	}
	public void setTheme_no(long theme_no) {
		this.theme_no = theme_no;
	}
	public String getThemeName() {
		return ThemeName;
	}
	public void setThemeName(String themeName) {
		ThemeName = themeName;
	}
	@Override
	public String toString() {
		return "ThemeBoxVo [themeBox_no=" + themeBox_no + ", member_no="
				+ member_no + ", theme_no=" + theme_no + ", ThemeName="
				+ ThemeName + "]";
	}
	
	

}
