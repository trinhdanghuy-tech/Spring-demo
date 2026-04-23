package vn.trinhdanghuy.laptopvn.config;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import vn.trinhdanghuy.laptopvn.services.UserService;

@Component
public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    private final UserService userService;

    @Autowired
    public CustomSuccessHandler(UserService userService) {
        this.userService = userService;
    }

    protected String determineTargetUrl(final Authentication authentication) {
        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin");
        roleTargetUrlMap.put("ROLE_USER", "/");

        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authority = grantedAuthority.getAuthority();
            if (authority == null) {
                continue;
            }
            authority = authority.trim().toUpperCase(Locale.ROOT);
            if (roleTargetUrlMap.containsKey(authority)) {
                return roleTargetUrlMap.get(authority);
            }
        }
        return "/";
    }

    protected void syncSessionAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(true);
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);

        vn.trinhdanghuy.laptopvn.domain.User user = userService.getUserByEmail(authentication.getName());
        if (user != null) {
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("userId", user.getId());
        } else {
            session.removeAttribute("fullName");
            session.removeAttribute("email");
            session.removeAttribute("userId");
        }
    }

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication)
            throws IOException, ServletException {
        final String targetUrl = determineTargetUrl(authentication);
        syncSessionAttributes(request, authentication);
        if (response.isCommitted()) {
            return;
        }
        redirectStrategy.sendRedirect(request, response, targetUrl);
    }
}
