네, resultMember.jsp 코드도 확인했습니다. 이 페이지는 회원가입, 회원 정보 수정, 회원 삭제, 로그인 후 환영 메시지 등 다양한 회원 관련 작업의 결과를 메시지로 표시하는 페이지입니다. msg 파라미터 값에 따라 다른 메시지를 출력합니다.

다른 페이지들과 동일하게 style.css 디자인 톤으로 통일해 보겠습니다. 특히 메시지 표시와 복귀 버튼을 content-box와 elegant-cute-button 스타일을 활용하여 일관성 있게 만듭니다.

resultMember.jsp 디자인 변경 (style.css 통합)
핵심 전략:

공통 CSS/JS 링크 통합: resultMember.jsp의 <head> 부분을 다른 JSP 파일과 동일하게 만듭니다. (Bootstrap, FontAwesome, Pretendard 폰트, 그리고 style.css 링크).

레이아웃 요소 통합:

menu.jsp와 footer.jsp는 기존처럼 포함합니다.

"와우" 헤더 박스 (custom-header-box)를 가져와 msg 값에 따라 "회원 정보" 또는 "회원 가입" 제목으로 활용합니다.

결과 메시지를 style.css의 content-box 클래스 안에 배치합니다.

메시지 및 버튼 스타일링:

결과 메시지에 적절한 클래스를 적용하여 디자인을 통일하고, "도서 목록" (또는 적절한 복귀) 버튼을 elegant-cute-button으로 변경합니다.

수정된 resultMember.jsp 코드
아래는 resultMember.jsp를 style.css 디자인에 맞춰 수정한 코드입니다.

Java

<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>회원 작업 결과 - BookMarket</title> <%-- 타이틀 변경 --%>

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
            <%
                String msg = request.getParameter("msg");
                String headerTitle = "회원 정보";
                String headerSub = "회원 관련 작업 결과입니다.";

                if ("1".equals(msg)) {
                    headerTitle = "회원 가입";
                    headerSub = "새로운 회원 가입 결과입니다.";
                } else if ("0".equals(msg) || "2".equals(msg)) {
                    // 기본값 유지
                } else {
                    headerTitle = "알림"; // msg가 없거나 예상치 못한 값일 경우
                    headerSub = "회원 작업에 대한 알림입니다.";
                }
            %>
            <h1 class="custom-header-title"><%= headerTitle %></h1>
            <p class="custom-header-sub"><%= headerSub %></p>
        </div>
        
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box result-message-box"> <%-- content-box 및 새로운 클래스 추가 --%>
                    <%
                        String resultHeading = "";
                        String resultText = "";
                        String resultClass = "alert-success"; // 기본 성공 메시지 스타일

                        if ("0".equals(msg)) {
                            resultHeading = "회원 정보가 수정되었습니다.";
                            resultClass = "alert-info"; // 정보성 메시지 스타일
                        } else if ("1".equals(msg)) {
                            String loginId = (String) session.getAttribute("sessionId"); // 가입 시 세션 아이디가 설정될 수 있음
                            if (loginId == null) loginId = ""; // null 방지
                            resultHeading = "회원가입을 축하드립니다!";
                            resultText = loginId + "님, BookMarket에 오신 것을 환영합니다!";
                            resultClass = "alert-success";
                        } else if ("2".equals(msg)) {
                            String loginId = (String) session.getAttribute("sessionId");
                            if (loginId == null) loginId = ""; // null 방지
                            resultHeading = loginId + "님 환영합니다!";
                            resultText = "즐거운 쇼핑되세요!";
                            resultClass = "alert-success";
                        } else { // msg가 null이거나 예상치 못한 값일 경우 (보통 회원 삭제)
                            resultHeading = "회원 정보가 삭제되었습니다.";
                            resultClass = "alert-danger"; // 오류/경고 메시지 스타일
                            resultText = "다음에 다시 찾아주세요.";
                        }
                    %>
                    <h2 class="result-heading <%= resultClass %>"><%= resultHeading %></h2>
                    <% if (!resultText.isEmpty()) { %>
                        <p class="result-detail-text"><%= resultText %></p>
                    <% } %>

                    <div class="mt-4"> <%-- 버튼 위 여백 --%>
                        <p><a href="./books.jsp" class="elegant-cute-button"> &laquo; 도서 목록으로 돌아가기</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div> <%-- end of container-fixed --%>
    

</body>
</html>