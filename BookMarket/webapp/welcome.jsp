<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html >
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>환영합니다 - BookMarket</title> <%-- 타이틀 변경 --%>

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
            <h1 class="custom-header-title">도서 쇼핑몰에 오신 것을 환영합니다!</h1> <%-- greeting 변수 대신 직접 텍스트 사용 또는 필요 시 변수 사용 --%>
            <p class="custom-header-sub">환영합니다, BookMarket에 오신 것을 기쁘게 생각합니다.</p> <%-- tagline 변수 대신 직접 텍스트 사용 --%>
        </div>

        <%!String greeting = "도서 쇼핑몰에 오신 것을 환영합니다";
		String tagline = "Welcome to Web Market!";%>	
        
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box"> <%-- content-box 클래스 적용 --%>
                    <h3 class="welcome-tagline"><%=tagline%></h3> <%-- 태그라인에 클래스 추가 --%>
                    <%
                        response.setIntHeader("Refresh", 5);
                        Date day = new java.util.Date();
                        String am_pm;
                        int hour = day.getHours();
                        int minute = day.getMinutes();
                        int second = day.getSeconds();
                        if (hour / 12 == 0) {
                            am_pm = "AM";
                        } else {
                            am_pm = "PM";
                            hour = hour - 12;
                        }
                        String CT = hour + ":" + minute + ":" + second + " " + am_pm;
                    %>
                    <p class="current-time">현재 접속 시각: <%=CT%></p> <%-- 시각 표시에도 클래스 추가 --%>
                </div>
            </div>
        </div>
    </div> <%-- end of container-fixed --%>

	<%@ include file="footer.jsp"%>   
</body>
</html>