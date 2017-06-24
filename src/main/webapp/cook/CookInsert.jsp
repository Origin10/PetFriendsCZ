<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/css/theme.min.css'></c:url>">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script>
	function previewFile(){
		       var preview = document.querySelector('img'); //selects the query named img
		       var file    = document.querySelector('input[type=file]').files[0]; //sames as here
		       var reader  = new FileReader();
	
		       reader.onloadend = function () {
		           preview.src = reader.result;
		       }
	
		       	if (file) {
		           reader.readAsDataURL(file); //reads the data as a URL
		       } 	else {
		           preview.src = "";
		       }
	  }
</script>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style >
		textarea {
    resize: none;
}
.a1{
	margin:none;
}
.a1 img { 
	max-width:418px; 
	myimg:expression(onload=function(){ 
	this.style.width=(this.offsetWidth > 600)?"418px":"auto"});
} 
.text1{
	width:450px;float:left;
}
.text2{
	width:450px; 
}
.text3{
	width:450px;float:left;
}	
#account{
	font-size:16px;height:25px
}
#comment{
	font-size:15px;
}
#comment1{
	font-size:15px;
}
	
.all{ 
	position:absolute; 
	left:30%; 
	top:50% 
} 
</style>
</head>
<body>

	<nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
            	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>                        
      			</button>
                <a class="navbar-brand" href="#">PetFriends</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
            	<ul class="nav navbar-nav">
	                <li><a href="#">Home</a></li>
	                <li class="active"><a href="#">協尋/認養</a></li>
	                <li><a href="#">Page 2</a></li>
            	</ul>
            	<ul class="nav navbar-nav navbar-right">
	                <li><a href="#"><span class="glyphicon glyphicon-user"></span> 註冊</a></li>
	                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登入</a></li>
            	</ul>
            </div>
        </div>
    </nav>
	<section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading"><b>歡迎進入獨特食譜</b></h1>
            <p class="lead"><b>在這裡您可以看到需要協尋的寵物通知，或是想要找到寵物主人的資訊，也有需要找新家的寵物訊息。</b></p>
            <p class="lead"><b>希望您能發揮愛心，讓每個寵物都能回家。</b></p>
            <p><a href="index.jsp" class="btn btn-primary">回食譜首頁</a></p>
        </div>
    </section>
				
<fieldset>
	<legend></legend>
<!-- 	index.jsp -->
					
<form action="CookServlet" method="post" enctype="multipart/form-data">
	<div class="all">
		<div class="text3">
				<label>食譜名稱 : </label><input type="text" name="account" placeholder="營養雞肉丸子" size="26" id="account" value="">
				${errors.account}<br>			
			<div  class="a1">
					<img src=""  ><br> 
					<input type="file" name="file" onchange="previewFile()">
			</div>
		</div>
			<div class="text1">
				<textarea type="text" name="comment" rows="22" cols="50.5" id="comment" 	
				 placeholder=
		"份量：1份  (以5kg成犬一餐為參考，實際用量可自行調整)
		烹調時間：X分鐘
		食材:
		——————————————————————————————————————————————————
		雞胸肉…………………約50g
		高麗菜切絲……………約30g
		紅蘿蔔切丁……………約10g
		雞蛋……………………一顆
		玉米粒…………………少許
		無糖原味優格…………一小杯
		麵粉……………………一茶匙
				"></textarea>
		<br>${errors.comment}<br>
			</div>
			<div  class="text2">
		<div><textarea type="text" name="comment1"  rows="20" cols="115"
		id="comment1"   
		placeholder=
		"烹調步驟：
		1. 將雞胸肉、玉米粒、紅蘿蔔分別蒸煮熟。
		2. 雞蛋打散後，加入高麗菜絲、雞胸肉湯汁和麵粉，均勻攪拌成糊狀。
		3. 熱鍋後將少許油倒入，均勻分佈於鍋底。
		4. 倒入步驟2的食材，使用溫火。
		5. 等到邊緣呈現淡淡的焦黃色，並且整體可以晃動不會鬆散時，就直接翻面。
		6. 待兩面都變成金黃色就可起鍋。
		7. 將蒸熟的雞胸肉切丁，和紅蘿蔔及玉米粒分別鋪在剛起鍋的煎餅上，也可依喜好自行妝點不同的菜色。
		8. 淋上少許優格。
		9. 完成。"	
		></textarea><br>${errors.comment1}<br></div>
				<input  type="submit" name="prodaction" value="Insert">
			</div>
		</div>
	</form>	
</fieldset>
</body>
</html>