<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>도서 편집 - BookMarket</title> <%-- 타이틀 변경 --%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"> <%-- style.css 링크 경로 수정 확인 --%>

<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 도서를 삭제합니다!!") == true)
			location.href = "./deleteBook.jsp?id=" + id;
		else
			return;
	}
</script>

</head>
<%
	String edit = request.getParameter("edit");
%>
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
            <h1 class="custom-header-title">도서 편집</h1>
            <p class="custom-header-sub">도서를 수정하거나 삭제할 수 있습니다.</p>
        </div>
    	
        <%@ include file="dbconn.jsp" %>
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box"> <%-- content-box 클래스 적용 --%>
                    <div class="row"> <%-- 도서 목록 그리드를 위한 새로운 row --%>
                    <%
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        
                        String sql = "select * from book";
                        try { // DB 연결 실패 시 예외 처리 추가 (NullPointerException 방지)
                            if (conn == null) {
                                throw new SQLException("데이터베이스 연결 객체가 null입니다. dbconn.jsp를 확인하세요.");
                            }
                            pstmt = conn.prepareStatement(sql);
                            rs = pstmt.executeQuery();
                            while (rs.next()) {
                    %>
                                <div class="col-md-4 mb-4"> <%-- col-md-4에 하단 여백 mb-4 추가 --%>
                                    <div class="h-100 p-2 book-item-card"> <%-- book-item-card 클래스 재활용 --%>
                                        <img src="./resources/images/<%=rs.getString("b_filename")%>" style="width: 200px; height:280px; object-fit: cover; border-radius: 10px;" class="img-fluid" />
                                        <h5 class="mt-3"><b><%=rs.getString("b_name")%></b></h5>
                                        <p class="text-muted"><%=rs.getString("b_author")%></p>
                                        <p class="mb-2"><%=rs.getString("b_publisher")%> | <b><%=String.format("%,d", rs.getInt("b_unitPrice"))%>원</b></p>
                                        <p class="book-description"> <%=rs.getString("b_description").substring(0, Math.min(rs.getString("b_description").length(), 60))%>....</p>
                                        <p>
                                            <%
                                                if (edit != null && edit.equals("update")) {
                                            %>
                                                <a href="./updateBook.jsp?id=<%=rs.getString("b_id")%>" class="elegant-cute-button" role="button"> 수정 &raquo;</a>
                                            <%
                                                } else if (edit != null && edit.equals("delete")) {
                                            %>
                                                <a href="#" onclick="deleteConfirm('<%=rs.getString("b_id")%>')" class="elegant-cute-button" role="button">삭제 &raquo;</a>
                                            <%
                                                }
                                            %>
                                        </p>
                                    </div>	
                                </div>			
                    <%
                            } // end of while
                        } catch (SQLException e) {
                            System.out.println("SQL 오류 발생: " + e.getMessage());
                            e.printStackTrace();
                    %>
                                <div class="col-12">
                                    <p class="alert alert-danger">도서 정보를 가져오는데 실패했습니다. 관리자에게 문의하세요.<br>오류: <%=e.getMessage()%></p>
                                </div>
                    <%
                        } finally { // 자원 해제는 finally 블록에서
                            if (rs != null) try { rs.close(); } catch(SQLException ignore) {}
                            if (pstmt != null) try { pstmt.close(); } catch(SQLException ignore) {}
                            if (conn != null) try { conn.close(); } catch(SQLException ignore) {}
                        }
                    %>
                    </div> <%-- end of row for books --%>
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp"%>
    </div>
</body>
</html>