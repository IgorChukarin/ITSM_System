const stompClient = new StompJs.Client({
    brokerURL: 'ws://192.168.1.59:8080/gs-guide-websocket'
});

stompClient.onConnect = (frame) => {
    setConnected(true);
    console.log('Connected: ' + frame);
    stompClient.subscribe('/topic/greetings', (chatMessage) => {
        showGreeting(JSON.parse(chatMessage.body).content);
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

function showGreeting(message) {
    document.getElementById("greetings").innerHTML +=
    '<div class="media w-50 ml-auto mb-3">' +
        '<div class="media-body">' +
            '<div class="bg-primary rounded py-2 px-3 mb-2">' +
                '<p class="text-small mb-0 text-white">' + message + '</p>' +
            '</div>' +
        '<p class="small text-muted">12:00 PM | Aug 13</p>' +
        '</div>' +
    '</div>';
}

$(function () {
    $("#sendMessage").on('submit', (e) => e.preventDefault());
    connect();
    $( "#send" ).click(() => sendName());
});