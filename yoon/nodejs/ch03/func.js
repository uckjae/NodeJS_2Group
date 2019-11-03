const {
    odd,
    even
} = require('./var'); // var 파일 참조

function checkOddOrEven(num) {
    if (num % 2)
        return odd;
    return even;
}

// module.exports에 checkOddOrEven 함수 넣어줌
module.exports = checkOddOrEven;