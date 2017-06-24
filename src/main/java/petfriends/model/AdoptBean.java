package petfriends.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Adopt")
public class AdoptBean implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int AId;
	
	private int mem_id;
	
	private int PetForm;
	
	@NotEmpty
	private String UserTitle;
	
	@Pattern(regexp="^[\u4e00-\u9fa5a-zA-Z]+$")
	@NotEmpty
	private String UserName;
	
	@Pattern(regexp="^09\\d{2}-?\\d{3}-?\\d{3}$")
	@NotEmpty
	private String UserPhone;
	
	@Email
	private String UserEmail;
	
	private String PetName;
	
	@NotEmpty
	private String PetType;
	
	private String PetBreeds;
	
	@NotEmpty
	private String PetFeature;
	
	@NotEmpty
	private String FindCity;
	
	private String FindDistrict;
	
	private String FindRoad;
	
	@DateTimeFormat(pattern="yyyy/MM/dd")
	@Past
	@NotNull
	private java.util.Date FindDate;
	
	private String IcNumber;
	
	@NotEmpty
	private String PetGender;
	
	private String PetNotes;
	
	//一個AdoptPhotoUrlBean 只能對應到一個AdoptBean(多對一)
	//一個AdoptBean能對應到多個AdoptPhotoUrlBean
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "adoptBean", cascade = CascadeType.ALL)
    private Set<AdoptPhotoUrlBean> adoptPhotoUrlBeans = new HashSet<AdoptPhotoUrlBean>();
	
	


	@Override
	public String toString() {
		return "AdoptBean [AId=" + AId + ", PetForm=" + PetForm + ", UserTitle=" + UserTitle + ", UserName=" + UserName
				+ ", UserPhone=" + UserPhone + ", UserEmail=" + UserEmail + ", PetName=" + PetName + ", PetType="
				+ PetType + ", PetBreeds=" + PetBreeds + ", PetFeature=" + PetFeature + ", FindCity=" + FindCity
				+ ", FindDistrict=" + FindDistrict + ", FindRoad=" + FindRoad + ", FindDate=" + FindDate + ", IcNumber="
				+ IcNumber + ", PetGender=" + PetGender + ", PetNotes=" + PetNotes + ", adoptPhotoUrlBeans="
				+ adoptPhotoUrlBeans + "]";
	}


	public int getAId() {
		return AId;
	}


	public void setAId(int aId) {
		AId = aId;
	}


	public int getMem_id() {
		return mem_id;
	}


	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}


	public int getPetForm() {
		return PetForm;
	}


	public void setPetForm(int petForm) {
		PetForm = petForm;
	}


	public String getUserTitle() {
		return UserTitle;
	}


	public void setUserTitle(String userTitle) {
		UserTitle = userTitle;
	}


	public String getUserName() {
		return UserName;
	}


	public void setUserName(String userName) {
		UserName = userName;
	}


	public String getUserPhone() {
		return UserPhone;
	}


	public void setUserPhone(String userPhone) {
		UserPhone = userPhone;
	}


	public String getUserEmail() {
		return UserEmail;
	}


	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}


	public String getPetName() {
		return PetName;
	}


	public void setPetName(String petName) {
		PetName = petName;
	}


	public String getPetType() {
		return PetType;
	}


	public void setPetType(String petType) {
		PetType = petType;
	}


	public String getPetBreeds() {
		return PetBreeds;
	}


	public void setPetBreeds(String petBreeds) {
		PetBreeds = petBreeds;
	}


	public String getPetFeature() {
		return PetFeature;
	}


	public void setPetFeature(String petFeature) {
		PetFeature = petFeature;
	}


	public String getFindCity() {
		return FindCity;
	}


	public void setFindCity(String findCity) {
		FindCity = findCity;
	}


	public String getFindDistrict() {
		return FindDistrict;
	}


	public void setFindDistrict(String findDistrict) {
		FindDistrict = findDistrict;
	}


	public String getFindRoad() {
		return FindRoad;
	}


	public void setFindRoad(String findRoad) {
		FindRoad = findRoad;
	}


	public java.util.Date getFindDate() {
		return FindDate;
	}


	public void setFindDate(java.util.Date findDate) {
		FindDate = findDate;
	}


	public String getIcNumber() {
		return IcNumber;
	}


	public void setIcNumber(String icNumber) {
		IcNumber = icNumber;
	}


	public String getPetGender() {
		return PetGender;
	}


	public void setPetGender(String petGender) {
		PetGender = petGender;
	}


	public String getPetNotes() {
		return PetNotes;
	}


	public void setPetNotes(String petNotes) {
		PetNotes = petNotes;
	}


	public Set<AdoptPhotoUrlBean> getAdoptPhotoUrlBeans() {
		return adoptPhotoUrlBeans;
	}


	public void setAdoptPhotoUrlBeans(Set<AdoptPhotoUrlBean> adoptPhotoUrlBeans) {
		this.adoptPhotoUrlBeans = adoptPhotoUrlBeans;
	}

	
}
