<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>協尋與認養</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Custom CSS -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/css/modern-business.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/theme.min.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/adoptAll.css'></c:url>">
<link href="<c:url value='/css/nav-setting.css'></c:url>" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.min.css">
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

    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading"><b>歡迎進入協尋與認養</b></h1>
            <p class="lead"><b>在這裡您可以看到需要協尋的寵物通知，或是想要找到寵物主人的資訊，也有需要找新家的寵物訊息。</b></p>
            <p class="lead"><b>希望您能發揮愛心，讓每個寵物都能回家。</b></p>
            <p><a href="addAdopt" class="btn btn-primary btn-lg">新增一個協尋或是認養資料</a></p>
            <!-- 
            <a href="selectAdopt" class="btn btn-primary btn-lg"  data-toggle="modal" data-target="#myModal">新增一個協尋或是認養資料</a>
             -->
        </div>
    </section>
    <!-- 下半部顯示與選單 -->
    <div class="container panel panel-primary">
        <div class="row justify-content-between">
            <div class="col-sm-5">
                <h3>尋找寵物、發現寵物、認養寵物</h3>
            </div>
            <div class="col-sm-7" style="text-align: right;">
                <form class="form-inline" style="margin-top:1.5rem;">
                    <label class="mr-sm-2" for="ViewPetForm">類別:</label>
                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="ViewPetForm" style="margin-right: 1rem">
                        <option selected>請選擇</option>
                        <option value="1">協尋</option>
                        <option value="2">拾獲，找原主人</option>
                        <option value="3">拾獲，找新主人</option>
                        <option value="4">認養</option>
                    </select>
                    <label class="mr-sm-2" for="ViewPetType">種類:</label>
                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="ViewPetType" style="margin-right: 1rem">
                        <option selected>請選擇</option>
                        <option value="狗狗">狗狗</option>
                        <option value="貓咪">貓咪</option>
                        <option value="兔子">兔子</option>
                        <option value="鼠類">鼠類</option>
                        <option value="鳥類">鳥類</option>
                        <option value="其他">其他</option>
                    </select>
                    <label class="mr-sm-2" for="ViewDate">日期:</label>
                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="ViewDate" style="margin-right: 1rem">
                        <option selected>請選擇</option>
                        <option value="1">由新到舊</option>
                        <option value="2">由舊到新</option>
                    </select>
                    <label class="mr-sm-2" for="ViewCity">城市:</label>
                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="ViewCity" style="margin-right: 1rem">
                        <option selected>請選擇</option>
                    </select>
                    <label class="mr-sm-2" for="ViewDistrict">地區:</label>
                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="ViewDistrict">
                        <option selected>請選擇</option>
                    </select>
                    <a href="#"><span class="glyphicon glyphicon-search"></span></a>
                </form>
            </div>
        </div>
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#all">所有</a></li>
            <li ><a data-toggle="tab" href="#dog">狗狗</a></li>
            <li ><a data-toggle="tab" href="#cat">貓咪</a></li>
            <li ><a data-toggle="tab" href="#other">其他</a></li>
        </ul>
        <div class="tab-content" style="margin-top:1rem;">
            <div id="all" class="tab-pane fade in active">        
            </div>
            <div id="dog" class="tab-pane fade">
            </div>
            <div id="cat" class="tab-pane fade">
            </div>
            <div id="other" class="tab-pane fade">
            </div>
        </div>
    </div>
    <!-- 左側選單 -->
	<div id=menu>
		<a href="#" class="glyphicon glyphicon-triangle-top" data-toggle="tooltip" data-placement="top" title="點此回到最上方">Top</a>
	</div>
	<!-- 新增協尋畫面 -->
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h3 class="modal-title text-center">標題</h3>
	            </div>
	            <div class="modal-body modeal-body-scroll">
	                <p>讀取中...</p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
	            </div>
	    </div>
	</div>
	</div>
<script type="text/javascript" src="<c:url value='/resources/js/viewAll.js' />"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.min.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript">
$(function() {
	getView("#all");
	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		var target = $(e.target).attr("href") // activated tab
		getView(target);
	});
	//用於綁定AJAX生出也可以用
	$(document).on('click','.viewModal',function(e) {
		e.preventDefault();
		var getUrl=$(this).attr("href");
		getSingleAdopt(getUrl);
	});
	$('body').on('hidden.bs.modal', '.viewModal', function () {
		  $(this).removeData('bs.modal');
		});
	
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
	    event.preventDefault();
	    $(this).ekkoLightbox();
	});
});
</script>

<script type="text/javascript" src="<c:url value='/js/petfriendsMem.js' />"></script>
</body>
</html>