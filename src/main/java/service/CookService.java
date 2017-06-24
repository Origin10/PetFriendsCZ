package service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import dao.CookDAO;
import vo.CookBean;

public class CookService {
	public static final int IMAGE_FILENAME_LENGTH = 20;
	private CookDAO cookDao;
	public CookService(CookDAO cookDao) {
		this.cookDao = cookDao;
	}	
	public List<CookBean> select(CookBean cookBean) {
		List<CookBean> result = null;
		if(cookBean!=null && cookBean.getCookId()!=0) {
			CookBean temp = cookDao.select(cookBean.getCookId());
			if(temp!=null) {
				result = new ArrayList<CookBean>();
				result.add(temp);
			}
		} else {
			result = cookDao.select();
		}
		return result;
	}
	public CookBean insert(CookBean cookBean) {
		CookBean result = null;
		if(cookBean!=null) {
			result = cookDao.insert(cookBean);
		}
		return result;
	}
	public CookBean update(CookBean cookBean) {
		CookBean result = null;
		if(cookBean!=null) {
			result = cookDao.update(cookBean);
		}
		return result;
	}
	public boolean delete(CookBean cookBean) {
		boolean result = false;
		System.out.println("cookBean ="+cookBean.getCookId());
		if(cookBean!=null) {
			result = cookDao.delete(cookBean.getCookId());
		}
		return result;
	}
	public String selectCookPhoto(int cookId){
		String cookPhoto = null;
		if(cookId>0){
			CookBean cookBean = cookDao.select(cookId);
			cookPhoto = cookBean.getCookPhoto();
		}
		return cookPhoto;
	}
	//圖片開始
	public static String adjustFileName(String fileName, int maxLength) {
		  int length = fileName.length();
		  if ( length <= maxLength ) {
			  return fileName ;
		  }
  	  int n      = fileName.lastIndexOf(".");
        int sub    = fileName.length() - n - 1;
        fileName = fileName.substring(0, maxLength-1-sub) + "." 
                     + fileName.substring(n+1); 
		return fileName;
	}
	public static String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
		
	}	
	public static void exploreParts(Collection<Part> parts, HttpServletRequest req){
		try {
			for (Part part: parts){
				String name = part.getName();
				String contentType = part.getContentType();
				String value = "";
				long size = part.getSize(); // 上傳資料的大小，即上傳資料的位元組數
				InputStream is =part.getInputStream();
				if (contentType != null) { // 表示該part為檔案
				   // 取出上傳檔案的檔名
				   String filename =  CookService.getFileName(part);
				   // 將上傳的檔案寫入到location屬性所指定的資料夾
				   if (filename != null && filename.trim().length() > 0) {
					   part.write(filename);	
					   System.out.println(part.getClass().getName());
				   }
				} else {  // 表示該part為一般的欄位
				   // 將上傳的欄位資料寫入到location屬性所指定的資料夾，檔名為"part_"+ name
				   part.write("part_"+ name);	
				   value = req.getParameter(name);    
				}
				System.out.printf("%-15s %-15s %8d  %-20s \n", name, contentType, size, value);
			}
		} catch (IOException e) {
			e.printStackTrace();
			//圖片結束
		}
	}
}