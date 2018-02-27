package com.wechat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wechat.model.Tree;
import com.wechat.model.TreeDTO;
import com.wechat.service.ITreeService;

@Controller
@RequestMapping("tree.do")

public class TreeController {
	@Resource
	private ITreeService treeService;
	
	@RequestMapping(value="loadTree",method=RequestMethod.POST)
	public @ResponseBody List<TreeDTO> loadTree(HttpServletRequest request,Model model) {
		
		String id = request.getParameter("id");
		List<TreeDTO> dtoList = new ArrayList<TreeDTO>();
		
		if("".equals(id) || id == null) {
			Tree root = treeService.getRoot();
			TreeDTO treeDTO = new TreeDTO();
			treeDTO.setId(root.getId());
			treeDTO.setParent_id(root.getParent_id());
			treeDTO.setText(root.getName());
			treeDTO.setChecked(root.getChecked());
			treeDTO.setIconCls(root.getIcon());
			treeDTO.setState("closed");
			
			Map<String, Object>  map = new HashMap<String, Object>();
			map.put("url", root.getUrl());			
			map.put("type", root.getType());
			map.put("other", root.getOther());
			
			treeDTO.setAttributes(map);
			
			dtoList.add(treeDTO);
		}
		else {
			List<Tree> list = treeService.getChildrenByParentId(id);
			for (Tree tree:list) {
				TreeDTO treeDTO = new TreeDTO();
				treeDTO.setId(tree.getId());
				treeDTO.setParent_id(tree.getParent_id());
				treeDTO.setText(tree.getName());
				treeDTO.setChecked(tree.getChecked());
				treeDTO.setIconCls(tree.getIcon());
				
				if(treeService.getChildrenByParentId(tree.getId()).size() > 0){
					
					treeDTO.setState("closed");
					//System.out.println("closed");
				} else {
					treeDTO.setState("open");
					//System.out.println("open");
				}
				
				Map<String, Object>  map = new HashMap<String, Object>();
				map.put("url", tree.getUrl());				
				map.put("type", tree.getType());
				map.put("testCaseList", tree.getOther());
				treeDTO.setAttributes(map);
				dtoList.add(treeDTO);
			}
		}
		return dtoList;
	}
}
