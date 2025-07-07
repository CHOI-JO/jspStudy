<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>

<%-- 기존 <header> 태그를 제거하고, style.css의 .nav-bar 클래스를 적용한 div로 대체 --%>
<div class="nav-bar"> 
 <%-- 왼쪽 타이틀 부분: style.css의 .nav-title 클래스를 적용한 a 태그로 감쌉니다. --%>
    <a href="./welcome.jsp" class="nav-title d-flex align-items-center"> <%-- a 태그에 nav-title, d-flex, align-items-center 클래스 추가 --%>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-heart me-1" viewBox="0 0 16 16">
      		<path d="M8 6.982C9.664 5.309 13.825 8.236 8 12 2.175 8.236 6.336 5.309 8 6.982"/>
      		<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.707L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.646a.5.5 0 0 0 .708-.707L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
    	</svg><%-- SVG 바로 뒤에 텍스트 시작 (공백 없음) --%>온라인 서점
    </a>

	<%-- 오른쪽 메뉴 버튼 그룹 --%>
	<div class="nav-btn"> <%-- .nav-btn 클래스 적용 --%>
		<ul class="nav-list" style="list-style: none; padding: 0; margin: 0; display: flex; gap: 20px;"> <%-- ul 태그의 기본 스타일 제거 및 flex 설정 --%>
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-btn-item"> <%-- .nav-btn-item 클래스 적용 --%>
						<a href="<c:url value="/member/loginMember.jsp"/>">로그인 </a>
					</li>
					<li class="nav-btn-item">
						<a href='<c:url value="/member/addMember.jsp"/>'>회원 가입</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-btn-item" style="color: #804d36; font-family: 'Pretendard', sans-serif; font-size: 14px; padding: 6px 0;"> <%-- 텍스트 색상 및 폰트, 크기 조정 --%>
						[<%=sessionId%>님]
					</li>
					<li class="nav-btn-item">
						<a href="<c:url value="/member/logoutMember.jsp"/>">로그아웃 </a>
					</li>
					<li class="nav-btn-item">
						<a href="<c:url value="/member/updateMember.jsp"/>">회원 수정</a>
					</li>
				</c:otherwise>
			</c:choose>
			<li class="nav-btn-item">
				<a href="<c:url value="/books.jsp"/>">도서 목록</a>
			</li>
			<li class="nav-btn-item">
				<a href="<c:url value="/addBook.jsp"/>">도서 등록</a>
			</li>
			<li class="nav-btn-item">
				<a href="<c:url value="/editBook.jsp?edit=update"/>">도서 수정</a>
			</li>
			<li class="nav-btn-item">
				<a href="<c:url value="/editBook.jsp?edit=delete"/>">도서 삭제</a>
			</li>
			<li class="nav-btn-item">
				<a href="<c:url value="/cart.jsp"/>">장바구니</a>
			</li>
			<li class="nav-btn-item">
				<a href="<c:url value ="/BoardListAction.do?pageNum=1"/>">게시판</a>
			</li>
		</ul>
	</div>
</div>