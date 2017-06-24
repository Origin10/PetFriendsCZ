
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
            <h2 class="section-headline"><span th:text="${#strings.toUpperCase(user.username)}"></span></h2>
          </h2>
        </div>
        <div class="col-xs-4"><img src="/imgs/logo.png" class="img-responsive"/></div>
      </div>
      <hr style="position: absolute; width: 100%; height: 6px; background-color: #333; z-index: -1; margin-top: -80px;"/><img src="/imgs/wood.png" style="margin-top: -75px;" class="img-responsive"/>
      <div style="margin-top: 60px;" class="row">
        <div class="col-xs-9 col-xs-offset-3">
          <!-- Nav tabs-->
          <ul class="nav nav-tabs">
            <li th:classappend="${classActiveOrders}? 'active'"><a href="#tab-2" data-toggle="tab"><span style="color: red;">訂單</span></a></li>
            <li th:classappend="${classActiveBilling}? 'active'"><a href="#tab-3" data-toggle="tab"><span style="color: red;">帳單</span></a></li>
            <li th:classappend="${classActiveShipping}? 'active'"><a href="#tab-4" data-toggle="tab"><span style="color: red;">運輸</span></a></li>
          </ul>
          <!-- Tab panels-->
          <div class="tab-content">
            <!-- Order Information-->
            <div id="tab-2" th:classappend="${classActiveOrders}? 'in active'" class="tab-pane fade">
              <div class="panel-group">
                <div style="border: none;" class="panel panel-default">
                  <div style="background-color: #ededed; margin-top: 20px;" class="panel-body">
                    <table class="table table-sm table-inverse">
                      <thead>
                        <tr>
                          <th>訂單訊息</th>
                          <th>訂單編號</th>
                          <th>總價</th>
                          <th>狀態</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr th:each="order : ${orderList}">
                          <td><a th:href="@{/orderDetail(id=${order.id})}"><span th:text="${order.orderDate}"></span></a></td>
                          <td data-th-text="${order.id}"></td>
                          <td data-th-text="${order.orderTotal}"></td>
                          <td data-th-text="${order.orderStatus}"></td>
                        </tr>
                      </tbody>
                    </table>
                    <div th:if="${displayOrderDetail}">
                      <div class="row">
                        <div class="col-xs-12">
                          <div class="text-center">
                            <h2>訂單詳細編號 #<span th:text="${order.id}"></span></h2>
                          </div>
                          <hr/>
                          <div class="row">
                            <div class="col-xs-4">
                              <div class="panel panel-default height">
                                <div class="panel-heading"><strong>帳單編號</strong></div>
                                <div class="panel-body"><span th:text="${order.billingAddress.billingAddressName}"></span><br/><span th:text="${order.billingAddress.billingAddressStreet1}+' '+${order.billingAddress.billingAddressStreet2}"></span><br/><span th:text="${order.billingAddress.billingAddressCity}"></span><br/><span th:text="${order.billingAddress.billingAddressState}"></span><br/><span th:text="${order.billingAddress.billingAddressZipcode}"></span><br/></div>
                              </div>
                            </div>
                            <div class="col-xs-4">
                              <div class="panel panel-default height">
                                <div class="panel-heading"><strong>付款資訊</strong></div>
                                <div class="panel-body"><span th:text="${order.payment.holderName}">持卡人姓名</span><br/><span th:text="${order.payment.cardNumber}">卡片編號</span><br/><span>到期日：</span><span th:text="${order.payment.expiryMonth}"></span>/<span th:text="${order.payment.expiryYear}"></span><br/></div>
                              </div>
                            </div>
                            <div class="col-xs-4">
                              <div class="panel panel-default height">
                                <div class="panel-heading"><strong>帳單寄送細目：</strong></div>
                                <div class="panel-body"><span th:text="${order.shippingAddress.shippingAddressName}"></span><br/><span th:text="${order.shippingAddress.shippingAddressStreet1}+' '+${order.shippingAddress.shippingAddressStreet2}"></span><br/><span th:text="${order.shippingAddress.shippingAddressCity}"></span><br/><span th:text="${order.shippingAddress.shippingAddressState}"></span><br/><span th:text="${order.shippingAddress.shippingAddressZipcode}"></span><br/></div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="panel-heading">
                            <h3 class="text-center"><strong>訂單總和</strong></h3>
                          </div>
                          <div class="panel-body">
                            <div class="table-responsive">
                              <table class="table table-condensed">
                                <thead>
                                  <tr>
                                    <td><strong>項目名稱</strong></td>
                                    <td class="text-center"><strong>項目價錢</strong></td>
                                    <td class="text-center"><strong>項目數量</strong></td>
                                    <td class="text-right"><strong>總合</strong></td>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr th:each="cartItem : ${cartItemList}">
                                    <td data-th-text="${cartItem.book.title}"></td>
                                    <td data-th-text="${cartItem.book.ourPrice}" class="text-center"></td>
                                    <td data-th-text="${cartItem.qty}" class="text-center"></td>
                                    <td data-th-text="${cartItem.subtotal}" class="text-center"></td>
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
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Billing Information-->
            <div id="tab-3" th:classappend="${classActiveBilling}? 'in active'" class="tab-pane fade">
              <div class="panel-group">
                <div style="border: none;" class="panel panel-default">
                  <div style="background-color: #ededed; margin-top: 20px;" class="panel-body">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item active"><a th:href="@{/listOfCreditCards}" th:style="${listOfCreditCards}? 'color:red'">信用卡列表</a></li>
                      <li class="breadcrumb-item active"><a th:href="@{/addNewCreditCard}" th:style="${addNewCreditCard}? 'color:red'">添加或修改信用卡</a></li>
                    </ol>
                    <div th:if="${listOfCreditCards}">
                      <form th:action="@{/setDefaultPayment}" method="post">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>預設付款</th>
                              <th>信用卡</th>
                              <th>操作</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr th:each="userPayment : ${userPaymentList}">
                              <td>
                                <input type="radio" name="defaultUserPaymentId" th:value="${userPayment.id}" th:checked="${userPayment.defaultPayment}"/>
                              </td>
                              <td th:text="${userPayment.cardName}"></td>
                              <td><a th:href="@{/updateCreditCard(id=${userPayment.id})}"><i class="fa fa-pencil"></i></a><a th:href="@{/removeCreditCard(id=${userPayment.id})}"><i class="fa fa-times"></i></a></td>
                            </tr>
                          </tbody>
                        </table>
                        <button type="submit" class="btn btn-primary">儲存</button>
                      </form>
                    </div>
                    <div th:if="${addNewCreditCard}">
                      <form th:action="@{addNewCreditCard}" method="post">
                        <div th:if="${updateUserPaymentInfo}" class="bg-info">使用者資訊已更新。</div>
                        <input hidden="hidden" name="id" th:value="${userPayment.id}"/>
                        <div class="form-group">
                          <h5>* 幫你的這張卡取名字：</h5>
                          <input id="cardName" type="text" placeholder="Card Name" th:name="cardName" required="required" th:value="${userPayment.cardName}" class="form-control"/>
                        </div>
                        <!-- Billing Address-->
                        <hr/>
                        <div class="form-group">
                          <h4>帳單地址</h4>
                        </div>
                        <div class="form-group">
                          <label for="billingName">* 收帳單者姓名</label>
                          <input id="billingName" type="text" placeholder="Receiver Name" th:name="userBillingName" required="required" th:value="${memBilling.userBillingName}" class="form-control"/>
                        </div>
                        <div class="form-group">
                          <label for="billingAddress">* 帳單地址</label>
                          <input id="billingAddress" type="text" placeholder="Street Address 1" th:name="userBillingStreet1" required="required" th:value="${memBilling.userBillingStreet1}" class="form-control"/>
                          <input id="billingAddress" type="text" placeholder="Street Address 2" th:name="userBillingStreet2" th:value="${memBilling.userBillingStreet2}" class="form-control"/>
                        </div>
                        <div class="row">
                          <div class="col-xs-4">
                            <div class="form-group">
                              <label for="billingCity">* 城市</label>
                              <input id="billingCity" type="text" placeholder="Billing city" th:name="userBillingCity" required="required" th:value="${memBilling.userBillingCity}" class="form-control"/>
                            </div>
                          </div>
                          <div class="col-xs-4">
                            <div class="form-group">
                              <label for="billingState">* 國家</label>
                              <select id="billingState" th:name="userBillingState" th:value="${memBilling.userBillingState}" required="required" class="form-control">
                                <option value="" disabled="disabled">請選一個選項</option>
                                <option th:each="state : ${stateList}" th:text="${state}" th:selected="(${memBilling.userBillingState}==${state})"></option>
                              </select>
                            </div>
                          </div>
                          <div class="col-xs-4">
                            <div class="form-group">
                              <label for="billingZipcode">* 郵遞區號</label>
                              <input id="billingZipcode" type="text" placeholder="Billing Zipcode" th:name="userBillingZipcode" required="required" th:value="${memBilling.userBillingZipcode}" class="form-control"/>
                            </div>
                          </div>
                        </div>
                        <!-- Credit Card Information-->
                        <hr/>
                        <div class="form-group">
                          <h4>信用卡訊息</h4>
                        </div>
                        <div class="row">
                          <div class="col-xs-12"><img src="/imgs/creditcard.png" class="img-responsive"/><br/>
                            <div class="form-group">
                              <label for="cardType">* 選擇卡片類型:</label>
                              <select id="cardType" th:name="type" th:value="${userPayment.type}" class="form-control">
                                <option value="visa">Visa</option>
                                <option value="mastercard">Mastercard</option>
                                <option value="discover">Discover</option>
                                <option value="amex">美國運通</option>
                              </select>
                            </div>
                            <div class="form-group">
                              <label for="cardHolder">* 持卡人姓名:</label>
                              <input id="cardHolder" type="text" required="required" placeholder="Card Holder Name" th:name="holderName" th:value="${userPayment.holderName}" class="form-control"/>
                            </div>
                            <div class="form-group">
                              <label for="cardNumber">* 信用卡卡號:</label>
                              <div class="input-group">
                                <input id="cardNumber" type="tel" required="required" placeholder="Valid Card Number" th:name="cardNumber" th:value="${userPayment.cardNumber}" class="form-control"/><span class="input-group-addon"><i aria-hidden="true" class="fa fa-credit-card"></i></span>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-xs-7">
                            <div class="form-group">
                              <label>* 到期日期</label>
                              <div class="row">
                                <div class="col-xs-6">
                                  <select name="expiryMonth" required="required" th:value="${userPayment.expiryMonth}" class="form-control">
                                    <option disabled="disabled">-- 月份 --</option>
                                    <option value="01">Jan (01)</option>
                                    <option value="02">Feb (02)</option>
                                    <option value="03">Mar (03)</option>
                                    <option value="04">Apr (04)</option>
                                    <option value="05">May (05)</option>
                                    <option value="06">June (06)</option>
                                    <option value="07">July (07)</option>
                                    <option value="08">Aug (08)</option>
                                    <option value="09">Sep (09)</option>
                                    <option value="10">Oct (10)</option>
                                    <option value="11">Nov (11)</option>
                                    <option value="12">Dec (12)</option>
                                  </select>
                                </div>
                                <div class="col-xs-6">
                                  <select name="expiryYear" th:value="${userPayment.expiryYear}" class="form-control">
                                    <option disabled="disabled">-- 年 --</option>
                                    <option value="2017">2017</option>
                                    <option value="2018">2018</option>
                                    <option value="19">2019</option>
                                    <option value="20">2020</option>
                                    <option value="21">2021</option>
                                    <option value="22">2022</option>
                                    <option value="23">2023</option>
                                    <option value="23">2024</option>
                                    <option value="23">2025</option>
                                    <option value="23">2026</option>
                                    <option value="23">2027</option>
                                    <option value="23">2028</option>
                                    <option value="23">2029</option>
                                  </select>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col-xs-5">
                            <div class="form-group">
                              <label for="cardCVC">CV Code</label>
                              <input id="cardCVC" type="tel" name="cvc" placeholder="CVC" th:name="cvc" th:value="${userPayment.cvc}" class="form-control"/>
                            </div>
                          </div>
                        </div>
                        <hr/>
                        <button type="submit" class="btn btn-primary btn-lg">儲存</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Shipping Information-->
            <div id="tab-4" th:classappend="${classActiveShipping}? 'in active'" class="tab-pane fade">
              <div class="panel-group">
                <div style="border: none;" class="panel panel-default">
                  <div style="background-color: #ededed; margin-top: 20px;" class="panel-body">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item active"><a th:href="@{/listOfShippingAddresses}" th:style="${listOfShippingAddresses}? 'color:red'">帳單地址列表</a></li>
                      <li class="breadcrumb-item active"><a th:href="@{/addNewShippingAddress}" th:style="${addNewShippingAddress}? 'color:red'">新增或更新帳單地址</a></li>
                    </ol>
                    <div th:if="${listOfShippingAddresses}">
                      <form th:action="@{/setDefaultShippingAddress}" method="post">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>預設帳單地址</th>
                              <th>帳單地址</th>
                              <th>操作</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr th:each="memShipping : ${memShippingList}">
                              <td>
                                <input type="radio" name="defaultShippingAddressId" th:value="${memShipping.id}" th:checked="${memShipping.userShippingDefault}"/><span>預設</span>
                              </td>
                              <td th:text="${memShipping.userShippingStreet1}+', '+                              ${memShipping.userShippingCity}+', '+${memShipping.userShippingState}"></td>
                              <td><a th:href="@{/updateUserShipping(id=${memShipping.id})}"><i class="fa fa-pencil"></i></a><a th:href="@{/removeUserShipping(id=${memShipping.id})}"><i class="fa fa-times"></i></a></td>
                            </tr>
                          </tbody>
                        </table>
                        <button type="submit" class="btn btn-primary">儲存</button>
                      </form>
                    </div>
                    <div th:if="${addNewShippingAddress}">
                      <form th:action="@{/addNewShippingAddress}" method="post">
                        <div th:if="${updateUserShippingInfo}" class="bg-info">使用者資訊已更新。</div>
                        <input hidden="hidden" name="id" th:value="${memShipping.id}"/>
                        <!-- Shipping Address-->
                        <hr/>
                        <div class="form-group">
                          <h4>收貨地址</h4>
                        </div>
                        <div class="form-group">
                          <label for="shippingName">* 收貨者姓名</label>
                          <input id="shippingName" type="text" placeholder="Receiver Name" th:name="userShippingName" required="required" th:value="${memShipping.userShippingName}" class="form-control"/>
                        </div>
                        <div class="form-group">
                          <label for="shippingAddress">* 收貨地址</label>
                          <input id="shippingAddress" type="text" placeholder="Street Address 1" th:name="userShippingStreet1" required="required" th:value="${memShipping.userShippingStreet1}" class="form-control"/>
                          <input type="text" placeholder="Street Address 2" th:name="userShppingStreet2" th:value="${memShipping.userShippingStreet2}" class="form-control"/>
                        </div>
                        <div class="row">
                          <div class="col-xs-4">
                            <div class="form-group">
                              <label for="shippingCity">* 城市</label>
                              <input id="shippingCity" type="text" placeholder="Shipping City" th:name="userShippingCity" required="required" th:value="${memShipping.userShippingCity}" class="form-control"/>
                            </div>
                          </div>
                          <div class="col-xs-4">
                            <div class="form-group">
                              <label for="shippingState">* 國家</label>
                              <select id="shippingState" th:name="userShippingState" th:value="${memShipping.userShippingState}" required="required" class="form-control">
                                <option value="" disabled="disabled">
                                  Please
                                  select an option
                                </option>
                                <option th:each="state : ${stateList}" th:text="${state}" th:selected="(${memShipping.userShippingState}==${state})"></option>
                              </select>
                            </div>
                          </div>
                          <div class="col-xs-4">
                            <div class="form-group">
                              <label for="shippingZipcode">* 郵遞區號</label>
                              <input id="shippingZipcode" type="text" placeholder="Shipping Zipcode" th:name="userShippingZipcode" required="required" th:value="${memShipping.userShippingZipcode}" class="form-control"/>
                            </div>
                          </div>
                        </div>
                        <hr/>
                        <button type="submit" class="btn btn-primary btn-lg">儲存</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
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
    <script src="${pageContext.request.contextPath}js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}js/scripts.js"></script>
    <!-- data table-->
    <script src="${pageContext.request.contextPath}js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}js/dataTables.bootstrap.min.js"></script>
  </body>
</html>