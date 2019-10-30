const fs = require('fs');

const readStream = fs.createReadStream('./readme3.txt',{highWaterMark: 16});
const data = [];

readStream.on('data',(chunck)=>{
    data.push(chunck);
    console.log('data :',chunck,chunck.length);
});
readStream.on('end',()=>{
    console.log('end:',Buffer.concat(data).toString());
});
readStream.on('error',(err)=>{
    console.log('error:',err);
});