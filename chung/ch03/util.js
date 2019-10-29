//util: 각종 편의 기능을 모아둔 모듈 /deprcated되어 사라지는 경우도 있다 
//자주 사용하는 메서드 
//1. deprecate : 함수가 사라졌는지 알려준다
//2.promisify : 콜백패턴을 프로미스패턴으로 바꿔준다 

const util = require(`util`);
const crypto = require(`crypto`);

const dontUseMe = util.deprecate((x,y) => {  //deprcate(a,b) :  deprcate되었음을 알려준다 a함수가 사용되었을때 b에 경고메시지를 넣는다 
    console.log(x+y);
}, `dontUseMe 함수는 deprecated되었으니 더 이상 사용하지 마세요`);
dontUseMe(1,2);

const randomBytesPromise = util.promisify(crypto.randomBytes); //콜백패턴을 프로미스패턴으로 바꿔준다 
randomBytesPromise(64)
.then((buf) => {
    console.log(buf.toString(`base64`));
})
.catch((error) => {
    console.log(error);
});