function joinform_check() {
  var id = document.getElementById("id");
  var pw = document.getElementById("pw");
  var repw = document.getElementById("repw");
  var name = document.getElementById("name");
  var tel = document.getElementById("tel");
  var email = document.getElementById("email");
  var region = document.getElementById("region");

  if (id.value == "") {
    alert("아이디를 입력하세요.");
    id.focus();
    return false;
  };
  var uidCheck = ^[a-zA-Z0-9]+$;

  if (!uidCheck.test(id.value)) {
    alert("아이디는 특수문자를 사용할 수 업습니다.");
    id.focus();
    return false;
  };

  if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  };

  if (repwd.value !== pwd.value) {
    alert("비밀번호가 일치하지 않습니다..");
    repw.focus();
    return false;
  };

  if (name.value == "") {
    alert("이름을 입력하세요.");
    name.focus();
    return false;
  };
  
  if (tel.value == "") {
    alert("전화번호를 입력하세요.");
    tel.focus();
    return false;
  };
  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

  if (!reg.test(tel.value)) {
    alert("전화번호는 숫자만 입력할 수 있습니다.");
    tel.focus();
    return false;
  }

  if (email.value == "") {
    alert("이메일 주소를 입력하세요.");
    email.focus();
    return false;
  }

  if (!region.checked) { //체크박스 미체크시
    alert("지역을 선택하세요.");
    region.focus();
    return false;
  }

  //입력 값 전송
  document.register_form.submit(); //유효성 검사의 포인트   
}

//아이디 중복체크 팝업창(현재 공백문서)
function id_check() {
  //window.open("팝업될 문서 경로", "팝업될 문서 이름", "옵션");
  window.open("", "", "width=600, height=200, left=200, top=100");
}
