<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.innerOuter{ display:flex;}
	.admin-box,
	.office-box {
	  display: flex;
	  align-self: center;
	  flex-direction: column;
	  border: 1px solid black;
	  min-width: 80%;
	}
	.button-box {
	  float: right;
	}
	table {
	  margin: 32px 0;
	  min-width: 100%;
	}
	.top-imgs {
	  display: flex;
	}
	.top-imgs .img1,
	.img2 {
	  height: 300px;
	  margin: 0 10px;
	  overflow: hidden;
	}
	.below-imgs {
	  display: flex;
	  justify-content: space-between;
	  margin-top: 20px;
	}
	.img3,
	.img4,
	.img5 {
	  height: 150px;
	  margin: 0 10px;
	}
	.office-imgs img {
	  height: 100%;
	}
	
	.line1,
	.line2,
	.line3,
	.line4 {
	  display: flex;
	  justify-content: space-between;
	}
	.line1 ul,
	.line2 ul,
	.line3 ul {
	  list-style-type: none;
	  margin: 10px;
	  padding: 0;
	  width: 100%;
	}
	.office-content ul li input {
	  width: 100%;
	  height: 30px;
	}
	.linecheck1,
	.linecheck2,
	.linecheck3 {
	  display: flex;
	  justify-content: space-around;
	  text-align: center;
	  padding: 0;
	  margin: 10px 0;
	}
	.office-content input[type="checkbox"] {
	  margin: 0 5px;
	}
	.button-box{
        margin-right: 10px;
    }
    .button-box button{
        margin:5px;
    }
    .button-box button[type=submit]{
        background-color: #eb3e3e;
        border:none;
        border-radius: 3px;
        color:#ffff;
        height: 40px;
        width: 120px;
    }
    .button-box button[type=button]{
        background-color: #ffff;
        border:1.5px solid #eb3e3e;
        border-radius: 3px;
        height: 40px;
        width: 120px;
        color:#eb3e3e;
    }
</style>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="innerOuter">
        <nav class="nav flex-column">
            <a class="nav-link active" href="#">Active</a>
            <a class="nav-link" href="#">Link</a>
            <a class="nav-link" href="#">Link</a>
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </nav>
        <div class="office-box">
            <form class="amdin" action="" method="post">
                <div class="office-title">
                    <h1>${ o.typeName}</h1>
                </div>
                <hr>
                <div class="office-imgs">
                    <div class="top-imgs">
                        <div class="img1"><img src="resources/images/result-1.jpg" alt=""></div>
                        <div class="img2"><img src="resources/images/result-2.jpg" alt=""></div>
                    </div>
                    <div class="below-imgs">
                        <div class="img3"><img src="resources/images/result-3.jpg" alt="" srcset=""></div>
                        <div class="img4"><img src="resources/images/DEDICATED_DESK_01.jpg" alt="" srcset=""></div>
                        <div class="img5"><img src="resources/images/desc-3.jpg" alt="" srcset=""></div>
                    </div>
                </div>
                <hr>
                <div class="office-title">
                    <h2>세부내역</h2>
                </div>
                <div class="office-content">
                    <div class="line1">
                        <ul>
                            <li>오피스번호</li>
                            <li><input type="text" name="officeNo" value="${ o.officeNo }"></li>
                        </ul>
                        <ul>
                            <li>오피스타입</li>
                            <li><input type="text" name="officeType" value="${ o.typeName }"></li>
                        </ul>    
                    </div>
                    <div class="line2">
                        <ul>
                            <li>가격</li>
                            <li><input type="text" name="price" value="${ o.price }"></li>
                        </ul>
                        <ul>
                            <li>매니저</li>
                            <li><input type="text" name="manager" value="${ o.manager }"></li>
                        </ul>
                    </div>
                    <div class="line3">
                        <ul>
                            <li>주소</li>
                            <li><input type="text" name="address" value="${ o.address }"></li>
                        </ul>
                    </div>
                </div>
                <hr>
                <div class="facility-box">
                    <div class="office-title">
                        <h2>시설정보</h2>
                    </div>
                    <div class="office-content">
                        <div class="linecheck1">
                            <label for="">
                                <input type="checkbox" name="wifi" value="와이파이">인터넷
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="print" value="프린트">프린터
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="pantry" value="팬트리">팬트리
                            </label>
                            
                        </div>
                        <div class="linecheck2">
                            <label for="">
                                <input type="checkbox" name="conference" value="회의실">회의실
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="parking" value="주차">주차
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="stationery" value="사무기기">사무기기
                            </label>
                            
                        </div>
                        <div class="linecheck2">
                            <label for="">
                                <input type="checkbox" name="air" value="냉/난방시설">냉난방
                            </label>
                            <label for="">
                                <input type="checkbox" name="cleaning" value="위생">위생
                            </label>
                            <label for="">
                                <input type="checkbox" name="manager" value="매니저">매니저
                            </label>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="button-box">
                    <button type="submit">작성하기</button>
                    <button type="button">수정하기</button>
                </div>
            </form>
        </div>
    </div>
<jsp:include page="../common/footer.jsp"/>
<script>
	$(function(){
		var facility = "${ o.facility }";
		var facilityArr = facility.split(", ");
		$("input:checkbox").each(function(index, e){
			if(facilityArr.indexOf($(this).val()) != -1){
				$(this).attr("checked", true);
			}
		})
	})
</script>
</body>
</html>