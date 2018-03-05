package com.wechat.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.wechat.service.IPicUrlService;
import com.wechat.util.FuncUtils;

@Service("getpicurl")
public class PicUrlServiceImpl implements IPicUrlService{

	private static Logger log=LoggerFactory.getLogger(PicUrlServiceImpl.class);
	
	 	
	private List<String> getAllFiles(String filePath){
		List<String> fileNames = new ArrayList<String>();
		
		File file = new File(filePath);
		
		if(file.exists()){
			File[] files = file.listFiles();
			if(files.length ==0){
				log.info("the path"+ filePath +" contains no file");
				return null;
			}else{
				for(File fileName : files){
					if(fileName.isDirectory()){
						log.info("the path"+ filePath +" contains filedir" + fileName.getAbsolutePath());
					}else{
						fileNames.add(fileName.getName());
					}
				}
			}
		}
		return fileNames;
		
	}
	
	@Override
	public List<String> getReputationPicUrl() {
		
		String filePath = null;
		List<String> fileList = new ArrayList<String>();
		try{
			filePath = FuncUtils.getConfParams("REPUTATIONFILEPATH");
			File dir = new File(filePath);
			if(dir.isDirectory()){
				fileList = getAllFiles(filePath);
			}
			else{
				log.info("the path is not exists " + filePath);
				return null;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}		
		return fileList;
	}

	@Override
	public  List<String> getMainPicUrl() {
		
		String filePath = null;
		List<String> fileList = new ArrayList<String>();
		try{
			filePath = FuncUtils.getConfParams("MAINMENUFILEPATHE");
			File dir = new File(filePath);
			if(dir.isDirectory()){
				fileList = getAllFiles(filePath);
			}
			else{
				log.info("the path is not exists " + filePath);
				return null;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}		
		return fileList;
	}
	
}
