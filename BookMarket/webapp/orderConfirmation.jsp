<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>주문 정보 확인 - BookMarket</title> <%-- 타이틀 변경 --%>

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
            <h1 class="custom-header-title">주문 확인</h1>
            <p class="custom-header-sub">주문 내용을 최종적으로 확인해주세요.</p>
        </div>
    	
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box"> <%-- content-box 클래스 적용 --%>
                    <h1 class="mb-4 order-receipt-title">영수증</h1> <%-- 새로운 클래스 추가 --%>
                    <div class="row mb-5 order-info-section"> <%-- 새로운 클래스 추가 --%>
                        <div class="col-md-6 text-start">
                            <h5 class="order-info-heading">배송 주소</h5>
                            <p><strong>성명:</strong> <%= shipping_name %></p>
                            <p><strong>우편번호:</strong> <%= shipping_zipCode %></p>
                            <p><strong>주소:</strong> <%= shipping_addressName %>(<%= shipping_country %>)</p>
                        </div>
                        <div class="col-md-6 text-end">
                            <h5 class="order-info-heading">주문 정보</h5>
                            <p><strong>주문 아이디:</strong> <%= shipping_cartId %></p>
                            <p><strong>배송일:</strong> <em><%= shipping_shippingDate %></em></p>
                        </div>
                    </div>
                    
                    <div class="table-responsive mb-4"> <%-- 테이블 반응형 및 하단 마진 --%>
                        <table class="styled-table"> <%-- style.css의 styled-table 클래스 적용 --%>
                            <caption>주문 상품 목록</caption> <%-- 테이블 캡션 추가 --%>
                            <thead>
                                <tr>
                                    <th class="text-center">도서</th>
                                    <th class="text-center">수량</th>
                                    <th class="text-center">가격</th>
                                    <th class="text-center">소계</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int sum = 0;
                                    ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
                                    if (cartList == null)
                                        cartList = new ArrayList<Book>();
                                    
                                    if (cartList.isEmpty()) {
                                %>
                                <tr>
                                    <td colspan="4" class="text-center py-4">장바구니가 비어 있습니다.</td>
                                </tr>
                                <%
                                    } else {
                                        for (int i = 0; i < cartList.size(); i++) {
                                            Book book = cartList.get(i);
                                            int total = book.getUnitPrice() * book.getQuantity();
                                            sum = sum + total;
                                %>
                                <tr>
                                    <td class="text-center book-name-col"><em><%=book.getName()%></em></td> <%-- 클래스 추가 --%>
                                    <td class="text-center"><%=book.getQuantity()%></td>
                                    <td class="text-center"><%=String.format("%,d", book.getUnitPrice())%>원</td>
                                    <td class="text-center"><%=String.format("%,d", total)%>원</td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                                <tr>
                                    <td colspan="2" class="text-end total-label"><strong>총액:</strong></td> <%-- 셀 병합 및 클래스 추가 --%>
                                    <td colspan="2" class="text-center text-danger total-price"><strong><%=String.format("%,d", sum)%>원</strong></td> <%-- 셀 병합 및 클래스 추가 --%>
                                </tr>
                            </tbody>
                        </table>			
                    </div>

                    <div class="button-group justify-content-center"> <%-- 버튼 그룹 중앙 정렬 --%>
                        <a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="elegant-cute-button me-2" role="button"> 이전 </a>
                        <a href="./thankCustomer.jsp" class="elegant-cute-button me-2" role="button"> 주문 완료 </a>
                        <a href="./checkOutCancelled.jsp" class="elegant-cute-button" role="button"> 취소 </a>			
                    </div>
                </div> <%-- end of content-box --%>
            </div>
        </div>
    </div> <%-- end of container-fixed --%>
    
</body>
</html>