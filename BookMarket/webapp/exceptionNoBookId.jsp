<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>도서 오류 - BookMarket</title> <%-- 타이틀 변경 --%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"> <%-- style.css 링크 경로 수정 확인 --%>

</head>
<body>
    <a href="https://www.cursors-4u.com/cursor/2010/04/20/cute-spinning-flower-purple.html"
        target="_blank" title="Cute Spinning Flower Purple">
        <img src="https://cur.cursors-4u.net/cursor.png" border="0"
        alt="Cute Spinning Flower Purple"
        style="position: absolute; top: 0px; right: 0px;" />
    </a>
    <br>

    <%@ include file="menu.jsp"%>	

    <div class="container-fixed py-4">
        <div class="custom-header-box">
            <h1 class="custom-header-title">오류 발생</h1>
            <p class="custom-header-sub">요청하신 페이지를 찾을 수 없습니다.</p>
        </div>
    	
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box error-message-box"> <%-- content-box 및 새로운 클래스 추가 --%>
                    <h2 class="error-heading">해당 도서가 존재하지 않습니다.</h2> <%-- 클래스 추가 --%>
                    <p class="error-detail-text">요청 URL: <%=request.getRequestURL()%><% if (request.getQueryString() != null) { %>?<%=request.getQueryString() %><% } %></p> <%-- URL 표시 스타일 조정 --%>
                    <p class="mt-4"> <%-- 버튼 위 여백 --%>
                        <a href="books.jsp" class="elegant-cute-button"> &laquo; 도서 목록으로 돌아가기</a>	
                    </p>
                </div>
            </div>
        </div>
    </div> <%-- end of container-fixed --%>

    <%@ include file="footer.jsp"%>	
</body>
</html>