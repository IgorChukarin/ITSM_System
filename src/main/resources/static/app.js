const stompClient = new StompJs.Client({
    brokerURL: 'ws://192.168.1.59:8080/gs-guide-websocket'
});

stompClient.onConnect = (frame) => {
    setConnected(true);
    console.log('Connected: ' + frame);
    stompClient.subscribe('/topic/greetings', (chatMessage) => {
        var content = JSON.parse(chatMessage.body).content;
        var sendingTime = JSON.parse(chatMessage.body).sendingTime;
        var sendingDate = JSON.parse(chatMessage.body).sendingDate;
        var senderId = JSON.parse(chatMessage.body).sender.id;
        var curUserId = $("#senderId").val();
        showGreeting(content, sendingTime, sendingDate, senderId, curUserId);
    });
};

stompClient.onWebSocketError = (error) => {
    console.error('Error with websocket', error);
};

stompClient.onStompError = (frame) => {
    console.error('Broker reported error: ' + frame.headers['message']);
    console.error('Additional details: ' + frame.body);
};

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#greetings").html("");
}

function connect() {
    stompClient.activate();
}

function disconnect() {
    stompClient.deactivate();
    setConnected(false);
    console.log("Disconnected");
}

function sendName() {
    stompClient.publish({
        destination: "/app/hello",
        body: JSON.stringify({
        'content': $("#content").val(),
        'chatId': $("#chatId").val(),
        'sender': {
            'id': $("#senderId").val()
        }
        })
    });
}

function showGreeting(message, sendingTime, sendingDate, senderId, curUserId) {
    console.log(senderId);
    console.log(curUserId);
    if (senderId == curUserId) {
        document.getElementById("greetings").innerHTML +=
        '<div class="media w-50 ml-auto mb-3">' +
            '<div class="media-body">' +
                '<div class="bg-primary rounded py-2 px-3 mb-2">' +
                    '<p class="text-small mb-0 text-white">' + message + '</p>' +
                '</div>' +
            '<p class="small text-muted">' + sendingTime + ' | ' + sendingDate + '</p>' +
            '</div>' +
        '</div>';
    } else {
        document.getElementById("greetings").innerHTML +=
        '<div class="media w-50 mb-3">' +
            '<img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">' +
            '<div class="media-body ml-3">' +
                '<div class="bg-light rounded py-2 px-3 mb-2">' +
                    '<p class="text-small mb-0 text-muted">' + message + '</p>' +
                '</div>' +
                '<p class="small text-muted">' + sendingTime + ' | ' + sendingDate + '</p>' +
            '</div>' +
        '</div>';
    }
    scrollChatToBottom();
}

$(function () {
scrollChatToBottom();
    $("#sendMessage").on('submit', (e) => {
        e.preventDefault();
        sendName();
        $("#content").val('');
        updateContent();
    });
    connect();
});

function updateContent() {
    $("#content").text("Новое содержимое элемента");
}

function scrollChatToBottom() {
    var chatBox = document.querySelector('.chat-box'); // Получаем контейнер чата
    chatBox.scrollTop = chatBox.scrollHeight; // Прокручиваем контейнер вниз до его нижней границы
}