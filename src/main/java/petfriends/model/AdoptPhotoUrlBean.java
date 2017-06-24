package petfriends.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "AdoptPhotoUrl")	
public class AdoptPhotoUrlBean implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int UrlId;
	
	@ManyToOne
    @JoinColumn(name = "AId")
	private AdoptBean adoptBean;
	
	private int PhotoOrder;
	
	private String PhotoUrl;

	public int getUrlId() {
		return UrlId;
	}

	public void setUrlId(int urlId) {
		UrlId = urlId;
	}

	public AdoptBean getAdoptBean() {
		return adoptBean;
	}

	public void setAdoptBean(AdoptBean adoptBean) {
		this.adoptBean = adoptBean;
	}

	public int getPhotoOrder() {
		return PhotoOrder;
	}

	public void setPhotoOrder(int photoOrder) {
		PhotoOrder = photoOrder;
	}

	public String getPhotoUrl() {
		return PhotoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		PhotoUrl = photoUrl;
	}
	
	
}
