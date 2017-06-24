<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>editMem</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/base.css">

</head>

<body>
	<!-- 橫列1 -->
<header>
	<div class="container">
		<div class="row">
			<ul class="list-inline list-unstyled pull-left">
				<li><h2><a href="http://localhost:8080/webpet/index.jsp">PetPet Pet</a></h2></li>
				<li><a href="http://localhost:8080/webpet/TEST.jsp">餐廳</a></li>
				<li><a href="#">玩樂</a></li>
				<li><a href="http://localhost:8080/webpet/needBloodForm.jsp">血庫</a></li>
				<li><a href="#">醫院</a></li>
			</ul>
				
					<ul class="list-inline list-unstyled pull-right">
						<li><a href="/MemInfo.jsp"><img class=class="card-img-top img-responsive" src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&type=memPhoto"  width="80" height="80"></a></li>	<!-- 會員照片 -->
						<li><H3>${mem.mem_name}</H3></li> <!--會員名 -->
						<li>
								<div class="btn-group">
									<button type="button" class="btn btn-default dropdown-toggle"  data-toggle="dropdown">
									設定 <span class="caret"></span>
									</button>
	
								<ul class="dropdown-menu" role="menu">
									<li><a href="${pageContext.servletContext.contextPath}/editMem.jsp" id="showeditMem">個人資料</a></li>
<!-- 								<li><a href="#">更改頭象</a></li> -->
									<li class="divider"></li>
									<li><a href="${pageContext.servletContext.contextPath}/logout.do?logout=登出">登出</a></li>
								</ul>
							</div>
						</li>
					</ul>
		</div>	
	</div>
	</header>

<!-- 第2列 -->

	<!-- 個人INFO 資訊 -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div id="profile-resume" class="card">				
					<a href="${pageContext.servletContext.contextPath}/MemInfo.jsp"><img class=class="card-img-top img-responsive" src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&type=memPhoto"  width="80" height="80"></a><!-- 會員照片 -->
					<div class="card-block">
<%-- 					<img class="card-img img-responsive" src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&type=memPhoto"  width="80" height="80"><!-- 會員照片 --> --%>
						<h4 class="card-title">${mem.mem_name}</h4>
						<p class="card-text">${mem.mem_info}</p> 
						<p class="card-text"><h2> <%-- PetInfo search fail --%> ${Message.SearchError} </h2></p> 
					</div>
					
<!-- PetINFO 資訊 -->
<div class="row ">
							<div class=" list-unstyled pull-left">
							<ul>
							<c:forEach var="list" items="${pet}">	
								<c:url value="/MemInfo.jsp" var="link_pinfo" scope="page">
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
										<button  id='showAddPet' type="submit" class="btn btn-default"><a href="${pageContext.servletContext.contextPath}/AddPet.jsp">Pet加入家庭</a></button>

				</div>
			</div>

<!-- share page -->
			<div class="col-md-9">
					<div class="row ">
				<div><ul  id="myTab"class="list-inline list-unstyled pull-left nav nav-tabs"  >
				       			 <li class="active"><a href="#home"   data-toggle="tab" id = "share">發表近況</a></li>
								 <li ><a href="#frilist" data-toggle="tab" id ="fri">好友</a></li>	
						 	
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="home">
								<form  class="form-inline" action="share.do" method="post" role="form">
                                   	<div class="form-group"id="sharebutton" >
                                          <input type="text" class="form-control"  name="contentMsg">
                                          <label > <button type="submit" class="btn btn-primary">送出 </button> </label>
                                           <label ><h4>${message.cmsg}${message.invalid}</h4>  </label>
          			             	</div>         			 
				           	</form>
				         </div> 	 

          			      <div  class="tab-pane fade" id="frilist">
                            <ul id="friul" style="list-style:none">
                              
                               </ul>
                          </div>                  		
  						</div>					
  					</ul>						
  									
					</div>
				</div>		
				
<!-- 			Insert Pet -->
				<br><br>
				<div id="addpet" class="row ">	
			
					<form action="insertpet.do" enctype="multipart/form-data"  method="post">
    						<div class="form-group">
      								<label>寵物名:</label>
     								<input class="form-control"  placeholder="寵物名:" name="pet_name${message.name}">
    						</div>
    						
  							<div class="form-group">
    			  					<label for="pwd">寵物照片:</label>
      								<input   type="file" class="form-control" placeholder="choice photo" name="photo"> 	
      						</div>
    							
    						<div class="form-group">
    			  					<label for="pwd">寵物InFo:</label>
    			  					 <textarea class="form-control" cols="30" rows="10" name="pet_info" placeholder="寵物InFo:"></textarea>
    						</div>
   	  								 <button type="submit" name="pet" value="addPet" class="btn btn-default ">新增寵物 ${messsage.PinsertError}</button>
   	  								 <button type="button" id="Cancel"  class="btn btn-default ">Cancel</button>	${petCRUD.pInsertError}
  					</form>
			     </div>	
			</div>
			
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<script>
		$('#Cancel').click(function(){
			window.location.href = '/webpet/MemInfo.jsp';
		});
		
		
		function chgpwd() {
			$('#chgform').toggle();
		};
		
		
		
		
		$(document).on("click","#fri", function() { 
			   $("#friul li").remove();
			   $.get("frilist", function(responseText) {
			  	 	 var count = 0;
			   	  	   $.each(responseText, function(index, item) {
		  			   if((index % 2) == 0){
		  				   var a = $("<a></a>").text(item)
							   var li  = $("<li></li>").append(a);
		  				   $("#friul").append(li);
		  			   }else { 
			   					$("#friul li:eq(" +count +") a").attr("href","/webpet/friInfo.do?id=" + item);			
			   					$("#friul li:eq(" + count +") a").attr("id", "finfo");
									count = count + 1;
		  			 		};
			   	  	 	});
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