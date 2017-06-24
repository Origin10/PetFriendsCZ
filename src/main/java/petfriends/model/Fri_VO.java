package petfriends.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="fri")
public class Fri_VO  implements Serializable{
	@Id
	private  int fri_id;
	private	 int mem_fri_num;
	private	int mem_id;
	
	@Override
	public String toString() {
		return "Fri_VO [fri_id=" + fri_id + ", mem_fri_num=" + mem_fri_num + ", mem_id=" + mem_id + "]";
	}
	public int getFri_id() { 
		return fri_id;
	}
	public void setFri_id(int fri_id) {
		this.fri_id = fri_id;
	}
	public int getMem_fri_num() {
		return mem_fri_num;
	}
	public void setMem_fri_num(int mem_fri_num) {
		this.mem_fri_num = mem_fri_num;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}

	
	
}
