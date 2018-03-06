package com.wechat.model;

import java.util.Date;

public class Appointment {
	
	private Integer id;
	private String taocan;
	private String appointTime;
	
    private String fromMapName;
    private String fromMapAddress;
    private String fromDes;
    private String fromFloor;
    

    private String toMapName;
    private String toMapAddress;
    private String toDes;
    private String toFloor;   
        
    private String userName;
    private String telephone;   
    private String note;  
    private Date submitTime;

	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getTaocan() {
		return taocan;
	}

	public void setTaocan(String taocan) {
		this.taocan = taocan;
	}

	public String getAppointTime() {
		return appointTime;
	}

	public void setAppointTime(String appointTime) {
		this.appointTime = appointTime;
	}

	public String getFromMapName() {
		return fromMapName;
	}

	public void setFromMapName(String fromMapName) {
		this.fromMapName = fromMapName;
	}

	public String getFromMapAddress() {
		return fromMapAddress;
	}

	public void setFromMapAddress(String fromMapAddress) {
		this.fromMapAddress = fromMapAddress;
	}

	public String getFromDes() {
		return fromDes;
	}

	public void setFromDes(String fromDes) {
		this.fromDes = fromDes;
	}

	public String getFromFloor() {
		return fromFloor;
	}

	public void setFromFloor(String fromFloor) {
		this.fromFloor = fromFloor;
	}

	public String getToMapName() {
		return toMapName;
	}

	public void setToMapName(String toMapName) {
		this.toMapName = toMapName;
	}

	public String getToMapAddress() {
		return toMapAddress;
	}

	public void setToMapAddress(String toMapAddress) {
		this.toMapAddress = toMapAddress;
	}

	public String getToDes() {
		return toDes;
	}

	public void setToDes(String toDes) {
		this.toDes = toDes;
	}

	public String getToFloor() {
		return toFloor;
	}

	public void setToFloor(String toFloor) {
		this.toFloor = toFloor;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	public Date getSubmitTime() {
		return submitTime;
	}

	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}

}
