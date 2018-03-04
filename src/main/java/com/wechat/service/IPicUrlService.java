package com.wechat.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service("getpicurl")
public interface IPicUrlService {

	public List<String> getReputationPicUrl();
	
	public List<String> getMainPicUrl();
}
