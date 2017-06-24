package petfriends.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import petfriends.model.Mem_VO;
import petfriends.model.Pet_VO;
import petfriends.service.MemService;
import petfriends.service.PetService;

@WebServlet(urlPatterns={"/register.do" })
public class RegisterServlet extends HttpServlet {
	private MemService memService;
	private PetService petService;

	@Override
	public void init() throws ServletException {
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		memService = (MemService) context.getBean("memService");
		petService = (PetService) context.getBean("petService");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String temp  = request.getParameter("pwd");
		String petName = request.getParameter("petName");
		String petInfo = request.getParameter("petInfo");
		

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("Regmessage", errors);
		if (name == null || name.length() ==0) {
			errors.put("name", "請輸入名字");
		}
		if (email == null || email.length() <= 8) {
			errors.put("email", "請輸入E-mail");
		}
		if (temp == null || temp.length() == 0) {
			errors.put("pwd", "請輸入密碼");
		}
		if (petName == null || petName.length() == 0) {
			errors.put("petName", "請輸入寵物名字");
		}
		if (petInfo == null || petInfo.length() == 0) {
			errors.put("petInfo", "請輸入寵物簡介");
		}
		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
		byte[] pwd = temp.getBytes();
		Mem_VO bean = new Mem_VO();
		bean.setmem_name(name);
		bean.setmem_mail(email);
		bean.setmem_pwd(pwd);
		
		
		Mem_VO  result = memService.insert(bean);

		
		if(result != null){
			Pet_VO pbean = new Pet_VO();
			pbean.setPet_name(petName);
			pbean.setPet_info(petInfo);
			pbean.setMem_id(result.getmem_id());
			petService.insert(pbean);
			response.sendRedirect("/webpet/index.jsp");
		}else {
			errors.put("fail", "此帳號已被使用");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		
	}
}