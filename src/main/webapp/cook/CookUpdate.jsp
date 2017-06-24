<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/css/theme.min.css'></c:url>">
<!-- <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
    } else {
        preview.src = "";
    }
}

$(document).ready(function() {
	previewFile();
}
</script>
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
	width:450px; ;
}
.text3{
	width:450px;float:left;
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
<form action="CookServlet" method="post" enctype="multipart/form-data">
<div class="all">
	<table>
	<tr>
		<div class="text3">
			<input type="text" name="account"  size="30" value="${param.account }">
			<div  class="a1">
				<img src="${pageContext.request.contextPath}${param.cookPhoto}"><br><input type="file" name="file" onchange="previewFile()">
			</div>
		</div>
	</tr>
		<tr>
		<input type="text" name="cookId" style="visibility: hidden;" size="30" value="${param.cookId}" >
			<div class="text1">		
				<textarea name="comment" rows="22" cols="51">${param.comment }</textarea>
			</div>
		</tr>
			<tr>
			<td>
				<div class="text2">
					<div>
						<textarea name="comment1"  rows="20" cols="115" >${param.comment1 }</textarea>
					</div>
					<div>
						<input type="submit" name="prodaction" value="Update">
					</div>
				</div>
			</td>
			</tr>
		</table>
	</div>	
</form>
</fieldset>
</body>
</html>