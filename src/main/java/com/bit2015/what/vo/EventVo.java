package com.bit2015.what.vo;

public class EventVo {
	private long event_no;
	private long content_no;
	private String title;
	private String message;
	private String regDate;
	private String dueDate;
	private String eventStatus;

	public long getEvent_no() {
		return event_no;
	}

	public void setEvent_no(long event_no) {
		this.event_no = event_no;
	}

	public long getContent_no() {
		return content_no;
	}

	public void setContent_no(long content_no) {
		this.content_no = content_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getEventStatus() {
		return eventStatus;
	}

	public void setEventStatus(String eventStatus) {
		this.eventStatus = eventStatus;
	}

	@Override
	public String toString() {
		return "EventVo [event_no=" + event_no + ", content_no=" + content_no
				+ ", title=" + title + ", message=" + message + ", regDate="
				+ regDate + ", dueDate=" + dueDate + ", eventStatus="
				+ eventStatus + "]";
	}

}
