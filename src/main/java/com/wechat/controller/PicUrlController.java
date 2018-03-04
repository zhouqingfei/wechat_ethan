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

@Controller
@RequestMapping("/getpic.do")
public class PicUrlController {

	@Resource
	IPicUrlService getpicurl;

	@RequestMapping(value = "/getreputation",method=RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public @ResponseBody String getReputationPic(){
		List<String> picUrlList = new ArrayList<String>();		
		picUrlList= getpicurl.getReputationPicUrl();
		
		List<Object> jsonList = new ArrayList<Object>();
		for(String picUrl:picUrlList){
			Map<String , String > picUrlMap =new HashMap<String,String>();
			picUrlMap.put("picUrl", picUrl);
			jsonList.add(picUrlMap);
		}
		Gson gs = new Gson();
		String json = "{\"result\":" + gs.toJson(jsonList).toString() + "}";
		System.out.println(json);
		return gs.toJson(json).toString();		
	}
}
