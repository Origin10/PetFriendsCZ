package petfriends.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import petfriends.model.Informfri_VO;
import petfriends.model.Mem_VO;
import petfriends.service.InformfriService;
import petfriends.service.MemService;


@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	
private MemService memService;
private InformfriService informfriService;


	@Override
	public void init() throws ServletException {
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		memService = (MemService) context.getBean("memService");
		informfriService = (InformfriService) context.getBean("informfriService");

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		
		String homepath = request.getRequestURI();
		System.out.println(homepath);
		Map<String,String> errors = new HashMap<String,String>();
		request.setAttribute("message", errors);
		if(email == null || email.length()==0){
			errors.put("email", "請輸入email");
		}
		if(pwd == null || pwd.length()==0){
			errors.put("pwd", "請輸入pwd");
		}
		if(errors != null && !errors.isEmpty()){
			request.getRequestDispatcher("/index.jsp").forward(request, response);		
		return;
		}

		
		Mem_VO bean =memService.login(email, pwd);
		
		

		if(bean != null){
				String userID = String.valueOf(bean.getmem_id());
				Cookie cookie = new Cookie("user",userID);
				cookie.setMaxAge(60*60);
				response.addCookie(cookie);

				
				List<Informfri_VO> invo = informfriService.select_info(bean.getmem_id());
				List<Mem_VO> minfo = new ArrayList<Mem_VO>();
				if (!invo.isEmpty()) {
					for (int i = 0; i < invo.size(); i++) {
						Mem_VO mvo = memService.select(invo.get(i).getMem_id());
						System.out.println("mvo" + mvo);
						Mem_VO data = new Mem_VO();
						data.setmem_id(mvo.getmem_id());
						data.setmem_name(mvo.getmem_name());
						data.setmem_mail(mvo.getmem_mail());					
						minfo.add(data);
					}
				}
				
				HttpSession session = request.getSession();
				session.setAttribute("alert", minfo);
				session.setAttribute("mem", bean);
				response.sendRedirect(request.getContextPath()+"/index.jsp");
				return;
			}else {
				errors.put("invalid", "帳密或密碼錯誤");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		
		
	
			
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doGet(request, response);
	}

}
