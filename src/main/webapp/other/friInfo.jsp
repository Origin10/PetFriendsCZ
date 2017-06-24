<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PetFriend</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/base.css">

<style type="text/css">

#mind{ 					//日誌分享
 	padding:1em 1em; 

 } 

</style>
</head>



<body>
	<!-- 橫列1 -->
<header>
	<div class="container">
		<div class="row">
			<ul class="list-inline list-unstyled pull-left">
				<li><h2><a href="${pageContext.servletContext.contextPath}/index.jsp">PetPet Pet</a></h2></li>
				<li><a href="http://localhost:8080/webpet/TEST.jsp">餐廳</a></li>
				<li><a href="#">玩樂</a></li>
				<li><a href="http://localhost:8080/webpet/needBloodForm.jsp">血庫</a></li>
				<li><a href="#">醫院</a></li>
			</ul>
				
					<ul class="list-inline list-unstyled pull-right">
						<li><a href="${pageContext.servletContext.contextPath}/MemInfo.jsp"><img class=class="card-img-top img-responsive" src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&type=memPhoto"  width="80" height="80"></a></li>	<!-- 會員照片 -->				
						<li><H3>${mem.mem_name}</H3></li> <!--會員名 -->
						<li>
								<div class="btn-group">
									<button type="button" class="btn btn-default dropdown-toggle"  data-toggle="dropdown">
									設定 <span class="caret"></span>
									</button>
	
								<ul class="dropdown-menu" role="menu">
									<li><a href="${pageContext.servletContext.contextPath}/editMem.jsp" id="showeditMem">個人資料</a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.servletContext.contextPath}/logout.do?logout=登出">登出</a></li>
								</ul>
							</div>
						</li>
					</ul>
					<!-- 						style="display:none" -->
						<button type="button" id="joinfri" >加入好友</button>
						
						<button type="button" id="removefri"  >移除好友</button>
		</div>	
	</div>
	</header>

<!-- 第2列 -->

	<!-- 個人INFO 資訊 -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div id="profile-resume" class="card">				
					<a href="#" id="photo"><img class=class="card-img-top img-responsive" src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mfri.mem_mail}&type=memPhoto"  width="80" height="80" ></a><!-- 會員照片 -->
					<div class="card-block">
<%-- 					<img class="card-img img-responsive" src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&type=memPhoto"  width="80" height="80"><!-- 會員照片 --> --%>
						<h4 class="card-title" >${mfri.mem_name}</h4>
						<p class="card-text">${mfri.mem_info}</p> 
						
					</div>
					
<!-- PetINFO 資訊 -->
					<div class="row ">
							<div class=" list-unstyled pull-left">
							<ul>
							<c:forEach var="list" items="${fripet}">	
								<c:url value="/friInfo.jsp" var="link_pinfo" scope="page">
										<c:param name="Pid"  value="${list.pet_id}" />
										<c:param name="Pname"  value="${list.pet_name}" />
										<c:param name="Pphoto"  value="${pageContext.servletContext.contextPath}/petPhoto.do?id=${list.pet_id}&type=petPhoto" />
										<c:param name="Pinfo"  value="${list.pet_info}" />
								</c:url>
								<li style="list-style-type:none" >
									<img class="img-circle" src="${pageContext.servletContext.contextPath}/petPhoto.do?id=${list.pet_id}&type=petPhoto"  width="80" height="80">
									<a   href="${link_pinfo}">${list.pet_name}</a>
								</li><br>
								</c:forEach>
							</ul>         
							</div>
						</div>

				</div>
			</div>





<!-- share page -->
			<div class="col-md-9">
				<div class="row ">
				<div><ul  id="myTab"class="list-inline list-unstyled pull-left nav nav-tabs"  >
				       			 <li class="active"><a href="#home"   data-toggle="tab" id = "share">近況</a></li>
								 <li ><a href="#frilist" data-toggle="tab" id ="fri">好友</a></li>	
						 	
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="home">
							</div> 	 

          			      <div  class="tab-pane fade" id="frilist">
                            <ul id="friul" style="list-style:none">
                              
                               </ul>
                          </div>                  		
  						</div>					
  					</ul>						
  									
					</div>
				</div>		
				
					
				
	

<!--會員心情-->				
				<div class="row panel panel-default" id="sharepage">
					<c:forEach var="share" items="${frishare}">
						<ul id="mind" class="list-unstyled">
							<li>
								<div class="panel-heading" id="mind">${share.share_date}
									<div class = "highlight">
							 			<H3>${share.share_content}</H3>
									</div>
								</div>
							</li>
							
						</ul><hr>
					</c:forEach>
				</div>
				

		<!-- 	寵物資訊表單 --> 
			<c:if test="${not empty param.Pid}">
			<br>
				<div  class="row" >
					<form action="update.do" enctype="multipart/form-data"  method="post"  id="showeditPet">
    						<div class="form-group" style="display: none">
      								<label>寵物id:</label>
     								<input class="form-control" name="pet_id" value="${param.Pid}">
    						</div>
    						<div class="form-group">
      								<label>寵物名:</label>
     								<input class="form-control"  placeholder="寵物名:" name="pet_name${message.name}" value="${param.Pname }">
    						</div>
    						
  							<div class="form-group">
    			  					<label for="pwd">寵物照片:</label>
    			  					<img id="blah"  class="img-circle" src="${param.Pphoto}" width="150" height="150">
      						</div>
    							
    						<div class="form-group">
    			  					<label for="pwd">寵物InFo:</label>
    			  					 <textarea class="form-control" cols="30" rows="10" name="pet_info" placeholder="寵物InFo:">${param.Pinfo}</textarea>
    						</div>
   	  									<button type="button" id="Cancel"  class="btn btn-default pull-right">Cancel</button>	
  					</form>
  				</div> 
  			</c:if>
  			
  			
