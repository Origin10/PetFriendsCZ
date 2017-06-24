package petfriends.model;

import java.util.List;
import java.util.Set;

public interface AdoptDAO {
	public List<AdoptBean> select();

	public AdoptBean select(int AId);

	public AdoptBean insert(AdoptBean bean);

	public AdoptBean update(AdoptBean bean);
	
	public boolean delete(int AId);
	
	public Set<AdoptPhotoUrlBean> getUrlsByAdoptBean(Integer AId);
}
