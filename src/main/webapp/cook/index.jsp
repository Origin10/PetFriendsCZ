<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/css/theme.min.css'></c:url>">
<!-- <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
<style type="text/css">
body {
	font-family: Microsoft JhengHei;
}
.thumbnail{
	margin-top: 1rem;
	margin-bottom: 1rem;
}
a:hover{
	text-decoration:none;
}
.searchable  img {
	max-width:200px;
}
.searchable{
	margin:none;
	width:800px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
table, td {
    border: 1px solid black;
}
.recipe-name{
	float:left;
}
.description{
	margin:none;float:left;
}
.material{
	margin:none;float:left;
	width:300px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.memId{
	float:right;
}
.Date{
	float:right;
}
.all{
	position:absolute;
	left:30%;
	top:50%
}
</style>
<style id="search_style">
.searchable  img {
	max-width:200px;
}
.searchable{
	margin:none;
	width:800px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var a='${a}'
    	if(!a)
    $('#autoclickme').get(0).click();
	
	var searchStyle = document.getElementById('search_style');
	document.getElementById('search').addEventListener('input', function() {
		if (!this.value) {
		    searchStyle.innerHTML = ".searchable:not([data-index*=\"" + 
	  		this.value.toLowerCase() + "\"]) { display: block; }";
		    return;
	  	}
	  	searchStyle.innerHTML = ".searchable:not([data-index*=\"" + 
  		this.value.toLowerCase() + "\"]) { display: none; }";
	});
})
</script>
		
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
                <a class="navbar-brand" href="/webpet/index.jsp">PetFriends</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
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
            <p><a href="CookInsert.jsp" class="btn btn-primary">新增一個獨特料理食譜</a></p>
        </div>
    </section>
    <div class="all">
		<form action="CookServlet" method="post">
			<input type="text" placeholder="search" id="search"><input id="autoclickme" type="submit" name="prodaction" value="SelectAll" style="visibility:hidden;">
			<c:forEach var="cookBean" items="${result}">
				<c:url value="/cook/CookUpdate.jsp" var="link" scope="page">
						<c:param name="cookId" value="${cookBean.cookId}" />
						<c:param name="account" value="${cookBean.cookName}" />
						<c:param name="comment" value="${cookBean.cookFood}" />
						<c:param name="comment1" value="${cookBean.cookSop}" />
						<c:param name="memId" value="${cookBean.memId}" />
						<c:param name="cookPhoto" value="${cookBean.cookPhoto}" />
				</c:url>
				<c:url value="/cook/Cook3.jsp" var="link1" scope="page">
						<c:param name="cookId" value="${cookBean.cookId}" />
						<c:param name="account" value="${cookBean.cookName}" />
						<c:param name="comment" value="${cookBean.cookFood}" />
						<c:param name="comment1" value="${cookBean.cookSop}" />
						<c:param name="memId" value="${cookBean.memId}" />
						<c:param name="cookPhoto" value="${cookBean.cookPhoto}" />
				</c:url>
				<div class="searchable" data-index="${cookBean.cookName}">
				    <table>
				      <tr>
				      	<th>
				      		<img src="${pageContext.request.contextPath}${cookBean.cookPhoto}">
				      	</th>
				      	<th>
				      		<div class="recipe-name" >
				      			<a href="${link1}">${cookBean.cookName}</a>
				      			<input type="text" name="cookId" style="visibility:hidden;" size="30" value="${cookBean.cookId}">
				      		</div>
				      	<div class="memId">by <a href="">${cookBean.memId}</a>
				      						
		<%-- 		      			<c:choose>  --%>
		<%--  			      			<c:when test="${cookBean.cookId>0} && ${cookBean.memId==XXX(會員資料)}">  --%>
					      				<input  type="button" name="prodaction" value="Update" onclick="window.location.href='${link}'">     				      	
		 		      					<input  type="submit" name="prodaction" value="Delete">	
		<%--  			      			</c:when>  --%>
		<%-- 		      				<c:otherwise>  --%>
				      				
		<%--  		      				</c:otherwise>  --%>
		<%--  		      			</c:choose> --%>
				      	</div>
				      	  	<div class="description">很好吃的一道中華料理，看似很難但其實做法很簡單，可以試試看喔！</div>
					      		<br>
					      		<br>
					      	<div class="material">${cookBean.cookFood}</div>
					      	<div class="Date">
					      		<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${cookBean.creationDate}" />
					      	</div>
				      	</th>
				      </tr>
				    </table>
				  </div>
				  <br>
			</c:forEach>
		</form>
	</div>
</body>
</html>