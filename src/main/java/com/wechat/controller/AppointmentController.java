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
import org.springframework.web.bind.annotation.RequestParam;
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
		String appointTime = request.getParameter("appointTime");
		
		String fromMapName = request.getParameter("fromMapName");
		String fromMapAddress = request.getParameter("fromMapAddress");
		String fromDes = request.getParameter("fromDes");
		String fromFloor = request.getParameter("fromFloor");
		
		String toMapName = request.getParameter("toMapName");
		String toMapAddress = request.getParameter("toMapAddress");
		String toDes = request.getParameter("toDes");
		String toFloor = request.getParameter("toFloor");
		
		String userName = request.getParameter("userName");
		String telephone = request.getParameter("telephone");
		String note = request.getParameter("note");
		
		System.out.println(taocan + appointTime + fromMapName + fromMapAddress + fromDes +fromFloor);
		System.out.println(toMapName + toMapAddress + toDes + toFloor + userName + telephone + note);
		
		Appointment appointment = new Appointment();
		appointment.setState("未处理");
		appointment.setTaocan(taocan);
		appointment.setAppointTime(appointTime);
		
		appointment.setFromMapName(fromMapName);
		appointment.setFromMapAddress(fromMapAddress);
		appointment.setFromDes(fromDes);		
		appointment.setFromFloor(fromFloor);
		
		appointment.setToMapName(toMapName);
		appointment.setToMapAddress(toMapAddress);
		appointment.setToDes(toDes);		
		appointment.setToFloor(toFloor);
		
		appointment.setUserName(userName);
		appointment.setTelephone(telephone);;
		appointment.setNote(note);;
		
		Date date = new Date();  
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");  
        String submitTime = dateFormat.format(date.getTime());    
		
		appointment.setSubmitTime(submitTime);
		
		appointmentService.addAppointment(appointment);
		
		return "成功";
	}
	
	@RequestMapping(value="/updateAppointment",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public @ResponseBody String updateAppointment(HttpServletRequest request) {
		String id = request.getParameter("id");
		String state = request.getParameter("state");
		String taocan = request.getParameter("taocan");
		String appointTime = request.getParameter("appointTime");
		
		String fromMapName = request.getParameter("fromMapName");
		String fromMapAddress = request.getParameter("fromMapAddress");
		String fromDes = request.getParameter("fromDes");
		String fromFloor = request.getParameter("fromFloor");
		
		String toMapName = request.getParameter("toMapName");
		String toMapAddress = request.getParameter("toMapAddress");
		String toDes = request.getParameter("toDes");
		String toFloor = request.getParameter("toFloor");
		
		String userName = request.getParameter("userName");
		String telephone = request.getParameter("telephone");
		String note = request.getParameter("note");
		
		System.out.println(id + state + taocan + appointTime + fromMapName + fromMapAddress + fromDes +fromFloor);
		System.out.println(toMapName + toMapAddress + toDes + toFloor + userName + telephone + note);
		
		Appointment appointment = new Appointment();
		
		appointment.setId(Integer.parseInt(id));
		appointment.setState(state);
		appointment.setTaocan(taocan);
		appointment.setAppointTime(appointTime);
		
		appointment.setFromMapName(fromMapName);
		appointment.setFromMapAddress(fromMapAddress);
		appointment.setFromDes(fromDes);		
		appointment.setFromFloor(fromFloor);
		
		appointment.setToMapName(toMapName);
		appointment.setToMapAddress(toMapAddress);
		appointment.setToDes(toDes);		
		appointment.setToFloor(toFloor);
		
		appointment.setUserName(userName);
		appointment.setTelephone(telephone);;
		appointment.setNote(note);;
		
		appointmentService.updateAppointment(appointment);
		
		return "成功";
	}
	
	@RequestMapping(value="/testTable.view",method=RequestMethod.GET)
	public String treeTable(HttpServletRequest request,Model model) {
		System.out.println("testTable.view");
		return "testTable";
	}
	
	@RequestMapping(value="/getAppointmentList",method=RequestMethod.POST,produces = "text/json;charset=UTF-8")
	public @ResponseBody String getAppointMentList(HttpServletRequest request) {
		
		//System.out.println("getAppointmentList");
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("rows"));
		
		int size = appointmentService.findAll().size();				

		int from = (currentPage - 1) * pageSize;
		int count = pageSize;

		List<Appointment> appointmentList = appointmentService.findByPagination(from, count);
		
		Gson gs = new Gson();
		String json = "{\"total\":" + size + " , \"rows\":" + gs.toJson(appointmentList).toString() + "}";
		// System.out.println("getTestCaseList handler, ret: "+ json);
		//System.out.println(json);
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
	
	@RequestMapping(value="/getUserOpenId",method=RequestMethod.GET)
	public @ResponseBody  String getUserOpenId(@RequestParam("openId") String openId) {
		//添加用户的的OPENID到数据库的 service
		
		System.out.println(openId);
		return "sucess";
	}
<<<<<<< HEAD
=======
	
>>>>>>> a78615182d36231e97e8579b6a2a2c7556c7b321
}
