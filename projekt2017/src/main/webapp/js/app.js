
var   stompMessageList=null;
function connectionListMessage(){
    var socket=new SockJS('/gs-guide-websocket');
    stompMessageList=Stomp.over(socket);
    stompMessageList.connect({},function (frame) {
        console.log('Connection messages list: '+frame);
        stompMessageList.subscribe('/topic/list2',function (list) {
            showMessageList(JSON.parse(list.body));
        });
    });

}

function sendMessage() {
    var date_now = new Date();
    var dateMessage = date_now.getHours() + ":" + date_now.getMinutes() + ":" + date_now.getSeconds() + " " + date_now.toDateString();


    var topic_id=$("#topic-id-var").val();
    var user_id=$("#user-id-var").val();
    var mess_text=$("#mess-text").val();



    stompMessageList.send("/app/"+topic_id+"/"+user_id+"/newMessage",{},mess_text+"</br><small> "
        + dateMessage + "</small>");

}

function showMessageList(messages) {
$("#listMessages").empty();

    $.each(messages,function (i,message) {
        var messages_var="<li class='list-group-item'>" +
        "<div class='d-flex w-100 justify-content-between'><h5 class='mb-1'>" + message.nameUser + "</h5></div>" +
        "<p class='mb-1'>" + message.textMessage + "</p></li>";


        $('#listMessages').append(messages_var);
    });

}

$(function () {

    connectionListMessage();
    $("form").on('submit',function(e){
        e.preventDefault();
    });

    $("#btn-send").click(function () {sendMessage(); $("#mess-text").val("");  })


})

