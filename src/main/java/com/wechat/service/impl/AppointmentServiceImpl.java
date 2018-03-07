package com.wechat.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wechat.dao.IAppointmentDao;
import com.wechat.model.Appointment;
import com.wechat.service.IAppointmentService;

@Service("appointmentService")
public class AppointmentServiceImpl implements IAppointmentService{
	@Resource
	private IAppointmentDao appointmentDao;

	@Override
	public void addAppointment(Appointment appointment) {
		// TODO 自动生成的方法存根
		this.appointmentDao.insert(appointment);
	}

	@Override
	public List<Appointment> findByPagination(int from, int count) {
		// TODO 自动生成的方法存根
		return this.appointmentDao.findByPagination(from, count);
	}

	@Override
	public List<Appointment> findAll() {
		// TODO 自动生成的方法存根
		return this.appointmentDao.findAll();
	}

	@Override
	public void updateAppointment(Appointment appointment) {
		// TODO 自动生成的方法存根
		this.appointmentDao.update(appointment);
	}
}
