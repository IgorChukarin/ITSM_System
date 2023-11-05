<#import "parts/common.ftl" as c>

<@c.page>
<h4>Name: ${userName}</h4>
<br>
<form action="/logout" method="post" style="margin-top: 30px; margin-bottom: 400px">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit">log out</button>
</form>
</@c.page>