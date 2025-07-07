<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page errorPage="exceptionNoBookId.jsp"%>
<%@ page import="java.sql.*"%>

<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>도서 정보 - BookMarket</title> <%-- 타이틀 변경 --%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"> <%-- style.css 링크 경로 수정 확인 --%>

<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>

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
            <h1 class="custom-header-title">도서 상세 정보</h1>
            <p class="custom-header-sub">선택하신 도서의 자세한 정보를 확인하세요.</p>
        </div>

		<%@ include file="dbconn.jsp"%>
		<%
		String bookId = request.getParameter("id");
		
		// NullPointerException 방지를 위한 conn null 체크
		if (conn == null) {
            throw new SQLException("데이터베이스 연결 객체가 null입니다. dbconn.jsp에서 발생한 상세 오류를 확인하세요.");
        }

		PreparedStatement pstmt = null;
		ResultSet rs = null;
        Book book = null; // Book 객체를 여기서 선언 및 초기화

		String sql = "select * from book where b_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// Book 객체 생성 및 데이터 설정 (dto.Book 사용)
				book = new Book();
				book.setBookId(rs.getString("b_id"));
				book.setName(rs.getString("b_name"));
				book.setUnitPrice(rs.getInt("b_unitPrice"));
				book.setAuthor(rs.getString("b_author"));
				book.setDescription(rs.getString("b_description"));
				book.setPublisher(rs.getString("b_publisher"));
				book.setCategory(rs.getString("b_category"));
				book.setUnitsInStock(rs.getLong("b_unitsInStock"));
				book.setReleaseDate(rs.getString("b_releaseDate")); // 또는 Date 타입으로 받기
				book.setCondition(rs.getString("b_condition"));
				book.setFilename(rs.getString("b_filename"));
				
				// 이제 book 객체를 사용하여 정보를 표시
		%>
		<div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box book-detail-card"> <%-- content-box 및 새로운 book-detail-card 클래스 적용 --%>
					<div class="row">
						<div class="col-md-5 d-flex justify-content-center align-items-center">
							<img src="./resources/images/<%=book.getFilename()%>"
								class="img-fluid book-detail-image" alt="<%=book.getName()%>">
						</div>
						<div class="col-md-7 text-start book-info-section"> <%-- 텍스트 왼쪽 정렬 및 새로운 클래스 --%>
							<h3 class="book-name-title">
								<b><%=book.getName()%></b>
							</h3>
							<p class="book-description-full"><%=book.getDescription()%></p>
							<p>
								<b>도서코드 : </b><span class="book-detail-badge"> <%=book.getBookId()%></span>
							</p>
							<p>
								<b>저자</b> :
								<%=book.getAuthor()%>
							</p>
							<p>
								<b>출판사</b> :
								<%=book.getPublisher()%>
							</p>
							<p>
								<b>출판일</b> :
								<%=book.getReleaseDate()%>
							</p>
							<p>
								<b>분류</b> :
								<%=book.getCategory()%>
							</p>
							<p>
								<b>재고수</b> :
								<%=book.getUnitsInStock()%>
							</p>
							<h4 class="book-price"><%=String.format("%,d", book.getUnitPrice())%>원
							</h4>
							<p class="button-group mt-4">
							<form name="addForm" action="./addCart.jsp?id=<%=book.getBookId()%>" method="post">
								<a href="#" class="elegant-cute-button me-2" onclick="addToCart()"> 도서주문&raquo;</a> <%-- 버튼 스타일 적용 --%>
								<a href="./cart.jsp" class="elegant-cute-button me-2"> 장바구니&raquo;</a> <%-- 버튼 스타일 적용 --%>
								<a href="./books.jsp" class="elegant-cute-button"> 도서목록&raquo;</a> <%-- 버튼 스타일 적용 --%>
							</form>
							</p>
						</div>
					</div>
                </div> <%-- end of content-box --%>
            </div>
        </div>
		<%
			} else { // rs.next()가 false일 때 (해당 ID의 책을 찾을 수 없을 때)
				// exceptionNoBookId.jsp로 에러를 보낼 것이므로 여기서는 간단히 처리하거나 제거할 수 있습니다.
				// 현재 @page errorPage="exceptionNoBookId.jsp" 가 선언되어 있으므로, book이 null인 경우 해당 페이지로 이동할 것입니다.
			}
		} catch (SQLException e) {
            System.out.println("SQL 오류 발생: " + e.getMessage());
            e.printStackTrace();
		%>
		<div class="row align-items-md-stretch">
			<div class="col-md-12">
				<div class="alert alert-danger" role="alert">
					도서 정보를 가져오는데 실패했습니다. 관리자에게 문의하세요.<br>오류: <%=e.getMessage()%>
				</div>
			</div>
		</div>
		<%
		} finally { // 자원 해제는 finally 블록에서
			if (rs != null) try { rs.close(); } catch(SQLException ignore) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ignore) {}
			if (conn != null) try { conn.close(); } catch(SQLException ignore) {}
		}
		%>
		
	</div> <%-- end of container-fixed --%>
	
	<jsp:include page="footer.jsp" /> <%-- footer.jsp 포함 --%>
</body>
</html>