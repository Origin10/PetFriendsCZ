package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import petfriends.service.InformfriService;
import petfriends.service.MemService;
import petfriends.service.PetService;
import petfriends.service.ShareService;

//@WebFilter(urlPatterns = { "/MemInfo.jsp", "/memInfo.do","/needBloodForm.jsp"})
public class loginFilter implements Filter {
	@Autowired
	private ShareService shareService;
	@Autowired
	private MemService memService;
	@Autowired
	private PetService petService;
	@Autowired
	private InformfriService informfriService;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils
				.getWebApplicationContext(filterConfig.getServletContext());

		memService = (MemService) context.getBean("memService");
		petService = (PetService) context.getBean("petService");
		shareService = (ShareService) context.getBean("shareService");
		informfriService = (InformfriService) context.getBean("informfriService");

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		Cookie[] cookies = req.getCookies();

		if (cookies == null) {
			resp.sendRedirect("/index.jsp");
			chain.doFilter(request, response);
		}

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().toString().equals("user")) {
					System.out.println("loginfirter");
					chain.doFilter(request, response);
					break;
				} else if (i == cookies.length && !cookie.getName().toString().equals("user")) {
					resp.sendRedirect("/index.jsp");
					chain.doFilter(request, response);
				}
	
			}
		}

	}

	@Override
	public void destroy() {

	}

}
