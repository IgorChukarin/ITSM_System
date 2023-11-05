<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by name">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>

<a class="btn btn-primary" data-toggle="collapse" href="#collapseAdd" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Product
</a>
<a class="btn btn-primary" data-toggle="collapse" href="#collapseDelete" role="button" aria-expanded="false" aria-controls="collapseExample">
    Delete product
</a>
<a class="btn btn-primary" data-toggle="collapse" href="#collapseUpdate" role="button" aria-expanded="false" aria-controls="collapseExample">
    Edit product
</a>

<div class="collapse" id="collapseAdd">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" name="name" placeholder="Введите имя товара" required/>
            </div>
            <div class="form-group">
                <input type="text" name="cost" placeholder="Цена" required/>
            </div>
            <div class="form-group">
                <input type="text" name="tag" placeholder="Тэг" required/>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile" required/>
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div>
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>

<div class="collapse" id="collapseDelete">
    <div class="form-group mt-3">
        <form method="post" action="delete">
            <div class="form-group">
                <input type="text" name="id" placeholder="ID" required>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div>
                <button type="submit" class="btn btn-primary">Delete</button>
            </div>
        </form>
    </div>
</div>

<div class="collapse" id="collapseUpdate">
    <div class="form-group mt-3">
        <form method="post" action="update">
            <div class="form-group">
                <input type="text" name="id" placeholder="ID" required>
            </div>
            <div class="form-group">
                <input type="text" name="name" placeholder="new name">
            </div>
            <div class="form-group">
                <input type="text" name="cost" placeholder="new cost">
            </div>
            <div class="form-group">
                <input type="text" name="tag" placeholder="new tag">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div>
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    </div>
</div>


<div class="card-columns">
    <#list products as product>
    <div class="card my-3">
    <#if product.filename??>
        <img src="/img/${product.filename}" class="card-img-top">
    </#if>
    <div class="m-2">
        <span><b>id:</b> ${product.id};</span>
        <span><b>name:</b> ${product.name};</span>
        <span><b>cost:</b> ${product.cost};</span>
        <span><b>tag:</b> ${product.tag}</span>
    </div>
</div>
<#else>
No products
</#list>
</div>
</@c.page>