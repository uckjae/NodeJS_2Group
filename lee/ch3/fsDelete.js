const fs = require('fs');

fs.readdir('./folder',(err,dir)=>{
    if(err){
        throw err;
    }
    console.log('폴더내용확인',dir);
    fs.unlink('./folder/newFile.js',(err)=>{
        if(err){
            throw err;
        }
        console.log('파일삭제성공');
        fs.rmdir('./folder',(err)=>{
            if(err){
                throw err;
            }
            console.log('폴더삭제 성공');
        });
    });
});