const http = require('http');

http.createServer((req,res) => {
    res.write('<h1>Hello Node!</h1>');
    res.end('<p>Hello Server!</p>');

}).listen(5500,() => {
    console.log('5500번 포트에서 서버 대기중 입니다!');
});