<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<title>新增完成</title>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Examples</title>
<meta name="description" content="此頁面可用來協尋或認養寵物">
<meta name="keywords" content="協尋 認養 寵物">
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/css/modern-business.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/theme.min.css'></c:url>">
<link href="<c:url value='/css/nav-setting.css'></c:url>" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value='/js/petfriendsMem.js' />"></script>
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
	<div id="form_frame">
		<!-- 設定表單樣版 -->
		<c:set value="undefined" var="fromName"></c:set>
		<c:choose>
			<c:when test="${insert.petForm == 1}">
				<c:set value="協尋" var="fromName"></c:set>
				<c:set value="走失日期" var="fromDate"></c:set>
				<c:set value="走失地點" var="fromLocal"></c:set>
			</c:when>
			<c:when test="${insert.petForm == 2}">
				<c:set value="拾獲，找原主人" var="fromName"></c:set>
				<c:set value="拾獲日期" var="fromDate"></c:set>
				<c:set value="拾獲地點" var="fromLocal"></c:set>
			</c:when>
			<c:when test="${insert.petForm == 3}">
				<c:set value="拾獲，找新主人" var="fromName"></c:set>
				<c:set value="拾獲日期" var="fromDate"></c:set>
				<c:set value="拾獲地點" var="fromLocal"></c:set>
			</c:when>
			<c:when test="${insert.petForm == 4}">
				<c:set value="不擬續養，送養" var="fromName"></c:set>
				<c:set value="養育時間(從)" var="fromDate"></c:set>
				<c:set value="寵物現在地點" var="fromLocal"></c:set>
			</c:when>
		</c:choose>
		<!-- End -->
		<h2>${insert.userName}，您好，您所填寫的「${fromName}」資料已成功修改。</h2>

		<form>
			<table>
				<tr>
					<td>標題：</td>
					<td>${insert.userTitle}</td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td>${insert.userName}</td>
				</tr>
				<tr>
					<td>手機號碼：</td>
					<td>${insert.userPhone}</td>
				</tr>
				<tr>
					<td>E-mail：</td>
					<td>${insert.userEmail}</td>
				</tr>
				<tr>
					<td>種類：</td>
					<td>${insert.petType}</td>
				</tr>
				<tr>
					<td>品種：</td>
					<td>${insert.petBreeds}</td>
				</tr>
				<tr>
					<td>特徵：</td>
					<td>${insert.petFeature}</td>
				</tr>
				<tr>
					<td>${fromLocal}</td>
					<td>${insert.findCity}，${insert.findDistrict}</td>
				</tr>
				<tr>
					<td>${fromDate}</td>
					<fmt:formatDate var="covnertDate" value="${insert.findDate}"
						pattern="yyyy-MM-dd" />
					<td>${covnertDate}</td>
				</tr>
				<tr>
					<td>晶片號碼：</td>
					<td>${insert.icNumber}</td>
				</tr>
				<tr>
					<td>性別：</td>
					<td>${insert.petGender}</td>
				</tr>
				<tr>
					<td>上傳圖片：</td>
					<td>
					<c:set var = "now" value = "<%=new java.util.Date()%>" />
					<c:forEach var="photourls" items="${insert.adoptPhotoUrlBeans}" end="1">
							<img src="${pageContext.request.contextPath}${photourls.photoUrl}?${now.time}" width="200">
						</c:forEach></td>
				</tr>
				<tr>
					<td>備註：</td>
					<td>${insert.petNotes}</td>
			</table>
		</form>
	</div>
</body>

</html>