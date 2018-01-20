package com.exercise.pojo.po;

public class Mail {

	private Integer sendid;
	private Integer receiveid;
	private String time;
	private String title;
	private String content;
	private String file;
	private Integer isdrop;
	private Integer isread;
	public Integer getSendid() {
		return sendid;
	}
	public void setSendid(Integer sendid) {
		this.sendid = sendid;
	}
	public Integer getReceiveid() {
		return receiveid;
	}
	public void setReceiveid(Integer receiveid) {
		this.receiveid = receiveid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public Integer getIsdrop() {
		return isdrop;
	}
	public void setIsdrop(Integer isdrop) {
		this.isdrop = isdrop;
	}
	public Integer getIsread() {
		return isread;
	}
	public void setIsread(Integer isread) {
		this.isread = isread;
	}
	 
}
