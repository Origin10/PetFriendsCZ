package petfriends.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import petfriends.model.Informfri_VO;
import petfriends.model.Mem_VO;
import petfriends.service.FriService;
import petfriends.service.InformfriService;
import petfriends.service.MemService;

@WebServlet(urlPatterns = { "/fristatus", "/informcheck" })
public class InsertRmFri extends HttpServlet {
	private FriService friService;
	private InformfriService informfriService;
	private MemService memService;

	class User {
		private String name;
		  private String email;


		  private User(String name, String email) {
		    this.name = name;
		    this.email = email;
		  }
		}
	

	@Override
	public void init() throws ServletException {
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		memService = (MemService) context.getBean("memService");
		friService = (FriService) context.getBean("friService");
		informfriService = (InformfriService) context.getBean("informfriService");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("id");
		String temp1 = request.getParameter("fri");
		String type = request.getParameter("type");

		System.out.println("id :" + temp + "  fri :" + temp1 + "  type :" + type);
		

		if ("onlydel".equals(type)) {
			Integer mid = Integer.parseInt(temp);
			Integer fri = Integer.parseInt(temp1);
			int[] num = { mid, fri };
			boolean result = friService.delFri(num);
			if (result) {
				response.getWriter().append("true");
			}
			response.getWriter().append("false");
		}
	
		
		if("insertinvalid".equals(type)){	
			Integer mid = Integer.parseInt(temp);
			Integer reqfri = Integer.parseInt(temp1);
			int[] num = {mid, reqfri};
						
			boolean  result	= informfriService.insert(num);
				if (result) {
					response.getWriter().append("true");
				}
				response.getWriter().append("false");
			}
		

		
		
		if("removeinvalid".equals(type)){
			
			Integer mid = Integer.parseInt(temp);
			Integer reqfri = Integer.parseInt(temp1);
			int[] num = {mid, reqfri};
						
			boolean result = informfriService.delete(num);
				if (result) {
					response.getWriter().append("true");
				}
				response.getWriter().append("false");
			}

		
		
		if ("remove".equals(type)) {
			Integer mid = Integer.parseInt(temp);
			Integer fri = Integer.parseInt(temp1);
			int[] num = { mid, fri };
			int[] fordel = { fri, mid };
				boolean result = friService.delFri(num);
				if(result){
					informfriService.delete(fordel);
					response.getWriter().append("true");
				}else{
					response.getWriter().append("false");
				}


		}

		if ("join".equals(type)) {
			Integer mid = Integer.parseInt(temp);
			Integer fri = Integer.parseInt(temp1);
			int[] num = { mid, fri };
			int[] fordel = { fri, mid };

				boolean result = friService.insertFri(num);
				if(result){
					informfriService.delete(fordel);
					response.getWriter().append("true");
				}else{
					response.getWriter().append("false");
				}
		}

		
		if ("ckeck".equals(type)) {
			Integer mid = Integer.parseInt(temp);
			List<Informfri_VO> invo = informfriService.select_info(mid);
			List<Mem_VO> minfo = new ArrayList<Mem_VO>();
			if (!invo.isEmpty()) {
				for (int i = 0; i < invo.size(); i++) {
					Mem_VO mvo = memService.select(invo.get(i).getMem_id());
					System.out.println("mvo" + mvo);
					Mem_VO data = new Mem_VO();
					data.setmem_name(mvo.getmem_name());
					data.setmem_mail(mvo.getmem_mail());					
					minfo.add(data);
				}

				System.out.println("minfo: " + minfo);	
				HttpSession session = request.getSession();	
				session.setAttribute("alert", minfo);
				
			} else {
				response.getWriter().append("null");
			}

		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		super.doGet(req, resp);
	}

}
