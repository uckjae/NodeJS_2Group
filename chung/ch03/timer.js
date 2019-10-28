//timeer 기능 제공하는 setTimeout,setInterval,setImmediate /global 객체 안에 있다 
//setTimeout(콜백함수,밀리초): 주어진 밀리초 이후에 콜백함수를 실행 
//setInterval(콜백함수,밀리초): 주어진 밀리초마다 콜백함수를 반복실행 
//setImmediate(콜백함수): 콜백함수 즉시 실행 

//clearTimeout(아이디): setTimeout 취소
//clearInterval(아이디) : setInterval  취소 
//clearImmediate(아이디) : setImmediate 취소 
const timeout = setTimeout(() => {
    console.log(`1.5초 후 실행`)
},1500);

const interval = setInterval(() => {
    console.log (`1초마다 실행`);
},1000);

const timeout2 = setTimeout(() => {
    console.log(`실행되지 않습니다`);
},3000);

setTimeout(() => {
    clearTimeout(timeout2);
    clearInterval(interval);
},2500);

const immediate = setImmediate(() => {
    console.log(`즉시 실행`);
});

const immediate2 = setImmediate(() => {
    console.log(`실행되지 않습니다`);
});

clearImmediate(immediate2);