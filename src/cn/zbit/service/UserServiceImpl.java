package cn.zbit.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zbit.entity.User;
import cn.zbit.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper;

	@Override
	public User login(String userName, String password) {
		User user = userMapper.getLoginUser(userName);
		
		if (user != null) {
			if (!password.equals(user.getPassword())) {
				return null;
			}
		}
		return user;
	}

}
