const cluster = require('cluster');
const http = require('http');
const numCPUs = require('os').cpus().length;

if(cluster.isMaster) {
    Console.log(`마스터 프로세스 아이디: ${process.pid}`);
    //CPU 개수 만큼 워커를 생산
    for(let i =0; i < numCPUs; i += 1){
        cluster.fork();
    }
    //워커가 종료
    cluster.on('exit' ,(worker,code,signal)=>{
        Console.log(`${worker,code,signal} => {
            Console.log()
        }`)
    })
}