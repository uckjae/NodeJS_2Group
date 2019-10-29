const fs = require(`fs`);

fs.writeFile(`./writeme.txt`,`글이 입력됩니다`,(err) => {  //생성될 파일 경로, 내용
    if(err){
        throw err;
    }
    fs.readFile(`./writeme.txt`,(err,data) => {  //readFile 메서드로 파일이 제대로 생성되었는지 확인한다 
        if(err){
            throw err;
        }
        console.log(data.toString());
    });
});