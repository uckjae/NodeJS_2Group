//3.4.4
console.log(__filename);
console.log(__dirname);
//.3.5
//exports.odd='홀수';
//exports.even='짝수';
//3.4.6.1
setImmediate(() => {
    console.log('immediate');
  });
  process.nextTick(() => {
    console.log('nextTick');
  });
  setTimeout(() => {
    console.log('timeout');
  }, 0);
  Promise.resolve().then(() => console.log('promise'));
//3.4.6.3
  let i = 1;
setInterval(() => {
  if (i === 5) {
    console.log('종료!');
    process.exit();
  }
  console.log(i);
  i += 1;
}, 1000);
//3.5.1
const os = require('os');

console.log('운영체제 정보---------------------------------');
console.log('os.arch():', os.arch());
console.log('os.platform():', os.platform());
console.log('os.type():', os.type());
console.log('os.uptime():', os.uptime());
console.log('os.hostname():', os.hostname());
console.log('os.release():', os.release());

console.log('경로-----------------------------');
console.log('os.homedir():', os.homedir());
console.log('os.tmpdir():', os.tmpdir());

console.log('cpu 정보-----------------');
console.log('os.cpus():', os.cpus());
console.log('os.cpus().length:', os.cpus().length);

console.log('메ah리 정보-----------------------------------');
console.log('os.freemem():', os.freemem());
console.log('os.totalmem():', os.totalmem());
//3.5.2
const path = require('path');

const string = __filename;

console.log('path.sep:', path.sep);
console.log('path.delimiter:', path.delimiter);
console.log('------------------------');
console.log('path.dirname():', path.dirname(string));
console.log('path.extname():', path.extname(string));
console.log('path.basename():', path.basename(string));
console.log('path.basename():', path.basename(string, path.extname(string)));
console.log('-------------------------');
console.log('path.parse()', path.parse(string));
console.log('path.format():', path.format({
dir: 'C:\\users\\zerocho',
name: 'path',
ext: '.js',
}));
console.log('path.normalize():', path.normalize('C://users\\\\choi\\\path.js'));
console.log('--------------------');
console.log('path.isAbsolute():', path.isAbsolute('C:\\'));
console.log('path.isAbsolute():', path.isAbsolute('./home'));
console.log('---------------------');
console.log('path.relative():', path.relative('C:\\users\\choi\\path.js', 'C:\\'));
console.log('path.join():', path.join(__dirname, '..', '..', '/choi', '.', '/ch03'));
console.log('path.resolve():', path.resolve(__dirname, '..', 'choi', '.', '/ch03'));
//3.5.3
const url = require('url');

const { URL } = url;
const myURL = new URL('http://www.gilbut.co.kr/book/bookList.aspx?sercate1=001001000#anchor');
console.log('new URL():', myURL);
console.log('url.format():', url.format(myURL));
console.log('------------------------');
const parsedUrl = url.parse('http://www.gilbut.co.kr/book/bookList.aspx?sercate1=001001000#anchor');
console.log('url.parse():', parsedUrl);
console.log('url.format():', url.format(parsedUrl));

const { URL } = require('url');

const myURL = new URL('http://www.gilbut.co.kr/?page=3&limit=10&category=nodejs&category=javascript');
console.log('searchParams:', myURL.searchParams);
console.log('searchParams.getAll():', myURL.searchParams.getAll('category'));
console.log('searchParams.get():', myURL.searchParams.get('limit'));
console.log('searchParams.has():', myURL.searchParams.has('page'));
console.log('searchParams.keys():', myURL.searchParams.keys());
console.log('searchParams.values():', myURL.searchParams.values());

myURL.searchParams.append('filter', 'es3');
myURL.searchParams.append('filter', 'es5');
console.log(myURL.searchParams.getAll('filter'));

myURL.searchParams.set('filter', 'es6');
console.log(myURL.searchParams.getAll('filter'));

myURL.searchParams.delete('filter');
console.log(myURL.searchParams.getAll('filter'));

console.log('searchParams.toString():', myURL.searchParams.toString());
myURL.search = myURL.searchParams.toString();
//3.5.4
const url = require('url');
const querystring = require('querystring');

