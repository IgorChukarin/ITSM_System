<#import "parts/common.ftl" as c>

<@c.page>
<div class="checkbox-container">
    <h4>${userName}</h4>
    <form action="/logout" method="post" style="margin-top: 30px;>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">log out</button>
    </form>
</div>
</@c.page>