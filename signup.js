function submitSignupForm() {
    // 폼 데이터 가져오기
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    // 회원가입 요청 보내기
    fetch('/signup', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({username: username, email: email, password: password})
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        // 회원가입 성공 시 메시지 표시
        alert("회원가입 성공!");
        // 서버로부터의 응답 처리
        console.log(data);
    })
    .catch(error => {
        // 오류 처리
        console.error('There was a problem with the fetch operation:', error);
    });
}
