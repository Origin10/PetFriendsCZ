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
import petfriends.service.ShareService;

@WebServlet(urlPatterns={"/share.do","/schange.do"})
		
public class ShareServlet extends HttpServlet{
	private ShareService shareService;
	

	@Override
	public void init() throws ServletException {
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		shareService = (ShareService) context.getBean("shareService");
		}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("id");
		String content = request.getParameter("content");
		String temp1 = request.getParameter("mid");
		String type = request.getParameter("type");

	
		System.out.println("sid:   " + temp  + "   content: " + content + "   type:  " + type );
		String  path = request.getServletPath();
		
	if(path.equals("/schange.do")){
			if(type.equals("updata")){
				int sid = Integer.parseInt(temp);
				int mid = Integer.parseInt(temp1);
			
					boolean result = shareService.update(sid, content, mid);
				if(result){
					response.getWriter().append("success");
				}else{
					response.getWriter().append("fail");
				}

			}
		
			if(type.equals("Delete")){
				int sid = Integer.parseInt(temp);
				
				boolean result = shareService.delete(sid);
				if(result){
					response.getWriter().append("success");
				}else{
					response.getWriter().append("fail");
				}
			}
		
		
		}	
	
			

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		request.setCharacterEncoding("UTF-8");
		String cmsg = request.getParameter("contentMsg");
		String  path = request.getServletPath();
	
		if(path.equals("/share.do")){
				Map<String,String > errors = new HashMap<String,String>();
				
				request.setAttribute("message", errors);
				if(cmsg.isEmpty()){
					errors.put("cmsg", "請輸入文字");
				}
				if(errors != null && !errors.isEmpty()){
					request.getRequestDispatcher("/MemInfo.jsp").forward(request, response);
					return;
				}
					
				Mem_VO vo 	= (Mem_VO)request.getSession().getAttribute("mem");
				int  num = vo.getmem_id();
				String valid = shareService.select_valid(num);
				
				if(valid == null){
					shareService.insert_Share(cmsg, vo.getmem_id());
					response.sendRedirect("/webpet/MemInfo.jsp");
				}
				else if(!valid.equals(cmsg)){
					shareService.insert_Share(cmsg, vo.getmem_id());
				response.sendRedirect("/webpet/MemInfo.jsp");	
				}else{
					errors.put("invalid", "此次分享與上次相同，試著換個內容");
					request.getRequestDispatcher("/MemInfo.jsp").forward(request, response);
					return;
				}
		}
	}

}
