<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>도서 등록 - BookMarket</title> <%-- 타이틀 변경 --%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"> <%-- style.css 링크 경로 수정 확인 --%>
    
    <script type="text/javascript" src="./resources/js/validation.js"></script> 
</head>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message" >
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
            <h1 class="custom-header-title">도서 등록</h1>
            <p class="custom-header-sub">새로운 도서 정보를 입력해주세요.</p>
        </div>
    	
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box register-form-box"> <%-- content-box 및 register-form-box 클래스 적용 (addMember와 유사하게) --%>
                    <div class="text-end mb-3 language-selector"> <%-- 언어 선택 부분 --%>
                        <a href="?language=ko" class="me-2 text-decoration-none text-muted">Korean</a> | 
                        <a href="?language=en" class="text-decoration-none text-muted">English</a>
                        <%-- 로그아웃 버튼은 menu.jsp에서 관리하는 것이 더 일반적입니다. 여기서는 삭제 --%>
                        <%-- <a href = "logout.jsp" class ="btn btn-sm btn-success pull right">logout</a> --%>
                    </div>	
                    <h3 class="register-heading">도서 정보 입력</h3> <%-- 제목 변경 --%>

                    <form name="newBook" action="./processAddBook.jsp" method="post" enctype ="multipart/form-data" class="member-form"> <%-- member-form 클래스 적용 (addMember와 유사하게) --%>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="bookId" /></label>
                            <div class="col-sm-4">
                                <input type="text" name="bookId" id="bookId" class="form-control elegant-input" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="name" /></label>
                            <div class="col-sm-4">
                                <input type="text" name="name" id="name" class="form-control elegant-input" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="unitPrice" /></label>
                            <div class="col-sm-4">
                                <input type="text" name="unitPrice" id="unitPrice" class="form-control elegant-input" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="author" /></label>
                            <div class="col-sm-4">
                                <input type="text" name="author" class="form-control elegant-input" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="publisher" /></label>
                            <div class="col-sm-4">
                                <input type="text" name="publisher" class="form-control elegant-input" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="releaseDate" /></label>
                            <div class="col-sm-4">
                                <input type="text" name="releaseDate" class="form-control elegant-input" placeholder="yyyy/mm/dd" required>
                            </div>
                        </div>
                
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="description" /></label>
                            <div class="col-sm-6">
                                <textarea name="description" id="description" cols="50" rows="3" 
                                    class="form-control elegant-input" placeholder="도서에 대한 자세한 설명을 100자 이상 적어주세요." required minlength="100"></textarea>
                            </div>
                        </div>			
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="category" /></label>
                            <div class="col-sm-4">
                                <input type="text" name="category" class="form-control elegant-input" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="unitsInStock" /></label>
                            <div class="col-sm-4">
                                <input type="text" name="unitsInStock" id="unitsInStock" class="form-control elegant-input" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="condition" /></label>
                            <div class="col-sm-6 text-start d-flex align-items-center flex-wrap"> <%-- 라디오 버튼 정렬 --%>
                                <div class="form-check form-check-inline me-3">
                                    <input type="radio" name="condition" value="New" id="conditionNew" class="form-check-input" checked>
                                    <label class="form-check-label" for="conditionNew"><fmt:message key="condition_New" /></label>
                                </div>
                                <div class="form-check form-check-inline me-3">
                                    <input type="radio" name="condition" value="Old" id="conditionOld" class="form-check-input">
                                    <label class="form-check-label" for="conditionOld"><fmt:message key="condition_Old" /></label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" name="condition" value="EBook" id="conditionEBook" class="form-check-input">
                                    <label class="form-check-label" for="conditionEBook"><fmt:message key="condition_Ebook" /></label>
                                </div>
                            </div>				
                        </div>		
                        
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end"><fmt:message key="bookImage" /></label>
                            <div class="col-sm-5">
                                <input type="file" name="bookImage" class="form-control elegant-input-file"> <%-- 새로운 클래스 추가 --%>
                            </div>
                        </div>
                        
                        <div class="mb-3 row mt-4 justify-content-center">
                            <div class="col-sm-10 text-center">
                                <input type="button" class="elegant-cute-button" value="<fmt:message key="button" />" onclick="CheckAddBook()">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div> <%-- end of container-fixed --%>

    <jsp:include page="footer.jsp" />
</fmt:bundle>
</body>
</html>