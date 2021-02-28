<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>북적북적::교환/환불/취소내역 조회</title>

<%@include file="/WEB-INF/views/member/inc/asset.jsp" %>

<link rel="stylesheet" href="/bookjuck/css/mypage.css">
<link rel="stylesheet" href="/bookjuck/css/global.css">

<link rel="stylesheet" href="/bookjuck/css/refund.css">


<style>

</style>
</head>

<body>



	<!-- 플로팅 메뉴 (북적이& top) -->
	<%@include file="/WEB-INF/views/member/bookjuckee.jsp" %>
	<%@include file="/WEB-INF/views/common/top.jsp" %>


	<div class="container">
	
		<!-- ########## 상단 헤더 시작 -->

		<!-- 변경 후 -->
		<%
			out.flush();
			RequestDispatcher dheader = request.getRequestDispatcher("/member/inc/header.do");
			dheader.include(request, response);
		%>
		<!-- ########## 상단 헤더 끝 -->
	
	
		<!-- 마이페이지 side bar -->
		<%@include file="/WEB-INF/views/member/inc/mypage.jsp" %>
		
		
		
		<!-- @@@@@여기에 개인작업 페이지 넣을 것 -->
        <section class="contentsection">
            <article class="list-form">

                <h3>교환/환불/취소 조회</h3>

                <table class="table tbl-md tbl-process">
                    <tr>
                        <th class="outline-l">교환신청<b>(0)</b></th>
                        <th rowspan="2" class="next">
                            <span class="glyphicon glyphicon-menu-right"></span>
                        </th>
                        <th>교환접수중<b>(0)</b></th>
                        <th rowspan="2" class="next">
                            <span class="glyphicon glyphicon-menu-right"></span>
                        </th>
                        <th >교환완료<b>(0)</b></th>

                        <th rowspan="2" class="line"></th>

                        <th>반품신청<b>(0)</b></th>
                        <th rowspan="2" class="next">
                            <span class="glyphicon glyphicon-menu-right"></span>
                        </th>
                        <th>반품회수중<b>(0)</b></th>
                        <th rowspan="2" class="next">
                            <span class="glyphicon glyphicon-menu-right"></span>
                        </th>
                        <th class="outline-r">반품완료<b>(0)</b></th>
                    </tr>
                    <tr>
                        <td class="outline-l">
                            <div class="crop"><img src="/bookjuck/image/orderprocess/return.jpg" class="order-process"></div>
                        </td>
                        <td>
                            <div class="crop"><img src="/bookjuck/image/orderprocess/retrieve.jpg" class="order-process"></div>
                        </td>
                        <td>
                            <div class="crop"><img src="/bookjuck/image/orderprocess/complete.jpg" class="order-process"></div>
                        </td>


                        <td>
                            <div class="crop"><img src="/bookjuck/image/orderprocess/refund.jpg" class="order-process"></div>
                        </td>
                        <td>
                            <div class="crop"><img src="/bookjuck/image/orderprocess/retrieve.jpg" class="order-process"></div>
                        </td>
                        <td class="outline-r">
                            <div class="crop"><img src="/bookjuck/image/orderprocess/complete.jpg" class="order-process"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                        <td class="line line-bottom"></td>
                        <td colspan="5"></td>
                    </tr>
                </table>

                <!-- style="background-color: RGBA(140,179,105,0.2)" -->
                <form method="GET" action="/bookjuck/member/refund/list.do" id="searchForm">
                <table class="table tbl-md search-type">
                    <tr>
                        <th>구분</th>
                        <td>
                            <select name="type" id="type" class="form-control" style="width: 200px;margin-left: 10px;">
                                <option value="1">일반배송</option>
                                <option value="2">바로드림</option>
                                <option value="3">E-Book</option>
                            </select>
                        </td>
                        <th>상품조회</th>
                        <td>
                            <input type="text" class="form-control" id="refundsearch" name="refundsearch" placeholder="상품명을 입력하세요.">
                        </td>
                        <td rowspan="2">
                            <input type="button" class="btn btn-general" id="btnview" value="조회하기" onclick="$('#searchForm').submit();">
                        </td>
                    </tr>
                    <tr>
                        <th>기간조회</th>
                        <td class="period" colspan="2">
                            <input type="button" class="btn btn-sm" id="btn1" value="일주일">
                            <input type="button" class="btn btn-sm" id="btn2" value="1개월">
                            <input type="button" class="btn btn-sm" id="btn3" value="3개월">
                            <input type="button" class="btn btn-sm" id="btn4" value="6개월">
                        </td>
                        <td>
                            <input type="date" class="form-control" id="startDate" name="startDate" min="2019-03-01"> ~
                            <input type="date" class="form-control" id="endDate" name="endDate" min="2019-03-01">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                    </tr>
                </table>
                </form>

				<ul id="searchrule">
					<li>최근 1개월이 기본으로 조회 되며, 기간 변경시 기간 선택한 후 조회버튼을 클릭해 주세요.</li>
					<li>한번에 조회 가능한 기간은 최대 6개월이며, 최근 2년부터 조회 가능합니다.</li>
					<li>배송완료 된 주문건은 <a href="/bookjuck/member/mypage/orderlist.do">구매내역</a>에서도 확인 하실 수 있습니다.</li>
				</ul>


                <table class="table tbl-md list">
                    <tr style="background-color: RGBA(140,179,105,0.2)">
                        <th id="orderN">주문번호</th>
                        <th id="date">접수일자</th>
                        <th id="bookinfo">상품정보</th>
                        <th id="totalamount">수량</th>
                        <th id="process">상태</th>
                    </tr>
                    
                    <c:if test="${not empty blist }">
                    <c:forEach items="${blist}" var="dto">
                    <tr>
                        <td><a href="/bookjuck/member/mypage/refundorderdetail.do" class="ordernumber">${dto.seq}</a></td>
                        <td>${dto.applyDate}</td>
                        <td class="book">${dto.title}
	                        <c:if test="${dto.totalAmount > 1}">
	                        <span class="amount">외 ${dto.totalAmount - 1}</span>
	                        </c:if>
                        </td>
                        <td>${dto.totalAmount}</td>
                        <td>${dto.orderState}</td>
                    </tr>
                    </c:forEach>
                    </c:if>
                    
                    <c:if test="${not empty balist }">
                    <c:forEach items="${balist}" var="dto">
                    <tr>
                        <td><a href="/bookjuck/member/mypage/refundorderdetail.do" class="ordernumber">${dto.seq}</a></td>
                        <td>${dto.applyDate}</td>
                        <td class="book">${dto.title}
	                        <c:if test="${dto.totalAmount > 1}">
	                        <span class="amount">외 ${dto.totalAmount - 1}</span>
	                        </c:if>
                        </td>
                        <td>${dto.totalAmount}</td>
                        <td>${dto.orderState}</td>
                    </tr>
                    </c:forEach>
                    </c:if>
                    
                    <c:if test="${not empty elist }">
                    <c:forEach items="${elist}" var="dto">
                    <tr>
                        <td><a href="/bookjuck/member/mypage/refundorderdetail.do" class="ordernumber">${dto.seq}</a></td>
                        <td>${dto.applyDate}</td>
                        <td class="book">${dto.title}</td>
                        <td>${dto.totalAmount}</td>
                        <td>${dto.orderState}</td>
                    </tr>
                    </c:forEach>
                    </c:if>
                    
                </table>


                <ul class="pagination">
	                <li>
	                <a href="#" aria-label="Previous">
	                    <span aria-hidden="true">&laquo;</span>
	                </a>
	                </li>
	                <li><a href="#">1</a></li>
	                <li><a href="#">2</a></li>
	                <li><a href="#">3</a></li>
	                <li><a href="#">4</a></li>
	                <li><a href="#">5</a></li>
	                <li>
	                <a href="#" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                </a>
	                </li>
            	</ul>

            </article>

            
            <!-- datepicker 현재 날짜로 기본값 설정 -->
            <script>
            
                document.getElementById('startDate').valueAsDate = new Date();
                document.getElementById('endDate').valueAsDate = new Date();
                
            </script>



            <div class="refund-info">
                <h5>안내사항</h5>
                <ul>
                    <li>교환신청은 상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내 가능합니다.</li>
                    <li>변심반품의 경우 수령 후 7일 이내, 상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내 가능합니다.</li>
                    <li>오픈마켓, 기프트, 중고장터, 해외배송주문, 바로드림주문건은 <b>[1:1 상담]</b>으로 문의 바랍니다. <a href="/bookjuck/member/mypage/servicecenter.do"><input type="button" class="btn btn-xs btn-general" value="1:1 상담 문의"></a></li>
                    <li><b>반품처리 절차 : 반품신청 > 접수 > 반품회수 > 회수완료 > 반품완료</b></li>
                    <li><b>교환처리 절차 : 교환신청 > 접수 > 처리중 > 교환완료</b></li>
                    <li>반품/교환신청건은 접수 이전 상태에서 신청취소가 가능합니다.
                </ul>
            </div>
            
        </section>


		<!-- ########## 하단 시작 -->
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
		<!-- ########## 하단 끝 -->
		
	</div>
	
	<script>
		
		//분류 고정
		$("#type").val("${type}").prop("selected",true);
		

		
		$("#btn1").click(function() {
			
			$("#startDate").valueAsDate("2021-02-19");
			
		});

	

	
	</script>

</body>

</html>