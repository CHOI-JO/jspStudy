<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>회원 로그인 - BookMarket</title> <%-- 타이틀 변경 --%>

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

    <jsp:include page="/menu.jsp" /> <%-- menu.jsp 포함 --%>

    <div class="container-fixed py-4">
        <div class="custom-header-box">
            <h1 class="custom-header-title">회원 로그인</h1>
            <p class="custom-header-sub">로그인하여 더 많은 기능을 이용해보세요.</p>
        </div>
        
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box login-form-box"> <%-- content-box 및 새로운 클래스 추가 --%>
                    <h3 class="login-heading">로그인</h3> <%-- 새로운 클래스 추가 --%>
                    <%
                        String error = request.getParameter("error");
                        if (error != null) {
                            out.println("<div class='alert alert-danger login-error-message'>"); // 클래스 변경
                            out.println("아이디와 비밀번호를 확인해 주세요");
                            out.println("</div>");
                        }
                    %>
                    <form class="login-form" action="processLoginMember.jsp" method="post"> <%-- 새로운 클래스 추가 --%>
                        <div class="form-floating mb-3"> <%-- row 클래스 제거 (이미 content-box가 flex 컨테이너) --%>
                            <input type="text" class="form-control elegant-input" name='id' id="floatingInput" placeholder="ID" required autofocus> <%-- elegant-input 추가 --%>
                            <label for="floatingInput">아이디</label> <%-- 라벨 텍스트 변경 --%>
                        </div>
                        <div class="form-floating mb-4"> <%-- row 클래스 제거 및 하단 마진 mb-4 --%>
                            <input type="password" class="form-control elegant-input" name='password' placeholder="Password" required> <%-- elegant-input 추가, required 속성 --%>
                            <label for="floatingPassword">비밀번호</label> <%-- 라벨 텍스트 변경 --%>
                        </div>
                        <button class="elegant-cute-button btn-block login-button" type="submit">로그인</button> <%-- 버튼 스타일 변경 --%>
                    </form>
                </div>
            </div>
        </div>
    </div> <%-- end of container-fixed --%>

    <jsp:include page="/footer.jsp" />	
</body>			
</html>