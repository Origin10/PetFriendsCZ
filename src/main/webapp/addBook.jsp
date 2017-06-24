<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
  <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>
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
      <div class="row">
        <form action="/book/add" method="post" enctype="multipart/form-data" class="form-horizontal">
          <fieldset>
            <legend class="center-block">新增的物資資訊<span style="font-size: small" class="text-right">* 是需要填寫的欄位</span></legend>
            <!-- title-->
            <div class="form-group">
              <label for="title" class="col-md-2 control-label">* 名稱</label>
              <div class="col-md-8">
                <input id="title" type="text" name="title" value="${book.title}" required="required" placeholder="Name" class="form-control"/><span class="help-block">物資名稱</span>
              </div>
            </div>
            <!-- author-->
            <div class="form-group">
              <label for="author" class="col-md-2 control-label">製造商</label>
              <div class="col-md-8">
                <input id="author" type="text" name="author" value="${book.author}" placeholder="Manufacturer" class="form-control"/><span class="help-block">物資的製造商</span>
              </div>
            </div>
            <!-- publisher-->
            <div class="form-group">
              <label for="publisher" class="col-md-2 control-label">經銷商</label>
              <div class="col-md-8">
                <input id="publisher" type="text" name="publisher" value="${book.publisher}" placeholder="Dealer" class="form-control"/><span class="help-block">
                  物資
                  的經銷商</span>
              </div>
            </div>
            <!-- publication date-->
            <div class="form-group">
              <label for="publicationDate" class="col-md-2 control-label">製造日期</label>
              <div class="col-md-8">
                <input id="publicationDate" type="date" name="publicationDate" value="${book.publicationDate}" placeholder="ublication Date" class="form-control"/><span class="help-block">物資的製造日期</span>
              </div>
            </div>
            <!-- language-->
            <div class="form-group">
              <label for="language" class="col-md-2 control-label">產地</label>
              <div class="col-md-8">
                <select id="language" value="${book.language}" name="language" class="form-control">
                  <option value="english">國內</option>
                  <option value="spanish">國外</option>
                </select>
              </div>
            </div>
            <!-- category-->
            <div class="form-group">
              <label for="category" class="col-md-2 control-label">
                *
                分類
              </label>
              <div class="col-md-8">
                <select id="category" value="${book.category}" name="category" class="form-control">
                  <option value="" selected="selected" disabled="disabled">請選擇一項分類</option>
                  <option value="Management" selected="(${book.category}=='Management')">玩具</option>
                  <option value="Fiction" selected="(${book.category}=='Fiction')">食物</option>
                  <option value="Engineering" selected="(${book.category}=='Engineering')">保養品</option>
                  <option value="Programming" selected="(${book.category}=='Programming')">日常消耗品</option>
                  <option value="Arts &amp;amp; Literature" selected="(${book.category}=='Arts &amp; Literature')">其他</option>
                </select>
              </div>
            </div>
            <!-- pages-->
            <div class="form-group">
              <label for="pageNumber" class="col-md-2 control-label">單位重量</label>
              <div class="col-md-8">
                <input id="pageNumber" type="number" name="numberOfPages" value="${book.numberOfPages}" placeholder="Page Number" class="form-control"/><span class="help-block">物資的重量</span>
              </div>
            </div>
            <!-- format-->
            <div class="form-group">
              <label for="format" class="col-md-2 control-label">保存方式</label>
              <div class="col-md-8">
                <select id="format" value="${book.format}" name="format" class="form-control">
                  <option value="paperback">常溫</option>
                  <option value="hardcover">冷藏</option>
                </select>
              </div>
            </div>
            <!-- isbn-->
            <div class="form-group">
              <label for="isbn" class="col-md-2 control-label">相關認證字號</label>
              <div class="col-md-8">
                <input id="isbn" type="text" name="isbn" value="${book.isbn}" placeholder="ISBN" class="form-control"/><span class="help-block">(食品)寵物食品認證字號</span>
              </div>
            </div>
            <!-- shipping weight-->
            <div class="form-group">
              <label for="shippingWeight" class="col-md-2 control-label">運費</label>
              <div class="col-md-8">
                <div class="input-group">
                  <input id="shippingWeight" value="${book.shippingWeight}" type="number" step="0.01" name="shippingWeight" placeholder="Shipping Weight" class="form-control"/><span class="input-group-addon">一次</span>
                </div><span class="help-block">貨到付款</span>
              </div>
            </div>
            <!-- list price-->
            <div class="form-group">
              <label for="listPrice" class="col-md-2 control-label">公司價</label>
              <div class="col-md-8">
                <div class="input-group"><span class="input-group-addon">$</span>
                  <input id="listPrice" value="${book.listPrice}" type="number" name="listPrice" step="0.01" placeholder="List Price" class="form-control"/>
                </div><span class="help-block">
                   
                  公司價</span>
              </div>
            </div>
            <!-- our price-->
            <div class="form-group">
              <label for="ourPrice" class="col-md-2 control-label">賣家價</label>
              <div class="col-md-8">
                <div class="input-group"><span class="input-group-addon">$</span>
                  <input id="ourPrice" value="${book.ourPrice}" type="number" name="ourPrice" step="0.01" placeholder="Our Price" class="form-control"/>
                </div><span class="help-block">賣家價</span>
              </div>
            </div>
            <!-- in stock number-->
            <div class="form-group">
              <label for="inStockNumber" class="col-md-2 control-label">市價</label>
              <div class="col-md-8">
                <input id="inStockNumber" value="${book.inStockNumber}" type="number" name="inStockNumber" placeholder="Number of in-stock copies" class="form-control"/><span class="help-block">相似商品的市價</span>
              </div>
            </div>
            <!-- status of book-->
            <div class="form-group">
              <label for="status" class="col-md-2 control-label">狀態</label>
              <div class="col-md-8">
                <label>
                  <input value="true" type="radio" name="active" checked="checked"/>發布
                </label>
                <label>
                  <input value="false" type="radio" name="active"/>暫存
                </label><span class="help-block">選擇物資是否正式上架。</span>
              </div>
            </div>
            <!-- description-->
            <div class="form-group">
              <label for="description" class="col-md-2 control-label">描述</label>
              <div class="col-md-8">
                <textarea id="description" name="description" rows="5" value="${book.description}" placeholder="Description" class="form-control"><span class="help-block">物資的相關描述</span></textarea>
              </div>
            </div>
            <!-- upload image-->
            <div class="form-group">
              <div class="col-md-2">
                <label for="bookImage" class="control-label">上傳照片</label>
              </div>
              <div class="col-md-8">
                <input id="bookImage" type="file" name="bookImage" value="${book.bookImage}"/>
              </div>
            </div>
            <div class="form-group">
              <div class="col-md-2"></div>
              <div class="col-md-8">
                <button type="submit" class="btn btn-success">增加物資</button><a href="/" class="btn btn-danger">取消</a>
              </div>
            </div>
          </fieldset>
        </form>
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