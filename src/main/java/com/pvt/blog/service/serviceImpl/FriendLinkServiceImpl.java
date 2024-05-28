package com.pvt.blog.service.serviceImpl;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.FriendLink;
import com.pvt.blog.repository.FriendLinkRepository;
import com.pvt.blog.service.IFriendLinkService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * @author LIWEI
 */
@Service
public class FriendLinkServiceImpl implements IFriendLinkService {
    @Resource
    private FriendLinkRepository friendLinkRepository;

    @Override
    public ResultResponse<List<FriendLink>> getFriendLinks() {
        List<FriendLink> all = friendLinkRepository.findAll();
        return ResultResponse.success(ResultEnum.SUCCESS, all);
    }

    @Override
    public ResultResponse<String> addFriendLink(FriendLink friendLink) {
        friendLinkRepository.save(friendLink);
        return ResultResponse.success(ResultEnum.SUCCESS, "添加友链成功");
    }

    @Override
    public ResultResponse<List<FriendLink>> getRecommendFriendLinks() {
        List<FriendLink> friendLinksByLevelEquals = friendLinkRepository.getFriendLinksByLevelEquals(1);
        return ResultResponse.success(ResultEnum.SUCCESS, friendLinksByLevelEquals);
    }

    @Override
    public ResultResponse<List<FriendLink>> getHighQualityFriendLinks() {
        List<FriendLink> friendLinksByLevelEquals = friendLinkRepository.getFriendLinksByLevelEquals(2);
        return ResultResponse.success(ResultEnum.SUCCESS, friendLinksByLevelEquals);
    }

}
