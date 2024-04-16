package com.pvt.blog.controller;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Role;
import com.pvt.blog.pojo.User;
import com.pvt.blog.repository.RoleRepository;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("/role")
public class RoleController {
    @Resource
    private RoleRepository roleRepository;

    /**
     * 获取所有的角色
     *
     * @return ResultResponse<List < Role>>
     */
    @GetMapping
    public ResultResponse<List<Role>> getAll() {
        List<Role> all = roleRepository.findAll();
        return ResultResponse.success(ResultEnum.SUCCESS, all);
    }

    @GetMapping("/{id}")
    public ResultResponse<Set<User>> getUsersWithRoleById(@PathVariable Long id) {
        Role byId = roleRepository.findById(0L).orElseThrow(() -> new RuntimeException("没有该 role"));
        return ResultResponse.success(ResultEnum.SUCCESS,byId.getUsers());

    }
}
