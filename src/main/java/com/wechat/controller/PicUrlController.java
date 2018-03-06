package com.wechat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.wechat.service.IPicUrlService;
import com.wechat.util.FuncUtils;

@Controller
@RequestMapping("/getpic.do")
public class PicUrlController {

	
	
	@Resource
	IPicUrlService getpicurl;

	@RequestMapping(value = "/getreputation",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public @ResponseBody String getReputationPic(){
		List<String> picUrlList = new ArrayList<String>();		
		picUrlList= getpicurl.getReputationPicUrl();
		
		String url = FuncUtils.getConfParams("URL");
		String[] folders = FuncUtils.getConfParams("REPUTATIONFILEPATH").split("//");
		
		String folder = folders[folders.length-1];
		url +=folder+"/";
		
		List<Object> jsonList = new ArrayList<Object>();
		for(String picUrl:picUrlList){
			Map<String , String > picUrlMap =new HashMap<String,String>();
			picUrlMap.put("picUrl", url+picUrl);
			jsonList.add(picUrlMap);
		}
		Gson gs = new Gson();
		String json = "{\"result\":" + gs.toJson(jsonList).toString() + "}";
		System.out.println(json);
		return gs.toJson(json).toString();	 	
	}
	
	@RequestMapping(value = "/getmain",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public @ResponseBody String getMainPic(){
		List<String> picUrlList = new ArrayList<String>();		
		picUrlList= getpicurl.getMainPicUrl();
		
		String url = FuncUtils.getConfParams("URL");
		String[] folders = FuncUtils.getConfParams("MAINMENUFILEPATHE").split("//");
		
		String folder = folders[folders.length-1];
		url +=folder+"/";
		
		
		List<Object> jsonList = new ArrayList<Object>();
		
		for(String picUrl:picUrlList){
			Map<String , String > picUrlMap =new HashMap<String,String>();
			picUrlMap.put("picUrl",url+ picUrl);
			jsonList.add(picUrlMap);
		}
		Gson gs = new Gson();
		String json = "{\"result\":" + gs.toJson(jsonList).toString() + "}";
		System.out.println(json);
		return gs.toJson(json).toString();		
	}
	
}
