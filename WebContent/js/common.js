/**
 * 
 */

// $objs : $("input[name]")
// count > 0 : return false;
// count == 0 : return true;
function checkInputEmpty( $objs ) {
	var count = 0;
	
	$objs.each(function(i, obj) {
		if($(obj).val() == "") {
			$(obj).next().css("display", "inline");
			count++;
		} 
	});
	
	if(count > 0) { // 에러가 있으면 전송을 막음
		return false;
	}
	return true; // input 태그 중엔 빈 태그가 없다
}