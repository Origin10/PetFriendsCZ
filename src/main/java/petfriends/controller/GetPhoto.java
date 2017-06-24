package petfriends.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import petfriends.service.MemService;
import petfriends.service.PetService;

@WebServlet(urlPatterns = { "/petPhoto.do", "/memPhoto.do" })

public class GetPhoto extends HttpServlet {
	private PetService petService;
	private MemService memService;

	@Override
	public void init() throws ServletException {
		WebApplicationContext context =
				WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		memService = (MemService) context.getBean("memService");
		petService = (PetService) context.getBean("petService");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String pidormEmail = request.getParameter("id");
		String type = request.getParameter("type");

		BufferedImage image = null;
		if (!pidormEmail.isEmpty() && type.equals("petPhoto")) {
			byte[] pphoto = petService.select_photo(Integer.parseInt(pidormEmail));
			if (pphoto != null && !pphoto.equals(null)) {
				try {
					image = ImageIO.read(new ByteArrayInputStream(pphoto));
					ImageIO.write(image, "jpg", response.getOutputStream());
				} catch (IOException e) {
					e.printStackTrace();
				} catch (java.lang.IllegalArgumentException e) {
					System.out.println("no images");
				}
			}
		}

		if (!pidormEmail.isEmpty() && type.equals("memPhoto")) {
			byte[] mphoto = memService.select_photo(pidormEmail);
			if (mphoto != null && !mphoto.equals(null)) {
				try {
					image = ImageIO.read(new ByteArrayInputStream(mphoto));
					ImageIO.write(image, "jpg", response.getOutputStream());
				} catch (IOException e) {
					e.printStackTrace();
				} catch (java.lang.IllegalArgumentException e) {
//					image = ImageIO.read(new File("imgs/sketch.jpeg"));
//					System.out.println("imag" + image);
//					ImageIO.write(image, "jpeg", response.getOutputStream());
					
					System.out.println("no images");
				}
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		this.doGet(req, resp);
	}

}
