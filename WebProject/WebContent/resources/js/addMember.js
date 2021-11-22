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
		form.id.focus();
		return false;
	}

	window.open("addMember_process.jsp?id=" + id + "&role=" + role,"아이디 중복 확인",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top)
}

function checkPasswd() {
	var form = document.memberForm;
	var passwd = form.passwd.value;
	var passwd_check = form.passwd_check.value;
	
	var regPasswd = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
	
	if (!regPasswd.test(passwd)) {
		alert('비밀번호는 영문자와 숫자가 적어도 하나는 들어간 6~12자 영문자 또는 숫자이어야 합니다.');
		return false;
	}
	if (passwd != passwd_check) {
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
	form.submit();
}

function before_id() {
	const target = document.getElementById('submit_btn');
	target.disabled = true;
}