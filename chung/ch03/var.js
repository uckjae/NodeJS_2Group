//const odd = `홀수입니다`;
//const even = `짝수입니다`;

/*
module.exports = {
    odd,
    even,
};
*/
 exports.odd = `홀수입니다`;  //module.exports로 한번에 대입하는 대신 각각의 변수를 exprots 객체에 하나씩 넣었다 
 exports.even = `짝수입니다`;


 //module.exports 
 //module 객체 말고 exports 객체로도 모듈을 만들 수 있다 
 //동일한 결과가 나오는 이유>> module.exports와 exprots 가 같은 객체를 참조하기 때문
 //console.log(module.exprots == exports)하면 true가 나온다 

 //module.exprots에는 어떤 값이든 대입해도 되지만, exports에는 반드시 객체처럼 속성명과 속성값을 대입해야한다 
 //exports에 다른 값을 대입하면 객체의 참조관계가 끊겨 더이상 모듈로 기능하지 않는다 
 