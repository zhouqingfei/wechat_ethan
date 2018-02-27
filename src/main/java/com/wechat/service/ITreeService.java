package com.wechat.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wechat.model.Tree;

@Service("treeService")
public interface ITreeService {
	public List<Tree> getChildrenByParentId (String id);
	public Tree getRoot();
}
