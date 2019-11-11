const https =require('http');
const fs =require('fs');

http.createServer({
    cert:fs.readFileSync('도메인 인승서 경로'),
    key:fs.readFileSync('도메인 비밀키 경로'),
    ca:[
        fs.readFileSync('상위 인승서 경로'),
        fs.readFileSync('상위 인증서 경로'),
    ],
},(req,res)=>{
    res.write('<h1>hello node!</h1>');
    res.end('<p>hello server!</p>');
}).listen(443,()=>{
    console.log('443 포트에서 서버 대기 중 입니다!');
});