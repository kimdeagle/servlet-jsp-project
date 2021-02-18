<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>북적북적_Admin::Welcome</title>

<%@include file="/WEB-INF/views/admin/inc/asset.jsp" %>


<link rel="stylesheet" href="/bookjuck/css/global.css">
<link rel="stylesheet" href="/bookjuck/css/faq.css">

<style>

</style>
</head>

<body>

	<div class="container">

	<!-- 관리자페이지 헤더 좌측 메뉴 + 상단 로고 + 검색창 -->
	<%@include file="/WEB-INF/views/admin/inc/header.jsp" %>

	<section class="contentsection">
        <h3>자주 하는 질문<small>수정하기</small></h3>
            	<form method="POST" action="/admin/faq/editok.do">
					<div id="letterbox">
			        	<input type="text" id="title" name="title" class="form-control inline" value="수정 전 제목">
					        <span class="dropdown">
					            <button class="btn btn-default dropdown-toggle" type="button" id="selected" data-toggle="dropdown" aria-expanded="true">
						            질문카테고리
						            <span class="caret"></span>
					            </button>
						        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="category">
									<li role="presentation"><a role="menuitem" tabindex="-1">반품</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1">환불</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1">교환</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1">배송</a></li>
						        </ul>
					        </span>
					        <textarea id="content" name="content" class="form-control" cols="40" rows="15">수정 전 내용</textarea>
					</div>
					<div id="btn">
					    <input type="submit" class="btn btn-general inline" value="저장하기" id="save">
					    <button type="button" class="btn btn-general" value="뒤로가기" id="back" onclick="location.href='/bookjuck/admin/faq/list.do'">뒤로가기</button>
					</div>
            	</form>
    </section>
	
	</div>
	
	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	<!-- 플로팅 메뉴 -->
	<%@include file="/WEB-INF/views/common/bookjuckee.jsp" %>
	<%@include file="/WEB-INF/views/common/top.jsp" %>

	<script>

        $('#category li > a').on('click', function() {
            // 버튼에 선택된 항목 텍스트 넣기 
            $('#selected').text($(this).text());
        });

    </script>

</body>

</html>