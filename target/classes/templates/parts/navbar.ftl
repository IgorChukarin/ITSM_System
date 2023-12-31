<#include "security.ftl">
<#import "login.ftl" as l>
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="/">ITSM</a>

      <#if isAuthorised>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item">
               <a class="nav-link" href="/">Services</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/desk">Desk</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/chat">Chat</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
               <a class="nav-link" href="/user">User list</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/registration">Add user</a>
            </li>
            </#if>
         </ul>
         <@l.logout />
      </#if>

   </nav>
</div>