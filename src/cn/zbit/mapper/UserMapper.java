package cn.zbit.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.zbit.entity.User;

@Repository("userMapper")
public interface UserMapper {
	public User getLoginUser(@Param("userName") String userName);
}
