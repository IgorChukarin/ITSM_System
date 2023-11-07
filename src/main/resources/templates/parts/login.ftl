<#include "security.ftl">
<#macro login path isRegisterForm>
<div class="centered-form">
    <form action="${path}" method="post">
        <div class="form-group row">
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="Login"/>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Password" />
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Enter</#if></button>
    </form>
</div>
</#macro>

<#macro logout>
<#if !isAuthorised>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit">Log in</button>
</form>
</#if>

<#if isAuthorised>
<a href="/user/userPage/${user.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-outline-light" type="">${name}</button>
</a>
</#if>
</#macro>