package com.wechat.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wechat.dao.ITreeDao;
import com.wechat.model.Tree;
import com.wechat.service.ITreeService;

@Service("treeService")
public class TreeServiceImpl implements ITreeService{
	 @Resource  
	    private ITreeDao treeDao;  
	
	@Override
	public List<Tree> getChildrenByParentId(String id) {
		// TODO 自动生成的方法存根
		return treeDao.getChildrenByPid(id);
	}

	@Override
	public Tree getRoot() {
		// TODO 自动生成的方法存根
		return treeDao.getRoot();
	}
}
