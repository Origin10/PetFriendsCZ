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
            <li><a sec:authorize="isAnonymous()" href="{/login}">MY ACCOUNT</a></li>
            <li><a sec:authorize="isAuthenticated()" href="{/myProfile}">MY ACCOUNT</a></li>
            <li><a sec:authorize="isAuthenticated()" href="{/logout}">LOGOUT</a></li>
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
          <h2 class="section-headline"><span>User Account</span></h2>
        </div>
        <div class="col-xs-4"><img src="/imgs/logo.png" class="img-responsive"/></div>
      </div>
      <hr style="position: absolute; width: 100%; height: 6px; background-color: #333; z-index: -1; margin-top: -80px;"/><img src="/imgs/wood.png" style="margin-top: -75px;" class="img-responsive"/>
      <div style="margin-top: 10px;" class="row">
        <form th:action="@{/checkout}" method="post">
          <!-- Left Panel-->
          <div class="col-xs-4">
            <div class="panel panel-default">
              <div class="panel-body">
                <button type="submit" class="btn btn-warning btn-block">訂貨地址</button>
                <p style="font-size: smaller;">你同意關於PetFriends提供的<a href="#">政策</a>notice and <a href="#">條件</a>來使用</p>
                <hr/>
                <h3>訂單簡要</h3>
                <div class="row">
                  <div class="col-xs-7 text-left">稅前:</div>
                  <div class="col-xs-5 text-right">$<span th:text="${shoppingCart.grandTotal}"></span></div>
                </div>
                <div class="row">
                  <div class="col-xs-7 text-left">含稅:</div>
                  <div class="col-xs-5 text-right">$<span th:with="tax=${shoppingCart.grandTotal*0.06}" th:text="${#numbers.formatDecimal(tax, 0 ,2)}"></span></div>
                </div>
                <div class="row">
                  <div class="col-xs-7 text-left">
                    <h3 style="color: darkred;"><strong>訂單總和: </strong></h3>
                  </div>
                  <div class="col-xs-5 text-right">
                    <h3><strong style="color: darkred;">$<span th:with="total=${shoppingCart.grandTotal+shoppingCart.grandTotal*0.06}" th:text="${#numbers.formatDecimal(total, 0 ,2)}"></span></strong></h3>
                  </div>
                </div>
                <div class="panel-footer">
                  Shipping and handling haven't
                  applied.
                </div>
              </div>
            </div>
          </div>
          <!-- Checkout Info-->
          <div class="col-xs-8">
            <div th:if="${missingRequiredField}">
              <h5 class="alert alert-warning">這裡有一些必要欄位＊需要填寫</h5>
            </div>
            <div id="accordion" class="panel-group">
              <!-- 1. Shipping Address-->
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#shippingInfo"> 1. 寄貨地址</a></h4>
                </div>
                <div id="shippingInfo" th:classappend="${classActiveShipping}? 'in'" class="panel-collapse collapse">
                  <div class="panel-body">
                    <table th:if="${not emptyShippingList}" class="table">
                      <thead>
                        <tr>
                          <th>可收貨地址</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr th:each="memShipping : ${memShippingList}">
                          <td th:text="${memShipping.userShippingStreet1}+' '+${memShipping.userShippingStreet2}+', '+${memShipping.userShippingCity}                          +', '+${memShipping.userShippingState}"></td>
                          <td><a href="{/setShippingAddress(userShippingId=${memShipping.id})}">
                              使用
                              這個地址</a></td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="form-group">
                      <label for="shippingName">* 收貨人姓名</label>
                      <input id="shippingName" type="text" placeholder="Receiver Name" name="shippingAddressName" th:value="${shippingAddress.shippingAddressName}" class="form-control"/>
                    </div>
                    <div class="form-group">
                      <label for="shippingStreet">* 收穫地址</label>
                      <input id="shippingStreet" type="text" placeholder="Street Address 1" name="shippingAddressStreet1" th:value="${shippingAddress.shippingAddressStreet1}" class="form-control"/>
                    </div>
                    <div class="form-group">
                      <input type="text" placeholder="Street Address 2" name="shippingAddressStreet2" th:value="${shippingAddress.shippingAddressStreet2}" class="form-control"/>
                    </div>
                    <div class="row">
                      <div class="col-xs-4">
                        <div class="form-group">
                          <label for="shippingCity">* 城市</label>
                          <input id="shippingCity" type="text" placeholder="Shipping City" th:name="shippingAddressCity" required="required" th:value="${shippingAddress.shippingAddressCity}" class="form-control"/>
                        </div>
                      </div>
                      <div class="col-xs-4">
                        <div class="form-group">
                          <label for="shippingState">* 國家</label>
                          <select id="shippingState" th:name="shippingAddressState" th:value="${shippingAddress.shippingAddressState}" required="required" class="form-control">
                            <option value="" disabled="disabled">請選擇一個選項</option>
                            <option th:each="state : ${stateList}" th:text="${state}" th:selected="(${shippingAddress.shippingAddressState}==${state})"></option>
                          </select>
                        </div>
                      </div>
                      <div class="col-xs-4">
                        <div class="form-group">
                          <label for="shippingZipcode">* 郵遞區號</label>
                          <input id="shippingZipcode" type="text" placeholder="Shipping Zipcode" th:name="shippingAddressZipcode" required="required" th:value="${shippingAddress.shippingAddressZipcode}" class="form-control"/>
                        </div>
                      </div>
                    </div><a data-toggle="collapse" data-parent="#accordion" href="#paymentInfo" class="btn btn-warning pull-right">下一步</a>
                  </div>
                </div>
              </div>
              <!-- Payment Information-->
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#paymentInfo"> 2. 付款資訊</a></h4>
                </div>
                <div id="paymentInfo" th:classappend="${classActivePayment}? 'in'" class="panel-collapse collapse">
                  <div class="panel-body">
                    <table th:if="${not emptyPaymentList}" class="table">
                      <thead>
                        <tr>
                          <th>可使用的信用卡</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr th:each="userPayment : ${userPaymentList}">
                          <td th:text="${userPayment.cardName}"></td>
                          <td><a href="{/setPaymentMethod(userPaymentId=${userPayment.id})}">
                              使用
                              這個付款方式</a></td>
                        </tr>
                      </tbody>
                    </table>
                    <!-- Credit Card Information-->
                    <div class="row">
                      <div class="col-xs-12"><img th:src="@{/imgs/creditcard.png}" class="img-responsive"/><br/>
                        <div class="form-group">
                          <label for="cardType">* 選擇信用卡型態: </label>
                          <select id="cardType" name="type" th:value="${payment.type}" class="form-control">
                            <option value="visa">Visa</option>
                            <option value="mastercard">Mastercard</option>
                            <option value="discover">Discover</option>
                            <option value="amex">美國運通</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="cardHolder">* 持卡人姓名:</label>
                          <input id="cardHolder" type="text" required="required" placeholder="Card Holder Name" th:name="holderName" th:value="${payment.holderName}" class="form-control"/>
                        </div>
                        <div class="form-group">
                          <label for="cardNumber">* 信用卡卡號:</label>
                          <div class="input-group">
                            <input id="cardNumber" type="tel" required="required" placeholder="Valid Card Number" th:name="cardNumber" th:value="${payment.cardNumber}" class="form-control"/><span class="input-group-addon"><i aria-hidden="true" class="fa fa-credit-card"></i></span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-xs-7">
                        <div class="form-group">
                          <label>* Expiration Date</label>
                          <div class="row">
                            <div class="col-xs-6">
                              <select name="expiryMonth" required="required" th:value="${payment.expiryMonth}" class="form-control">
                                <option disabled="disabled">-- Month --</option>
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
                              <select name="expiryYear" th:value="${payment.expiryYear}" class="form-control">
                                <option disabled="disabled">-- Year --</option>
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
                          <input id="cardCVC" type="tel" name="cvc" placeholder="CVC" th:name="cvc" th:value="${payment.cvc}" class="form-control"/>
                        </div>
                      </div>
                    </div>
                    <!-- Billing Address-->
                    <div class="checkbox">
                      <label>
                        <input id="theSameAsShippingAddress" type="checkbox" name="billingSameAsShipping" value="true"/>與寄件地址相同
                      </label>
                    </div>
                    <div class="form-group">
                      <label for="billingName">* 姓名</label>
                      <input id="billingName" type="text" placeholder="Receiver Name" th:name="billingAddressName" required="required" th:value="${billingAddress.billingAddressName}" class="form-control billingAddress"/>
                    </div>
                    <div class="form-group">
                      <label for="billingAddress">* 帳單地址</label>
                      <input id="billingAddress" type="text" placeholder="Street Address 1" th:name="billingAddressStreet1" required="required" th:value="${billingAddress.billingAddressStreet1}" class="form-control billingAddress"/>
                      <input id="billingAddress" type="text" placeholder="Street Address 2" th:name="billingAddressStreet2" th:value="${billingAddress.billingAddressStreet2}" class="form-control billingAddress"/>
                    </div>
                    <div class="row">
                      <div class="col-xs-4">
                        <div class="form-group">
                          <label for="billingCity">* 城市</label>
                          <input id="billingCity" type="text" placeholder="Billing city" th:name="billingAddressCity" required="required" th:value="${billingAddress.billingAddressCity}" class="form-control billingAddress"/>
                        </div>
                      </div>
                      <div class="col-xs-4">
                        <div class="form-group">
                          <label for="billingState">* 國家</label>
                          <select id="billingState" th:name="billingAddressState" th:value="${billingAddress.billingAddressState}" required="required" class="form-control billingAddress">
                            <option value="" disabled="disabled">請選一個選項</option>
                            <option th:each="state : ${stateList}" th:text="${state}" th:selected="(${billingAddress.billingAddressState}==${state})"></option>
                          </select>
                        </div>
                      </div>
                      <div class="col-xs-4">
                        <div class="form-group">
                          <label for="billingZipcode">* 郵遞區號</label>
                          <input id="billingZipcode" type="text" placeholder="Billing Zipcode" th:name="billingAddressZipcode" required="required" th:value="${billingAddress.billingAddressZipcode}" class="form-control billingAddress"/>
                        </div>
                      </div>
                    </div><a data-toggle="collapse" data-parent="#accordion" href="#reviewItems" class="btn btn-warning pull-right">下一步</a>
                  </div>
                </div>
              </div>
              <!-- 3. Review Items and Shipping-->
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#reviewItems"> 3. 檢視項目與郵遞資訊</a></h4>
                </div>
                <div id="reviewItems" class="panel-collapse collapse">
                  <div class="panel-body">
                    <h4>選擇你的郵遞資訊:</h4>
                    <div class="radio">
                      <label>
                        <input type="radio" name="shippingMethod" value="groundShipping" checked="checked"/> 郵寄
                      </label>
                    </div>
                    <div class="radio">
                      <label>
                        <input type="radio" name="shippingMethod" value="premiumShipping"/> 快遞
                      </label>
                    </div>
                    <div class="row">
                      <div class="col-xs-8">
                        <h4>貨物</h4>
                      </div>
                      <div class="col-xs-2">
                        <h4>價格</h4>
                      </div>
                      <div class="col-xs-2">
                        <h4>數量</h4>
                      </div>
                    </div>
                    <!-- display products in cart-->
                    <div th:each="cartItem : ${cartItemList}" class="row">
                      <hr/>
                      <div class="col-xs-2"><a href="{/bookDetail(id=${cartItem.book.id})}"><img th:src="undefined+@{/imgs/book/}+${cartItem.book.id}+'.png'" style="width: 70px;" class="img-responsive shelf-book"/></a></div>
                      <div class="col-xs-6">
                        <div style="margin-left: 50px;"><a href="{/bookDetail?id=}+${cartItem.book.id}">
                            <h4 th:text="${cartItem.book.title}"></h4></a>
                          <p th:if="${cartItem.book.inStockNumber&gt;10}" style="color: green;">在庫存</p>
                          <p th:if="${cartItem.book.inStockNumber&lt;10 and cartItem.book.inStockNumber&gt;0}" style="color: green;">只剩<span th:text="${cartItem.book.inStockNumber}"></span>在庫存</p>
                          <c:if test="${cartItem.book.inStockNumber==0}" style="color: darkred;">商品不能選購</c:if><a href="{/shoppingCart/removeItem?id=}+${cartItem.id}">刪除</a>
                        </div>
                      </div>
                      <div class="col-xs-2">
                        <h5 style="color: #db3208; font-size: large;">$<span th:text="${cartItem.book.ourPrice}" th:style="${cartItem.book.inStockNumber}==0? 'text-decoration: line-through' : ''"></span></h5>
                      </div>
                      <div class="col-xs-2">
                        <h5 style="font-size: large;" th:text="${cartItem.qty}"></h5>
                      </div>
                    </div>
                    <hr/>
                    <h4 class="col-xs-12 text-right"><strong style="font-size: large;">總和 (<span th:text="${#lists.size(cartItemList)}"></span> 個項目):</strong><span style="color: #db3208; font-szie: large;">$<span th:text="${shoppingCart.grandTotal}"></span></span></h4><br/><br/>
                    <button type="submit" class="btn btn-warning btn-block">確定你的訂購</button>
                    <p style="font-size: smaller;">並且同意PetFriends所提供的 <a href="#">政策</a>訊息以及 <a href="#">條約</a> 使用</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
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