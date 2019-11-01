const util = require ('util');
const crypto = require('crypto');

const dontUseme = util.deprecate((x,y) => {
    console.log(x + y);
}, 'dontUseme 함수는 deprecate되었으니 더 이상 사용 하지 마세요!');
dontUseme(1,2);

const randomBytesPromise = util.promisify(crypto.randomBytes);
randomBytesPromise(64)
.then((buf) => {
    console.log(buf.toString('base64'));
})
.catch((error) => {
    console.error(error);
});