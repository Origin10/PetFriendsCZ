package petfriends.model;

import java.util.List;

public interface AdoptPhotoUrlDAO {
	public List<AdoptPhotoUrlBean> select();

	public AdoptPhotoUrlBean select(int UrlId);

	public AdoptPhotoUrlBean insert(AdoptPhotoUrlBean bean);

	public AdoptPhotoUrlBean update(AdoptPhotoUrlBean bean);
	
	public boolean delete(int UrlId);
}
