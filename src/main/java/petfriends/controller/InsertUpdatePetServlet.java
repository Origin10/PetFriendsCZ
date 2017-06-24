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
import petfriends.model.Pet_VO;
import petfriends.service.PetService;
import petfriends.util.UploadPhoto;

@WebServlet(urlPatterns = { "/insertpet.do", "/update.do" })
@MultipartConfig()
public class InsertUpdatePetServlet extends HttpServlet {
	private PetService petService;
	private byte[] image = null;
	@Override
	public void init() throws ServletException {
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		petService = (PetService) context.getBean("petService");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				request.setCharacterEncoding("UTF-8");
		
		
				String pid =request.getParameter("pet_id");
				String pname = request.getParameter("pet_name");
				String petinfo = request.getParameter("pet_info");
				String button = request.getParameter("pet");

				Part photo = request.getPart("photo");
				
				Mem_VO	mem = (Mem_VO)request.getSession().getAttribute("mem");

			

	
				Map<String, String> errors = new HashMap<String ,String>();
				request.setAttribute("petCRUD", errors);
				
				if(pname == null || pname.length() == 0 ){
					errors.put("name", "請輸入寵物名字");
				}
			
				if(photo.getSize() != 0){
					 image = UploadPhoto.photo(photo);
				}
				
				
				if(pname.length() >10){
					errors.put("name", "名字長度必須小於10個");
				}
				if(errors !=null && !errors.isEmpty()){					
					request.getRequestDispatcher("/editpet.jsp").forward(request, response);
					return;
				}

				
				Pet_VO pbean = new Pet_VO();
				
				pbean.setPet_name(pname);
				pbean.setPet_info(petinfo);
				pbean.setPet_photo(image);
				pbean.setMem_id(mem.getmem_id());

				
				
				if("addPet".equals(button) && pbean != null){
					boolean result = petService.insert(pbean);
					if(result){
						response.sendRedirect("/webpet/MemInfo.jsp");
						return;
					}else{
						 errors.put("pInsertError", "請洽管理員");
						 request.getRequestDispatcher("/editpet.jsp").forward(request, response);
					}
					
				}
				
				if("petUpdate".equals(button) && pbean != null){
					pbean.setPet_id(Integer.parseInt(pid));
					boolean result = petService.pupdate(pbean);
					if(result){
							response.sendRedirect("/webpet/MemInfo.jsp");
						return;
					}else{
						errors.put("pUdateError", "請洽管理員");
						request.getRequestDispatcher("/editpet.jsp").forward(request, response);
					}
								
				}

				if("petDelete".equals(button) && pbean != null){
					pbean.setPet_id(Integer.parseInt(pid));
					boolean result =petService.pdelete(pbean.getPet_id());
					if(result){
						 response.sendRedirect("/webpet/MemInfo.jsp");
						 return;
					}else{
						 errors.put("pDelete", "請洽管理員");
						 request.getRequestDispatcher("/edit.jsp").forward(request, response);
					}
				}

				
				
	}
}