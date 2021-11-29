function checkShipping() {
	var form = document.shippingForm;
	var regAddress = /^\d{5}$/;
	
	if(form.name.value.length == 0) {
		alert('성함을 입력해주세요.');
		form.name.focus();
		return false;
	}
	if (!regAddress.test(form.zipcode.value)){
		alert('우편번호 숫자 5자리를 입력해주세요.');
		form.zipcode.select();
		form.zipcode.focus();
		return false;
	}
	if(form.address.value.length == 0) {
		alert('주소를 기입해주세요.');
		form.address.value.focus();
		return false;
	}
	
	form.submit();
}