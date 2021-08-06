<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- flatpickr -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_red.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
   * {
      box-sizing: border-box;
    }
    .outcontainer {
      display:flex;
      margin:0 auto;
      width: 70%;
      z-index: 1;
    }
    .bcontainer {
      position: relative !important;
      width: 50% !important;
      margin-left: 0% !important;
      margin-right: 0% !important;
    }
    .btitle {
      padding-top:32px;
      padding-bottom: 32px;
      display: flex;
      align-items: center;
    }
    .backto {
      width: 48px;
      height: 48px;
      border-radius: 50%;
      margin-right: 32px;
      align-items: center;
      position: relative;
    }
    .backto:hover {
      background-color: #f7f7f7;
      cursor: pointer;
    }
    .backto i {
      color: rgb(34, 34, 34);
      position: absolute;
      top: 35%;
      left: 35%;
    }
    .date-section {
      padding-top: 24px;
      padding-bottom: 24px;
    }
    .date-content,
    .person-content {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .date-title {
      font-weight: 800;
    }
    .date-content button,
    .person-content button {
      border: none;
      background-color: #ffff;
      font-size: 16px;
      font-weight: 600;
      text-decoration: underline;
    }
    .person-content {
      padding-bottom: 24px;
    }
    .border {
      border-top: solid 1px rgb(221, 221, 221);
      margin: 24px 0;
    }
    .payment-section {
      margin-top: 32px;
    }
    .payment-section ul {
      padding: 0;
    }
    .payment-section ul li {
      display: flex;
      list-style: none;
      padding: 1.5rem;
      align-items: center;
    }
    .payment-section input[type="radio"] {
      width: 24px;
      height: 24px;
    }

    .payment-section i {
      font-size: 30px;
    }
    .paylogo {
      margin-left: 1rem;
    }
    .payname {
      margin-left: 1rem;
    }
    .mandatory-section {
      margin-top: 24px;
    }
    .phone input {
      border: 1px solid rgb(176, 176, 176);
      height: 64px;
      width: 100%;
      border-radius: 8px;
    }
    .ask textarea {
      border: 1px solid rgb(176, 176, 176);
      width: 100%;
      height: 100px;
      border-radius: 8px;
    }
    .phone,
    .ask {
      margin-bottom: 24px;
    }
    .button-box {
      margin-top: 24px;
      margin-bottom: 24px;
    }
    .button-box button {
      border-radius: 8px;
      padding: 14px 24px;
      font-size: 16px;
      font-weight: 600;
      background-color: #eb3e3e;
      color: #ffff;
      border: none;
    }
    .sum-section {
      position: relative;
      width: 41.6667%;
      margin-left: 8.33333%;
      margin-right: 0%;
      z-index: 1;
      padding-top:32px;
    }
    .sum-float {
      display: flex;
      flex-direction: column;
      position: sticky;
      top: 80px !important;
      width: 100%;
      border: 1px solid rgb(176, 176, 176);
      border-radius: 8px;
      z-index: 1;
    }
    .sum-top {
      display: flex;
      justify-content: space-between;
      padding: 24px;
    }
    .office-img img{
      width: 124px;
      height: 106px;
      border-radius: 8px;
      border: 1px solid black;
      margin-right: 10px;
    }
    .office-desc {
      font-size: 14px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      /* margin-bottom: 24px; */
    }
    .sum-detail {
      padding: 24px;
    }
    .receipt {
      margin-top: 24px;
    }
    .receipt-day{display:flex}
    .receipt,
    .fee,
    .total {
      display: flex;
      justify-content: space-between;
      margin-bottom: 16px;
    }
    .total {
      font-weight: 800;
    }
    /* 인원수 선택 */
    .box {
      display: flex;
      flex-direction: column;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      padding: 16px 32px;
      border-radius: 32px;
      background-color: rgb(255, 255, 255);
      width: 330px;
      overflow: hidden;
    }
    .box i {
      font-size: 16px;
      padding-bottom: 16px;
    }
    .pselect {
      display: flex;
      justify-content: space-between;
    }
    .text {
      font-size: 14px;
    }
    .stp {
      display: flex;
      justify-content: space-between;
      width: 110px;
      height: 32px;
      align-self: center;
    }
    .stp .circle {
      display: inline-flex;
      border-radius: 50%;
      border: 1px solid rgb(176, 176, 176) !important;
      width: 32px;
      height: 32px;
      justify-content: center;
      color: rgb(113, 113, 113);
      background-color: transparent;
      align-items: center;
    }
    .howmany input {
      border: none;
      border-radius: 50%;
      width: 32px;
      height: 32px;
      text-align: center;
      justify-content: center;
      font-weight: 400;
      color: rgb(34, 34, 34);
    }
    #person-modal {
      display: none;
      background-color: rgba(0, 0, 0, 0.5);
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
    }
    .show-modal {
      display: block !important;
      z-index: 2;
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="outcontainer">
      <div class="bcontainer">
        <form action="submitBook.bk" method="post">
          <div class="btitle">
            <div class="backto">
              <i class="fas fa-chevron-left"></i>
            </div>
            <h1>예약요청하기</h1>
          </div>
          <div class="bcontent">
            <h2>예약정보</h2>
            <input type="hidden" name="officeNo" value="${ o.officeNo }">
            <div class="date-section">
              <div class="date-title">
                <h3>날짜</h3>
              </div>
              <div class="date-content">
                <div class="dateprint" id="dates"></div>
                <input type="hidden" id="sd" name="startDate">
				<input type="hidden" id="ed" name="endDate">                
                <button class="editdate" type="button">수정</button>
              </div>
            </div>
            <div class="person-section">
              <div class="person-title">
                <h3>인원</h3>
              </div>
              <div class="person-content">
                <div class="personprint">${ o.person }명</div>
                <input type="hidden" name="person" value="${ o.person }">
                <button class="editperson" type="button">수정</button>
              </div>
            </div>
            <div class="border"></div>
            <h2>결제 수단 선택</h2>
            <div class="payment-section">
              <ul>
                <li>
                  <input type="radio" name="pay" id="kakao" /><img
                    class="paylogo"
                    src="resources/images/payment_icon_yellow_small.png"
                  />
                  <div class="payname">카카오페이</div>
                </li>
                <li>
                  <input type="radio" name="pay" id="card" /><i
                    class="far fa-credit-card paylogo"
                  ></i>
                  <div class="payname">신용카드</div>
                </li>
                <li>
                  <input type="radio" name="pay" id="npay" /><img
                    class="paylogo"
                    src="resources/images/npay.png"
                  />
                  <div class="payname">네이버페이</div>
                </li>
              </ul>
            </div>
            <div class="border"></div>
            <h2>필수 입력 정보</h2>
            <div class="mandatory-section">
              <div class="phone">
                <h3>전화번호</h3>
                <input type="text" name="phone"/>
              </div>
              <div class="ask">
                <h3>요청사항</h3>
                <textarea name="bAsk" rows="3"></textarea>
              </div>
            </div>
            <div class="border"></div>
            <h2>환불 정책</h2>
            <div class="refund-section">
              <span
                >멤버십 및 공용 데스크 멤버십의 경우 멤버는 당월 말까지 언제든지
                취소할 수 있습니다.</span
              >
            </div>
          </div>
          <div class="button-box">
          <c:choose>
	          <c:when test="${loginUser ne null }">
	          	<button id="settle" type="button">예약 요청하기</button>
	          </c:when>
	          <c:otherwise>
	         	<button id="return" type="button"><a href="${ pageContext.request.contextPath }">예약 요청하기</a></button>
	          </c:otherwise>
          </c:choose>

            
          </div>
          <input type="hidden" id="priceInput" name="price" value="${ o.price }">
          <input type="hidden" id="totalInput" name="total" value="${ o.price }">
        </form>
      </div>
      <div class="sum-section">
        <div class="sum-float">
          <div class="sum-top">
            <div class="office-img"><img src="${ o.offImgPath }"/></div>
            <div class="office-desc">
              <div class="office-type">${ o.typeName } ${o.person }인</div>
              <div class="office-address">${ o.address }</div>
            </div>
          </div>
          <div class="border"></div>
          <div class="sum-detail">
            <h2>요금 세부 정보</h2>
            <div class="receipt">
              <div class="receipt-day">￦${ o.price } x <div class="days"></div></div>
              <div class="receipt-price" id="receipt-price">￦80,000</div>
            </div>
            <div class="fee">
              <div class="fee-title">서비스 수수료</div>
              <div class="fee-price">￦${ o.price * 0.1 }</div>
            </div>
            <div class="total">
              <div class="total-title">총 합계(KRW)</div>
              <div class="total-price" id="total-price">￦88,000</div>
            </div>
          </div>
        </div>
      </div>
      <!-- 인원수 선택 -->
      <div id="person-modal">
        <div class="box">
          <div class="close"><i class="fas fa-times"></i></div>
          <div class="pselect">
            <div class="text">
              <div class="tt">성인</div>
              <div class="tdesc">만 13세 이상</div>
            </div>
            <div class="stp">
              <button type="button" class="circle" onclick="minus();">
                <span>-</span>
              </button>
              <div id="pp2" class="howmany">
                <input type="text" id="num1" value="${ o.person }" />
              </div>
              <button type="button" class="circle" onclick="plus();">
                <span>+</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
<jsp:include page="../common/footer.jsp"/>

    <script>
    
    $("#return").on("click", function(){
    	window.alert("로그인이 필요한 서비스 입니다");
    })
    
    <%-- 결제 방식 선택 --%>
	 $("#settle").on("click", function(){
		 if($("#card").prop("checked")){
			 console.log("sss");
			 requestPay();
		 }
	  })
	  
	IMP.init("imp00193045");
	 
   function requestPay() {
       IMP.request_pay(
           {
               pg: "html5_inicis", //ActiveX 결제창은 inicis를 사용
               pay_method: "card", //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
               merchant_uid: "merchant_" + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
               name: "주문명:결제테스트",
               amount: 100,
               buyer_email: "dev.likeimfive@gmail.com",
               buyer_name: "최빛나",
               buyer_tel: "010-8728-9254", //누락되면 이니시스 결제창에서 오류
               buyer_addr: "서울특별시 강남구 삼성동",
               buyer_postcode: "123-456",
           },
           function (rsp) {
               if (rsp.success) {
                   //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                   jQuery
                       .ajax({
                           url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                           type: "POST",
                           dataType: "json",
                           data: {
                               imp_uid: rsp.imp_uid,
                               //기타 필요한 데이터가 있으면 추가 전달

                           },
                           //결제위변조검증기능추가??
                       })
                       .done(function (data) {
                           //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                           if (everythings_fine) {
                               var msg = "결제가 완료되었습니다.";
                               msg += "\n고유ID : " + rsp.imp_uid;
                               msg +=
                                   "\n상점 거래ID : " +
                                   rsp.merchant_uid;
                               msg +=
                                   "\n결제 금액 : " + rsp.paid_amount;
                               msg +=
                                   "카드 승인번호 : " + rsp.apply_num;

                               alert(msg);
                           } else {
                               //[3] 아직 제대로 결제가 되지 않았습니다.
                               //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                           }
                       });
                   $("form").submit(); 
               } else {
                   var msg = "결제에 실패하였습니다.";
                   msg += "에러내용 : " + rsp.error_msg;

                   alert(msg);
               }
           }
       );
   }
    <%-- 로컬스토리지에서 날짜 가져오기 --%>
    //var startDate = localStorage.getItem("startDate");
    //var endDate = localStorage.getItem("endDate");

    //console.log("로컬start"+localStorage.getItem("startDate"));
    //console.log("로컬end"+localStorage.getItem("endDate"));
    var startDate = "${startDate}";
    var endDate = "${endDate}";
    //console.log("start"+startDate);
    //console.log("end"+endDate);
    $.when($.ready).then(function(){
    	$(".dateprint").html(startDate+" ~ "+endDate);
    	
        <%-- 날짜 값 컨트롤러에 넘기기 --%>
        var dates = $(".dateprint")[0].innerHTML.split(" ~ ");
       $("#sd").val(dates[0]);
       $("#ed").val(dates[1]);

        <%-- 날짜 계산 --%>
        var day1 =  $("#sd").val(dates[0]).val().substring(8);
        var day2 =  $("#ed").val(dates[1]).val().substring(8);
        console.log(day2-day1);
        
        $(".days").html((day2-day1)+"박");
        
        <%-- receiptPrice --%>
        $(".receipt-price").html("￦" + ${o.price} * (day2-day1));
        $("#priceInput").val(${o.price} * (day2-day1));
        
        <%-- feePrice --%>
        $(".fee-price").html("￦" + (${o.price} * (day2-day1)) * 0.1);
        
        <%-- totalPrice --%>
        $(".total-price").html("￦" + (${o.price} * (day2-day1) + (${o.price} * (day2-day1)) * 0.1));
        $("#totalInput").val((${o.price} * (day2-day1) + (${o.price} * (day2-day1)) * 0.1));


      	//  $(".total-price").html("글씨출력");
      	//  $("totalInput").val("input에값넣어줌");



    });
    
    <%-- 로컬스토리지 삭제하기 --%>
    $("button[type=submit]").on("change", function(){
    	localStorage.removeItem("startDate");
    	localStorage.removeItem("endDate");
    });
            
    const editdate = document.querySelector('.editdate');
	  flatpickr(editdate ,{
          locale: "ko",
          mode: "range",
          dateFormat: "Y F d\\일",
          minDate: "today",
          dateFormat: "Y-m-d",
          disable: [<%-- 예약된 날짜들 받아오기 jstl--%>
              {
                from: "2021-08-01",
                to: "2021-08-04",
              },
              {
                from: "2021-08-15",
                to: "2021-08-17",
              },
            ],
          onChange: function (selectedDates, dateStr, instance) {
            $(".dateprint").html(dateStr);
            <%-- 날짜 값 컨트롤러에 넘기기 --%>
            var dates = $(".dateprint")[0].innerHTML.split(" ~ ");
           $("#sd").val(dates[0]);
           $("#ed").val(dates[1]);
           
           <%-- 날짜 계산 --%>
           var day1 =  $("#sd").val(dates[0]).val().substring(8);
           var day2 =  $("#ed").val(dates[1]).val().substring(8);
           console.log(day2-day1);
           
           $(".days").html((day2-day1)+"박");
           
           <%-- receiptPrice --%>
           $(".receipt-price").html("￦" + ${o.price} * (day2-day1));
           $("#priceInput").val(${o.price} * (day2-day1));
           
           <%-- feePrice --%>
           $(".fee-price").html("￦" + (${o.price} * (day2-day1)) * 0.1);
           
           <%-- totalPrice --%>
           $(".total-price").html("￦" + (${o.price} * (day2-day1) + (${o.price} * (day2-day1)) * 0.1));
           $("#totalInput").val((${o.price} * (day2-day1) + (${o.price} * (day2-day1)) * 0.1));
          },
          clickOpens: true
	  });
	  
      $(function(){

    	 <%-- 
        $(".editdate").flatpickr({
          locale: "ko",
          mode: "range",
          dateFormat: "Y F d\\일",
          minDate: "today",
          dateFormat: "Y-m-d",
          onChange: function (selectedDates, dateStr, instance) {
            $(".dateprint").text(dateStr);
          },
          clickOpens: true
        });
    	  --%> 
    	  
        $(".close").on("click", function () {
              $("#person-modal").removeClass("show-modal");
           });
          
        $(".editperson").click(function(){
          $("#person-modal").toggleClass("show-modal");
        });
      });
      const pmodal = document.querySelector("#person-modal"); //인원수 모달
      let pp = document.querySelector(".personprint"); //인원수 input
      let pp2 = document.querySelector("#num1");
      const box = document.querySelector(".box");
      const mbtn = document.querySelector(".circle");

      document.querySelector('.backto').addEventListener('click', () => {
    	  history.back();
    	});
      
      function minus() {
        if (pp2.value > 0) {
          pp2.value = Number(pp2.value) - 1;
          let result = pp2.value;
          pp.innerHTML = result + " 명";
          $("input[name=person]").val(result);
        }
      }
      
      function plus(){
        pp2.value = Number(pp2.value) + 1;
        let result = pp2.value;
        pp.innerHTML = result + " 명";
        $("input[name=person]").val(result);
      }

      window.onclick = (e) => {
        e.target === pmodal ? pmodal.classList.remove("show-modal") : false;
      };
      
    </script>
</body>
</html>