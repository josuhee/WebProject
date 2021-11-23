function checkNumber(target) {
	alert('숫자만 입력해 주세요.' + target);
	target.value = "1";
}

function checkPrice() {
	var form = document.productForm;
	
	if (isNaN(form.price.value)){
		checkNumber(form.price.value);
	}
}