//createReadStream: 파일을 읽는 스트림 메서드
//
const fs = require(`fs`);

const readStream = fs.createReadStream(`./readme3.txt`,{highWaterMark:16});
//두번째 파라ㅁ터: 옵션 객체 >> highWaterMark 버퍼의 크기를 정한다
const data = [];

readStream .on(`data`,(chunk) => {  //readStream은 이벤트 리스너를 붙여서 사용 . data,end,error를 붙인다
    data.push(chunk);
    console.log('data:',chunk, chunk.length);
});

readStream.on(`end`,() => { //파일을 다 읽으면 발생
    console.log(`end: `,Buffer.concat(data).toString());
});

readStream.on(`error`,(err) => {
    console.log(`error: `,err);
});