<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--     <meta name="description" content=""> -->
<!--     <meta name="author" content=""> -->

    <title>PetFriend</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

<!--     Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>

<style>
	.dropdown-menu {
    width: 320px ;
    height: 100px ;
    font-size: 17px;
    font-family: sans-serif;
}

.navbar-default {
    background-color: #499975;
    border-color: #499975;
}

.navbar-default .navbar-nav > li > a {
    color: #f8f8f8;
}
.navbar-brand>img {
   max-height: 100%;
   height: 100%;
   width: auto;
   margin: 0 ;
}
 .navbar-brand { 
   background: url(imgs/pf2update2.png) center / contain no-repeat; 
   width: 250px; 
 } 

.profile-image {
    padding-top: 0;
    padding-bottom: 0;
}


#introdiv{
/* 	height:250px;  */
/* 	weight:100px;  */
	text-align:center;
	line-height:150px;
	margin-left: 150px
}

</style>
<body>

 <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation" >
        <div class="container ">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header ">
             <a class="navbar-brand " href="index.jsp" ></a>			<!--    	title -->
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                       
               <ul class="nav navbar-nav navbar-center">
                    <li>
                        <a href="about.html">餐廳</a>
                    </li>
                    <li>
                        <a href="services.html">市集</a>
                    </li>
                    <li>
                        <a href="contact.html">協尋</a>
                    </li>
                    <li>
                        <a href="contact.html">血庫</a>
                    </li>
                </ul>
            <ul class="nav navbar-nav navbar-right">
                 <c:if test="${not empty mem}">
                            <li id="profile-image">
                              <a href="${pageContext.servletContext.contextPath}/MemInfo.jsp"><img  src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&type=memPhoto" width="20" height="20">
                              ${mem.mem_name} <!--會員名 --></a>	<!-- 會員照片-->         
                           </li>
                          
          <!--  通知 -->
                    <li class="dropdown"  style="display:none" id="alert">
                   
                        <a href="#" class="dropdown-toggle  glyphicon glyphicon-bell" data-toggle="dropdown"><span class="badge" id="alerttotal">00</span></a>
                        <ul class="dropdown-menu" >                       
                      		 <c:forEach var="alertlist" items="${alert}">       
                            	<li>
                           	 		<div class="panel panel-default">
   									 	<div class="panel-body">
       										<img src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${alertlist.mem_mail}&type=memPhoto" width="60" height="60"  id="alertimg">${alertlist.mem_name}  	&nbsp;&nbsp;&nbsp; 寄出交友邀請給你<br>	
       									 	<div id= "mid" class="${mem.mem_id}"  style="display:none"></div>	
       										<div id ="almid" class="${alertlist.mem_id}"  style="display:none"></div>	
       										<button  id="removefri" type="submit" class="btn btn-default" style="float:right">刪除邀請</button>
       										<button  id="joinfri"  type="submit" class="btn btn-default" style="float:right">接受</button>
    									</div>
									</div>               	
                            	</li> 
                          	</c:forEach>
                          
                       	 </ul>
                    	</li> 

                            <li> 
                                  <a href="${pageContext.servletContext.contextPath}/logout.do?logout=登出">登出</a>
                            </li>
                  </c:if>
                  

       

