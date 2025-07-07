<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>주문 완료 - BookMarket</title> <%-- 타이틀 변경 --%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"> <%-- style.css 링크 경로 수정 확인 --%>

</head>
<body>
    <%
        // 쿠키 및 세션 처리 로직 (변화 없음)
        String shipping_cartId = "";
        String shipping_name = ""; // 이 변수는 쿠키에서 읽어오지 않지만, 이전 코드에 있었으므로 유지
        String shipping_shippingDate = "";
        String shipping_country = ""; // 이 변수는 쿠키에서 읽어오지 않지만, 이전 코드에 있었으므로 유지
        String shipping_zipCode = ""; // 이 변수는 쿠키에서 읽어오지 않지만, 이전 코드에 있었으므로 유지
        String shipping_addressName = ""; // 이 변수는 쿠키에서 읽어오지 않지만, 이전 코드에 있었으므로 유지		

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie thisCookie = cookies[i];
                String n = thisCookie.getName();
                if (n.equals("Shipping_cartId"))
                    shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                if (n.equals("Shipping_shippingDate"))
                    shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                // 나머지 쿠키들도 필요하다면 여기에 추가적으로 읽어올 수 있습니다.
            }
        }
    %>
    
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
            <h1 class="custom-header-title">주문 완료</h1>
            <p class="custom-header-sub">성공적으로 주문이 접수되었습니다.</p>
        </div>
    	
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box thank-you-message-box"> <%-- content-box 및 새로운 클래스 추가 --%>
                    <h2 class="thank-you-heading">주문해주셔서 감사합니다!</h2>
                    <p class="order-detail-text">주문은 <span class="highlight-text"><%= shipping_shippingDate %></span>에 배송될 예정입니다.</p>	
                    <p class="order-detail-text">주문번호: <span class="highlight-text"><%= shipping_cartId %></span></p>
                </div>
            </div>
        </div>

        <div class="text-center mt-4"> <%-- 버튼 중앙 정렬 --%>
            <p><a href="./books.jsp" class="elegant-cute-button"> &laquo;도서 목록</a></p>
        </div>
    </div> <%-- end of container-fixed --%>

    <%@ include file="footer.jsp"%>
</body>
</html>
<%
    // 세션 및 쿠키 무효화 로직 (변화 없음)
	session.invalidate(); // 세션 무효화

	if (cookies != null) { // 쿠키가 존재할 경우에만 반복
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			// 모든 Shipping_ 관련 쿠키를 0으로 설정하여 삭제
			if (thisCookie.getName().startsWith("Shipping_")) { // "Shipping_"으로 시작하는 모든 쿠키를 삭제
				thisCookie.setMaxAge(0);
				response.addCookie(thisCookie);
			}
		}
	}
%>