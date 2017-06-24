
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
      <div class="container"></div>
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
    </nav>
    <div class="container">
      <div class="table-responsive">
        <table id="bookListTable" class="table table-bordered table-hover table-striped">
          <thead>
            <tr>
              <th>
                <input th:id="selectAllBooks" type="checkbox"/>
              </th>
              <th>名稱</th>
              <th>製造商</th>
              <th>分類</th>
              <th>公司價</th>
              <th>賣家價</th>
              <th>公開或暫存</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            <tr data-th-each="book : ${bookList}">
              <td>
                <input hidden="hidden" name="id" th:value="${book.id}"/>
                <input th:id="'selected'+${book.id}" type="checkbox" class="checkboxBook"/>
              </td>
              <td><a th:href="@{/book/bookInfo(id=${book.id})}"><span th:text="${book.title}"></span></a></td>
              <td th:text="${book.author}"></td>
              <td th:text="${book.category}"></td>
              <td th:text="${book.listPrice}"></td>
              <td th:text="${book.ourPrice}"></td>
              <td th:text="${book.active}"></td>
              <td>
                <input hidden="hidden" name="id" th:value="${book.id}"/>
                <button th:id="'oneBook-'+${book.id}" type="submit" value="delete" class="btn btn-danger btn-xs delete-book"><span class="fa fa-times"></span>刪除</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <button th:id="deleteSelected" class="btn btn-danger">刪除已選擇</button>
    </div>
    <script src="${pageContext.request.contextPath}js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}js/scripts.js"></script>
    <!-- data table-->
    <script src="${pageContext.request.contextPath}js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}js/dataTables.bootstrap.min.js"></script>
    <script>
      $(document).ready(function() {
      $("#bookListTable").DataTable({
      "lengthMenu": [[5,10,15,20,-1],[5,10,15,20,"All"]],
      "ordering": false,
      stateSave: true
      });
      });
    </script>
  </body>
</html>