<!-- 登入                   -->
                    <li class="dropdown" id="loginbutton">
                        <a href="#" class="dropdown-toggle " data-toggle="dropdown">登入</a>
                        <ul class="dropdown-menu" >
                            	<li>
                           	 		<div class="panel panel-default">
   									 	<div class="panel-body">
       												<form action="login.do"   method="post" id="loginForm">
    													<div class="form-group">
      														<label>E-MAIL:</label>
     														<input class="form-control"  placeholder="E-MAIL:" name="email">${message.email}
    													</div>
  														<div class="form-group">
    			  											<label for="pwd">Password:</label>
      														<input  class="form-control" id="pwd" placeholder="Password" name="pwd">${message.pwd}
    														</div>
   	  													<button type="submit" class="btn btn-default pull-right" >登入</button>${message.invalid}
  													</form>	
  													<hr>
  													<a href="#" id ="regbutton">註冊 </a>
    									</div>
									</div>               	
                            	</li> 
                        </ul>
                    </li>  
                 </ul>
            </div>
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    
	<div class="body">
	<div class="wrap">
	<div class="wrapper">
	<!-- start header-->
			<div class="header">
				<div class="logo">
				 	 <div class="content"> <h2>Hello &nbsp;&nbsp;  ${mem.mem_name}</h2> </div> <!--  放會員名字-->	 
				</div>
				<div class="cssmenu">
					<ul>
					  	<li ><a href="MemInfo.jsp">Home</a></li>
						<li><a href="${pageContext.servletContext.contextPath}/editMem.jsp" id="showeditMem">個人資料</a></li>
						<li><a href="FriList.jsp">Friend</a></li>
						<li><a href="addPet.jsp">寵物加入家庭</a></li>
							<li><a href="share.jsp">在想什麼</a></li>
						<div class="clear"></div>
					 </ul>
				</div>
				<div class="clear"></div>
				<div class="top-nav">
				<nav class="clearfix">
						<ul>
							<li><a href="MemInfo.jsp">Home</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/editMem.jsp" id="showeditMem">個人資料</a></li>
							<li><a href="FriList.jsp">Friend</a></li>
							<li><a href="addPet.jsp">寵物加入家庭</a></li>
								<li><a href="share.jsp">在想什麼</a></li>
						</ul>
						<a href="#" id="pull">Menu</a>
					</nav>
				</div>
			</div>
			<!-- start banner -->
		<div class="banner">
		    	<div class="banner-division d_img">
			    	 <img src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&type=memPhoto" height="300px" />
			    	<br>
			    	<div class="banner-division d_img"   id="introdiv"> 
	<!-- 		    		<div class="banner-division d_img"  style="border-width:1px;border-style:dashed;" id="introdiv">  -->
	    					 <p style="text-align:center;padding-bottom:20px;border-width:1px;border-style:dashed;"> 
	    							 簡介<br>
	    					 ${mem.mem_info}
	    					 </p>
	    			</div>
		    	</div>
		    	
<!--會員心情-->
    				
    					<!-- 	寵物資訊表單 --> 
				<div class="banner-division"  >
				<p>
					<form action="update.do" enctype="multipart/form-data"  method="post"  id="showeditPet">
<!-- 					 <button type="button" id="pCancel" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
    						<div class="form-group"  style="display: none">
      								<label>寵物id:</label>
     								<input class="form-control" name="pet_id" value="${param.Pid}">
    						</div>
    						<div class="form-group">
      								<label>寵物名:</label>
     								<input class="form-control"  placeholder="寵物名:" name="pet_name${message.name}" value="${param.Pname }">
    						</div>
    						
  							<div class="form-group">
    			  					<label>寵物照片:</label>
    			  					<img id="blah"  class="img-circle" src="${param.Pphoto}" width="100" height="100">
      								<input  id="imgInp"  type="file" class="form-control" placeholder="choice photo" name="photo"  value=""> 	
      						</div>
    							
    						<div class="form-group">
    			  					<label for="pwd">寵物InFo:</label>
    			  					 <textarea class="form-control" cols="30" rows="10" name="pet_info" placeholder="寵物InFo:">${param.Pinfo}</textarea>
    						</div>
   	  								  <button type="submit" class="btn btn-default" name="pet" value="petUpdate">修改</button>
									  <button type="submit" class="btn btn-default" name="pet" value="petDelete">刪除</button>	
   	  								  <button type="button" id="Cancel"  class="btn btn-default pull-right">Cancel</button>	
   	  								  																							
  					</form>
  				</p>
  				</div> 
    				
    				
    				
   
    				<div class="clear" ></div>
    				
    				
		    	<div class="clear"></div>

		    </div>
  
  
  
  
   			 <!-- start content -->
					 <div class="main">
					 	 <div class="content">
					 	 	<h2>Pets<a href="${pageContext.servletContext.contextPath}/AddPet.jsp">加入家庭</a></h2>
					 	 </div>
					 	 
