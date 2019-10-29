const odd="홀수 입니다.";
const even="짝수 입니다.";

/*
exports.odd="홀수 입니다.";
exports.even="짝수 입니다.";
*/

// 다른 파일에서 var.js를 불러오면 module.exports에 대입된 변수를 사용 할 수 있다.
module.exports ={
    odd,
    even
};