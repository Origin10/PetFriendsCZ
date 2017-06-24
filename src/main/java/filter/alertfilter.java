package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import petfriends.model.Informfri_VO;
import petfriends.model.Mem_VO;
import petfriends.model.Pet_VO;
import petfriends.model.Share_VO;
import petfriends.service.InformfriService;
import petfriends.service.MemService;
import petfriends.service.PetService;
import petfriends.service.ShareService;

public class alertfilter implements Filter {
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
		System.out.println("啟動alert");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		Cookie[] cookies = req.getCookies();
		

		chain.doFilter(request, response);

	
		if (cookies != null && !"/logout.do".equals(req.getServletPath())) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().toString().equals("user")) {
					System.out.println("alertfilter");
					String user = cookie.getValue();
					int id = Integer.parseInt(user);

					List<Pet_VO> pBean = petService.select_pet_all(id);
					Mem_VO mbean = memService.select(id);
					List<Share_VO> sBean = shareService.select_all(id);

					List<Informfri_VO> invo = informfriService.select_info(id);
					List<Mem_VO> minfo = new ArrayList<Mem_VO>();
					if (!invo.isEmpty()) {
						for (int a = 0; a < invo.size(); a++) {
							Mem_VO mvo = memService.select(invo.get(a).getMem_id());
							System.out.println("mvo" + mvo);
							Mem_VO data = new Mem_VO();
							data.setmem_id(mvo.getmem_id());
							data.setmem_name(mvo.getmem_name());
							data.setmem_mail(mvo.getmem_mail());
							minfo.add(data);
						}
					}
					HttpSession session = req.getSession();

					session.setAttribute("share", sBean);
					session.setAttribute("mem", mbean);
					session.setAttribute("pet", pBean);
					session.setAttribute("alert", minfo);
					break;
				}
			}
		}
	
	}

}
