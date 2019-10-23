Cmd
node -v : node 버전확인
npm -v : npm 버전확인
npm install -g npm :npm 업데이트

변수
let : scope이 정해져 있는 변수로 값 변경이 가능하다.
const : scope이 정해져 있는 변수로 값 변경이 **불가능**하다.

ES2015문법
`(백틱:Tab위에)으로 감싼다.
변수는 ${변수명}
```java
var num1 = 1;
var num2 = 2;
var result = 3;
var str = num1 + "더하기 " + num2 +"는 \'"+ result+"\'";

var str2=`${num1}더하기 ${num2}는 '${result}'`;
```

AJAX
- 비동기적 웹 서비스를 개발하기 위해 사용
- 페이지 이동없이 서버에 요청을 보내고 응답을 받는 기술
- 보통 JSON, axios같은 라이브러리를 이용해서 보냄

FormData
- 주로 AXAJ와 함께 사용됨
- has('key') : 해당 key값이 포함되었있나 boolean값 리턴
- get('key') : 해당 Key값의 Value를 가져온다
- getAll('key') : 해당 Key값의 모든 Value를 가져온다
- delete('key') : 해당 key를 삭제한다.
- set('key') : 해당 key의 값을 수정한다.

encodeURIComponent, decodeURIComponent
- 주소에 한글이 포함된 경우를 처리하기 위해 사용한다.

data attribute
- data attribute의 장점은 자바스크립트로 쉽게 접근이 가능하다
```html
<ul>
    <li data-id="1" , data-user-job="programmer">Zero</li>
</ul>
```
- data-id : id=1
- data-user-job : userJob=programmer



