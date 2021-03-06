<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- daum address -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
<%-- aside --%>
	aside{
            float: left;
            margin-right: 50px;
        }
	.aside-title{
            padding: 30px 10px;
        }
	aside ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 130px;
        }
	aside li{
            border: 1px lightgray solid;
        }

	aside li a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
            text-align: center;
        }

	aside li a.active {
            background-color: rgb(220, 53, 69);
            color: white;
            text-decoration: none;
        }

	aside li a:hover:not(.active) {
            background-color: rgb(220, 53, 69);
            color: white;
            text-decoration: none;
        }
        
	.innerOuter{ display:flex;}
	.admin-box,
	.office-box {
	  display: flex;
	  align-self: center;
	  flex-direction: column;
	  border: 1px solid rgb(134,134,134);
	  margin:30px 0 60px 0;
	  min-width: 80%;
	}
	.button-box {
	  float: right;
	}
	table {
	  margin: 32px 0;
	  min-width: 100%;
	}
	.top-img {
	  display: flex;
      justify-content: center;
	}
	.top-img .img1{
	height: 220px;
    width: 400px;
	overflow: hidden;
	}
	.below-imgs {
	  display: flex;
	  justify-content: space-around;
	  margin-top: 20px;
	}
	.img2 {
	  height:100px;
      width:160px;
	  margin: 0 10px;
	  border: 1px solid rgb(221,221,221);
      border-radius: 8px;
	}
	.office-imgs img {
    border: 1px solid rgb(221,221,221);
    border-radius: 8px;
    height: 100%;
    width: 100%;
    object-fit: cover;
    object-position:50% 50%;
	}
	
	.line1,	.line2,	.line3,	.line4 {
	display: flex;
	justify-content: space-evenly;
	}
	.line1 ul,	.line2 ul, .line3 ul {
	list-style-type: none;
	margin: 10px;
	padding: 0;
	width: 100%;
	}
    .office-content option, .office-content select{
        border: 1px solid rgb(221,221,221);
        border-radius: 8px;
        width:100%;
        height: 30px;
    }
	.office-content ul li input {
	width: 100%;
	height: 30px;
    border: 1px solid rgb(221,221,221);
    border-radius: 8px;
	}
	.linecheck1,.linecheck2,.linecheck3 {
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
    .line3 input{
    	margin:5px 0;
    }
    .address1{display:flex;}
	.address1 input[type=button]{width:30%}
	.address1 input[type=text]{margin-right:5px;}
	.office-title{display:flex; align-items:center;}
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
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="innerOuter">
    
	    <div class="sideBar">
	        <div class="aside-title">
	        	<h3>????????????</h3>
	        </div>
		    <aside>
		        <ul>
		            <li><a href="member.ad">????????????</a></li>
		            <li><a href="board.ad">???????????????</a></li>
		            <li><a href="customer.ad">????????????</a></li>
		            <li><a href="donation.ad">????????????</a></li>
		            <li><a href="list.bk">??????????????????</a></li>
		            <li><a href="space.bo">??????????????????</a></li>
		        </ul>
		    </aside>
	    </div>
    
        <div class="office-box">
            <form class="updateOffice" action="updateOf.bk" method="post" enctype="multipart/form-data">
                <div class="office-title">
                <div class="backto">
	              <i class="fas fa-chevron-left"></i>
	            </div>
                    <h1>${ o.typeName } ${ o.person }</h1>
                </div>
                <hr>
               
                <div class="office-imgs">
                    <div class="top-img">
                        <div class="img1"><img id="img1" name="offImgPath" src="${o.offImgPath}"></div>
                        <input type="hidden" name="offImgPath" value="${ o.offImgPath }">
                    </div>
                    <div class="below-imgs">

						<c:forEach var="i" begin="0" end="3">
							<c:choose>
						      <c:when test="${ i<fn:length(list) }">
						         <div class="img2">
						            <img id="img${i+2}" src="${ list[i].filePath }">
						         </div>
						         <input type="hidden" name="atlist[${i}].fileNo" value="${ list[i].fileNo }">
						         <input type="hidden" name="atlist[${i}].filePath" value="${ list[i].filePath }">
						         <input type="hidden" name="atlist[${i}].status" value="${ list[i].status }">
						      </c:when>
						      <c:otherwise>
						         <div class="img2">
						            <img id="img${i+2}"><input type="hidden" name="atlist[${i}].filePath" value="0">
						            <input type="hidden" name="atlist[${i}].fileNo" value="0">
						         </div>
						      </c:otherwise>
						    </c:choose>        
						 </c:forEach>
                    </div>    
                </div>

               	<div id="file-area">
                	<input type="file" id="file1" name="refileTop" onchange="loadImg(this, 1);">
                	<input type="file" id="file2" name="refile" onchange="loadImg(this, 2);">
                	<input type="file" id="file3" name="refile" onchange="loadImg(this, 3);">
                	<input type="file" id="file4" name="refile" onchange="loadImg(this, 4);">
                	<input type="file" id="file5" name="refile" onchange="loadImg(this, 5);">
                </div>
                <hr>
                <div class="office-title">
                    <h2>????????????</h2>
                </div>
                <div class="office-content">
                    <div class="line1">
                        <ul>
                            <li>???????????????</li>
                            <li><input type="text" name="officeNo" value="${ o.officeNo }"></li>
                        </ul>
                        <ul>
                            <li>???????????????</li>
                            <li>
                                <select name="typeName" id="typeName">
                                    <option value="????????????">????????????</option>
                                    <option value="?????? ?????????">?????? ?????????</option>
                                    <option value="?????? ?????????">?????? ?????????</option>
                                </select>
                            </li>
                        </ul>
                        <ul>
                            <li>????????????</li>
                            <li>
                                <select name="person" id="person">
                                    <option value="1">1 ???</option>
                                    <option value="2">2 ???</option>
                                    <option value="3">3 ???</option>
                                    <option value="4">4 ???</option>
                                    <option value="5">5 ?????????</option>
                                </select>
                            </li>
                        </ul>    
                    </div>
                    <div class="line2">
                        <ul>
                            <li>??????</li>
                            <li><input type="text" name="branch" value="${ o.branch }"></li>
                        </ul>
                        <ul>
                            <li>??????</li>
                            <li><input type="text" name="price" value="${ o.price }"></li>
                        </ul>
                        <ul>
                            <li>?????????</li>
                            <li><input type="text" name="manager" value="${ o.manager }"></li>
                        </ul>
                    </div>
                    <div class="line3">
                        <ul>
                            <li>??????</li>
                            <li><input type="text" name="address" value="${ o.address }"></li>
                        </ul>
                    </div>
                </div>
                <hr>
                <div class="facility-box">
                    <div class="office-title">
                        <h2>????????????</h2>
                    </div>
                    <div class="office-content">
                        <div class="linecheck1">
                            <label for="">
                                <input type="checkbox" name="facility" value="????????????">?????????
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="facility" value="?????????">?????????
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="facility" value="?????????">?????????
                            </label>
                            
                        </div>
                        <div class="linecheck2">
                            <label for="">
                                <input type="checkbox" name="facility" value="?????????">?????????
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="facility" value="??????">??????
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="facility" value="????????????">????????????
                            </label>
                            
                        </div>
                        <div class="linecheck2">
                            <label for="">
                                <input type="checkbox" name="facility" value="???/????????????">?????????
                            </label>
                            <label for="">
                                <input type="checkbox" name="facility" value="??????">??????
                            </label>
                            <label for="">
                                <input type="checkbox" name="facility" value="?????????">?????????
                            </label>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="button-box">
                    <button type="submit">????????????</button>
                    <button type="button" onclick="deleteOf();">????????????</button>
                </div>
            </form>
        </div>
    </div>
<jsp:include page="../common/footer.jsp"/>
<script>
	function deleteOf(){
		console.log("!!");
		$("form").attr("action", "deleteOffice.bk").submit();
		
	}
	
	$(function(){
		$("#file-area").hide();
		
		$("#img1").click(function(){
			$("#file1").click();
		})
		$("#img2").click(function(){
			$("#file2").click();
		})
		$("#img3").click(function(){
			$("#file3").click();
		})
		$("#img4").click(function(){
			$("#file4").click();
		})
		$("#img5").click(function(){
			$("#file5").click();
		})
		
		$("#typeName option").each(function(){
			if($(this).val() == "${o.typeName}"){
				$(this).prop("selected", true);
			}
		})
		
		$("#person option").each(function(){
			if($(this).val() == ${o.person}){
				$(this).prop("selected", true);
			}
		})
		
		var facility = "${ o.facility }";
		var facilityArr = facility.split(",");
		console.log(facility);
		console.log(facilityArr);
		$("input:checkbox").each(function(){
			if(facilityArr.indexOf($(this).val()) != -1){
				$(this).prop("checked", true);
			}
		});
		
	});
	
		function loadImg(inputFile, num){
			 //console.log(inputFile.files.length);
			if(inputFile.files.length == 1){
				
				var reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e){
					switch(num){
					case 1: $("#img1").attr("src", e.target.result); break;
					case 2: $("#img2").attr("src", e.target.result); break;
					case 3: $("#img3").attr("src", e.target.result); break;
					case 4: $("#img4").attr("src", e.target.result); break;
					case 5: $("#img5").attr("src", e.target.result); break;
					}
				}
			} else {
				switch(num){
				case 1: $("#img1").attr("src", null); break;
				case 2: $("#img2").attr("src", null); break;
				case 3: $("#img3").attr("src", null); break;
				case 4: $("#img4").attr("src", null); break;
				case 5: $("#img5").attr("src", null); break;
				}
			}
		}
		
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

	                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
	                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
	                var addr = ''; // ?????? ??????
	                var extraAddr = ''; // ???????????? ??????

	                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
	                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
	                    addr = data.roadAddress;
	                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
	                    addr = data.roadAddress;//????????? ??????????????? ??????
	                }
	                
	                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
	                if(data.userSelectedType === 'R'){
	                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
	                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
	                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // ???????????? ??????, ??????????????? ?????? ????????????.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
	                    if(extraAddr !== ''){
	                        extraAddr  = extraAddr;
	                    }
	                    // ????????? ??????????????? ?????? ????????? ?????????.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // ????????? ???????????? ????????? ????????????.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	      document.querySelector('.backto').addEventListener('click', () => {
	    	  console.log("back");
	    	  location.href="list.bk"
	    	});
</script>
</body>
</html>