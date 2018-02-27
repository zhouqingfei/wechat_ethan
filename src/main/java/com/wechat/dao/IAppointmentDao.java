package com.wechat.dao;

import java.util.List;

import com.wechat.model.Appointment;

public interface IAppointmentDao {
	public int insert(Appointment record);
	public List<Appointment> findByPagination(int from ,int count);
	public List<Appointment> findAll();
}
