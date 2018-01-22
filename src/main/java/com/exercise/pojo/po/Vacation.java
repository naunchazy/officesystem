package com.exercise.pojo.po;

import java.util.Date;

public class Vacation {

	private Integer id;
	private String username;
//	private Date begintime;
//	private Date overtime;
	private String begintime;
	private String overtime;
	private Integer days;
	private Integer ispass;
	private String reason;
	private Integer approverid;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getOvertime() {
		return overtime;
	}
	public void setOvertime(String overtime) {
		this.overtime = overtime;
	}
	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}
	public Integer getIspass() {
		return ispass;
	}
	public void setIspass(Integer ispass) {
		this.ispass = ispass;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Integer getApproverid() {
		return approverid;
	}
	public void setApproverid(Integer approverid) {
		this.approverid = approverid;
	}
	
}
