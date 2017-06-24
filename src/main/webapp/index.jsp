<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="en" xmlns:th="http://www.w3.org/1000/xhtml">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>PetFriends</title>
    <!-- Bootstrap core CSS-->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/non-responsive.css" rel="stylesheet"/>
    <!-- data table-->
    <link href="css/jquery.dataTables.min.css" rel="stylesheet"/>
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Custom styles for this template-->
    <link href="css/CZ.css" rel="stylesheet"/>
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
            <li><a sec:authorize="isAnonymous()" th:href="@{/login}">MY ACCOUNT</a></li>
            <li><a sec:authorize="isAuthenticated()" th:href="@{/myProfile}">MY ACCOUNT</a></li>
            <li><a sec:authorize="isAuthenticated()" th:href="@{/logout}">LOGOUT</a></li>
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
      <div class="row">
        <div class="col-md-8 text-left">
          <div style="position:relative; top:75px" class="btn-group"><a type="button" href="/book/add" class="btn btn-primary btn-lg">新增物資</a><a type="button" href="/book/bookList" class="btn btn-success btn-lg">檢視物資清單</a></div>
        </div>
        <div class="col-md-4 text-right">
          <h2 style="padding-left:10px;">物資搜尋</h2>
          <div id="search-input">
            <div style="margin-left:80px;" class="input-group"> 
              <form action="/searchBook" method="post" class="navbar-form">
                <div class="form-group">
                  <input type="text" name="keyword" placeholder="尋找物資" size="22" style="position:relative; left:10px" class="form-control input-lg"/><span class="input-group-btn">
                    <button type="submit" class="btn btn-info btn-lg"><i class="glyphicon glyphicon-search"> </i>
                      <div style="margin:15px 0;" class="text-center bg-theme">
                        <div class="container">
                          <div style="padding-top: 10px;" class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-2"><a style="color:#fff" th:href="@{/bookshelf?category=all}"> <i class="fa fa-5x fa-fw fa-archive"></i>
                                <div class="col-md-12">
                                  <p class="lead">新進的物資</p>
                                </div></a></div>
                            <div class="col-md-2"><a style="color:#fff" th:href="@{/bookshelf}"><i class="fa fa-5x fa-fw fa-heart"></i>
                                <div class="col-md-12">
                                  <p class="lead">喜愛的物資</p>
                                </div></a></div>
                            <div class="col-md-2"><a style="color:#fff" th:href="@{/myProfile}"> <i class="fa fa-5x fa-fw fa-cart-plus"></i>
                                <div class="col-md-12">
                                  <p class="lead">物資交易明細</p>
                                </div></a></div>
                            <div class="col-md-2"><a style="color:#fff" th:href="@{/book/bookList}"><i class="fa fa-5x fa-fw fa-shopping-basket"></i>
                                <div class="col-md-12">
                                  <p class="lead">捐出的物資</p>
                                </div></a></div>
                            <div class="col-md-2">                   </div>
                          </div>
                        </div>
                      </div>
                    </button></span>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <hr/>
      <div class="row banner">
        <!-- carousel-->
        <div class="col-xs-8">
          <div style="margin-top: 20px;" class="panel panel-default">
            <div class="panel-body">
              <div id="carousel-example-generic" data-ride="carousel" class="carousel slide">
                <!-- Indicators-->
                <ol class="carousel-indicators">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides-->
                <div role="listbox" class="carousel-inner">
                  <div class="item active"><img src="/imgs/hero-1.png" alt="..."/>
                    <div class="carousel-caption">
                      <h4>First Thumbnail Label</h4>
                      <p>
                        Contrary to popular belief, Lorem Ipsum is not simply
                        random text. It has roots in a piece of classical Latin
                        literature from 45 BC, making it over 2000 years old.
                      </p>
                    </div>
                  </div>
                  <div class="item"><img src="/imgs/hero-2.png" alt="..."/>
                    <div class="carousel-caption">
                      <h4>Second Thumbnail Label</h4>
                      <p>
                        Contrary to popular belief, Lorem Ipsum is not simply
                        random text. It has roots in a piece of classical Latin
                        literature from 45 BC, making it over 2000 years old.
                      </p>
                    </div>
                  </div>
                  <div class="item"><img src="/imgs/hero-3.png" alt="..."/>
                    <div class="carousel-caption">
                      <h4>Thired Thumbnail Label</h4>
                      <p>
                        Contrary to popular belief, Lorem Ipsum is not simply
                        random text. It has roots in a piece of classical Latin
                        literature from 45 BC, making it over 2000 years old.
                        								...
                      </p>
                    </div>
                  </div>
                </div>
                <!-- Controls--><a href="#carousel-example-generic" role="button" data-slide="prev" class="left carousel-control"><span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span><span class="sr-only">Previous</span></a><a href="#carousel-example-generic" role="button" data-slide="next" class="right carousel-control"><span aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span><span class="sr-only">Next</span></a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xs-4"><img src="/imgs/logo.png" class="img-responsive"/></div>
      </div>
      <hr/>
      <div class="row">
        <div class="col-xs-4">
          <div class="panel panel-default">
            <div class="panel-body"><a th:href="@{/bookshelf}"><img src="/imgs/bestseller.png" class="img-responsive"/></a></div>
          </div>
        </div>
        <div class="col-xs-4">
          <div clas="panel panel-default">
            <div class="panel-body"><a th:href="@{/hours}"><img src="/imgs/hours.png" class="img-responsive"/></a></div>
          </div>
        </div>
        <div class="col-xs-4">
          <div clas="panel panel-default">
            <div class="panel-body"><a th:href="@{/faq}"><img src="/imgs/faq.png" class="img-responsive"/></a></div>
          </div>
        </div>
      </div>
      <div>
        <div class="home-headline"><span>Featured Books</span></div>
        <hr style="margin-top: -15px;"/>
      </div>
      <div class="row">
        <div id="featured-books" data-ride="carousel" class="carousel slide">
          <!-- Indicators-->
          <ol class="carousel-indicators">
            <li data-target="#featured-books" data-slide-to="0" class="active"></li>
            <li data-target="#featured-books" data-slide-to="1"></li>
            <li data-target="#featured-books" data-slide-to="2"></li>
          </ol>
          <!-- Wrapper for slides-->
          <div role="listbox" class="carousel-inner">
            <div class="item active"><img src="/imgs/shelf.png" class="img-responsive"/>
              <div class="carousel-caption">
                <div class="row">
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                </div>
              </div>
            </div>
            <div class="item"><img src="/imgs/shelf.png" class="img-responsive"/>
              <div class="carousel-caption">
                <div class="row">
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                </div>
              </div>
            </div>
            <div class="item"><img src="/imgs/shelf.png" class="img-responsive"/>
              <div class="carousel-caption">
                <div class="row">
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                  <div class="col-xs-2"><img src="/imgs/book1.png" class="img-responsive"/></div>
                </div>
              </div>
            </div>
          </div>
          <!-- Controls--><a href="##featured-books" role="button" data-slide="prev" class="left carousel-control"><span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span><span class="sr-only">Previous</span></a><a href="##featured-books" role="button" data-slide="next" class="right carousel-control"><span aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span><span class="sr-only">Next</span></a>
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