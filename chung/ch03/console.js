//conosle 객체: global 객체 안에 있다  
//사용 예시: 디버깅/ 변수에 값이 제대로 들어있나 확인/에러 발생 시 에러 내용을 콘솔에 표시 / 코드 실행 시간 확인
const string = 'abc';
const number = 1;
const boolean = true;
const obj = {
    outside: {
        insdie:{
            key:`value`,
        },
    },
};
console.time(`전체 시간`);
console.log(`평범한 로그입니다 쉼표로 구분해 여러 값을 찍을 수 있습니다`);
console.log(string,number,boolean);
console.log(`에러 메시지는 conosle.erro에 담아주세요`);

console.dir(obj,{colors:false,depth:2}); //(객체,옵션) 객체를 콘솔에 표시/ colors: true> 색이 추가된다 
console.dir(obj,{colors:true,depth:1}); //depth: 객체 안의 객체를 몇단계까지 보여줄것인지를 결정 

console.time(`시간 측정`);  //시간 측정 
for (let i = 0; i < 100000; i++){
    continue;
}
console.timeEnd(`시간 측정`);

function b() {
    console.trace(`에러 위치 추적`);
}
function a() {
    b();
}
a();
console.timeEnd(`전체 시간`);