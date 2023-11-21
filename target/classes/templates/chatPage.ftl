<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>

<div class="container" style="margin-top: 30px; margin-bottom: 30px">
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
            Dropdown button
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
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <#list userChats as userChat>
                    <div class="card-header">
                        ${userChat.recipient.username}
                    </div>
                </#list>
            </div>
        </div>
    </div>
</div>

</@c.page>