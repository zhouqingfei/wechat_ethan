package com.wechat.model;

import java.util.Date;

public class Appointment {
	private Integer id;

	private String userName;

    private String taocan;
    
    private String telephone;

    private String date;

    private String time;

    private String fromDes;

    private String toDes;
    
    private String note;
    
    private Date submitTime;
	
	public Date getSubmitTime() {
		return submitTime;
	}

	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTaocan() {
		return taocan;
	}

	public void setTaocan(String taocan) {
		this.taocan = taocan;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}


	public String getFromDes() {
		return fromDes;
	}

	public void setFromDes(String fromDes) {
		this.fromDes = fromDes;
	}

	public String getToDes() {
		return toDes;
	}

	public void setToDes(String toDes) {
		this.toDes = toDes;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}	    
}
