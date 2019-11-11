const http =require('http');
http.createServer((req,res) =>{
    res.write('<h1>hello node!</h1>');
    res.end('<p>hello server!</P>');
}).listen(8099,()=>{
    console.log('8080포트에서 서버 대기 중 입니다.');
});