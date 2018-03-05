package com.wechat.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wechat.service.impl.PicUrlServiceImpl;

public class FuncUtils {
	
	private static Logger log=LoggerFactory.getLogger(FuncUtils.class);
	
	public static String getConfParams(String param) {
		InputStream is = FuncUtils.class.getResourceAsStream("/config.properties");
		Properties properties = new Properties();
		try {
			properties.load(new InputStreamReader(is, "UTF-8"));
			log.debug("GuGong: pls print " + param + " :" + properties.getProperty(param));
			return properties.getProperty(param);
		} catch (IOException e) {
			log.error("读取配置文件参数异常：", e);
		}
		return null;
	}
}
