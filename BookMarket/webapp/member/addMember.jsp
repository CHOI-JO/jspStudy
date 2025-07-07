<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8"> <%-- UTF-8 메타 태그 추가 --%>
    <title>회원 가입 - BookMarket</title> <%-- 타이틀 변경 --%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"> <%-- style.css 링크 경로 수정 확인 --%>

<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
        // 이메일 유효성 검사 추가 (선택 사항)
        // const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        // if (!emailRegex.test(document.newMember.mail1.value + "@" + document.newMember.mail2.value)) {
        //     alert("유효한 이메일 주소를 입력하세요.");
        //     return false;
        // }
        
        return true; // 모든 검사 통과 시 true 반환
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

    <jsp:include page="/menu.jsp" />

    <div class="container-fixed py-4">
        <div class="custom-header-box">
            <h1 class="custom-header-title">회원 가입</h1>
            <p class="custom-header-sub">BookMarket의 새로운 가족이 되어주세요.</p>
        </div>
        
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5 content-box register-form-box"> <%-- content-box 및 새로운 클래스 추가 --%>
                    <h3 class="register-heading">회원 정보 입력</h3> <%-- 새로운 클래스 추가 --%>
                    <form name="newMember" action="processAddMember.jsp" method="post" onsubmit="return checkForm()" class="member-form"> <%-- 새로운 클래스 추가 --%>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">아이디</label>
                            <div class="col-sm-4">
                                <input name="id" type="text" class="form-control elegant-input" placeholder="아이디" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">비밀번호</label>
                            <div class="col-sm-4">
                                <input name="password" type="password" class="form-control elegant-input" placeholder="비밀번호" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">비밀번호 확인</label>
                            <div class="col-sm-4">
                                <input name="password_confirm" type="password" class="form-control elegant-input" placeholder="비밀번호 확인" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">성명</label>
                            <div class="col-sm-4">
                                <input name="name" type="text" class="form-control elegant-input" placeholder="성명" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">성별</label>
                            <div class="col-sm-4 text-start d-flex align-items-center"> <%-- 텍스트 왼쪽 정렬, flexbox 사용 --%>
                                <div class="form-check form-check-inline me-3"> <%-- 라디오 버튼 간격 --%>
                                    <input name="gender" type="radio" value="남" id="genderMale" class="form-check-input" checked>
                                    <label class="form-check-label" for="genderMale">남</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="gender" type="radio" value="여" id="genderFemale" class="form-check-input">
                                    <label class="form-check-label" for="genderFemale">여</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">생일</label>
                            <div class="col-sm-8"> <%-- col-sm-10에서 8로 변경하여 간격 맞춤 --%>
                                <div class="row g-2"> <%-- g-2로 그리드 간격 조정 --%>
                                    <div class="col-sm-4">
                                        <input type="text" name="birthyy" maxlength="4" class="form-control elegant-input" placeholder="년(4자)" required>
                                    </div>
                                    <div class="col-sm-4">
                                        <select name="birthmm" class="form-select elegant-input" required>
                                            <option value="">월</option>
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="03">3</option>
                                            <option value="04">4</option>
                                            <option value="05">5</option>
                                            <option value="06">6</option>
                                            <option value="07">7</option>
                                            <option value="08">8</option>
                                            <option value="09">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" name="birthdd" maxlength="2" class="form-control elegant-input" placeholder="일" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">이메일</label>
                            <div class="col-sm-8"> <%-- col-sm-10에서 8로 변경하여 간격 맞춤 --%>
                                <div class="row g-2 align-items-center"> <%-- g-2로 그리드 간격 조정, 중앙 정렬 --%>
                                    <div class="col-sm-5">
                                        <input type="text" name="mail1" maxlength="50" class="form-control elegant-input" placeholder="이메일">
                                    </div> 
                                    <div class="col-auto text-dark">@</div> <%-- @기호 중앙 정렬, 색상 추가 --%>
                                    <div class="col-sm-5">
                                        <select name="mail2" class="form-select elegant-input">
                                            <option>naver.com</option>
                                            <option>daum.net</option>
                                            <option>gmail.com</option>
                                            <option>nate.com</option>
                                        </select>
                                    </div>
                                </div>		
                            </div>		
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">전화번호</label>
                            <div class="col-sm-4">
                                <input name="phone" type="text" class="form-control elegant-input" placeholder="전화번호" required>
                            </div>
                        </div>
                        <div class="mb-3 row form-group-custom">
                            <label class="col-sm-2 col-form-label text-end">주소</label>
                            <div class="col-sm-6">
                                <input name="address" type="text" class="form-control elegant-input" placeholder="주소" required>
                            </div>
                        </div>
                        <div class="mb-3 row mt-4 justify-content-center"> <%-- 버튼 그룹 중앙 정렬 및 상단 마진 --%>
                            <div class="col-sm-10 text-center">
                                <input type="submit" class="elegant-cute-button me-2" value="등록" > 
                                <input type="reset" class="elegant-cute-button" value="취소" onclick="reset()" >
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div> <%-- end of container-fixed --%>
    
    <jsp:include page="/footer.jsp" />  
</body>			
</html>