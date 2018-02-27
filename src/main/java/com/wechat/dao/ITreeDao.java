package com.wechat.dao;

import java.util.List;

import com.wechat.model.Tree;

public interface ITreeDao {
	public List<Tree> getChildrenByPid(String id);
	public Tree getRoot();
}
