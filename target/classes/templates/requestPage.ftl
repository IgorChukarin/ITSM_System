<#import "parts/common.ftl" as c>
<@c.page>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/requestForm.css">
</head>
<body>
<div class="container" style="margin-top: 30px; margin-bottom: 30px">
    <nav>
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="/desk">&laquo; back</a></li>
        </ul>
    </nav>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Brief information</h5>
                    <p>
                        <span><strong>Subject:</strong> ${request.subject}</span>
                        <span><strong>Service:</strong> ${request.businessService.name}</span>
                        <span><strong>Status:</strong> ${request.status}</span>
                        <span><strong>Creation time:</strong> ${request.formattedCreationTime}</span>
                        <span><strong>Text:</strong> ${request.text}</span>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6" style="margin-top: 30px">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Contact person</h5>
                    <p>
                        <span><strong>Name:</strong> ${request.name}</span>
                        <span><strong>E-mail:</strong> ${request.email}</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6" style="margin-top: 30px">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Contractor</h5>
                    <p>
                        <#if request.contractor??>
                        <span><strong>Name:</strong> ${request.contractor.username}<span>
                        <#else>
                            <span style="color: #a5a5a5">not assigned</span>
                        </#if>
                    </p>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12" style="margin-top: 30px">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Related assets</h5>
                    <p>
                        <#list request.businessService.relatedTechnicalServices as technicalService>
                        <span>${technicalService.name}</span>
                    </#list>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>

</@c.page>