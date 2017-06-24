package dao;

import java.util.List;

import vo.CookBean;

public interface CookDAO {

	CookBean select(int cookId);

	List<CookBean> select();

	CookBean insert(CookBean cookBean);

	CookBean update(CookBean cookBean);

	boolean delete(int cookId);
}