function checkList() {
	var form = document.productForm;
	
	if(form.name.value.length == 0 || form.name.value.length > 14) {
		alert('제품명은 1 ~ 13자로 입력해주세요.');
		form.name.focus();
		return false;
	}
	if (form.price.value.length == 0 || isNaN(form.price.value)){
		alert('가격은 숫자만 입력해주세요.');
		form.price.select();
		form.price.focus();
		return false;
	}
	if (form.unitsInStock.value.length == 0 || isNaN(form.unitsInStock.value)) {
		alert('재고는 숫자만 입력해주세요.');
		form.unitsInStock.select();
		form.unitsInStock.focus();
		return false;
	}
	if(form.description.value.length == 0) {
		alert('제품 설명을 기입해주세요.');
		form.description.value.focus();
		return false;
	}
	
	form.submit();
}