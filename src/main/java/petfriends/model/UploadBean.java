package petfriends.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;


public class UploadBean implements Serializable{
	public UploadBean(String name, String path) {
        super();
        this.name = name;
        this.path = path;
    }
	
	private String name;
	
	private String path;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	


}
