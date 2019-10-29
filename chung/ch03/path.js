const path = reuqire(`path`);

const string = __filename;

console.log(`path.sep:`,path.sep); //경로의 구분자 
console.log(`path.delimiter:` + path.delimiter); //환경변수 구분자 
console.log(`------------------------`);
console.log(`paht.dirname(): ` , path.dirname(string)); 
console.log(`path.extname():`, path.extname(string));
console.log(`path.basename():`,path.basename(string));
console.log(`path.basename`,path.basename(string,path.extname(string)));
console.log(`------------------------`);
console.log(`paht.parse(): ` , path.parse(string)); //경로

console.log(`path.normalize() :` + path.normalize()); //정상경로로 변환 
console.log(`path.isAbsolute() : `, path.isAbsolute(`C:\\`));  //경로
console.log(`path.relative(): `, path.relative(`C:\\users`));
console.log(`path.join():`, path.join(__dirname,`...`,`...`,`users`,`.`));
