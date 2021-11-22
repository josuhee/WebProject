function checkDuplicateId() {
	// new Window size
	var _width = '300';
    var _height = '100';
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2);
	var form = document.memberForm;
	
	// parameter
	var id = form.id.value;
	var role = form.role.value;
	
	//validation check
	if (id.length == 0) {
		alert("아이디를 입력해주세요.");
		return false;
	}
	
	var regId = /^[a-z]+[a-z0-9]{5,11}$/;
	if (!regId.test(id)){
		alert("아이디는 영문자로 시작하는 6~12자 영문자 또는 숫자이어야 합니다.");
		return false;
	}
	//만약 아이디 중복체크 안했을 때 예외처리 해줘야함,
	//쿠키로 해야하나?
	window.open("addMember_process.jsp?id=" + id + "&role=" + role,"아이디 중복 확인",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top)
}