
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
            <h2 class="section-headline"><span th:text="${user}? ${#strings.toUpperCase(user.username)} : 'All Books'"></span></h2>
          </h2>
        </div>
        <div class="col-xs-4"><img src="/imgs/logo.png" class="img-responsive"/></div>
      </div>
      <hr style="position: absolute; width:85%; height: 6px; background-color: #333; z-index: -1; margin-top: -80px;"/><img src="/imgs/wood.png" style="margin-top: -75px;" class="img-responsive"/>
      <div style="margin-top: 10px;" class="row">
        <div class="col-xs-12">
          <div class="row">
            <div class="col-xs-6 text-left"><a th:href="@{/bookshelf}" class="btn btn-warning">繼續選購</a></div>
            <div class="col-xs-6 text-right"><a th:href="@{/checkout(id=${shoppingCart.id})}" class="btn btn-primary">結帳</a></div><br/>
            <div th:if="${notEnoughStock}" class="alert alert-warning">抱歉，您選購的商品目前庫存不足</div>
            <div th:if="${emptyCart}" class="alert alert-warning">您購物籃裡的項目為空，請選購您所喜歡的項目</div><br/><br/>
            <div class="row">
              <div class="col-xs-8">
                <h4 style="margin-left:70px;">物資</h4>
              </div>
              <div class="col-xs-2">
                <h4>價格</h4>
              </div>
              <div class="col-xs-2">
                <h4>數量</h4>
              </div>
            </div>
            <!-- **************** display products in cart ****************-->
            <div th:each="cartItem : ${cartItemList}" class="row">
              <form th:action="@{/shoppingCart/updateCartItem}" method="post">
                <hr/>
                <div class="col-xs-2"><a th:href="@{bookDetail(id=${cartItem.book.id})}"><img style="width:70px;" th:src="undefined+@{/imgs/book/}+                    ${cartItem.book.id}+'.png'" class="img-responsive shelf-book center-block"/></a></div>
                <div class="col-xs-6">
                  <div style="margin-left:50px;"><a th:href="@{/bookDetail?id=}+${cartItem.book.id}">
                      <h4 th:text="${cartItem.book.title}"></h4></a>
                    <p th:if="${cartItem.book.inStockNumber&gt;10}" style="color: green;">庫存</p>
                    <p th:if="${cartItem.book.inStockNumber&lt;10 and cartItem.book.inStockNumber&gt;0}" style="color: green;">庫存只剩下：<span th:text="${cartItem.book.inStockNumber}"></span></p>
                    <p th:if="${cartItem.book.inStockNumber==0}" style="color: darkred;">物資不能選購</p><a th:href="@{/shoppingCart/removeItem?id=}+${cartItem.id}">刪除</a>
                  </div>
                </div>
                <div class="col-xs-2">
                  <h5 style="color: #db3208; font-size: large;">$<span th:text="${cartItem.book.ourPrice}" th:style="${cartItem.book.inStockNumber}==0? 'text-decoration: line-through' : ''"></span></h5>
                </div>
                <div class="col-xs-2">
                  <input hidden="hidden" name="id" th:value="${cartItem.id}"/>
                  <input th:id="${cartItem.id}" th:name="qty" th:disabled="${cartItem.book.inStockNumber==0}" th:value="${cartItem.qty}" class="form-control cartItemQty"/>
                  <button style="display: none;" th:id="'update-item-'+${cartItem.id}" type="submit" class="btn btn-warning btn-xs">更新</button>
                </div>
              </form>
            </div>
            <div class="row">
              <hr/>
              <h4 class="col-xs-12 text-right"><strong style="font-size: large;">總價 (<span th:text="${#lists.size(cartItemList)}"></span> 個項目):</strong><span style="color: #db3208; font-szie: large;">$<span th:text="${shoppingCart.grandTotal}"></span></span></h4>
            </div>
          </div>
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
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <!-- data table-->
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
  </body>
</html>