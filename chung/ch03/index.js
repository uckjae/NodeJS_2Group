const { odd, even } = require('./var');
const checkNumber = require('./func');

function checkStringOddOrEven(str){
    if(str.length%2){
        return odd;
    }
    return even;
}
console.log(checkNumber(10));
console.log(checkStringOddOrEven('hello'));
//index는 func와 var 모두를 참조한다. 모듈 하나가 여러개의 모듈을 사용할 수 있고 모듈 하나가 여러개의 모듈에 사용될 수 있다 
