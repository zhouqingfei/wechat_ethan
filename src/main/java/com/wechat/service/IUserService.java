package com.wechat.service;

import org.springframework.stereotype.Service;

import com.wechat.model.User;

@Service("userService")

public interface IUserService {  
    public User getUserById(int userId);
    public void addUser(User user);  
}  