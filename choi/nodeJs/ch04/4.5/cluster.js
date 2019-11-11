const cluster =require('cluster');
const http = require('http');
const numCPUS =require('os').cpus().length;

if(cluster.isMaster){
    console.log('마스터 프로세스 아이디:${process.pid}');
    for(let i=0; i<numCPUS; i+=1){
        cluster.fork();
    }
    cluster.on('exit',(Worker, code, signal)=>{
        console.log('${worker.process.pid}번 워커가 종료되었습니다.');
    });
    
}else{
    http.createServer((req,res)=>{
        res.write('<h1>hello node!</h1>');
        res.end('<p>hello cluster!</p>');
    }).listen(8085);
    console.log('${prodess.pid}번 워커 실행');
}