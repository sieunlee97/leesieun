const express = require('express')
const PORT = process.env.PORT || 5000
//socket.io 관련기술: https://poiemaweb.com/nodejs-socketio
//const PORT2 = 5001;//포트를 서비스별로 분리가 가능
//예, 댓글: 6000 reply.js, 게시판:5500 board.js, 인증서비스: 5002 login.js
//위 방식이 마이크로서비스(MSA)방식 입니다.
var app = express();
// 푸시기능, 챠트 실시간 렌더링 하는 소켓앱 시작
//http서버 객체를 생성시 app(express) 프레임워크를 전달
var http = require('http').createServer(app);
//socket.io 소켓 통신 객체생성 시 http를 객체로 전달
var io = require('socket.io').listen(http);
//.listen은 클라이언트에서 서버로 접속을 받기위해 대기하는 명령
http.listen(PORT, function(){
console.log('앱이 시작 되었습니다. 포트번호: ' + PORT);
});
var jsonMsg = { msg:'' };//io서버와 스프링간의 메세지 전송 담는 변수
//.on함수는 클라이언트에서 서버로 소켓통신의 이벤트를 대기하는 명령
io.on('connection', function(socket) {
    console.log(socket.id + ' user 접속됨');
    io.emit('OnOff', jsonMsg);//스프링의 Model같은역할-접속한 All소켓에 OnOff변수명으로 msg를 보냅니다.
    //client가 접속을 끊었을때
    //위 아래 결과 확인은 http://localhost:5000/socket.io/socket.io.js 이 소스를 사용
    socket.on('disconnect',function() {
        console.log(socket.id + ' user 접속끊어짐');
    });
    socket.on('OnOff', function(jsonMsg) {//1:1통신 받은내용
        console.log('소켓으로 받은 메세지는 '+jsonMsg.msg);
        if(jsonMsg.msg == 'updateRender') {
        io.emit('OnOff', jsonMsg);//1:다 통신으로 보냅니다.
        }
    });
});