//fs: 파일 시스템에 접근하는 모듈 , 파일 생성,삭제 읽거나 쓸 수 있다 , 폴더도 생성,삭제 
const fs = require(`fs`); 

fs.readFile(`./readme.txt`,(err,data) => { //콜백함수도 readFile 메서드 인자로 넣어준다 
    if(err) {                              //콜백함수의 매개변수로 에러 또는 데이터를 받는다 
        throw err;                          
    }   
    console.log(data);  //readFile 결과물은 버퍼라는 형식으로 제공된다 (버퍼: 메모리의 데이터)
    console.log(data.toString());  //버퍼는 사람이 읽을 수 있는 형식이 아니므로 문자열로 변환 
});