<!-- PetINFO 資訊 -->
					 	 <div class="grids_of_4">
					 	 	<c:forEach var="list" items="${pet}">	
								<c:url value="/editpet.jsp" var="link_pinfo" scope="page">
										<c:param name="Pid"  value="${list.pet_id}" />
										<c:param name="Pname"  value="${list.pet_name}" />
										<c:param name="Pphoto"  value="${pageContext.servletContext.contextPath}/petPhoto.do?id=${list.pet_id}&type=petPhoto" />
										<c:param name="Pinfo"  value="${list.pet_info}" />
								</c:url>
								<div class="grid_1_of_4 images_1_of_4" id="petedit" >
									<img src="${pageContext.servletContext.contextPath}/petPhoto.do?id=${list.pet_id}&type=petPhoto"  width= "160px" height="180px"/>
									 <h3><a href="${link_pinfo}">${list.pet_name}</a></h3>
									 <h4 style="color:#FF61A0;">${list.pet_info}</h4>
								</div>
								</c:forEach>
									</div>
								<div class="clear"></div>
							</div>
					 	 		<div class="clear"></div>
					 	
		</div>
		</div>
		</div>

        

        
  	 	
  	 	 
<!-- start footer copy -->
		<div class="wrap">
			<div class="wrapper">
			<div class="copy">	
				<p class="w3-link">Copyright © 2012 Designer First. All Rights Reserved. Template by&nbsp; <a href="http://w3layouts.com/"> W3Layouts</a></p>
			</div>
 		</div>	
 	</div>
 			</div>
		</div>
	</div>


    <!-- /.container -->


    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>


    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })

    
    //註冊表單SHow
  	$("#regbutton").click(function(){
	 	$("#regform").toggle();
  		$("#intro").toggle();
 	 });
    
	$('#Cancel').click(function(){
		$("#regform").toggle();
  		$("#intro").toggle();
	});
    
 	$("#profile-image").show(function(){
 		$("#loginbutton").hide();
 		$("#alert").show();
 	})
 	
 	
 	
    var count = $("#alert li").children().length;
	$("#alerttotal").text(count);

	
	$(document).on("click","#removefri",function(){
		var mid = $(this).parent().children("#mid").attr("class");
		var friid=  $(this).parent().children("#almid").attr("class");
		
		$.get("fristatus",{"id": mid, "fri":friid ,"type":"removeinvalid" } , function(){			
		alert("fri: "+ mid + "mid :"+friid );
		})
		.done(function(data){
			if(data){
				alert("移除成功");
				location.reload();
			}
		})
		.fail(function(){
			alert("移除失敗 ，請洽管理員");
		});
	});
	
	

	$(document).on("click","#joinfri",function(){
		
		var mid = $(this).parent().children("#mid").attr("class");
		var friid=  $(this).parent().children("#almid").attr("class");
		
		$.get("fristatus",{"id": friid ,"fri":mid,"type":"join" }, function(){	
		})
		.done(function(data){
			if(data){
				alert("成功加入");
				location.reload();
			}
		})
		.fail(function(){
			alert("加入失敗 ，請洽管理員");
		});
	});

	
	
	//照片選擇 秀出
	function readURL(input) {
   	 if (input.files && input.files[0]) {
      	  var reader = new FileReader();
        
       	 reader.onload = function (e) {
           	 $('#blah').attr('src', e.target.result);
       	 }
       	 reader.readAsDataURL(input.files[0]);
    	}
	}
	$("#imgInp").change(function(){
   	 readURL(this);
	});

	
	var ctx = "${pageContext.request.contextPath}"
	var page = "/MemInfo.jsp";
	$('#Cancel').click(function(){
		window.location.href = ctx +page;
	});
	

	
	
	
	
	
	
	
    </script>

</body>