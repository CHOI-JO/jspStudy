<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>도서 수정 - BookMarket</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"> 

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
            <h1 class="custom-header-title">도서 수정</h1>
            <p class="custom-header-sub">도서 정보를 최신으로 업데이트해주세요.</p>
        </div>
    	
        <%@ include file="dbconn.jsp"%>
        <%
            String bookId = request.getParameter("id");

            if (conn == null) {
                throw new SQLException("데이터베이스 연결 객체가 null입니다. dbconn.jsp를 확인하세요.");
            }

            PreparedStatement pstmt = null;
            ResultSet rs = null;
        
            String sql = "select * from book where b_id = ?";
            try { // <--- try 블록 시작
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, bookId);
                rs = pstmt.executeQuery();
                if (rs.next()) { // <--- if 블록 시작
        %>		
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box register-form-box"> 
                    <h3 class="register-heading">도서 정보 수정</h3> 
                    <div class="row mb-4">
                        <div class="col-md-4 d-flex justify-content-center align-items-center">
                            <img src="./resources/images/<%=rs.getString("b_filename")%>" alt="도서 이미지" class="img-fluid book-detail-image-thumb" />
                        </div>
                        <div class="col-md-8 text-start">
                            <form name="updateBook" action="./processUpdateBook.jsp" method="post" enctype ="multipart/form-data" class="member-form">
                                <input type="hidden" name="originalBookId" value='<%=rs.getString("b_id")%>'>
                                
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">도서코드</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="bookId" id="bookId" class="form-control elegant-input" value='<%=rs.getString("b_id")%>' readonly>
                                    </div>
                                </div>
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">도서명</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="name" id="name" class="form-control elegant-input" value='<%=rs.getString("b_name")%>' required>
                                    </div>
                                </div>
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">가격</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="unitPrice" id="unitPrice" class="form-control elegant-input" value='<%=rs.getString("b_unitPrice")%>' required>
                                    </div>
                                </div>
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">저자</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="author" class="form-control elegant-input" value='<%=rs.getString("b_author")%>' required>
                                    </div>
                                </div>
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">출판사</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="publisher" class="form-control elegant-input" value='<%=rs.getString("b_publisher")%>' required>
                                    </div>
                                </div>
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">출판일</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="releaseDate" class="form-control elegant-input" value='<%=rs.getString("b_releaseDate")%>' placeholder="yyyy/mm/dd" required>
                                    </div>
                                </div>
                        
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">상세정보</label>
                                    <div class="col-sm-9">
                                        <textarea name="description" id="description" cols="50" rows="3"
                                            class="form-control elegant-input" placeholder="100자 이상 적어주세요" required><%=rs.getString("b_description")%></textarea>
                                    </div>
                                </div>			
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">분류</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="category" class="form-control elegant-input" value='<%=rs.getString("b_category")%>' required>
                                    </div>
                                </div>
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">재고수</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="unitsInStock" id="unitsInStock" class="form-control elegant-input" value='<%=rs.getString("b_unitsInStock")%>' required>
                                    </div>
                                </div>
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">상태</label>
                                    <div class="col-sm-9 text-start d-flex align-items-center flex-wrap">
                                        <%-- 라디오 버튼 checked 속성 추가 --%>
                                        <div class="form-check form-check-inline me-3">
                                            <input type="radio" name="condition" value="New" id="conditionNew" class="form-check-input" <% if(rs.getString("b_condition").trim().equals("New")) out.print("checked"); %>>
                                            <label class="form-check-label" for="conditionNew">신규도서</label>
                                        </div>
                                        <div class="form-check form-check-inline me-3">
                                            <input type="radio" name="condition" value="Old" id="conditionOld" class="form-check-input" <% if(rs.getString("b_condition").trim().equals("Old")) out.print("checked"); %>>
                                            <label class="form-check-label" for="conditionOld">중고도서</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="radio" name="condition" value="EBook" id="conditionEBook" class="form-check-input" <% if(rs.getString("b_condition").trim().equals("EBook")) out.print("checked"); %>>
                                            <label class="form-check-label" for="conditionEBook">E-Book</label>
                                        </div>
                                    </div>				
                                </div>		
                                
                                <div class="mb-3 row form-group-custom">
                                    <label class="col-sm-3 col-form-label text-end">이미지</label>
                                    <div class="col-sm-7">
                                        <input type="file" name="bookImage" class="form-control elegant-input-file">
                                    </div>
                                </div>
                                
                                <div class="mb-3 row mt-4 justify-content-center">
                                    <div class="col-sm-10 text-center">
                                        <input type="submit" class="elegant-cute-button" value="수정" >
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            } else { // if (rs.next()) 가 false일 때, 즉 해당 ID의 책을 찾을 수 없을 때
        %>
            <div class="row align-items-md-stretch text-center">
                <div class="col-md-12">
                    <div class="h-100 p-5 content-box">
                        <p class="alert alert-warning">해당 도서 정보를 찾을 수 없습니다.</p>
                        <a href="./editBook.jsp?edit=update" class="elegant-cute-button">도서 수정 목록으로 돌아가기</a>
                    </div>
                </div>
            </div>
        <%
            } // <--- if (rs.next()) 닫는 중괄호
        } catch (SQLException e) { // <--- try 블록 닫는 중괄호
            System.out.println("SQL 오류 발생: " + e.getMessage());
            e.printStackTrace();
        %>
            <div class="row align-items-md-stretch text-center">
                <div class="col-md-12">
                    <div class="h-100 p-5 content-box">
                        <p class="alert alert-danger">데이터베이스 오류가 발생했습니다. 관리자에게 문의하세요.<br>오류: <%=e.getMessage()%></p>
                    </div>
                </div>
            </div>
        <%
        } finally { // <--- finally 블록 시작
            if (rs != null) try { rs.close(); } catch(SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch(SQLException ignore) {}
        } // <--- finally 블록 끝
        %>
        <jsp:include page="footer.jsp" />
    </div>	
</body>
</html>