
<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns:th="http://www.w3.org/1000/xhtml">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>PetFriends</title>
    <!-- Bootstrap core CSS-->
    <link href="${pageContext.request.contextPath}css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}css/non-responsive.css" rel="stylesheet"/>
    <!-- data table-->
    <link href="${pageContext.request.contextPath}css/jquery.dataTables.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}css/CZ.css" rel="stylesheet"/>
  </head>
  <body>
    <nav role="navigation" class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display-->
        <div class="navbar-header"><a href="index.html" class="navbar-brand"> </a>
          <!--(href='index.html')-->
        </div>
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-center">
            <li><a href="about.html">餐廳</a></li>
            <li><a href="services.html">市集</a></li>
            <li><a href="contact.html">協尋</a></li>
            <li><a href="contact.html">血庫</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <cif test="${not empty mem}">
              <li id="profile-image"><a href="${pageContext.servletContext.contextPath}/MemInfo.jsp"><img src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&amp;type=memPhoto" width="20" height="20"/>                              ${mem.mem_name}</a></li>
              <li id="alert" style="display:none" class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle glyphicon glyphicon-bell"><span id="alerttotal" class="badge">00</span></a>
                <ul class="dropdown-menu">
                  <cforeach var="alertlist" items="${alert}">
                    <li>
                      <div class="panel panel-default">
                        <div class="panel-body"><img id="alertimg" src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${alertlist.mem_mail}&amp;type=memPhoto" width="60" height="60"/>
                          <button id="removefri" type="submit" style="float:right" class="btn btn-default">刪除邀請</button>
                          <button id="joinfri" type="submit" style="float:right" class="btn btn-default">接受</button>
                        </div>
                      </div>
                    </li>
                    <li><a href="${pageContext.servletContext.contextPath}/logout.do?logout=登出">登出     </a></li>
                  </cforeach>
                </ul>
              </li>
            </cif>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container">
      <div style="margin-bottom: -100px;" class="row">
        <div class="col-xs-8">
          <h2 class="section-headline">
            <h2 class="section-headline"><span th:text="${user}? '使用者 '+${#strings.toUpperCase(user.username)}+' 歡迎您的蒞臨' : 'PetFriends 物資交換中心'"></span></h2>
          </h2>
        </div>
        <div class="col-xs-4"><img src="/imgs/logo.png" class="img-responsive"/></div>
      </div>
      <hr style="position: absolute; width: 100%; height: 6px; background-color: #333; z-index: -1; margin-top: -80px;"/><img src="/imgs/wood.png" style="margin-top: -75px;" class="img-responsive"/>
      <div style="margin-top: 60px;" class="row">
        <div class="col-xs-3">
          <h3>
            <label for="category">分類</label>
          </h3>
          <div id="category" class="list-group"><a th:href="@{/bookshelf(category='all')}" th:classappend="${activeAll}? 'active'" class="list-group-item">全部</a><a th:href="@{/searchByCategory(category='Management')}" th:classappend="${activeManagement}? 'active'" class="list-group-item">玩具</a><a th:href="@{/searchByCategory(category='Fiction')}" th:classappend="${activeFiction}? 'active'" class="list-group-item">食物</a><a th:href="@{/searchByCategory(category='Engineering')}" th:classappend="${activeEngineering}? 'active'" class="list-group-item">清潔保養品</a><a th:href="@{/searchByCategory(category='Programming')}" th:classappend="${activeProgramming}? 'active'" class="list-group-item">日常消耗品</a><a th:href="@{/searchByCategory(category='Arts &amp; Literature')}" th:classappend="${activeArtsLiterature}? 'active'" class="list-group-item">其他</a></div>
        </div>
        <div class="col-xs-9">
          <div th:if="${emptyList}">
            <div class="alert alert-info"><strong style="font-style: italic;">抱歉！沒有你搜尋的結果，可以留下您電子信箱，有相關物資上架時讓我們通知您。</strong></div>
            <div class="text-center">
              <input type="text" placeholder="輸入信箱..." width="35px"/>
              <button type="submit" class="btn btn-success">通知我</button>
            </div>
          </div>
          <table id="bookList" border="0">
            <thead>
              <tr>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr data-th-each="book : ${bookList}" class="book-item">
                <td>
                  <div th:if="${book != null}">
                    <div style="margin-bottom: 50px;" class="row">
                      <div class="col-xs-3"><a th:href="@{/bookDetail?id=}+${book.id}"><img th:src="@{/imgs/book/}+${book.id}+'.png'" class="img-responsive shelf-book"/></a></div>
                      <div class="col-xs-9"><a th:href="@{/bookDetail?id=}+${book.id}">
                          <h4 th:text="${book.title}"></h4></a><span th:text="${book.publicationDate}"></span>
                        <p th:text="${book.author}"></p><a th:href="@{/bookDetail?id=}+${book.id}"><span th:text="${#strings.capitalize(book.format)}"></span></a><span th:text="${book.numberOfPages}"><span> 頁數</span></span><br/><a th:href="@{/bookDetail?id=}+${book.id}"><span style="font-size: x-large; color: #db3208;">$<span th:text="${#numbers.formatDecimal(book.ourPrice, 0 , 'COMMA', 2, 'POINT')}"></span></span></a><span style="text-decoration: line-through;">$<span th:text="${#numbers.formatDecimal(book.listPrice, 0 , 'COMMA', 2, 'POINT')}"></span></span>
                        <p th:utext="${#strings.abbreviate(book.description, 1000)}"></p>
                      </div>
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <!-- end of container--><br/><br/>
    <!--footer-->
    <footer>
      <div class="row">
        <div class="col-xs-3 footerleft">
          <div class="logofooter"><a href="index.html"> <img src="/imgs/logo.png" style="width: 200px;" class="img-responsive"/></a></div>
          <p>PetFriends. <br/>動物們的好朋友
            						best.
          </p>
        </div>
        <div class="col-xs-3 paddingtop-bottom">
          <h6 class="heading7">聯絡方式</h6>
          <ul class="post">
            <p><i class="fa fa-map-pin"></i> 123 XXX Ave<br/> Boston MA, USA
              							02112
            </p>
            <p><i class="fa fa-phone"></i> 電話 (TW) : +886 999 9999 999</p>
            <p><i class="fa fa-envelope"></i> E-mail : info@petfriends.com</p>
          </ul>
        </div>
        <div class="col-xs-3 paddingtop-bottom">
          <h6 class="heading7">相關連結</h6>
          <ul class="footer-ul">
            <li><a href="#"> 使用者條約</a></li>
            <li><a href="#"> 政策 &amp; 公開條款</a></li>
            <li><a href="#"> 常見問與答</a></li>
          </ul>
        </div>
        <div class="col-xs-3 paddingtop-bottom">
          <h6 class="heading7">網站營業時間</h6>
          <div class="post">
            <p>星期一 - 星期六: 9am - 11pm</p>
            <p>星期天: 10am - 10pm</p>
          </div>
        </div>
      </div>
    </footer>
    <div class="copyright">
      <div class="col-md-6">
        <p>© 2017 - All Rights Reserved</p>
      </div>
      <div class="col-md-6">
        <ul class="bottom_ul">
          <li><a href="#">關於我們</a></li>
          <li><a href="#">部落格</a></li>
          <li><a th:href="faq.jsp">問與答</a></li>
          <li><a href="#">聯絡我們</a></li>
          <li><a href="#">網站地圖</a></li>
        </ul>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}js/scripts.js"></script>
    <!-- data table-->
    <script src="${pageContext.request.contextPath}js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}js/dataTables.bootstrap.min.js"></script>
    <script>
      $(document).ready(function() {
      $('#bookList').DataTable({
      "lengthMenu":[[5,10,15,20,-1],[5,10,15,20,"All"]],
      "ordering":false,
      stateSave:true
      });
      $("#bookList").on('page.dt', function() {
      $('html, body').animate({
      scrollTop: $('#bookList').offset().top
      }, 200);
      });
      });
    </script>
  </body>
</html>