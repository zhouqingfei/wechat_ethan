package com.wechat.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wechat.model.Appointment;

@Service("appointmentService")
public interface IAppointmentService {
	public void addAppointment(Appointment appointment);
	public void updateAppointment(Appointment appointment);
	public List<Appointment> findByPagination(int from ,int count);
	public List<Appointment> findAll();
}
