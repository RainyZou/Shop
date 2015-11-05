package com.liveman.shop.filter;

import java.io.IOException;

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

/**
 * Servlet Filter implementation class SessionFilter
 */
@WebFilter("/SessionFilter")
public class SessionFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public SessionFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) request).getSession();
		HttpServletResponse rep = (HttpServletResponse) response;
		HttpServletRequest req = (HttpServletRequest) request;

		String path = req.getContextPath();
		String url = req.getRequestURI();
		boolean isContainsUncheckedUrl = isContainsUncheckedUrl(url);
		String basePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + path + "/";

		if ((session == null || session.getAttribute("user") == null)&&!isContainsUncheckedUrl) {
			rep.sendRedirect(basePath + "user/login");
		} else {

			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	private boolean isContainsUncheckedUrl(String url) { 
        boolean isContainsUncheckedUrl = false;
        String[] uncheckedUrls = {"cart/list"};

        for (String uncheckedUrl : uncheckedUrls) {
            if (url.contains(uncheckedUrl)) {
                isContainsUncheckedUrl = true;
                break;
            }
        }
        return isContainsUncheckedUrl;
    }

}
