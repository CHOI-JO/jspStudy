<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>배송 정보 - BookMarket</title> <%-- 타이틀 변경 --%>

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
            <h1 class="custom-header-title">배송 정보</h1>
            <p class="custom-header-sub">정확한 배송을 위해 정보를 입력해주세요.</p>
        </div>
    	
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box"> <%-- content-box 클래스 적용 --%>
                    <form action="./processShippingInfo.jsp" method="post" class="shipping-form"> <%-- 새로운 shipping-form 클래스 추가 --%>
                        <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>">
                            
                        <div class="mb-3 row form-group-custom"> <%-- 새로운 form-group-custom 클래스 추가 --%>
                            <label class="col-sm-2 col-form-label text-end">성명</label> <%-- 텍스트 오른쪽 정렬 --%>
                            <div class="col-sm-4">
                                <input type="text" name="name" class="form-control elegant-input" required> <%-- elegant-input 클래스 추가, required 속성 --%>
                            </div>
                        </div>
                        
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">배송일</label>
                            <div class="col-sm-4">
                                <input type="text" name="shippingDate" class="form-control elegant-input" placeholder="yyyy/mm/dd" required> <%-- placeholder, required 추가 --%>
                            </div>
                        </div>		
                        
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">국가명</label>
                            <div class="col-sm-4">
                                <input type="text" name="country" class="form-control elegant-input" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">우편번호</label>
                            <div class="col-sm-4">
                                <input type="text" name="zipCode" class="form-control elegant-input" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">주소</label>
                            <div class="col-sm-6">
                                <input type="text" name="addressName" class="form-control elegant-input" required>
                            </div>
                        </div>
                        
                        <div class="mb-3 row button-group mt-4 justify-content-center"> <%-- 버튼 그룹 중앙 정렬 및 상단 마진 --%>
                            <div class="col-sm-10 text-center"> <%-- col-sm-offset-2 대신 중앙 정렬 --%>
                                <a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="elegant-cute-button me-2" role="button"> 이전 </a> 
                                <input type="submit" class="elegant-cute-button me-2" value="등록" /> 
                                <a href="./checkOutCancelled.jsp" class="elegant-cute-button" role="button"> 취소 </a>
                            </div>
                        </div>

                    </form>
                </div> <%-- end of content-box --%>
            </div>
        </div>
    </div> <%-- end of container-fixed --%>
    
<jsp:include page="footer.jsp" />
</body>
</html>