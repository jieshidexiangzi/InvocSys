package cn.zbit.service;

import cn.zbit.entity.User;

public interface UserService {

	/**
	 * 登录处理
	 * @param userName
	 * @param password
	 * @return
	 */
	public User login(String userName, String password);
}
