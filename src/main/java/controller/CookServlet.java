package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.CookDAOHibernate;
import model.hibernate.HibernateUtil;
import petfriends.model.Mem_VO;
import service.CookService;
import vo.CookBean;

/**
 * Servlet implementation class CookServlet
 */

@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, 
maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet(
		urlPatterns={"/cook/CookServlet"}
		)
public class CookServlet extends HttpServlet {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CookService cookService;
	
	@Override
	public void init() throws ServletException {
		cookService = new CookService(
				new CookDAOHibernate(HibernateUtil.getSessionFactory()));
//		WebApplicationContext context =
//				WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
//		cookService = (CookService) context.getBean("cookService");
	}
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Get!!!");
		this.doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//接收資料
		System.out.println("POST");
		Collection<Part> parts = null;
		InputStream is = null;
		byte[] img = null;
		String photoUrl = null;
		String cookName   = request.getParameter("account");
		String cookSop    = request.getParameter("comment1");
		String cookFood   = request.getParameter("comment");
		String prodaction = request.getParameter("prodaction");
		Integer memId = request.getParameter("memId") == null ? 0 : Integer.valueOf(request.getParameter("memId"));
		int cookId = request.getParameter("cookId") == null ? 0 : Integer.valueOf(request.getParameter("cookId"));
		
		
		Mem_VO mbean = (Mem_VO) request.getSession().getAttribute("mem");
		
		System.out.println("mbean" + mbean.getmem_id());		
		
		
	System.out.println("prodaction = " + prodaction + ", CookName = " + cookName + ", CookFood = " + cookFood + ", CookSop  = " + cookSop + 
			", memId = " + memId+",cookId="+cookId+",is="+is);
//驗證資料	
		Map<String,String> errors = new HashMap<String,String>();
		request.setAttribute("errors", errors);
		if("Insert".equals(prodaction) || "Update".equals(prodaction) ) {
			if(cookName == null||cookName.length()==0){
				errors.put("account", "請輸入食譜名稱");
			}
			if(cookFood==null||cookFood.length()==0){
				errors.put("comment", "請輸入食材內容");
			}
			if(cookSop==null||cookSop.length()==0){
				errors.put("comment1", "請輸入食譜步驟");
			}
			
			//圖片
			parts = request.getParts();
			for (Part p : parts) {
				if(p != null && p.getName().equals("file")){
					img = new byte[(int) p.getSize()];
					
					is=p.getInputStream();
//					is.read(img);
					FileOutputStream os=new FileOutputStream(new File(getServletContext().getRealPath("\\images"), p.getSubmittedFileName()));
					int l=0;byte[] b=new byte[1024];
					while((l=is.read(b))!=-1){
						os.write(b, 0, l);
					}
					photoUrl = "/images/" + p.getSubmittedFileName();
					os.close();
					is.close();
				}
			}
		}
		
//轉換資料	
		if(errors != null && !errors.isEmpty()){
			if("Insert".equals(prodaction)){
				request.getRequestDispatcher("/cook/CookInsert.jsp").forward(request, response);
				return ;
			}else if("Update".equals(prodaction)){
				request.getRequestDispatcher("/cook/CookUpdate.jsp").forward(request, response);
				return ;
			}else{
				request.getRequestDispatcher("/cook/index.jsp").forward(request, response);
				return ;
			}
			
		}
		
//呼叫Model
		
		CookBean cookBean = new CookBean();
		cookBean.setmemId(memId);
		cookBean.setCookId(cookId);
		cookBean.setCookName(cookName);
		cookBean.setCookFood(cookFood);
		cookBean.setCookSop(cookSop);
		cookBean.setCreationDate(new Date());
		cookBean.setCreationBy(memId);
		cookBean.setCookPhoto(photoUrl);
		
//		System.out.println("cook_sop = " + cook_sop +"1"+ " cook_food = " + cook_food + " cook_name = " + cook_name);
//根據Model執行結果呼叫View
		if("Select".equals(prodaction)){
			List<CookBean> result =cookService.select(cookBean);
			request.setAttribute("select", result);
			request.getRequestDispatcher("/cook/CookUpdate.jsp"
					).forward(request, response);
		} else if("Insert".equals(prodaction)){
			CookBean result = null;
			result = cookService.insert(cookBean);
			
			if(result == null){
				errors.put("action", "Insert失敗");
			}else{
				request.setAttribute("insert", result);
			}
			request.getRequestDispatcher(
					"/cook/index.jsp").forward(request, response);
		} else if("Update".equals(prodaction)){
			System.out.println("prodaction"+prodaction);
			CookBean result = cookService.update(cookBean);
			
			if(result==null) {
				errors.put("action", "Update失敗");
			} else{
				request.setAttribute("update", result);
			}
			request.getRequestDispatcher(
					"/cook/index.jsp").forward(request, response);
		} else if("Delete".equals(prodaction)){
			
			boolean result = cookService.delete(cookBean);
			if(result){
				request.setAttribute("delete", 1);
				
			}else {
				request.setAttribute("delete", 0);
			}
			request.getRequestDispatcher(
					"/cook/index.jsp").forward(request, response);
		} else if ("SelectAll".equals(prodaction)) {
			List<CookBean> result =cookService.select(cookBean);
			
			System.out.println("result : " + result);
			request.setAttribute("a", "a");
			request.setAttribute("result", result);
			request.getRequestDispatcher("/cook/index.jsp"
					).forward(request, response);
		} 
//		else if("getCookPhoto".equals(prodaction)){
//			if ( cookId > 0) {
//				String cookPhoto = cookService.selectCookPhoto(cookId);
//				if (cookPhoto != null && !cookPhoto.equals(null)) {
//					try {
//						response.getOutputStream().write(cookPhoto);
//					} catch (IOException e) {
//						e.printStackTrace();
//					} catch (java.lang.IllegalArgumentException e) {
//						System.out.println("no images");
//					}
//				}
//			}
//		}
		else {
			errors.put("action", "Unknown Action:"+prodaction);
			request.getRequestDispatcher(
					"/cook/index.jsp").forward(request, response);
		}
  }
}