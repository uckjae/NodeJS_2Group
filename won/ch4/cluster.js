const cluster = require('cluster');
const http = require('http');
const numCPUs = require('os').cpus().length;

if(cluster.isMaster){
	console.log(`마스터 프로세스 아이디 : ${process.pid}`);
	for(let i = 0; i < numCPUs; i++){ // cpu개수만큼 워커 생성
		cluster.fork();
	}
	cluster.on('exit',(worker, code, signal)=>{
		console.log(`${worker.process.pid}번 워커가 종료`);
	});
}else{
	http.createServer((req,res)=>{
		res.write('<h1>hello node</h1>');
		res.end('<p>hello server</p>');
		setTimeout(()=>{
			process.exit(1);
		}, 1000);
	}).listen(8090);
	console.log(`${process.pid}번 워커실행`);
}