const parsedUrl = url.parse('http://www.gilbut.co.kr/?page=3&limit=10&category=nodejs&category=javascript');
const query = querystring.parse(parsedUrl.query);
console.log('querystring.parse():', query);
console.log('querystring.stringify():', querystring.stringify(query));
//3.5.5
const crypto = require('crypto');

console.log('base64:', crypto.createHash('sha512').update('비밀번호').digest('base64'));
console.log('hex:', crypto.createHash('sha512').update('비밀번호').digest('hex'));
console.log('base64:', crypto.createHash('sha512').update('다른 비밀번호').digest('base64'));

const crypto = require('crypto');

crypto.randomBytes(64, (err, buf) => {
  const salt = buf.toString('base64');
  console.log('salt:', salt);
crypto.pbkdf2('비밀번호', salt, 100000, 64, 'sha512', (err, key) => {
 console.log('password:', key.toString('base64'));
  });
});

const crypto = require('crypto');

const cipher = crypto.createCipher('aes-256-cbc', '열쇠');
let result = cipher.update('암호화 할 문장', 'utf8', 'base64');
result += cipher.final('base64');
console.log('암호화:', result);

const decipher = crypto.createDecipher('aes-256-cbc', '열쇠');
let result2 = decipher.update(result, 'base64', 'utf8');
result2 += decipher.final('utf8');
console.log('복호화:', result2);
//3.5.6
const util = require('util');
const crypto = require('crypto');
const dontUseMe = util.deprecate((x, y) => {
  console.log(x + y);
}, 'dontUseMe 함수는 deprecated되었으니 더 이상 사용하지 마세요!');
dontUseMe(1, 2);

const randomBytesPromise = util.promisify(crypto.randomBytes);
randomBytesPromise(64)
  .then((buf) => {
    console.log(buf.toString('base64'));
  })
  .catch((error) => {
    console.error(error);
  });
  //3.6
  const fs = require('fs');
fs.readFile('./readme.txt', (err, data) => {
  if (err) {
    throw err;}
  console.log(data);
  console.log(data.toString());
});

const fs = require('fs');

fs.writeFile('./writeme.txt', '글이 입력됩니다', (err) => {
  if (err) {
    throw err;
  }
  fs.readFile('./writeme.txt', (err, data) => {
 if (err) {
   throw err;
   }
 console.log(data.toString());
  });
});
//3.6.1
const fs = require('fs');

console.log('시작');
fs.readFile('./readme2.txt', (err, data) => {
  if (err) {
    throw err;
  }
  console.log('1번', data.toString());
});
fs.readFile('./readme2.txt', (err, data) => {
  if (err) {
    throw err;
  }
  console.log('2번', data.toString());
});
fs.readFile('./readme2.txt', (err, data) => {
  if (err) {
    throw err;
  }
  console.log('3번', data.toString());
});
console.log('끝');

const fs = require('fs');

console.log('시작');
let data = fs.readFileSync('./readme2.txt');
console.log('1번', data.toString());
data = fs.readFileSync('./readme2.txt');
console.log('2번', data.toString());
data = fs.readFileSync('./readme2.txt');
console.log('3번', data.toString());
console.log('끝');

const fs = require('fs');

console.log('시작');
fs.readFile('./readme2.txt', (err, data) => {
  if (err) {
    throw err;
  }
  console.log('1번', data.toString());
  fs.readFile('./readme2.txt', (err, data) => {
    if (err) {
      throw err;
    }
    console.log('2번', data.toString());
    fs.readFile('./readme2.txt', (err, data) => {
      if (err) {
        throw err;
      }
      console.log('3번', data.toString());
    });
  });
});
console.log('끝');
//3.6.2
const buffer = Buffer.from('저를 버퍼로 바꿔보세요');
console.log('from():', buffer);
console.log('length:', buffer.length);
console.log('toString():', buffer.toString());
const array = [Buffer.from('띄엄 '), Buffer.from('띄엄 '), Buffer.from('띄어쓰기')];
const buffer2 = Buffer.concat(array);
console.log('concat():', buffer2.toString());
const buffer3 = Buffer.alloc(5);
console.log('alloc():', buffer3);
const fs = require('fs');

