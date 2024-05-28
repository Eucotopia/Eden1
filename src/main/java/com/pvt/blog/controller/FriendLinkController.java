package com.pvt.blog.controller;

import com.pvt.blog.pojo.FriendLink;
import com.pvt.blog.service.IFriendLinkService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * @author LIWEI
 */
@RestController
@RequestMapping("/friendLink")
public class FriendLinkController {
    @Resource
    private IFriendLinkService friendLinkService;

    @GetMapping
    public ResultResponse<List<FriendLink>> getFriendLinks() {
        return friendLinkService.getFriendLinks();
    }

    @PostMapping
    public ResultResponse<String> addFriendLink(@RequestBody FriendLink friendLink) {
        return friendLinkService.addFriendLink(friendLink);
    }

    @GetMapping("/recommend")
    public ResultResponse<List<FriendLink>> getRecommendFriendLinks() {
        return friendLinkService.getRecommendFriendLinks();
    }

    @GetMapping("/highQuality")
    public ResultResponse<List<FriendLink>> getHighQualityFriendLinks() {
        return friendLinkService.getHighQualityFriendLinks();
    }
}
