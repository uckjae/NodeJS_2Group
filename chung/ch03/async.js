//시작 끝 123,213 등 순서가 다르게 나온다 >> 반복실행할 때마다 결과가 달라진다 
//비동기 메서드들은 백그라운드에 해당 파일을 읽으라고만 요청하고 다음 작업으로 넘어간다
//파일 읽기 요청을 세번 보낸 후 `끝`을 찍는다 >> 읽기가 끝나면 백그라운드가 다시 메인 스레드에 알림을 주고 메인 스레드는 등록된 콜백함수 실행 
//동기 vs 비동기: 함수가 바로 return 되는지 여부 
//블로킹 vs 논블로킹 : 백그라운드 작업 완료 여부  

const fs = require(`fs`);

console.log(`시작`);
fs.readFile(`./readme2.txt`,(err,data) => {
    if(err){
        throw err;
    }
    console.log(`1번`,data.toString());
});
fs.readFile(`./readme2.txt`,(err,data) =>{
    if(err){
        throw err;
    }
    console.log(`2번`,data.toString());
});
fs.readFile(`./readme2.txt`,(err,data) =>{
    if(err){
        throw err;
    }
    console.log(`3번`,data.toString());
});
console.log(`끝`);
