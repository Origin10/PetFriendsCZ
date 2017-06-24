package petfriends.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="informfri")
public class Informfri_VO  implements Serializable{
	@Id
	private	int  informfri_id;
	private	int  to_fri_num;
	private	int  mem_id;
	
	
	@Override
	public String toString() {
		return "Informfri_VO [informfri_id=" + informfri_id + ", to_fri_num=" + to_fri_num + ", mem_id=" + mem_id + "]";
	}
		
		public int getInformfri_id() {
		return informfri_id;
	}
	public void setInformfri_id(int informfri_id) {
		this.informfri_id = informfri_id;
	}
	public int getTo_fri_num() {
		return to_fri_num;
	}
	public void setTo_fri_num(int to_fri_num) {
		this.to_fri_num = to_fri_num;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
		
}
