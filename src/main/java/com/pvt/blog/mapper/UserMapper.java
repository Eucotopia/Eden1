package com.pvt.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pvt.blog.pojo.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author LW
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
}
