package util;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.Part;

public class UploadPhoto {
		
	public  static byte[] photo (Part part){
		   InputStream in;
		   ByteArrayOutputStream out = new ByteArrayOutputStream();
		try {
			in = part.getInputStream();
			 byte[] buffer = new byte[1024];
			 
			 int length = 0;
			 while ((length = in.read(buffer)) != -1) {
				 out.write(buffer, 0, length);
				System.out.println("out:" + out);
			 }			
			 return out.toByteArray();
			 
		} catch (IOException e) {
			e.printStackTrace();
		}
	      finally {
			 try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
		}
		  
		return null;
		
	}
}
