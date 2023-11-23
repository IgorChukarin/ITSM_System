<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>

   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
          <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
          <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
      <link rel="stylesheet" href="/static/chat.css">

   </head>



<div class="container" style="margin-top: 30px; margin-bottom: 30px">
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
            New chat
        </button>
        <div class="dropdown-menu" aria-labelledby="start new chat">
            <#list users as user>
                <form method="post" action="/chat/startChat">
                    <input name="recipientId" type="hidden" value=${user.id}>
                    <input type="submit" class="dropdown-item" value="${user.username}">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                </form>
            </#list>
        </div>
    </div>
    <br>

      <div class="row rounded-lg overflow-hidden shadow">
        <!-- Users box-->
        <div class="col-5 px-0">
          <div class="bg-white">

            <div class="bg-gray px-4 py-2 bg-light">
              <p class="h5 mb-0 py-1">Recent</p>
            </div>

            <div class="messages-box">
              <div class="list-group rounded-0">
                <#list userChats as userChat>
                <#if curChatId??>
                    <#if userChat.chatId == curChatId>
                        <a class="list-group-item list-group-item-action active text-white rounded-0">
                            <div class="media"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
                                <div class="media-body ml-4">
                                    <div class="d-flex align-items-center justify-content-between mb-1">
                                        <h6 class="mb-0">Jason Doe</h6><small class="small font-weight-bold">25 Dec</small>
                                    </div>
                                    <p class="font-italic mb-0 text-small">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
                                </div>
                            </div>
                        </a>
                    <#else>
                            <a href="/chat/${userChat.chatId}" class="list-group-item list-group-item-action list-group-item-light rounded-0">
                              <div class="media"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
                                <div class="media-body ml-4">
                                  <div class="d-flex align-items-center justify-content-between mb-1">
                                    <h6 class="mb-0">${userChat.recipient.username}</h6><small class="small font-weight-bold">14 Dec</small>
                                  </div>
                                  <p class="font-italic text-muted mb-0 text-small">Lorem ipsum dolor sit amet, consectetur. incididunt ut labore.</p>
                                </div>
                              </div>
                            </a>
                    </#if>
                <#else>
                    <a href="/chat/${userChat.chatId}" class="list-group-item list-group-item-action list-group-item-light rounded-0">
                      <div class="media"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
                        <div class="media-body ml-4">
                          <div class="d-flex align-items-center justify-content-between mb-1">
                            <h6 class="mb-0">${userChat.recipient.username}</h6><small class="small font-weight-bold">14 Dec</small>
                          </div>
                          <p class="font-italic text-muted mb-0 text-small">Lorem ipsum dolor sit amet, consectetur. incididunt ut labore.</p>
                        </div>
                      </div>
                    </a>
                </#if>
                </#list>
              </div>
            </div>
          </div>
        </div>
        <!-- Chat Box-->
        <div class="col-7 px-0">
          <div class="px-4 py-5 chat-box bg-white">
            <!-- Sender Message-->
            <div class="media w-50 mb-3"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
              <div class="media-body ml-3">
                <div class="bg-light rounded py-2 px-3 mb-2">
                  <p class="text-small mb-0 text-muted">Test which is a new approach all solutions</p>
                </div>
                <p class="small text-muted">12:00 PM | Aug 13</p>
              </div>
            </div>

            <!-- Reciever Message-->
            <div class="media w-50 ml-auto mb-3">
              <div class="media-body">
                <div class="bg-primary rounded py-2 px-3 mb-2">
                  <p class="text-small mb-0 text-white">Test which is a new approach to have all solutions</p>
                </div>
                <p class="small text-muted">12:00 PM | Aug 13</p>
              </div>
            </div>

            <!-- Sender Message-->
            <div class="media w-50 mb-3"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
              <div class="media-body ml-3">
                <div class="bg-light rounded py-2 px-3 mb-2">
                  <p class="text-small mb-0 text-muted">Test, which is a new approach to have</p>
                </div>
                <p class="small text-muted">12:00 PM | Aug 13</p>
              </div>
            </div>

            <!-- Reciever Message-->
            <div class="media w-50 ml-auto mb-3">
              <div class="media-body">
                <div class="bg-primary rounded py-2 px-3 mb-2">
                  <p class="text-small mb-0 text-white">Apollo University, Delhi, India Test</p>
                </div>
                <p class="small text-muted">12:00 PM | Aug 13</p>
              </div>
            </div>

            <!-- Sender Message-->
            <div class="media w-50 mb-3"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
              <div class="media-body ml-3">
                <div class="bg-light rounded py-2 px-3 mb-2">
                  <p class="text-small mb-0 text-muted">Test, which is a new approach</p>
                </div>
                <p class="small text-muted">12:00 PM | Aug 13</p>
              </div>
            </div>

            <!-- Reciever Message-->
            <div class="media w-50 ml-auto mb-3">
              <div class="media-body">
                <div class="bg-primary rounded py-2 px-3 mb-2">
                  <p class="text-small mb-0 text-white">Apollo University, Delhi, India Test</p>
                </div>
                <p class="small text-muted">12:00 PM | Aug 13</p>
              </div>
            </div>

          </div>

          <!-- Typing area -->
          <form action="#" class="bg-light">
            <div class="input-group">
              <input type="text" placeholder="Type a message" aria-describedby="button-addon2" class="form-control rounded-0 border-0 py-4 bg-light">
              <div class="input-group-append">
                <button id="button-addon2" type="submit" class="btn btn-link"> <i class="fa fa-paper-plane"></i></button>
              </div>
            </div>
          </form>

        </div>
      </div>
    </div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</@c.page>