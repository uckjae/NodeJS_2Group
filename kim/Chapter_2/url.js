const url = require('url');

const URL = url.URL;
const myURL = new ('http://www.gitbut.co.kr/book/bookList.aspx?sercate1=00100100#anchor');
console.log('new URL() :',myURL);
console.log('new URL() :',url.format(myURL));
console.log('------------------------------');
const parseUrl = url.parse('http://www.gilbut.co.kr/book/bookList.aspx?sercate1=00100100#anchor');
console.log('url.parse():', parseUrl);
console.log('url.format():',url.format(parseUrl));