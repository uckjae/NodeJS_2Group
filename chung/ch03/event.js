//events : 이벤트 만들고 호출하고 삭제
//
const EventEmitter = require(`events`);

const myEvent = new EventEmitter();
myEvent.addListener(`event1`,() => { //on과 같은 기능
   console.log(`이벤트1`);
});
myEvent.on(`event2`,() => { //이벤트이름과 이벤트 발생 시의 콜백 연결  : 이벤트 리스닝
    console.log(`이벤트2`);
});
myEvent.on(`event2`,() => {
    console.log(`이벤트2 추가`);
});

myEvent.emit(`event1`); //이벤트 호출
myEvent.emit(`event2`);

myEvent.once(`event3`,() => { //한번말 실행되는 이벤트
    console.log(`이벤트3`);
});
myEvent.emit(`event3`);

myEvent.on(`event4`,() => {
    console.log(`이벤트4`);
});

myEvent.removeAllListeners(`event4`); //모든 이벤트 리스너 삭제
myEvent.emit(`event4`);

const listener = () => {
    console.log(`이벤트 5`);
};
myEvent.on(`event5`,listener);
myEvent.removeListener(`event5`,listener); //이벤트 하나씩 제거
myEvent.emit(`event5`);

console.log(myEvent.listenerCount(`event2`));
