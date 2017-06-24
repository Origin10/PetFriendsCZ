<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
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
        <div class="row">
          <div class="col-xs-8">
            <h2 class="section-headline"><span>User Account</span></h2>
          </div>
          <div class="col-xs-4"><a href="index.html"><img src="/imgs/logo.png" class="img-responsive"/></a></div>
        </div>
        <hr style="position: absolute; width:100%; height:6px; background-color: #333; z-index: -1; margin-top: -80px;"/><img src="/imgs/wood.png" style="margin-top: -75px;" class="img-responsive"/>
      </div>
      <div style="margin-top: 120px;" class="row">
        <div class="col-xs-9 col-xs-offset-3">
          <div class="hd">
            <div>
              <h2 class="title">商城買家常見問題：付款須知</h2>
              <div class="bd"><br/>
                <script language="JavaScript" type="text/javascript"></script>
                <div align="right">
                  <form id="change_uri" name="change_uri"><font face="微軟正黑體">其他商城買家常見問題：
                      <select name="to_uri" onchange="RefreshCode(this.form)" style="vertical-align:middle">
                        <option value="">請選擇</option>
                        <option value="buy_1.html">購物流程</option>
                        <option value="buy_2.html">購物優惠</option>
                        <option value="buy_3.html">付款須知</option>
                        <option value="buy_4.html">查詢訂單-取消/出貨/退換貨</option>
                        <option value="buy_5.html">發票問題</option>
                        <option value="buy_6.html">售後服務</option>
                        <option value="buy_7.html">超贈點常見問題</option>
                      </select></font></form>
                </div>
                <div class="bd">
                  <ul>
                    <li><a href="#1-1">ATM轉帳後需要將收據回傳嗎?</a></li>
                    <li><a href="#1-2">ATM轉帳帳號弄丟了，或是ATM繳款期限已過了該怎麼辦?</a></li>
                    <li><a href="#1-3">為何我在ATM轉帳無法成功?</a></li>
                    <li><a href="#1-4">如何知道我是否付款成功了呢? 付款完成後多久可以查到?</a></li>
                    <li><a href="#1-5">在訂購完成後，我還可以更改成別種的付款方式嗎?</a></li>
                    <li><a href="#1-6">為何信用卡刷不過?</a></li>
                    <li><a href="#1-7">請問可以將信用卡一次付清更改成分期付款嗎?</a></li>
                    <li><a href="#1-8">分期付款每期付款金額怎麼計算?</a></li>
                    <li><a href="#1-9">我選擇的是分期付款的方式，為什麼銀行簡訊通知的卻是總金額?</a></li>
                    <li><a href="#1-10">請問線上分期付款的授權和額度如何計算?</a></li>
                    <li><a href="#1-11">商品未送達，信用卡帳單來了怎辦？需先繳款嗎?</a></li>
                    <li><a href="#1-12">分期付款的信用卡已到期，銀行發新卡給我，卡號不一樣怎麼辦?</a></li>
                    <!--
                    <li><a href="#1-13">信用卡付款的手續費如何計算?</a></li>
                    未送達，信用卡帳單來了怎辦？需先繳款嗎?</a></li>
                    -->
                    <li><a href="#1-14">可否使用外國卡 / VISA 金融卡?</a></li>
                  </ul><br/>
                  <!-- modified-->
                  <h3><a name="1-1"></a>ATM轉帳後需要將收據回傳嗎?</h3>
                  <p>不用，您無需再回傳收據，由於轉帳帳號是依訂單所產生，一個帳號只會對應一筆訂單，我們將會依照轉入帳號與銀行進行核帳！但建議您可將轉帳明細單收妥以便日後需要時的核對！</p>
                  <p><br/></p>
                  <!-- -->
                  <h3><a name="1-2"></a>ATM轉帳帳號弄丟了，或是ATM繳款期限已過了該怎麼辦?</h3>
                  <p>在您完成訂購程序時，系統會自動寄發一封訂購通知函到您指定的 E-mail 信箱，若您未收到此信或是忘記了，請您至網頁上方的「訂單查詢」的”訂單明細”中查詢該筆訂單的轉帳資料。</p>
                  <p>由於轉帳帳號為虛擬帳號，一旦過了繳費期限，該帳號就不再存在，該筆訂單亦會自動取消。若是逾期未繳款，煩請您重新訂購，系統會再次給您一組新的轉帳帳號和新的繳款期限。</p>
                  <p>再次提醒您，請您儘量在繳費期限內完成轉帳，以免您心愛的商品剛好售完，無法訂購。</p>
                  <p><br/></p>
                  <h3><a name="1-3"></a>為何我在ATM轉帳無法成功?</h3>
                  <p>可能有以下情況，麻煩請您先確認一下:</p>
                  <p>1. 您至提款機操作時，必需正確輸入該組帳號及正確轉帳金額，一旦帳號或金額有任何一個輸入錯誤，直接就變成無法轉帳交易失敗。<br/> 範例如下： 轉入銀行代號：013 轉入帳號請輸入本網站為您所特別準備的帳號<br/> 2. 請您確認您的金融卡是否具有轉帳或跨行轉帳的功能。<br/> 3. 建議您可更換其他台提款機，或有可能是銀行端連線發生問題。<br/> 詳細操作方式請見ATM轉帳付款說明。<br/> 4. 若您的訂單金額超過三萬元，而ATM機器無法跨行轉帳時，可能是因ATM機台介面不同而無法轉帳成功，建議您可改選「轉帳繳費」功能即可。</p>
                  <p><br/></p>
                  <h3><a name="1-4"></a>如何知道我是否付款成功了呢? 付款完成後多久可以查到?</h3>
                  <p>請您至網頁上方的「訂單查詢」的”訂單明細”中查詢所訂購商品的狀況。若已付款成功在訂單狀態會出現”付款成功”。 </p>
                  <p>信用卡付款完成訂購後即可至網頁上方的「訂單查詢」的”訂單狀態”中查詢。</p>
                  <p>若是ATM轉帳，可於轉帳後30分鐘至網頁上方的「訂單查詢」的”訂單狀態”中查詢。若您是在週五～週日付款，配合銀行的作業時間，請您於週一下午再查詢。 </p>
                  <p><br/></p>
                  <h3><a name="1-5"></a>在訂購完成後，我還可以更改成別的付款方式嗎?</h3>
                  <p>由於不同付款方式是採用不同的作業系統，且受限於銀行規定，目前尚未提供您直接更改付款方式的服務。</p>
                  <p>如您需要更改付款方式或數量，請您取消訂單重新訂購，謝謝。</p>
                  <p><br/></p>
                  <h3><a name="1-6"></a>為何信用卡刷不過?</h3>
                  <p>若您的信用卡資料與信用卡中心確認後有錯誤，超級商城客服人員將會主動與您連絡再次確認資料。</p>
                  <p>通常信用卡刷不過可能是以下原因： 1. 超出信用卡使用額度或餘額不足，請更換其他信用卡，或選擇其他付款方式<br/> 2. 單筆刷卡金額超過發卡銀行允許的"單筆授權上限"，建議您聯絡發卡銀行，告知需要臨時調高單筆授權金額，再繼續訂購<br/> 3. 網路連線壅塞，無法與銀行連線確認，請稍後再試即可。</p>
                  <p><br/></p>
                  <h3><a name="1-7"></a>請問可以將信用卡一次付清更改成分期付款嗎?</h3>
                  <p>訂單成立後不能更改付款方式。即使同樣是刷卡，一次付清和分期付款視為不同的付款方式，一次付清後不能改分期。</p>
                  <p><br/></p>
                  <h3><a name="1-8"></a>分期付款每期付款金額怎麼計算?</h3>
                  <p>將依您選擇的分期數平均每期付款，不足額部分併入第1期計算。<br/> 如商品總額是1000元，您選擇12期分期付款，每期付款金額為第1期是87元，第2-12期是83元。<br/> 發卡銀行如有特殊計算方式則以銀行說明為主，建議您可與持卡行聯繫確認。</p>
                  <p>請注意，花旗銀行有特殊計算方式：<br/> 花旗銀行的分期收款方式是依訂購總金額除以您選擇的分期期數，不足額部分將四捨五入計算。<br/> 如商品總額是1000元，您選擇6期分期付款，1000/6=166.66，四捨五入後，每期付款金額是167元。<br/> 如商品總額是500元，您選擇6期分期付款，500/6=83.33，四捨五入後，每期付款金額是83元。</p>
                  <p><br/></p>
                  <h3><a name="1-9"></a>我選擇的是分期付款的方式，為什麼銀行簡訊通知的卻是總金額?</h3>
                  <p>銀行的授權額度計算是以訂購商品總金額，而非單筆分期金額，同時為確保您的用卡安全性，故銀行端的簡訊內容是通知您核對消費總金額。不過，請您放心，信用卡帳單仍會是以分期的方式計算。</p>
                  <p><br/></p>
                  <h3><a name="1-10"></a>請問線上分期付款的授權和額度如何計算?</h3>
                  <p>在您使用分期付款時，銀行將會確認您的信用卡額度是否高於以商品總額，故請您在訂購前先確認信用卡的額度是高於商品總額，否則會訂購不成功。</p>
                  <p>至於您繳款時，是由銀行逐月在信用卡帳單向您收取，如您選擇分六期則會是分六個月逐月入帳。</p>
                  <p><br/></p>
                  <h3><a name="1-11"></a>商品未送達，信用卡帳單來了怎辦？需先繳款嗎?</h3>
                  <p>信用卡付款必須先獲得銀行授權准予請款，店家才會出貨。若您尚未收到貨，但已收到信用卡帳單，請依帳單所示的期限先行繳款。</p>
                  <p><br/></p>
                  <h3><a name="1-12"></a>分期付款的信用卡已到期，銀行發新卡給我，卡號不一樣怎麼辦?</h3>
                  <p>由於您的分期付款是由您的信用卡銀行為您辦理，若您已更換新卡號，請您協助向信用卡銀行確認。</p>
                  <p><br/></p>
                  <h3><a name="1-14"></a>可否使用外國卡 / VISA 金融卡?</h3>
                  <p>很抱歉，目前本網站暫不接受外國卡 / Debit卡 / Visa 金融卡消費。</p>
                  <p>若您仍需訂購產品，請您改用其他信用卡或其他付款方式付款。</p>
                  <p>造成不便之處請見諒。</p>
                  <p><br/></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div><br/><br/>
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