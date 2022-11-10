function joinform_check() {
  var pw = document.getElementById("pw");
  var name = document.getElementById("name");
  var nickName = document.getElementById("nickName");
  var tel = document.getElementById("tel");
  var email = document.getElementById("email");
  var city = document.getElementById("city");
  var region = document.getElementById(city.value);
  var gender = document.getElementById("gender");
 
  var uidCheck = /^[a-zA-Z0-9]+$/;
  var upwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
  var uemailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  var utelCheck = /^[0-9]+$/;
  var ucityCheck = city.options[city.selectedIndex].value;
  var ugenderCheck = gender.options[gender.selectedIndex].value;
  
  if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  } else if (!upwCheck.test(pw.value)) {
    alert("최소 8자리 이상, 영어 대소문자, 숫자, 특수문자 포함해주세요");
    id.focus();
    return false;
  } else if (name.value == "") {
    alert("이름을 입력하세요.");
    name.focus();
    return false;
  } else if (nickName.value == "") {
    alert("닉네임을 입력하세요.");
    name.focus();
    return false;
  } else  if (tel.value == "") {
    alert("전화번호를 입력하세요.");
    tel.focus();
    return false;
  } else if (!utelCheck.test(tel.value)) {
    alert("숫자만 입력해주세요.");
    tel.focus();
    return false;
  } else if (ucityCheck == "") {
    alert("지역을 선택하세요.");
    return false;
  } else if (region.options[region.selectedIndex].value == "") {
    alert("지역을 선택하세요.");
    return false;
  } else if (ugenderCheck == "") {
    alert("성별을 선택하세요.");
    return false;
  } else if (email.value == "") {
    alert("이메일 주소를 입력하세요.");
    email.focus();
	return false;
	};

  //입력 값 전송
  document.getElementById('modify').submit(); //유효성 검사의 포인트   
};