package vo;

import java.util.Arrays;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="COOK")
public class CookBean  {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int     cookId ;
	private String  cookName;
	private String  cookFood;
	private String  cookSop;
	private int memId;
	private String  cookPhoto;
	@Temporal(TemporalType.TIMESTAMP)
	private Date creationDate;
	private int creationBy;
	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;
	private int updateBy;
	
	public int getCookId() {
		return cookId;
	}
	public void setCookId(int cookId) {
		this.cookId = cookId;
	}
	public String getCookName() {
		return cookName;
	}
	public void setCookName(String cookName) {
		this.cookName = cookName;
	}
	public String getCookFood() {
		return cookFood;
	}
	public void setCookFood(String cookFood) {
		this.cookFood = cookFood;
	}
	public String getCookSop() {
		return cookSop;
	}
	public void setCookSop(String cookSop) {
		this.cookSop = cookSop;
	}
	public int getmemId() {
		return memId;
	}
	public void setmemId(int memId) {
		this.memId = memId;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public int getCreationBy() {
		return creationBy;
	}
	public void setCreationBy(int creationBy) {
		this.creationBy = creationBy;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(int updateBy) {
		this.updateBy = updateBy;
	}
	public String getCookPhoto() {
		return cookPhoto;
	}
	public void setCookPhoto(String cookPhoto) {
		this.cookPhoto = cookPhoto;
	}
	@Override
	public String toString() {
		return "CookBean [cookId=" + cookId + ", cookName=" + cookName + ", cookFood=" + cookFood + ", cookSop="
				+ ", creationBy=" + creationBy + ", updateDate=" + updateDate + ", updateBy=" + updateBy + "]";
	}
		
}