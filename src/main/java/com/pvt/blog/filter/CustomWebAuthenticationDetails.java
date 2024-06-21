package com.pvt.blog.filter;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

@Getter
@Setter
public class CustomWebAuthenticationDetails extends WebAuthenticationDetails {

    public Integer id;

    public CustomWebAuthenticationDetails(HttpServletRequest request, Integer id) {
        super(request);
        this.id = id;
    }

    public String toString() {
        return this.getClass().getSimpleName() + " [" +
                "RemoteIpAddress=" + super.getRemoteAddress() + ", " +
                "id=" + this.getId() + ", " +
                "SessionId=" + super.getSessionId() + "]";
    }

}
