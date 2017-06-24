package petfriends.controller;

import java.io.File;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import petfriends.model.AdoptBean;
import petfriends.model.AdoptPhotoUrlBean;
import petfriends.model.Mem_VO;
import petfriends.model.UploadBean;
import petfriends.service.AdoptService;
import petfriends.service.AdoptUrlService;

@Controller
@RequestMapping("/")
@MultipartConfig
public class AdoptController {
	@Autowired
	private AdoptService adoptService;
	
	@Autowired
	private AdoptUrlService adoptUrlService;	
	
	@Autowired
	ServletContext context;

	@InitBinder
	protected void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
		CustomDateEditor customerDateEditor = new CustomDateEditor(new SimpleDateFormat("yyyy/MM/dd"), true);
		webDataBinder.registerCustomEditor(java.util.Date.class, customerDateEditor);
	}

	@RequestMapping(value = "addAdopt", method = RequestMethod.GET)
	public String newRegistration(ModelMap model) {
		AdoptBean adoptBean = new AdoptBean();
		model.addAttribute("adoptBean", adoptBean);
		return "addAdopt";
	}

	@RequestMapping(value = "addAdopt", method = RequestMethod.POST)
	public String savePetInfo(@Valid @ModelAttribute AdoptBean adoptBean, BindingResult result, ModelMap model,
			@RequestParam("file") List<MultipartFile> files,HttpSession session) {
		// 設定資料夾、存檔路徑、副檔名
		Mem_VO memBean=(Mem_VO)session.getAttribute("mem");
		int memId=memBean.getmem_id();
		String path = null;
		String saveUrl = null;

		for (MultipartFile file : files) {
			String oriFileNameExt = FilenameUtils.getExtension(file.getOriginalFilename().toLowerCase());
			if (oriFileNameExt.equals("jpg") || oriFileNameExt.equals("png") || oriFileNameExt.equals("bmp")) {
			} else {
				model.addAttribute("file", "只支援BMP,JPG,PNG檔");
				return "addAdopt";
			}
		}

		if (result.hasErrors()) {
			model.addAttribute("file", "表單錯誤請重新上傳");
			return "addAdopt";
		} else if (result.hasErrors() || model.containsAttribute("file")) {
			return "addAdopt";
		}

		// 新增寵物資訊AdoptBean元件
		// 新增圖片元件
		List<UploadBean> uploadedFiles = new ArrayList<UploadBean>();
		Set<AdoptPhotoUrlBean> set = new HashSet<AdoptPhotoUrlBean>();
		if (!files.isEmpty() || !result.hasErrors()) {
			try {
				for (MultipartFile file : files) {
					// 儲存檔名(by MD5)
					SecureRandom random=SecureRandom.getInstance("SHA1PRNG");
					String msg = adoptBean.getUserTitle()+random.nextInt();
			        MessageDigest md = MessageDigest.getInstance("MD5");
			        byte[] messageDigest = md.digest(msg.getBytes());
			        BigInteger number = new BigInteger(1, messageDigest);
			        String hashtext = number.toString(16);
			        
					saveUrl = hashtext + File.separator + "photo" + File.separator + files.indexOf(file) + "."
							+ "png";
					path = context.getRealPath("/resources/images/") + saveUrl;

					File destinationFile = new File(path);
					if (!destinationFile.exists()) {
						destinationFile.getParentFile().mkdirs();
						destinationFile.createNewFile();
					}
					file.transferTo(destinationFile);
					uploadedFiles.add(new UploadBean(destinationFile.getName(), path));
					//建立URL BEAN並儲存下來
					AdoptPhotoUrlBean Urlbean = new AdoptPhotoUrlBean();
					Urlbean.setAdoptBean(adoptBean);
					Urlbean.setPhotoOrder(files.indexOf(file) + 1);
					Urlbean.setPhotoUrl("/resources/images/" + saveUrl);
					set.add(Urlbean);
				}

				adoptBean.setAdoptPhotoUrlBeans(set);
				adoptBean.setMem_id(memId);
				AdoptBean resultBean = adoptService.insert(adoptBean);
				if (resultBean == null) {
					model.addAttribute("action", "Insert失敗");
					return "addAdopt";
				}

				// 都成功就回傳
				model.addAttribute("insert", resultBean);
				return "view";

			} catch (Exception e) {
				// 有錯誤就顯示，刪除資料夾
				System.out.println(e.getMessage());
				model.addAttribute("file", "請至少選擇一張圖片");
				return "addAdopt";
			}
		}
		return "addAdopt";
	}
	
	
	@RequestMapping(value = { "/list" }, method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getAllAdopt(AdoptBean adoptBean, ModelMap model) {
		List<AdoptBean> adoptBeans = adoptService.select(adoptBean);
		
		//JSON 範例，使用GSON LIB
		Gson gson = new GsonBuilder().setExclusionStrategies(new ExclusionStrategy() {

			@Override
			public boolean shouldSkipField(FieldAttributes f) {
				return f.getName().contains("adoptBean");
			}

			@Override
			public boolean shouldSkipClass(Class<?> clazz) {
				return false;
			}
		}).create();
		String json = gson.toJson(adoptBeans);
		return json;
	}
	
	@RequestMapping(value = { "/selectAdopt/{AId}" }, method = RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectAdopt(@PathVariable int AId, ModelMap model) {
		AdoptBean bean = adoptService.select(AId);
		
		//JSON 範例，使用GSON LIB
		Gson gson = new GsonBuilder().setExclusionStrategies(new ExclusionStrategy() {

			@Override
			public boolean shouldSkipField(FieldAttributes f) {
				return f.getName().contains("adoptBean");
			}

			@Override
			public boolean shouldSkipClass(Class<?> clazz) {
				return false;
			}
		}).create();
		String json = gson.toJson(bean);
		return json;
	}
	
	@RequestMapping(value = "/editAdopt/updateAdopt--{AId}", method = RequestMethod.POST)
	public String updatePetInfo(@Valid @ModelAttribute AdoptBean adoptBean, BindingResult result, ModelMap model,
			@RequestParam("file") List<MultipartFile> files,@PathVariable int AId,HttpSession session) {
		// 設定資料夾、存檔路徑、副檔名
		Mem_VO memBean=(Mem_VO)session.getAttribute("mem");
		int memId=memBean.getmem_id();
		String path = null;
		String saveUrl = adoptUrlService.select(AId).getPhotoUrl();
		for (MultipartFile file : files) {
			String oriFileNameExt = FilenameUtils.getExtension(file.getOriginalFilename().toLowerCase());
			if (oriFileNameExt.equals("jpg") || oriFileNameExt.equals("png") || oriFileNameExt.equals("bmp")) {
			} else {
				model.addAttribute("file", "只支援BMP,JPG,PNG檔");
				return "editAdopt";
			}
		}

		if (result.hasErrors()) {
			model.addAttribute("file", "表單錯誤請重新上傳");
			return "editAdopt";
		} else if (result.hasErrors() || model.containsAttribute("file")) {
			return "editAdopt";
		}

		// 新增寵物資訊AdoptBean元件
		// 新增圖片元件
		List<UploadBean> uploadedFiles = new ArrayList<UploadBean>();
		if (!files.isEmpty() || !result.hasErrors()) {
			try {
				for (MultipartFile file : files) {
						// 儲存檔名(by MD5)						
						path = context.getRealPath(saveUrl);
						System.out.println(path);
						File destinationFile = new File(path);
						if (!destinationFile.exists()) {
							destinationFile.getParentFile().mkdirs();
							destinationFile.createNewFile();
						}
						file.transferTo(destinationFile);
						uploadedFiles.add(new UploadBean(destinationFile.getName(), path));
				}
				adoptBean.setPetForm(adoptBean.getPetForm());
				adoptBean.setMem_id(memId);
				AdoptBean resultBean = adoptService.update(adoptBean);
				System.out.println(resultBean);
				if (resultBean == null) {
					model.addAttribute("action", "Update失敗");
					return "editAdopt";
				}

				// 都成功就回傳
				model.addAttribute("insert", resultBean);
				return "viewUpdate";

			} catch (Exception e) {
				// 有錯誤就顯示，刪除資料夾
				System.out.println(e.getMessage());
				model.addAttribute("file", "請至少選擇一張圖片");
				return "editAdopt";
			}
		}
		return "editAdopt";
	}
	
	@RequestMapping(value = { "/editAdopt/{AId}" }, method = RequestMethod.GET)
	public String editAdopt(@PathVariable int AId, ModelMap model,HttpSession session) {
		Mem_VO memBean=(Mem_VO)session.getAttribute("mem");
		int memId=memBean.getmem_id();	
		AdoptBean bean = adoptService.select(AId);
		if(bean.getMem_id()!=memId){
			model.addAttribute("editError", "您並非使用者，回到協尋頁面");
			return "viewAll";
		}
		model.addAttribute(bean);
		return "editAdopt";
	}
	
	
	
	@RequestMapping(value ="/adopt", method = RequestMethod.GET)
	public String MainPage(ModelMap model) {
		return "viewAll";
	}
}
