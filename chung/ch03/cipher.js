//양방향 암호화 
const crypto = require('crypto');

const cipher = crypto.createCipher(`aes-256-cbc`,`열쇠`);  //(알고리즘,키) //getCiphers() >> 사용가능한 알고리즘 목록 조회할 수 있다
let result = cipher.update(`암호화할 문장`,`utf-8`,`base64`); //(문자열,인코딩,출력 인코딩) :보통 문자열은 utf-8, 암호 base64를 사용 
result += cipher.final(`base64`);  //final(출력 인코딩) : 암호화 완료 
console.log(`암호화`,result);

const decipher = crypto.createDecipher(`aes-256-cbc`,`열쇠`);
let result2 = decipher.update(result,`base64`,`utf8`); //
result2 += decipher.final(`utf8`);
console.log(`복호화:`,result2);