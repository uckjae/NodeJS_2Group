//crypto 다양한 방식의 암호화를 도와주는 모듈
//비밀번호는 무조건 암호화해야한다 

const crypto = require(`crypto`);

console.log(`base64:`,crypto.createHash(`sha512`).update(`비밀번호`).digest(`base64`));
console.log(`hex:`,crypto.createHash('sha512').update(`비밀번호`).digest(`hex`));
console.log(`base64`,crypto.createHash('sha512').update(`다른 비밀번호`).digest(`base64`));