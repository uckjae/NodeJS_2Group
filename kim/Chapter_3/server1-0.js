const http = require('http');

http.createServer((req ,  res) => {
    res.write('<h1>Hello Node</h1>');
    res.end('<p>Hello Server!</p>');

});
server.listen(5500);
server.on('listening',()=>{
    console.log('5500번 포트에서 서버 대기 중입니다!');
});
server.on('error',(error) => {
    console.error(error);
});