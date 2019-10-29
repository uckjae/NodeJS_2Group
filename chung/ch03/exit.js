//process.exit : 서버가 멈추므로 서버에는 사용하지 않는다 서버외의 독립적인 프로그램에서는 수동으로 노드를 멈추게 하기 위해 사용
let i = 1;
setInterval (() => {
    if(i === 5){
        console.log(`종료`);
        process.exit(); //프로세스 종료 
    } 
    console.log(i);
    i += 1;
},1000);