const readStream = fs.createReadStream('./readme3.txt', { highWaterMark: 16 });
const data = [];

readStream.on('data', (chunk) => {
  data.push(chunk);
  console.log('data :', chunk, chunk.length);
});

readStream.on('end', () => {
  console.log('end :', Buffer.concat(data).toString());
});

readStream.on('error', (err) => {
  console.log('error :', err);
});

const fs = require('fs');

const writeStream = fs.createWriteStream('./writeme2.txt');
writeStream.on('finish', () => {
  console.log('파일쓰기 완료');
});

writeStream.write('이글을 씁니다.\n');
writeStream.write('한번더 씁니다.');
writeStream.end();

const fs = require('fs');

const readStream = fs.createReadStream('readme4.txt');
const writeStream = fs.createWriteStream('writeme3.txt');
readStream.pipe(writeStream);

const zlib = require('zlib');
const fs = require('fs');

const readStream = fs.createReadStream('./readme4.txt');
const zlibStream = zlib.createGzip();
const writeStream = fs.createWriteStream('./readme4.txt.gz');
readStream.pipe(zlibStream).pipe(writeStream);
//3.6.3
const fs = require('fs');

fs.access('./folder', fs.constants.F_OK | fs.constants.R_OK | fs.constants.W_OK, (err) => {
  if (err) {
    if (err.code === 'ENOENT') {
      console.log('폴더 없음');
      fs.mkdir('./folder', (err) => {
        if (err) {
          throw err;
      }
   console.log('폴더만들기 성공');
        fs.open('./folder/file.js', 'w', (err, fd) => {
       if (err) {
            throw err;
          }
  console.log('빈파일 만들기 성공', fd);
          fs.rename('./folder/file.js', './folder/newfile.js', (err) => {
            if (err) {
        throw err;
          }
        console.log('이름 바꾸기 성공');
          });
        });
      });
    } else {
      throw err;
    }
  } else {
    console.log('이미 폴더 있음');
  }
});

const fs = require('fs');

fs.readdir('./folder', (err, dir) => {
  if (err) {
    throw err;
  }
  console.log('폴더 내용 확인', dir);
  fs.unlink('./folder/newFile.js', (err) => {
    if (err) {
      throw err;
    }
    console.log('파일 삭제 성공');
    fs.rmdir('./folder', (err) => {
      if (err) {
        throw err;
      }
      console.log('폴더 삭제 성공');
    });
  });
});

const fs = require('fs');

fs.copyFile('readme4.txt', 'writeme4.txt', (error) => {
  if (error) {
    return console.error(error);
  }
  console.log('복사 완료');
});

//3.7
const EventEmitter = require('events');
const myEvent = new EventEmitter();
myEvent.addListener('event1', () => {
  console.log('이벤 1');
});
myEvent.on('event2', () => {
  console.log('이벤 2');
});
myEvent.on('event2', () => {
  console.log('이벤 2 추가');
});
myEvent.emit('event1');
myEvent.emit('event2');
myEvent.once('event3', () => {
  console.log('이벤 3');
});
myEvent.emit('event3');
myEvent.emit('event3');
myEvent.on('event4', () => {
  console.log('이벤 4');
});
myEvent.removeAllListeners('event4');
myEvent.emit('event4');
const listener = () => {
  console.log('이벤 5');
};
myEvent.on('event5', listener);
myEvent.removeListener('event5', listener);
myEvent.emit('event5');
console.log(myEvent.listenerCount('event2'));
//3.8
setInterval(() => {
    console.log('시작');
    try {
      throw new Error('서버를 고장내마');
    } catch (err) {
      console.error(err);
    }
  }, 1000);
  console.log(process.argv);

  const fs = require('fs');

setInterval(() => {
  fs.unlink('./abcdefg.js', (err) => {
    if (err) {
      console.error(err);
    }
  });
}, 1000);

process.on('uncaughtException', (err) => {
    console.error('예기치 못한 에러', err);
    process.exit();
  });
  
  setInterval(() => {
    throw new Error('서버를 고장내마');
  }, 1000);
  
  setTimeout(() => {
    console.log('실행됨');
  }, 2000);
  
  








  