<!-- 主人資訊表單 --> 
			<br>
				<div  class="row"  id="editMem"  style="display:none">
						<form  action="mupdel.do"     enctype="multipart/form-data"  method="post" id="mform" >
    						<div class="mem-group" style="display: none">
      								<label>會員id:</label>
     								<input class="form-control" name="mid" value="${mfri.mem_id}" id="id">
    						</div>
   							<div class="mem-group" >
      								<label>會員名稱:</label>
     								<input class="form-control"  placeholder="會員名稱:" name="mname" value="${mfri.mem_name}" id="name">   								

    						</div> 

    						<div class="mem-group">
      								<label>會員Email:</label>
     								<input class="form-control"  placeholder="會員Email:" name="memail" value="${mfri.mem_mail}" id="email">
    						</div>${mupdate.email}
   
  							<div class="mem-group">
    			  					<label for="pwd">會員照片:</label>
    			  					<img id="blah"  class="img-circle" src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mfri.mem_mail}&type=memPhoto"  width=150 height="150">
      						</div>
    					
    						<div class="mem-group">
    			  					<label for="pwd">會員InFo:</label>
    			  					 <textarea class="form-control" cols="30" rows="10" name="minfo" placeholder="會員InFo:" id="info">${mfri.mem_info}</textarea>
    						</div>
   	  								  <button type="button" id="Cancel"  class="btn btn-default ">Cancel</button>
  					</form>
  				</div> 
  			
  			
  			
  			
  			
  			
  			
  			
  			
  			
  			
  			
  			
  			
  			
</div> 
			
			
			
			
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

<script >


$(document).on("click" ,"#photo" ,function(){
	$("#editMem").toggle();
	$("#sharepage").toggle();
});

	$('#showeditPet').show(function(){
		$('#sharepage').toggle();
	});

	$('#Cancel').click(function(){
		$('#sharepage').toggle();
		window.location.href = '/webpet/friInfo.jsp';
	});


	
	$(document).on("click","#fri", function() { 
		   $("#friul li").remove();
		   $.get("frilist",{"id":${mfri.mem_id} },function() {
		  
	  	   		})
	  	   		.done(function(responseText){
					if(responseText != null && responseText != false){
					 	 var count = 0;
				   	  	   $.each(responseText, function(index, item) {
			  			if((index % 2) == 0){
			  				  	   var a = $("<a></a>").text(item);
								   var li  = $("<li></li>").append(a);
			  				   $("#friul").append(li);
			  			   }else {
				   					$("#friul li:eq(" +count +") a").attr("href","/webpet/friInfo.do?id=" + item);					   					
				   					$("#friul li:eq(" + count +") a").attr("id", "finfo");
										count = count + 1;
			  			 		};
				   	  	 	});
					}else{
						console.log("尚無好友");
					}
	  	   		})
				.fail(function(){
					console.log("好友功能異常");
				});
		});
	
	
	
	
	$(window).on("load",function(){
		$.get("frilist",{"id": ${mfri.mem_id} },function(){	
		})
		.done(function(responseText){
			alert("responseText: "+responseText);
			if(responseText == null){
					$("#removefri").toggle();					
				}else{
					$("#joinfri").toggle();
			}
		})
		.fail(function(){
			alert("好友功能異常 ，請洽管理員");
		});
	});
	
	
	
	
	
	$(document).on("click","#removefri",function(){
		$.get("fristatus",{"id": ${mem.mem_id},"fri":${mfri.mem_id} ,"type":"remove" } , function(){			
		alert("fri: "+ ${mfri.mem_id} + "mid :"+ ${mem.mem_id} );
		})
		.done(function(data){
			if(data){
				alert("移除成功");
			$("#joinfri").show();
			$("#removefri").hide();
			}
		})
		.fail(function(){
			alert("移除失敗 ，請洽管理員");
		});
		
		
	});
	
	

	$(document).on("click","#joinfri",function(){
		$.get("fristatus",{"id": ${mfri.mem_id} ,"fri":${mem.mem_id},"type":"join" }, function(){			
		})
		.done(function(data){
			if(data){
				alert("成功加入");
			$("#joinfri").hide();
			$("#removefri").show();
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

	
	
	
</script> 


</body>
</html>