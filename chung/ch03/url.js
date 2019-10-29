const url = require(`url`);

const URL = url.URL;
const myURL = new URL(`http://www.gilbut.co.kr/book/bookList.aspx?sercate1=001001000#anchor`);
console.log(`new URL():`,myURL);
console.log(`url.format():`,url.format(myURL)); //두 종류 url 모두 사용할 수 있다 
console.log(`-------------------`);
const parsedUrl = url.parse(`http://www.gilbut.co.kr/book/bookList.aspx?sercate1=001001000#anchor`); //주소를 분해
console.log(`url.parse() :`, parsedUrl);
console.log(`url.format():`,url.format(parsedUrl));
