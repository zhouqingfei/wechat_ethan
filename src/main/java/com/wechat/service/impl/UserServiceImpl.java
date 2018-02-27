package com.wechat.service.impl;
import javax.annotation.Resource;  

import org.springframework.stereotype.Service;

import com.wechat.dao.IUserDao;
import com.wechat.model.User;
import com.wechat.service.IUserService;
  
  
@Service("userService")  
public class UserServiceImpl implements IUserService {  
    @Resource  
    private IUserDao userDao;  
    
    public User getUserById(int userId) {  
        // TODO Auto-generated method stub  
        return this.userDao.selectByPrimaryKey(userId);  
    }

	@Override
	public void addUser(User user) {
		// TODO 自动生成的方法存根
		this.userDao.insert(user);
	}  
}  