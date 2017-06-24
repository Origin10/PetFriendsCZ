<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/base.css">

<body>
<!-- action="mupdel.do" -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
					<form  action="mupdel.do"     enctype="multipart/form-data"  method="post" id="mform">
<!-- 					 <button type="button" id="pCancel" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->

    						<div class="mem-group" >
      								<label>會員id:</label>
     								<input class="form-control" name="mid" value="${mem.mem_id}" id="id">
    						</div>
   							<div class="mem-group" >
      								<label>會員名稱:</label>
     								<input class="form-control"  placeholder="會員名稱:" name="mname" value="${mem.mem_name}" id="name">
     								<label>${mupdate.mname}</label>
     								<a href="#" id ="chg">修改密碼</a>
     							
    						</div> 
    						 				
    					
    						 				
    					<div  id="chgform" style="display: none">						
    						<div class="mem-group" >
      								<label>修改密碼:</label>
     								<input class="form-control"  placeholder="修改密碼:" name="mpwd" value="" id="pwd">
    						</div>${mupdate.pwd}
    						
    						<div class="mem-group" >
      								<label>確認密碼:</label>
     								<input class="form-control"  placeholder="確認密碼:" name="mcheckpwd" value="" id ="checkpwd">
    						</div> ${mupdate.ckpwd}
    					</div> 

    						<div class="mem-group">
      								<label>會員Email:</label>
     								<input class="form-control"  placeholder="會員Email:" name="memail" value="${mem.mem_mail}" id="email">
    						</div>${mupdate.email}
   
  							<div class="mem-group">
    			  					<label for="pwd">會員照片:</label>
<!--     			  					<img id="blah"  class="img-circle" src=> -->
      								<input   type="file" class="form-control" placeholder="choice photo" name="mphoto"  value="" id="photo"> 	
      						</div>
    					
    						<div class="mem-group">
    			  					<label for="pwd">會員InFo:</label>
    			  					 <textarea class="form-control" cols="30" rows="10" name="minfo" placeholder="會員InFo:" id="info">${mem.mem_info}</textarea>
    						</div>
   	  								  <button id="sendMemUp"type="button" class="btn btn-default" name="membutton" value="memUpdate" onclick="doMemset()">修改</button>									 
   	  								  <button type="submit" id="Cancel123"  class="btn btn-default pull-right">summit test</button>		
  					</form>





<!-- <div  id="addpet" class="row ">	 -->
			
<!-- 					<form action="insertpet.do" enctype="multipart/form-data"  method="post"> -->
<!--     						<div class="form-group"> -->
<!--       								<label>寵物名:</label> -->
<%--      								<input class="form-control"  placeholder="寵物名:" name="pet_name${message.name}"> --%>
<!--     						</div> -->
    						
<!--   							<div class="form-group"> -->
<!--     			  					<label for="pwd">寵物照片:</label> -->
<!--       								<input   type="file" class="form-control" placeholder="choice photo" name="photo"> 	 -->
<!--       						</div> -->
    							
<!--     						<div class="form-group"> -->
<!--     			  					<label for="pwd">寵物InFo:</label> -->
<!--     			  					 <textarea class="form-control" cols="30" rows="10" name="pet_info" placeholder="寵物InFo:"></textarea> -->
<!--     						</div> -->
<%--    	  								 <button type="submit" name="pet" value="addPet" class="btn btn-default ">新增寵物 ${messsage.PinsertError}</button> --%>
<!--    	  								 <button type="button" id="Cancel"  class="btn btn-default ">Cancel</button>	 -->
<!--   					</form> -->
<!-- 			     </div>	 -->
























			</div>
		</div>
	</div>
	
</body>
<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<script>
		$('#chg').click(function(){
			$('#chgform').toggle();
			
		})
		
		
		var mfrm = $('#mform')
		$("#sendMemUp").submit(function(e){
			 e.preventDefault();
			$.ajax({
					type: mfrm.attr('method'),
					url:  mfrm.attr('action'),
					data: mfrm.serialize(),
					success: function (data) {
		                console.log('Submission was successful.');
		                console.log(data);
		            },
		            error: function (data) {
		                console.log('An error occurred.');
		                console.log(data);
		            },
			});
			
		});

		
	</script>
	
	
	
	
	
	
	
	
</html>