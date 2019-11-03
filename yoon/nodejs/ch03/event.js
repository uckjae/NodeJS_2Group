const EventEmitter = require('events');

const myevent = new EventEmitter();
myevent.addListener('event1', () => {
    console.log('이벤트 1');
});

myevent.on('event2', () => {
    console.log('이벤트 2');
});

myevent.on('event2', () => {
    console.log('이벤트 2 추가');
});

myevent.emit('event1');
myevent.emit('event2');

myevent.once('event3', () => {
    console.log('이벤트 3');
});
myevent.emit('event3');
myevent.emit('event3');

myevent.on('event4', () => {
    console.log('이벤트 4');
});
myevent.removeAllListeners('event4');
myevent.emit('event4');

const listener = () => {
    console.log('이벤트 5');
};

myevent.on('event5', listener);
myevent.removeAllListeners('event5', listener());
myevent.emit('event5');

console.log(myevent.listenerCount('event2'));