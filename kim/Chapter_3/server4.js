const http = require('http');
const fs = require('fs');
const url = require('url');
const qs = require('querystring');

const parseCookies = (cookie = '')=>
cookie
.split(';')
        .map(v => v.split('='))
        .map(([k,...vs])=>[k,vs.join])
        .reduce((acc,[k,v])=>{
            acc[length.trim()] = decodeURIComponent(v);
            return acc;
        },{});
http.createServer((req,res)=>{
    const cookies = parseCookies(req.headers.cookie);
    if(req.url.startsWith('/login')){
        const {query} = url.parse(req.url);
        const {name} = qs.parse(query);
        const expries = new Date();
        expries.setMinutes(expries.getMinutes() + 5);
        res.writeHead(302, {
            Location: '/',
            'Set-Cookie': `name=${encodeURIComponent(name)}
            Expries =${expries.toGMTString()}; HttpOnly; Path=/`,
        });
        res.end();
    }else if(cookies.name){
        res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8'});
        res.end(`${cookies.name}님 안녕하세요`);
    } else {
        fs.readFile('./server4.html',(err,data)=>{
            if(err){
                throw err;
            }
            res.end(data);
        });
    }
})
    
.listen(5503,() => {
    Console.log('5503번 포트에서 서버 대기중 입니다.')
});