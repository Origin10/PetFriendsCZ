<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PetFriend</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/base.css">


</head>
<body>
	<!-- 橫列1 -->
	<header>
	<div class="container">
		<div class="row">
			<ul class="list-inline list-unstyled pull-left">
				<li><h2><a href="http://localhost:8080//webpet/index.jsp">PetPet Pet</a></h2></li>
				<li><a href="#">餐廳</a></li>
				<li><a href="#">玩樂</a></li>
				<li><a href="http://localhost:8080/webpet/needBloodForm.jsp">血庫</a></li>
				<li><a href="#">醫院</a></li>
			</ul>
			
		<ul class="list-inline list-unstyled pull-right">
					<li><H3>${mem.mem_name}</H3></li> <!--會員名 -->
					<li><a href="${pageContext.servletContext.contextPath}/MemInfo.jsp"><img class=class="card-img-top img-responsive" src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&type=memPhoto"  width="80" height="80"></a></li>	<!-- 會員照片 -->
					
					<li>
							<ul id="myTab" class="nav nav-tabs">
								<li class="active"><a href="#login" data-toggle="tab">登入</a></li>
								<li><a href="#reg" data-toggle="tab">註冊</a></li>		
							</ul>
					</li>
			<div id="myTabContent" class="tab-content" >
						<div class="tab-pane fade in active" id="login">
							<form action="login.do"   method="post" id="loginForm">
    							<div class="form-group">
      								<label>E-MAIL:</label>
     								<input class="form-control"  placeholder="E-MAIL:" name="email">${message.email}
    							</div>
  								<div class="form-group">
    			  					<label for="pwd">Password:</label>
      								<input  class="form-control" id="pwd" placeholder="Password" name="pwd">${message.pwd}
    							</div>
   	  									<button type="submit" class="btn btn-default" id="loginbutton" >登入</button>${message.invalid}
  							</form>		
  						</div>
  					
					
				 <div class="tab-pane fade" id="reg" >
		  			<form action="register.do"   method="post">
						<div class="form-group">
      						<label>會員名字:</label>
     						<input class="form-control"  placeholder="會員名字:" name="name">${Regmessage.name}
    					</div>
    					<div class="form-group">
      						<label>E-MAIL:</label>
     						<input class="form-control"  placeholder="E-MAIL:" name="email">${Regmessage.email}
    					</div>
  						<div class="form-group">
    			  			<label for="pwd">Password:</label>
      						<input  class="form-control" id="pwd" placeholder="Password" name="pwd">${Regmessage.pwd}
    					</div>	
   	  					<div class="form-group">
      						<label>寵物名:</label>
     						<input class="form-control"  placeholder="寵物名:" name="petName">${Regmessage.petName}
    					</div>  		
    					<div class="form-group">
    			  			<label for="pwd">寵物簡介:</label>
      						<input  class="form-control" id="pwd" placeholder="寵物InFo:" name="petInfo">${Regmessage.petInfo}
    					</div>
    		
    						<button type="submit" class="btn btn-default" id="regbutton">註冊</button>
  	    		  </form>
				</div>
			</div>
		</ul>
		
		</div>
	</div>
	</header>







	<!-- 第2列 -->

	<!-- 個人INFO 資訊 -->
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-3"></div>
			<div class="col-md-3"></div>

			
<div class="col-md-3"></div>
		</div>
	</div>
	
	
	<!-- 第3列 -->
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-3"></div>
			<div class="col-md-3"></div>
			<div class="col-md-3"></div>
		</div>
	</div>



	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
<script>
		$("#loginbutton").onclick(function(){
	 			 $("#login").show();
		});
		
		$("#regbutton").onclick(function(){
			 $("#reg").toggle();
	});


</script>

</body>
</html>