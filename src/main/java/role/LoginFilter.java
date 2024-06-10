/*
 * package role;
 * 
 * 
 * 
 * import java.io.IOException; import java.util.Arrays; import java.util.List;
 * 
 * import javax.servlet.Filter; import javax.servlet.FilterChain; import
 * javax.servlet.FilterConfig; import javax.servlet.ServletException; import
 * javax.servlet.ServletRequest; import javax.servlet.ServletResponse; import
 * javax.servlet.annotation.WebFilter; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * @WebFilter("/*") public class LoginFilter implements Filter { private static
 * final List<String> EXCLUDED_PATHS = Arrays.asList("/login",
 * ".../webapp/css/login.css", "/js/", "/images/");
 * 
 * @Override public void init(FilterConfig filterConfig) throws ServletException
 * { }
 * 
 * @Override public void doFilter(ServletRequest request, ServletResponse
 * response, FilterChain chain) throws IOException, ServletException {
 * HttpServletRequest req = (HttpServletRequest) request; HttpServletResponse
 * resp = (HttpServletResponse) response; HttpSession session =
 * req.getSession(false); String loginURI = req.getContextPath() + "/login";
 * boolean loggedIn = session != null && session.getAttribute("profile") !=
 * null; boolean loginRequest = req.getRequestURI().equals(loginURI);
 * 
 * if (loggedIn || loginRequest) { chain.doFilter(request, response); } else {
 * resp.sendRedirect(loginURI); } }
 * 
 * @Override public void destroy() { } }
 */

package role;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class LoginFilter implements Filter {

    private static final List<String> EXCLUDED_PATHS = Arrays.asList(
        "/login", 
        "/css/", 
        "/js/", 
        "/img/"
    );

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String path = req.getRequestURI().substring(req.getContextPath().length());
        boolean isExcludedPath = EXCLUDED_PATHS.stream().anyMatch(path::startsWith);

        boolean loggedIn = session != null && session.getAttribute("profile") != null;
        boolean loginRequest = req.getRequestURI().equals(req.getContextPath() + "/login");

        if (loggedIn || loginRequest || isExcludedPath) {
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }

    @Override
    public void destroy() {
    }
}
