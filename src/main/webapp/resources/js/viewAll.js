function getView(tabVal) {
	//扣掉號的文字
	var setType=tabVal.substring(1);
	if(setType!="all"&&setType!="dog"&&setType!="cat"&&setType!="other") return;
	
	var transType="";
	switch(setType){
		case "dog":
			transType="狗狗";
			break;
		case "cat":
			transType="貓咪";
			break;
	}
	
	$(tabVal).empty();
	$.ajax({
		url: "list",
		type: "POST",
		dataType: "json",
		success: function(datas) {
			console.log(datas)
			alert("SUCCESS!!!");
			var docFragment = $(document.createDocumentFragment());
			//初值
			var divOut = $("<div></div>").addClass("row masonry");
			
			$(datas).each(function(index, item) {
				//取值
				//var imgPath = '${pageContext.request.contextPath}' + item.adoptPhotoUrlBeans[0].PhotoUrl;
				if(setType=="all"){
				}else if(setType=="other"){
					if(item.PetType=="狗狗"||item.PetType=="貓咪"){
						return};
				}else if(transType!=item.PetType){
					return;
				};
				var imgPath = getContextPath() + item.adoptPhotoUrlBeans[0].PhotoUrl;
				var date = $.datepicker.formatDate('yy-mm-dd', new Date(item.FindDate));
				var formType="";
				var dateType = "";
				var localType = "";
				switch (item.PetForm) {
				case 1:
					formType="「協尋」"
					dateType = "遺失日期：";
					localType = "遺失地點：";
					break;
				case 2:
					formType="「找原主人」"
					dateType = "拾獲日期：";
					localType = "拾獲地點：";
					break;
				case 3:
					formType="「找新主人」"
					dateType = "拾獲日期：";
					localType = "拾獲地點：";
					break;
				case 4:
					formType="「認養」"
					dateType = "養育時間(從)：";
					localType = "寵物現在地點：";
					break;
				}
				var title = item.UserTitle;

				//設定樣式
				var pTitle = $("<h5></h5>").text(formType+title).addClass("text-center");
				var pDate = $("<p></p>").text(dateType + date).addClass("text-center").css("margin-top","1rem");
				var pLocation = $("<p></p>").text(localType + item.FindCity + item.FindDistrict).addClass("text-center");
				var img = $("<img />").attr({'src': imgPath+'?'+Date(),'title': title}).addClass("img-thumbnail");
				var a = $("<a></a>").attr({'href': "selectAdopt/"+item.AId,'data-lightbox': 'park','data-title': title
				}).append(pTitle).append(img).addClass("viewModal");
				var divIn = $("<div></div>").addClass("thumbnail");
				var divMid = $("<div></div>").addClass("col-md-3 item");
				
				var cookieId=getCookie("user");
				if(item.mem_id==cookieId){
					var editUrl=getContextPath()+'/editAdopt'+"/"+item.AId;
					console.log(editUrl);
					var editButton=$("<a>編輯</a>").attr({'href': editUrl}).addClass("btn btn-primary btn-sm");
					divIn.append(editButton);
				}				
				
				a.append(pDate);
				a.append(pLocation);
				divIn.append(a);
				divMid.append(divIn);
				
				
				
				divOut.append(divMid);
				docFragment.append(divOut);
				/*if((index+1)%4==0){
					divOut = $("<div></div>").addClass("row masonry");
				}*/
			});
			$(tabVal).append(docFragment);
			initialiceMasonry();
		    //toMasonry();
		},
		error: function() {
			alert("網頁發生錯誤，請重新整理!!!");
		}
	});
};
function getSingleAdopt(getUrl) {
	$.ajax({
		url : getUrl,
		type : "GET",
		dataType : "json",
		success : function(datas) {
			//var docFragment = $(document.createDocumentFragment());
			var formType="";
			var dateType = "";
			var localType = "";
			switch (datas.PetForm) {
			case 1:
				formType="「協尋」"
				dateType = "遺失日期：";
				localType = "遺失地點：";
				break;
			case 2:
				formType="「找原主人」"
				dateType = "拾獲日期：";
				localType = "拾獲地點：";
				break;
			case 3:
				formType="「找新主人」"
				dateType = "拾獲日期：";
				localType = "拾獲地點：";
				break;
			case 4:
				formType="「認養」"
				dateType = "養育時間(從)：";
				localType = "寵物現在地點：";
				break;
			}
			$('#myModal').modal('show').find('.modal-title').empty();
			$('#myModal').modal('show').find('.modal-title').text(formType+datas.UserTitle);
			var imgPath = getContextPath() + datas.adoptPhotoUrlBeans[0].PhotoUrl;
			var img=$("<img />").attr({'src': imgPath}).addClass("img-responsive modal-img");
			var imgLink = $("<a></a>").attr({'href': imgPath,'data-toggle': 'lightbox'}).append(img);
			$('#myModal').modal('show').find('.modal-body').html(imgLink);
			var UserTable=$("<table></table>").addClass("table table-responsive");
			var PetTable=$("<table></table>").addClass("table table-responsive");
			//連絡人資訊
			var UserInfo=$("<thead><tr><th>聯絡人資訊</th><th></th><tr></thead>");
			var UserBody=$("<tbody></tbody>");
			
			var UserName=$("<tr></tr>")
			.append($("<td></td>").text("聯絡人：").addClass("col-md-2"))
			.append($("<td></td>").text(datas.UserName));
			
			var UserPhone=$("<tr></tr>")
			.append($("<td></td>").text("手機號碼：").addClass("col-md-2"))
			.append($("<td></td>").text(datas.UserPhone));
			
			if(typeof datas.UserEmail==='undefined') datas.UserEmail='';
			var UserEmail=$("<tr></tr>")
				.append($("<td></td>").text("電子信箱：").addClass("col-md-2"))
				.append($("<td></td>").text(datas.UserEmail));
			
			UserBody.append(UserName).append(UserPhone).append(UserEmail);
			//寵物資訊
			var PetInfo=$("<thead><tr><th>寵物資訊</th><th></th></tr></thead>");
			var PetBody=$("<tbody></tbody>");
			if(typeof datas.PetName==='undefined') datas.PetName='';
			var PetName=$("<tr></tr>")
				.append($("<td></td>").text("寵物名稱：").addClass("col-md-2"))
				.append($("<td></td>").text(datas.PetName));
			
			var PetType=$("<tr></tr>")
				.append($("<td></td>").text("種類：").addClass("col-md-2"))
				.append($("<td></td>").text(datas.PetType));
			
			if(typeof datas.PetBreeds==='undefined') datas.PetBreeds='';
			var PetBreeds=$("<tr></tr>")
				.append($("<td></td>").text("品種：").addClass("col-md-2"))
				.append($("<td></td>").text(datas.PetBreeds));
			var PetFeature=$("<tr></tr>")
				.append($("<td></td>").text("特徵：").addClass("col-md-2"))
				.append($("<td></td>").text(datas.PetFeature));
			
			if(typeof datas.FindRoad==='undefined') datas.FindRoad='';
			var PetLocal=$("<tr></tr>")
				.append($("<td></td>").text(localType).addClass("col-md-2"))
				.append($("<td></td>").text(datas.FindCity+datas.FindDistrict+datas.FindRoad));
			
			var date = $.datepicker.formatDate('yy-mm-dd', new Date(datas.FindDate));
			var FindDate=$("<tr></tr>")
				.append($("<td></td>").text(dateType).addClass("col-md-2"))
				.append($("<td></td>").text(date));
			
			var IcNumber=$("<tr></tr>")
			.append($("<td></td>").text("晶片號碼：").addClass("col-md-2"))
			.append($("<td></td>").text(datas.IcNumber));
			
			var PetGender=$("<tr></tr>")
			.append($("<td></td>").text("性別：").addClass("col-md-2"))
			.append($("<td></td>").text(datas.PetGender));
			
			var PetNotes=$("<tr></tr>")
			.append($("<td></td>").text("備註：").addClass("col-md-2"))
			.append($("<td></td>").text(datas.PetNotes));
			
			PetBody.append(PetName).append(PetType).append(PetBreeds).append(PetFeature)
			.append(PetLocal).append(FindDate).append(IcNumber)
			.append(PetGender).append(PetNotes);
			
			UserTable.append(UserInfo).append(UserBody);
			PetTable.append(PetInfo).append(PetBody)
			$('#myModal').modal('show').find('.modal-body').append(UserTable).append(PetTable);
			console.log($('#myModal').modal('show').find('.modal-body'));
			
			//$('#myModal').modal('show').find('.modal-body').empty();
			},
		error: function() {
			$('#myModal').modal('show').find('.modal-title').text("讀取資料失敗");
			$('#myModal').modal('show').find('.modal-body').text("網頁發生錯誤，請重新整理!!!");
		}
	});
}


function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
};
function toMasonry(){
	$('.masonry').masonry({
        itemSelector: '.item'
    });
};
function initialiceMasonry(){
    var $container = $('.masonry');        
        $container.imagesLoaded(function() {
            $container.masonry({
                isInitLayout : true,
                itemSelector: '.item'
            });
        });
}
function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

