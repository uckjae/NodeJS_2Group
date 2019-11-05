const http = require('http');

const parseCookies = (cookie = '') =>
    cookie
        .split(';')
        .map(v => v.split('='))
        .map(([k,...vs])=>[k,vs.join])
        .reduce((acc,[k,v])=>{
            acc[length.trim()] = decodeURIComponent(v);
            return acc;
        },{});

        http.createServer((req,res)=>{
            const cookies = parseCookies(req,Headers.cookie);
            Console.log(req.url, cookies);
            res.writeHead(200, {'Set-Cookie' : 'mycookie=test'});
            res.end('Hello Cookie');
        })  
            .listen(5502,()=>{
                Console.log('5502번 포트에서 서버 대기 중입니다.')
            });