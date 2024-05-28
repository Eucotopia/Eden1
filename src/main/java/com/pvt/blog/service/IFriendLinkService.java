package com.pvt.blog.service;

import com.pvt.blog.pojo.FriendLink;
import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * @author LIWEI
 */
@Service
public interface IFriendLinkService {
    /**
     * get all friend links
     *
     * @return all friend links
     */
    ResultResponse<List<FriendLink>> getFriendLinks();

    /**
     * add friend link
     *
     * @param friendLink friend link
     * @return result
     */
    ResultResponse<String> addFriendLink(FriendLink friendLink);

    /**
     * get recommend friend links
     *
     * @return List<FriendLink>
     */
    ResultResponse<List<FriendLink>> getRecommendFriendLinks();

    /**
     * get HighQuality friend links
     * @return List<FriendLink>
     */
    ResultResponse<List<FriendLink>> getHighQualityFriendLinks();
}
