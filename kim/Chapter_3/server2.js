const http = require('http');
const fs = require('fs');

http.createServer((req,res) =>{
    fs.readFile('./server2.html',(err,data)=>{
        if(err) {
            throw err;
        }
        res.end(data);

    });
}).listen(5501, ()=>{
    Console.log('5501번 포트에서 서버 대기중 입니다.');
});