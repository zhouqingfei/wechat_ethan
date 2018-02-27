package com.wechat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wechat.model.Appointment;
import com.wechat.service.IAppointmentService;


@Controller
@RequestMapping("/appointment.do")
public class AppointmentController {
	@Resource IAppointmentService appointmentService; 
	
	@RequestMapping(value="/addAppointment",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public @ResponseBody String addAppointment(HttpServletRequest request) {
		String taocan = request.getParameter("taocan");
		String userName = request.getParameter("username");
		String telephone = request.getParameter("telephone");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String fromDes = request.getParameter("fromDes");
		String toDes = request.getParameter("toDes");
		String note = request.getParameter("note");
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("当前时间：" + sdf.format(d));
		//Date submitTime = sdf.format(d);
		
		System.out.println(taocan + userName + telephone + date + time +fromDes + toDes + note);
		
		Appointment appointment = new Appointment();
		appointment.setTaocan(taocan);
		appointment.setUserName(userName);
		appointment.setTelephone(telephone);
		appointment.setDate(date);
		appointment.setTime(time);
		appointment.setFromDes(fromDes);
		appointment.setToDes(toDes);
		appointment.setNote(note);
		appointment.setSubmitTime(new Date());
		
		appointmentService.addAppointment(appointment);
		
		return "成功";
	}
	
	@RequestMapping(value="/testTable.view",method=RequestMethod.GET)
	public String treeTable(HttpServletRequest request,Model model) {
		System.out.println("testTable.view");
		return "testTable";
	}
	
	@RequestMapping(value="/getAppointmentList",method=RequestMethod.POST,produces = "text/json;charset=UTF-8")
	public @ResponseBody String getAppointMentList(HttpServletRequest request) {
		
		System.out.println("getAppointmentList");
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("rows"));
		
		int size = appointmentService.findAll().size();				

		int from = (currentPage - 1) * pageSize;
		int count = pageSize;

		List<Appointment> appointmentList = appointmentService.findByPagination(from, count);
		
		Gson gs = new Gson();
		String json = "{\"total\":" + size + " , \"rows\":" + gs.toJson(appointmentList).toString() + "}";
		// System.out.println("getTestCaseList handler, ret: "+ json);
		System.out.println(json);
		return json;
		
	}
	
	@RequestMapping(value="/findAll",method=RequestMethod.POST,produces = "text/json;charset=UTF-8")
	public @ResponseBody String findAll(HttpServletRequest request) {
		
		System.out.println("findAll");
		
		List<Appointment> appointmentList = appointmentService.findAll();
		
		Gson gs = new Gson();
		String json = "{\"total\":" + appointmentList.size() + " , \"rows\":" + gs.toJson(appointmentList).toString() + "}";
		// System.out.println("getTestCaseList handler, ret: "+ json);
		System.out.println(json);
		return json;
		
	}
}
