<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
  <head>
    <!-- Bootstrap core CSS-->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/non-responsive.css" rel="stylesheet"/>
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Custom styles for this template-->
    <link href="css/style.css" rel="stylesheet"/>
    <style>
      table {
      border-collapse: collapse;
      }
      table, th, td {
      border:1px solid black;}
    </style>
  </head>
  <body>
    <p>親愛的 <span th:text="${user.firstName}"></span>,</p><br/>
    <p>感謝您使用我們的物資交換平台，希望您在本平台上有份美好的使用經驗。</p>
    <p>您的訂單號碼是： <strong>#<span th:text="${order.id}"></span></strong>. 這是您的訂單明細：</p>
    <h2>訂單明細號碼 #<span th:text="${order.id}"></span></h2>
    <hr/>
    <table>
      <tr>
        <th>帳單明細</th>
        <th>付款資訊</th>
        <th>寄送地址</th>
      </tr>
      <tr>
        <td><span th:text="${order.billingAddress.billingAddressName}"></span><br/><span th:text="${order.billingAddress.billingAddressStreet1}+' '+${order.billingAddress.billingAddressStreet2}"></span><br/><span th:text="${order.billingAddress.billingAddressCity}"></span><br/><span th:text="${order.billingAddress.billingAddressState}"></span><br/><span th:text="${order.billingAddress.billingAddressZipcode}"></span><br/></td>
        <td><span th:text="${order.payment.holderName}"></span><br/><span th:text="${order.payment.type}"></span><br/><span th:text="${order.payment.cardNumber}"></span><br/><span th:text="${order.payment.expiryMonth}"></span><br/><span th:text="${order.payment.expiryYear}"></span><br/></td>
        <td><span th:text="${order.shippingAddress.shippingAddressName}"></span><br/><span th:text="${order.shippingAddress.shippingAddressStreet1}+' '+${order.shippingAddress.shippingAddressStreet2}"></span><br/><span th:text="${order.shippingAddress.shippingAddressCity}"></span><br/><span th:text="${order.shippingAddress.shippingAddressState}"></span><br/><span th:text="${order.shippingAddress.shippingAddressZipcode}"></span><br/></td>
      </tr>
    </table>
    <h3><strong>訂單總計</strong></h3>
    <table>
      <thead>
        <tr>
          <td><strong>項目名稱</strong></td>
          <td class="text-center"><strong>項目價格</strong></td>
          <td class="text-center"><strong>項目數量</strong></td>
          <td class="text-right"><strong>總合</strong></td>
        </tr>
      </thead>
      <tbody>
        <tr th:each="cartItem : ${cartItemList}">
          <td><span data-th-text="${cartItem.book.title}"></span></td>
          <td data-th-text="${cartItem.book.ourPrice}" class="text-center"></td>
          <td data-th-text="${cartItem.qty}" class="text-center"></td>
          <td data-th-text="${cartItem.subtotal}" class="text-right"></td>
        </tr>
        <tr>
          <td class="highrow"></td>
          <td class="highrow"></td>
          <td class="highrow text-center"><strong>小計</strong></td>
          <td data-th-text="${order.orderTotal}" class="highrow text-right"></td>
        </tr>
        <tr>
          <td class="emptyrow"></td>
          <td class="emptyrow"></td>
          <td class="emptyrow text-center"><strong>稅</strong></td>
          <td data-th-text="${#numbers.formatDecimal(order.orderTotal*0.06,0,2)}" class="emptyrow text-right"></td>
        </tr>
        <tr>
          <td class="emptyrow"><i class="fa fa-barcode iconbig"></i></td>
          <td class="emptyrow"></td>
          <td class="emptyrow text-center"><strong>總計</strong></td>
          <td th:with="total=${order.orderTotal+order.orderTotal*0.06}" data-th-text="${#numbers.formatDecimal(total, 0, 2)}" class="emptyrow text-right"></td>
        </tr>
      </tbody>
    </table><br/>
    <p>Best,</p>
    <p>PetFriends</p>
    <p>Since 1923</p>
  </body>
</html>