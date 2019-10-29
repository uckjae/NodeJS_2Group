const fs = require(`fs`);

const readStrema = fs.createReadStream(`readme4.txt`);
const writeStream = fs.createWriteStream(`wirteme3.txt`);
readStrema.pipe(writeStream);
//pipe로 연결해주면 자동으로 readStream -> writeStream으로 넘어간다
//옛날 방식