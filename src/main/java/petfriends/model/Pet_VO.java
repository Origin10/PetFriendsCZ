package petfriends.model;


import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pet")
public class Pet_VO implements Serializable{
	@Id
	private int pet_id;
	private String pet_name;
	private byte[] pet_photo;
	private String pet_info;
	private int mem_id;
	


	@Override
	public String toString() {
		return "Pet_VO [pet_id=" + pet_id + ", pet_name=" + pet_name + ", pet_photo=" + Arrays.toString(pet_photo)
				+ ", pet_info=" + pet_info + ", mem_id=" + mem_id + "]";
	}
	public int getPet_id() {
		return pet_id;
	}
	public void setPet_id(int pet_id) {
		this.pet_id = pet_id;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public byte[] getPet_photo() {
		return pet_photo;
	}
	public void setPet_photo(byte[] bs) {
		this.pet_photo = bs;
	}
	public String getPet_info() {
		return pet_info;
	}
	public void setPet_info(String pet_info) {
		this.pet_info = pet_info;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}

}
