package petfriends.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import petfriends.model.Mem_VO;
import petfriends.service.MemService;
import util.UploadPhoto;

@WebServlet("/mupdel.do")
@MultipartConfig()
public class UpdateDelteMemServlet extends HttpServlet{
	private MemService memService;

	@Override
	public void init() throws ServletException {
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		memService = (MemService) context.getBean("memService");
		}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					request.setCharacterEncoding("UTF-8");
		
					String temp = request.getParameter("mid");
					String name = request.getParameter("mname");
					String temp1 = request.getParameter("mpwd");
					String temp2 = request.getParameter("mcheckpwd");
					String minfo = request.getParameter("minfo");
					Part mphoto = request.getPart("mphoto");
					
//					String method = request.getMethod();
//					System.out.println("method="+method+", "+request.getRequestURI());
//					
//					String action = request.getParameter("action");
//					System.out.println("action="+action);
				
					
					
					Map<String ,String> errors = new HashMap<String,String>();
					request.setAttribute("mupdate", errors);

					if(name == null ||  name.length() == 0 ){
						errors.put("mname", "請輸入姓名");
					}			

					int id =0;
					if(temp != null){
						id = Integer.parseInt(temp);
					}
					
					byte[] images = null;
					if(mphoto!= null){
						images = UploadPhoto.photo(mphoto);	
					}
					
					
					
					byte[] passwrod = null;
					if(temp1 != null || temp1.length() !=0 && temp1 == temp2){
						if(temp1.length() <=6){
							passwrod = temp1.getBytes();
						}else{
							errors.put("pwd", "密碼不得小於6碼");
						}
					}else{
						errors.put("pwd", "密碼 或 確認密碼不一致 請確認");
					}
	
					if(errors != null && !errors.isEmpty()){
						request.getRequestDispatcher("/editMem.jsp").forward(request, response);
						return;
					}
					
					
					Mem_VO mbean = new Mem_VO();
					mbean.setmem_id(id);
					mbean.setmem_name(name);
					mbean.setmem_pwd(passwrod);
					mbean.setmem_photo(images);
					mbean.setmem_info(minfo);
					

				
					if( mbean != null){
						boolean result= memService.update(mbean);
						if(result){
							response.sendRedirect("/webpet/MemInfo.jsp");
						}else{
							//新增失敗
							errors.put("mInsertError", "請洽管理員");
							request.getRequestDispatcher("/editMem.jsp").forward(request, response);

						}
					}


	}
}