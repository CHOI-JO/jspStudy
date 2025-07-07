<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>장바구니 - BookMarket</title> <%-- 타이틀 변경 --%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"> <%-- style.css 링크 경로 수정 확인 --%>

<%
	String cartId = session.getId();
%>
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
            <h1 class="custom-header-title">장바구니</h1>
            <p class="custom-header-sub">선택하신 도서들을 구매하시겠습니까?</p>
        </div>
    	
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box"> <%-- content-box 클래스 적용 --%>
                    <div class="row mb-3"> <%-- 버튼들을 위한 행 (아래 테이블과의 간격 mb-3) --%>
                        <div class="col-6 text-start"> <%-- 왼쪽 정렬 --%>
                            <a href="./deleteCart.jsp?cartId=<%=cartId%>" class="elegant-cute-button">전체 삭제</a> <%-- 버튼 스타일 변경 --%>
                        </div>
                        <div class="col-6 text-end"> <%-- 오른쪽 정렬 --%>
                            <a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="elegant-cute-button">주문하기</a> <%-- 버튼 스타일 변경 --%>
                        </div>
                    </div>
                    
                    <div class="table-responsive"> <%-- 작은 화면에서 테이블 스크롤 가능하게 --%>
                        <table class="styled-table"> <%-- style.css의 styled-table 클래스 적용 --%>
                            <caption>장바구니 상품 목록</caption> <%-- 테이블 캡션 추가 --%>
                            <thead>
                                <tr>
                                    <th>상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>소계</th>
                                    <th>비고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%				
                                    int sum = 0;
                                    ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
                                    if (cartList == null) {
                                        cartList = new ArrayList<Book>();
                                    }

                                    if (cartList.isEmpty()) {
                                %>
                                <tr>
                                    <td colspan="5" class="text-center py-4">장바구니에 담긴 상품이 없습니다.</td>
                                </tr>
                                <%
                                    } else {
                                        for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
                                            Book book = cartList.get(i);
                                            int total = book.getUnitPrice() * book.getQuantity();
                                            sum = sum + total;
                                %>
                                <tr>
                                    <td><%=book.getBookId()%> - <%=book.getName()%></td>
                                    <td><%=String.format("%,d", book.getUnitPrice())%>원</td> <%-- 가격 포맷 적용 --%>
                                    <td><%=book.getQuantity()%></td>
                                    <td><%=String.format("%,d", total)%>원</td> <%-- 소계 포맷 적용 --%>
                                    <td><a href="./removeCart.jsp?id=<%=book.getBookId()%>" class="badge text-bg-secondary styled-badge">삭제</a></td> <%-- 뱃지 스타일 변경 --%>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                                <tr>
                                    <th colspan="2" class="text-end">총액</th> <%-- 총액 셀 병합 및 정렬 --%>
                                    <th></th> <%-- 수량 아래 빈 셀 --%>
                                    <th><%=String.format("%,d", sum)%>원</th> <%-- 총액 포맷 적용 --%>
                                    <th></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-start mt-4"> <%-- 버튼 그룹 왼쪽 정렬 및 상단 마진 --%>
                        <a href="./books.jsp" class="elegant-cute-button"> &laquo; 쇼핑 계속하기</a> <%-- 버튼 스타일 변경 --%>
                    </div>
                </div> <%-- end of content-box --%>
            </div>
        </div>
    </div> <%-- end of container-fixed --%>

	<jsp:include page="footer.jsp" />
</body>
</html>