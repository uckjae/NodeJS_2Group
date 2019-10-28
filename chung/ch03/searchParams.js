const { URL } = require(`url`);

const myURL = new URL(`http://www.gilbut.co.kr/?page=3&limit=10&category=nodejs&category=javascript`); //myURL이라는 주소객체를 만듦 
console.log(`searchParams:`,myURL.searchParams);
console.log(`searchParams.getAll():`,myURL.searchParams.getAll(`category`)); //모든 키를 가져온다 
console.log(`searchParams.get():`,myURL.searchParams.get(`limit`)); //첫번째 키를 가져온다 
console.log(`searchParams.has():`,myURL.searchParams.has(`page`)); //해당키가 있는지 조사 

console.log(`searchParams.keys():`,myURL.searchParams.keys()); //반복기 객체로 가져온다 
console.log(`searchParams.values():`,myURL.searchParams.values()); //모든 값을 반복기 객체로 가져온다 

myURL.searchParams.append(`filter`,`es3`);  //키 값을 추가한다 / 같은 키값이 있다면 유지하고 하나 더 추가한다 
myURL.searchParams.append(`filter`,`es5`);
console.log(myURL.searchParams.getAll(`filter`));

myURL.searchParams.set(`filter`,`es6`); //모든 키의 값을 지우고 새로 추가 
console.log(myURL.searchParams.getAll(`filter`));

myURL.searchParams.delete(`filter`); //해당 키 제거 
console.log(myURL.searchParams.getAll(`filter`));

console.log(`searchParams.toString():`,myURL.searchParams.toString());
myURL.search = myURL.searchParams.toString();

