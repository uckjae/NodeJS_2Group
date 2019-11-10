//const http = require('http');
/*http.createServer((req, res) =>{
    res.write('<h1>HelloNode</h1>');
    res.end('<p>HelloServer</p>');
});.listen(8090, ()=>{
    console.log("8090번 포트에서 대기중");
});

server.listen(8090);
server.on('listening', () =>{
	console.log('8090대기중');
});
server.on('error',(error)=>{
	soncole.error(error);
});

*/

/*const fs = require('fs');

http.createServer((req,res)=>{
	fs.readFile('/ch4.html', (drr, data)=>{
		if(err)	{
			throw err;
		}
		res.end(data);
	});
}).listen(8090, ()=>{
	console.log('8090포트 대기중');
});
*/
/*
const parseCookies=(cookie='')=>{
	cookie
	.spilt(';')
	.map(v=>v.split('='))
	.map(([k, ...vs])=>[k, vs.join('=')])
	.reduce((acc, [k,v])=>{
		acc[k.trim()] = decodeURIComponent(v);
		return acc;
	},{});

http.createServer((req,res)=>{
	const cookies = parseCookies(req.headers.cookie);
	console.log(req.url, cookies);
	res.writeHead(200, {'Set-Cookie':'mycookie=test'});
	res.end('helloCookie');
	})
	.listen(8090, ()=>{
		console.log('8090에서 대기중');
	});
}*/
/*const fs = require('fs');
const url = require('url');
const qs = require('querystring');

const parseCookies = (Cookie='')=>
cookie
.spilt(';')
.map(v=>v.split('='))
.map(([k, ...vs])=>[k, vs.join('=')])
.reduce((acc, [k,v])=>{
	acc[k.trim()] = decodeURIComponent(v);
	return acc;
},{});

http.createServer((req,res)=>{
	const cookies = parseCookies(res.headers.cookie);
	if(req.url.startsWith('/login')){
		const {query} = url.parse(req.url);
		const {name} = qs.parse(query);
		const expires = new Date();
		expires.setMinutes(expires.getMinutes())+5);
res.writeHead(302, {
	Location: '/',
'Set-Cookie':`name=${encodeURIComponent(name)};
Expires = ${expires.toGMTString()}; httpOnly; Path=/`,
	});
	res.end();
}else if(cookies.name){
	res.writeHead(200, {Content-Type}: 'text/html; charset=UTF-8'});
	res.end(`${cookie.name}님 안녕하세요`);
}else{
	fs.readFile('/ch4.html', (err, data)=>{
		if(err{
			throw err;
		}
		res.end(data);
	});
}
})
.listen(8090, ()=>{
	console.log('8090 포트 대기중')
});
*/

/*const fs = require('fs');
const url = require('url');
const qs = require('querystring');

const parseCookies = (cookie='')=>
	cookie
	.spilt(';')
	.map(v=>v.split('='))
	.map(([k, ...vs])=>[k, vs.join('=')])
	.reduce((acc, [k,v])=>{
		acc[k.trim()] = decodeURIComponent(v);
		return acc;
},{});
	
const session = {};

http.createServer((req,res)=>{
	const cookies = parseCookies(req.headers.cookie);
	if(req.url.startsWith('/login')){
		const {query} = url.parse(req.url);
		const {name} = qs.parse(query);
		const expires = new Date();
		expires.setMinutes(expires.getMinutes()+5);
		const readomInt = Date.now();
		session[randomInt] = {
				name,
				expires,
		};
		res.writeHead(302, {
			Location :'/',
			'Set-Cookie': `session=${randomInt}; Expires=${expires.toGMTString()};HttpOnly;
			Path=/`,
		});
		res.end();
	}else if(cookies.session && session[cookies.session].expires>new Date()){
		res.writeHead(200, {'Content-Type': 'text/html; charset=UTF-8'});
		res.end(`${session[cookies.session].name} 님 `);
	}else {
		fs.readFile('/ch4.html', (err, data)=>{
			if(err){
				throw err;
			}
			res.end(data);
		});
	}
}).listen(8090,()=>{
	console.log('포트에서 사용중');
});

*/
/*const https = require('https'); 
const fs - require('fs');

https.createServer({ // http2 >> createSecureServer
	cert: fs.readFileSync('도메인 인증서 경로'),
	key: fs.readFileSync('도메인 비밀키 경로'),
	ca: [
		fs.readFileSync('상위 인증서 경로');
		fs.readFileSync('상위 인증서 경로');
	],
}, (req, res)=>{
	res.write('<h1>hello node</h1>');
	res.end('<p>hello server</p>');
}).listen(443, () =>{
	console.log('443포트 대기중');
});*/

