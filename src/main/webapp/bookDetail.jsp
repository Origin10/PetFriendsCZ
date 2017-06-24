
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
            <h2 class="section-headline">
              <c:out value="${user}" default="全部的商品"></c:out>
            </h2>
          </h2>
        </div>
        <div class="col-xs-4"><img src="/imgs/logo.png" class="img-responsive"/></div>
      </div>
      <hr style="position: absolute; width: 100%; height: 6px; background-color: #333; z-index: -1; margin-top: -80px;"/><img src="/imgs/wood.png" style="margin-top: -75px;" class="img-responsive"/>
      <form action="${pageContext.servletContext.contextPath}/shoppingCart/addItem}" method="post">
        <input hidden="hidden" value="${book.id}"/>
        <div style="margin-top: 120px;" class="row">
          <div class="col-xs-3"><a href="/bookshelf"><i aria-hidden="true" class="fa fa-2x fa-long-arrow-left"> </i><br/>
              <h3>回到物資列表</h3></a><br/><img c:url="/imgs/book/${book.id}+'.png'" class="img-responsive shelf-book"/></div>
          <div class="col-xs-9">
            <h3>
              <c:if test="${addBookSuccess}" style="color: forestgreen"><i aria-hidden="true" style="color: forestgreen" class="fa fa-check"></i>加到購物車</c:if>
            </h3>
            <h3>
              <c:if test="${notEnoughStock}" style="color: red"><span>抱歉，庫存只剩：
                  <c:out value="${book.inStockNumber}"></c:out></span></c:if>
            </h3>
            <c:out value="${book.title}"> </c:out><span>物資名稱</span>
            <div class="row">
              <div class="col-xs-5">
                <h5><strong>製造商：</strong><span>
                    <c:out value="${book.author}"></c:out></span></h5>
                <p><strong>經銷商： </strong><span>
                    <c:out value="${book.publisher}"></c:out></span></p>
                <p><strong>製造日期： </strong><span>
                    <c:out value="${book.publicationDate}"></c:out></span></p>
                <p><strong>產地： </strong><span>
                    <c:out value="${book.language}"></c:out></span></p>
                <p><strong>分類： </strong><span>
                    <c:out value="${book.category}"></c:out></span></p>
                <p><strong>單位重量：<span>
                      <c:out value="${book.format}"></c:out></span>:</strong><span>
                    <c:out value="${book.numberOfPages}"></c:out> 重量</span></p>
                <p><strong>相關認證字號： </strong><span>
                    <c:out value="${book.isbn}"></c:out></span></p>
                <p><strong>運費： </strong><span>
                    <c:out value="${book.shippingWeight}"></c:out> 一次</span></p>
              </div>
              <div class="col-xs-7">
                <div style="border-width: 5px; margin-top: 20px;" class="panel panel-default">
                  <div class="panel-body">
                    <div class="row">
                      <div class="col-xs-6">
                        <h4>賣家價：<span>
                            <c:out value="color:#db3208;"></c:out>$<span>
                              <c:out value="${book.ourPrice}"></c:out></span></span></h4>
                        <p>公司價： <span style="text-decoration: line-through">$<span>
                              <c:out value="${book.listPrice}"></c:out></span></span></p>
                        <p>你省下 $ <span>
                            <c:out value="${#numbers.formatDecimal((book.listPrice - book.ourPrice), 0, 'COMMA', 2, 'POINT' )}"></c:out></span></p><span>數量: </span>
                        <select name="qty">
                        </select>
                      </div>
                      <div class="col-xs-6">
                        <C:if test="${book.inStockNumber&gt;10}">
                          <h4 style="color: green">市價</h4>
                        </C:if>
                        <C:if test="${book.inStockNumber&lt;10 and book.inStockNumber&gt;0}"> 
                          <h4 style="color: green">只剩下 </h4><span>
                            <c:out value="${book.inStockNumber}">
                               
                              的庫存
                            </c:out></span>
                        </C:if>
                        <C:if test="${book.inStockNumber==0}">
                          <h4 style="color:darkred;">無法訂購</h4>
                        </C:if>
                        <button type="submit" style="color:black;border:1px solid black; padding: 10px 40px 10px 40px;" class="btn btn-warning">加入購物車</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <hr/>
            <c:out value="${book.description}"></c:out>
          </div>
        </div>
      </form>
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
          <li><a href="#">網站地圖    </a></li>
        </ul>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}js/scripts.js"></script>
    <!-- data table-->
    <script src="${pageContext.request.contextPath}js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}js/dataTables.bootstrap.min.js"></script>
  </body>
</html>