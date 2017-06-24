package petfriends.model;


import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="share")
public class Share_VO  implements Serializable{
	
	
	@Id
	private int share_Id;
	private String share_content;
	private String share_date;
	private int mem_id;
	
	@Override
	public String toString() {
		return "Share_VO [share_Id=" + share_Id + ", share_content=" + share_content + ", share_date=" + share_date
				+ ", mem_id=" + mem_id + "]";
	}
	public int getShare_Id() {
		return share_Id;
	}
	public void setShare_Id(int share_Id) {
		this.share_Id = share_Id;
	}

	public String getShare_date() {
		return share_date;
	}
	public void setShare_date(String share_date) {
		this.share_date = share_date;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	public String getShare_content() {
		return share_content;
	}
	public void setShare_content(String share_content) {
		this.share_content = share_content;
	}
	

	
}
	