<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增協尋或認養</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/css/modern-business.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/theme.min.css'></c:url>">
<link href="<c:url value='/css/nav-setting.css'></c:url>" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.css' />">
<style>
	.container {
    font-size: 1.5rem;
    }
	#formEnity{
		margin-top: 50px;
	}
	#formH2{
		margin-bottom:1rem; 
	}
	.PetFormSet{
		font-size: 2rem;
		margin-bottom: 20px;
		text-align: center;
	}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js' />"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/addAdopt.js' />"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	
    	
    	//下拉式選單產生 可以用AJAX寫
    	setCity();
    	$("#FindCity").change(function name() {
    		setFindDistrict($("#FindCity").val());
		});
    	
    	$("#FindDate").datepicker({dateFormat: 'yy/mm/dd',changeMonth: true,changeYear: true});
    	
    	//選項回填
    	
    	$("#FindCity").val('${adoptBean.findCity}');
    	setFindDistrict($("#FindCity").val());
        $("#FindDistrict").val('${adoptBean.findDistrict}');
    });
    </script>    
</head>

<body>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container ">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header ">
            <a class="navbar-brand" href="index.jsp"><img src="${pageContext.servletContext.contextPath}/logo.png"></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-center">
                <li>
                    <a href="cook/index.jsp">餐廳</a>
                </li>
                <li>
                    <a href="services.html">市集</a>
                </li>
                <li>
                    <a href="${pageContext.servletContext.contextPath}/adopt">協尋</a>
                </li>
                <li>
                    <a href="contact.html">血庫</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${not empty mem}">
                    <li id="profile-image">
                        <a href="${pageContext.servletContext.contextPath}/MemInfo.jsp"><img src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&type=memPhoto" width="20" height="20"> ${mem.mem_name}
                            <!--會員名 -->
                        </a>
                        <!-- 會員照片-->
                    </li>
                    <!--  通知 -->
                    <li class="dropdown" style="display:none" id="alert">
                        <a href="#" class="dropdown-toggle  glyphicon glyphicon-bell" data-toggle="dropdown"><span class="badge" id="alerttotal">00</span></a>
                        <ul class="dropdown-menu">
                            <c:forEach var="alertlist" items="${alert}">
                                <li>
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <img src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${alertlist.mem_mail}&type=memPhoto" width="60" height="60" id="alertimg">${alertlist.mem_name} &nbsp;&nbsp;&nbsp; 寄出交友邀請給你
                                            <br>
                                            <div id="mid" class="${mem.mem_id}" style="display:none"></div>
                                            <div id="almid" class="${alertlist.mem_id}" style="display:none"></div>
                                            <button id="removefri" type="submit" class="btn btn-default" style="float:right">刪除邀請</button>
                                            <button id="joinfri" type="submit" class="btn btn-default" style="float:right">接受</button>
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
                <!--登入-->
                <li class="dropdown" id="loginbutton">
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown">登入</a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form action="login.do" method="post" id="loginForm">
                                        <div class="form-group">
                                            <label>E-MAIL:</label>
                                            <input class="form-control" placeholder="E-MAIL:" name="email">${message.email}
                                        </div>
                                        <div class="form-group">
                                            <label for="pwd">Password:</label>
                                            <input class="form-control" id="pwd" placeholder="Password" name="pwd">${message.pwd}
                                        </div>
                                        <button type="submit" class="btn btn-default pull-right">登入</button>${message.invalid}
                                    </form>
                                    <hr>
                                    <a href="#" id="regbutton">註冊 </a>
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
    <div class="container" id="formEnity">
        <form:form method="POST" modelAttribute="adoptBean" enctype="multipart/form-data" action="updateAdopt--${adoptBean.AId}" class="form-horizontal">
        	<h2 class="formH2 col-sm-offset-5">修改資料</h2><form:label path="PetForm" />
        	            
				<div class="form-group">
					<label class="col-sm-2 control-label">標題：</label>
					<div class="col-sm-8">
						<form:input type="text" class="form-control" path="UserTitle" id="UserTitle" maxlength="20" />						
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="UserTitle" /></label></span>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">聯絡人姓名：</label>
					<div class="col-sm-8">
						<form:input type="text" class="form-control" path="UserName" id="UserName" maxlength="10" />
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="UserName" /></label></span>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">聯絡人手機電話：</label>
					<div class="col-sm-8">
						<form:input type="text" class="form-control" path="UserPhone" id="UserPhone" maxlength="10" placeholder="Ex:09xxxxxxxx"/>
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="UserPhone" /></label></span>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">E-mail：</label>
					<div class="col-sm-8">
						<form:input type="email" class="form-control" path="UserEmail" id="UserEmail" maxlength="30" placeholder="選填"/>
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="UserEmail" /></label></span>
				</div>	
							
				<div class="form-group">
					<label class="col-sm-2 control-label">寵物姓名：</label>
					<div class="col-sm-8">
						<form:input type="text" class="form-control" path="PetName" id="PetName" maxlength="10" placeholder="若未知可不填"/>
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="PetName" /></label></span>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">種類：</label>
					<div class="col-sm-8">
                    	<form:select path="PetType" id="PetType" class="form-control">
                    		<form:option value="">請選擇種類</form:option>
                    		<form:option value="狗狗">狗狗</form:option>
                    		<form:option value="貓咪">貓咪</form:option>
                    		<form:option value="兔子">兔子</form:option>
                    		<form:option value="鼠類">鼠類</form:option>
                    		<form:option value="鳥類">鳥類</form:option>
                    		<form:option value="其他">其他</form:option>
                    	</form:select>
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="PetType" /></label></span>
				</div>	
					
				<div class="form-group">
					<label class="col-sm-2 control-label">品種：</label>
					<div class="col-sm-8">
						<form:input type="text" class="form-control" path="PetBreeds" id="PetBreeds" maxlength="10" placeholder="若未知可不填"/>
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="PetBreeds" /></label></span>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">特徵：</label>
					<div class="col-sm-8">
						<form:input type="text" class="form-control" path="PetFeature" id="PetFeature" maxlength="50" />
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="PetFeature" /></label></span>
				</div>				
 
				<div class="form-group">
					<label class="col-sm-2 control-label" id="localtionChange">走失地點：</label>
					<div class="col-sm-2">
                    	<form:select path="FindCity" id="FindCity" class="form-control">
                    		<form:option value="">請選擇城市</form:option>
                    	</form:select>
					</div>
					<div class="col-sm-2">
                    	<form:select path="FindDistrict" id="FindDistrict" class="form-control">
                    		<form:option value=""></form:option>
                    	</form:select>
					</div>
					<div class="col-sm-4">
						<form:input type="text" class="form-control" path="FindRoad" id="FindRoad" maxlength="20"/>
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="FindCity" /></label></span>
				</div>	 
				
				<div class="form-group">
					<label class="col-sm-2 control-label" id="DateChange">走失日期：</label>
					<div class="col-sm-8">
						<form:input type="text" class="form-control" path="FindDate" id="FindDate"/>
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="FindDate" /></label></span>
				</div> 
 
 				<div class="form-group">
					<label class="col-sm-2 control-label" id="DateChange">晶片號碼：</label>
					<div class="col-sm-8">
						<form:input type="text" class="form-control" path="IcNumber" id="IcNumber" maxlength="15" placeholder="若未知可不填"/>
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="IcNumber" /></label></span>
				</div> 
				
				<div class="form-group">
					<label class="col-sm-2 control-label">種類：</label>
					<div class="col-sm-8">
                    	<form:select path="PetGender" id="PetGender" class="form-control">
                    		<form:option value="">請選擇性別</form:option>
                    		<form:option value="不確定">不確定</form:option>
                    		<form:option value="男性">男性</form:option>
                    		<form:option value="女性">女性</form:option>  
                    	</form:select>
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="PetGender" /></label></span>
				</div>
				
 				<div class="form-group">
					<label class="col-sm-2 control-label">上傳圖片：</label>
					<div class="col-sm-6">
						<input type="file" name="file" accept="image/*">
					</div>
					<span class="help-inline col-sm-offset-2 col-sm-2"><label class="text-danger">${file}</label></span>
				</div> 				
				
				<div class="form-group">
					<label class="col-sm-2 control-label">備註：</label>
					<div class="col-sm-8">
						<form:textarea class="form-control" rows="3" path="PetNotes" id="PetNotes" maxlength="500" placeholder="最多500字"/>
					</div>
					<span class="help-inline col-sm-2"><label class="text-danger"><form:errors path="PetNotes" /></label></span>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-8 col-sm-4">
						<button type="submit" class="btn btn-primary">修改</button>
						<button type="button" class="btn btn-default">刪除</button>
					</div>
				</div>	
				</form:form>
    </div>
<script type="text/javascript" src="<c:url value='/js/petfriendsMem.js' />"></script>
</body>

</html>
