<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        
        div{
            box-sizing:border-box;
            
            font-family: 'Noto Sans KR', sans-serif;
        }
        #body{width:1200px; height:1000px; margin: auto;}
        #body>div{float: left;}

        #sidebar{width: 15%; height: 100%;}
        #sidmenu{height: 32%; width: 100%;border: 3px solid rgb(220, 53, 69);}
        #sidmenu>div{width: 100%; height: 25%; text-align:center; margin:0; padding-top:21px; font-size: 22px;}
        #sidmenu>div:hover{color:white; background-color:rgb(220, 53, 69) ; }
        #profile{height:23%; width: 100%;  margin-top: 15px; margin-left:3px;}
        #profile>img{width:150px; height:150px; border-radius: 70%; margin-left: 12px; margin-top: 12px;}
        #profile>div{width: 100%; height: 50px; font-size: 19px; text-align: center; margin-top:15px;}

        #info{width: 100%; height: 4%;}
        #pageinfo{width:100%; height: 100%;}
        #pageinfo h3{margin:0; padding-top:10px; padding-left: 5px;}
        #line{width: 100%; height: 2px; background-color: lightgrey;}

        #content{width:85%; height: 95%;}
        #mem{width:100%; height: 20%;}
        #mem>div{float: left;}
        #meminfo{width:65%; height: 100%;}
        #meminfo>div{width: 80%; height: 80%; margin-top:15px; margin-left:67px; border: 3px solid lightgray;}
        #meminfo>div>div{width:100%;height: 33.4%; }
        #donate{width: 35%; height: 100%;}
        #donate>div{width: 80%; height: 80%;margin-top:15px; margin-left:40px; border: 3px solid lightgray;}
        #donate>div>div{width: 100%; height: 33.3%;}
        #post{width: 100%; height: 78%;}
        #post>div{width: 100%; height: 30%;margin-top: 2%;}
        #post>div>div{margin-left: 150px; width: 100%; margin-bottom: 5px;}
        #post table{width: 70%; height: 80%; margin-left:15%; text-align:center;}
        #change{background-color:rgb(220, 53, 69); color: white; border-radius:3px; border: none;}
        #calculate{background-color:rgb(220, 53, 69); color: white; border-radius:3px; border: none;}
        
        #pagingArea{float: left;}
		#pagingArea>ul{margin-left:330px;}

    </style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="body">
      
      <div id="info">
        <div id="pageinfo">
            <h3>MY PAGE</h3>
        </div>
          <div id="line">
        </div>
      </div>

      <div id="sidebar">
       <div id="profile">
        <c:choose>
	        <c:when test="${ empty memberInfor.memProfile }">
	         	 <img src="https://i.imgur.com/pO4OGIl.jpg" alt="">
	         </c:when>
	         <c:otherwise>
	         	<img src="${ memberInfor.memProfile }" alt="">
	         </c:otherwise>
	    </c:choose>
          <div>
            	${memberInfor.nickName} ???
          </div>
        </div>
         <div id="sidmenu">  
          <div id="" onclick="location.href='myPage.me?memNo=${ loginUser.memNo }'" style="color:white; background-color:rgb(220, 53, 69);">
                  	?????????
          </div>
          <div id="" onclick="location.href='donate.me?memNo=${ loginUser.memNo }'">
                  	??????
          </div>
          <div id="" onclick="location.href='inquiry.me?memNo=${ loginUser.memNo }'">
                  	1:1??????
          </div>
          <%-- ?????? ?????? --%>
          <div onclick="location.href='myBookList.bk?memNo=${ loginUser.memNo }'">
                  	????????????
          </div>
        </div>
    </div>
        
        <div id="content">
            <div id="mem">
                <div id="meminfo">
                    <div>
                        <div>
                            	${memberInfor.memName} ???
                            <button id="change" type="button" onclick="location.href='correctInfor.me'">????????????</button>
                        </div>
                        <div>
                            	????????? : ${memberInfor.email}
                        </div>
                        <div>
                            	????????? : ${memberInfor.nickName}
                        </div>
                    </div>
                </div>
                <div id="donate">
                    <div>
                        <div>
                            	??? ???????????? ?????? : <fmt:formatNumber value="${ price }" pattern="#,###,###"/>
                            	<c:if test="${ settleable > 9999 }">
                            		<button id="calculate" type="button" data-toggle="modal" data-target="#MyModal">????????????</button>
                            	</c:if>
                            	
                        </div>
                        <div>
                            	?????? ????????? ?????? : <fmt:formatNumber value="${ settleable }" pattern="#,###,###"/>
                        </div>
                        <div>
                            	?????? ?????? : ${ memberInfor.bank } ${ memberInfor.accountNum }
                        </div>
                    </div>
                </div>
            </div>
            <div id="post">
                <div>
                    <div>
                        	??????????????? ?????????
                    </div>
                    <table class="table">
                    <thead>
                      <tr>
                        <th>????????????</th>
                        <th>??????</th>
                        <th>?????????</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" items="${ list }">
	                  		<c:choose>
		                  		<c:when test="${ list.category eq 'QNA' }">
			                      <tr onclick="location.href='qnaUpdateForm.bo?bno=${ list.bno }'">
			                        <td><fmt:formatDate pattern="yy/MM/dd" value="${ list.enrollDate }"></fmt:formatDate></td>
			                        <td>${ list.title }</td>
			                        <td>${ list.category }</td>
			                      </tr>
			                  	</c:when>
			                  	<c:when test="${ list.category eq '??????' }">
			                  		<tr onclick="location.href='selectTemSave.bo?bno=${ list.bno }'">
			                        	<td><fmt:formatDate pattern="yy/MM/dd" value="${ list.enrollDate }"></fmt:formatDate></td>
			                        	<td>${ list.title }</td>
			                        	<td>${ list.category }</td>
			                      	</tr>
			                  	</c:when>
		                	</c:choose>
	                	</c:forEach>
                    </tbody>
                  </table>
                  <div id="pagingArea">
	                	<ul class="pagination">
		                	<c:choose>
		                		<c:when test="${ pi.currentPage eq 1 }">
			                    	<li class="page-item disabled"><a class="page-link"><</a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<c:choose>
			                    		<c:when test="${ !empty condition }">
			                    			<li class="page-item"><a class="page-link" href="tempSaveListDetail.me?memNo=${loginUser.memNo}&dcurrentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}"><</a></li>
		                    			</c:when>
		                    			<c:otherwise>
		                    				<li class="page-item"><a class="page-link" href="tempSaveListDetail.me?memNo=${loginUser.memNo}&currentPage=${ pi.currentPage-1 }"><</a></li>
		                    			</c:otherwise>
		                    		</c:choose>
		                    	</c:otherwise>
		                    </c:choose>
	                    
	                    
	                    
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${ !empty condition }">
		                   				<li class="page-item"><a class="page-link" href="tempSaveListDetail.me?memNo=${loginUser.memNo}&currentPage=${ p }&condition=${condition}">${ p }</a></li>
		                   			</c:when>
		                   			<c:otherwise>
		                   				<li class="page-item"><a class="page-link" href="tempSaveListDetail.me?memNo=${loginUser.memNo}&currentPage=${ p }">${ p }</a></li>
		                   			</c:otherwise>
		                    	</c:choose>
		                    </c:forEach>
	                    
	                    
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    	<li class="page-item disabled"><a class="page-link">></a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<c:choose>
			                    		<c:when test="${ !empty condition }">
				                    		<li class="page-item"><a class="page-link" href="tempSaveListDetail.me?memNo=${loginUser.memNo}&currentPage=${ pi.currentPage+1 }&condition=${condition}">></a></li>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<li class="page-item"><a class="page-link" href="tempSaveListDetail.me?memNo=${loginUser.memNo}&currentPage=${ pi.currentPage+1 }">></a></li>
				                    	</c:otherwise>
				                    </c:choose>
			                    </c:otherwise>
		                    </c:choose>
	                	</ul>
            		</div>
                </div>
            </div>
        </div>
        
        <!-- The Modal -->
        <div class="modal fade" id="MyModal">
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">????????????</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="border: 2px solid lightgrey;">
                  <div  style="margin-left:80px;">
                 	 ?????? <br>
                  1?????? ???????????? ????????????<br>
                  	????????? ??? ?????????????????? ????????? 5% ????????? ??????<br><br>
                  <input type="text" placeholder="????????? ??????????????????" style="width:70%; height:30px;">
                  </div>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" style="border: 2px solid rgb(220, 53, 69); background-color: white; color: rgb(220, 53, 69);">??????</button>
                <button type="submit" class="btn btn-secondary" data-dismiss="modal" style="background-color: rgb(220, 53, 69); color: white;">????????????</button>
                </div>
                
            </div>
            </div>
        </div>

    </div>
    <br><br>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>