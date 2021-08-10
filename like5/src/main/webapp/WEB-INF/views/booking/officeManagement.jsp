<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공간예약관리</title>
<style>
	/*예약관리부분*/

		.content-area{
			margin-left:150px;
		}
        .outer {
            width: 70% !important; 
            margin: auto !important;
            align-items:center;
            padding:10px 20px;
        }
        #report-list {
			padding : 0;
            text-align: center;
            border: 1px solid lightgray;
            width: 90%;
            font-size: 13px;
            background-color: white;
        }
        .buttons{
            width: 100%;
            padding-left: 84%;;
            margin-bottom: 10px;
        }    
        #pagingArea{
		width: 100%;
        padding-left: 30%;
    }
    /*사이드 바*/
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
        /* background-color: #f1f1f1; */
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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<!--예약관리 버튼-->
    <div class="outer">
        <div class="aside-title">
            <h3>통합관리</h3>
        </div>
		<aside>
			<ul>
				<li><a class="active" href="member.ad">회원관리</a></li>
				<li><a href="board.ad">게시글관리</a></li>
				<li><a href="customer.ad">고객센터</a></li>
				<li><a href="donation.ad">후원관리</a></li>
				<li><a href="list.bk">공간대여관리</a></li>
				<li><a href="space.bo">공간예약관리</a></li>
			</ul>
		</aside>

        <div class="content-area">    
            <h4><b>예약관리</b></h4> 
            <div class="buttons">
                <button class="btn btn-primary btn-sm" onclick="">취소하기</button>
            </div>

			<div class="table">
				<table id="report-list">
					<thead>
						<tr class="table-default">
							<th width="150px">예약번호</th>
							<th width="130px">지점</th>
							<th width="100px">예약자</th>
							<th width="100px">오피스타입</th>
							<th width="100px">예약일</th>
							<th width="80px">상태</th>
							<th width="100px">#</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${list}">
							<tr>
								<td>${ s.bookingNo }</td>
								<td>${ s.branch }</td>
								<td>${ s.memName }</td>
								<td>${ s.typeName }</td>
								<td>${ s.requestDate }</td>
								<c:choose>
		                        	<c:when test="${ s.status eq 'Y' }">
		                        		<td>대기</td>
		                        	</c:when>
		                        	<c:when test="${ s.status eq 'N' }">
		                        		<td>취소</td>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<td>완료</td>
		                        	</c:otherwise>
	                        	</c:choose>
								<td>
									<input type="checkbox" onclick = "">
								</td>
							</tr>
						</c:forEach>	
					</tbody>
				</table>
			</div>
            
            <br><br><br>

            <!-- 페이징 바 -->
            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="space.bo?currentPage=${ pi.currentPage-1 }">&laquo;</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="space.bo?currentPage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="space.bo?currentPage=${ pi.currentPage+1 }">&raquo;</a></li>
	                    </c:otherwise>
	                </c:choose>    
                </ul>
            </div>
		</div>
    </div>
</body>
</html>