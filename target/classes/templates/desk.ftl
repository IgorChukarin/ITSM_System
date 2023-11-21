<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>

   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="/static/js/socket.js"></script>

   </head>
<body>
<h4 class="margintop50">Requests</h4>
<div class="table-responsive">
   <table class="table table-bordered">
      <thead>
         <tr>
            <th scope="col">#</th>
            <th scope="col">Status</th>
            <th scope="col">Creation time</th>
            <th scope="col">E-mail</th>
            <th scope="col">Name</th>
            <th scope="col">Business service</th>
            <th scope="col">Subject</th>
            <th scope="col">Text</th>
            <th scope="col">Contractor</th>
         </tr>
      </thead>
      <tbody>
         <#list requests as request>
         <tr <#if request.status == "COMPLETED">style="color: #a5a5a5""</#if>>
            <th scope="row"> <a href="request/${request.id}">${request.id}... </a></th>
            <td>${request.status}</td>
            <td>${request.formattedCreationTime}</td>
            <td>${request.email}</td>
            <td>${request.name}</td>
            <td>${request.businessService.name}</td>
            <td>${request.subject}</td>
            <td>${request.text}</td>




            <#if request.contractor??>
                <td>
                   ${request.contractor.username}
                </td>
                <#if !isAdmin>
                    <#if request.status == "COMPLETED">
                        <td style="background-color: #28a7455e">
                           <form method="post" action="/desk/complete">
                              <input type="hidden" name="requestId" value=${request.id}>
                              <input type="submit" class="btn center-button" value="Done" disabled></button>
                              <input type="hidden" name="_csrf" value="${_csrf.token}" />
                           </form>
                        </td>
                    <#else>
                        <#if username == request.contractor.username>
                            <td style="background-color: #28a745">
                               <form method="post" action="/desk/complete">
                                  <input type="hidden" name="requestId" value=${request.id}>
                                  <input type="submit" class="btn btn-success center-button" value="Finish"></button>
                                  <input type="hidden" name="_csrf" value="${_csrf.token}" />
                               </form>
                            </td>
                        <#else>
                            <td style="background-color: #d9dcde">
                               <form method="post" action="/desk/complete">
                                  <input type="hidden" name="requestId" value=${request.id}>
                                  <input type="submit" class="btn center-button" value="Taken" disabled></button>
                                  <input type="hidden" name="_csrf" value="${_csrf.token}" />
                               </form>
                            </td>
                        </#if>
                    </#if>
                </#if>


            <#else>
                <td>
                   <span style="color: #a5a5a5">not assigned</span>
                </td>
                <#if !isAdmin>
                    <td style="background-color: #007bff"">
                       <form method="post" action="/desk">
                          <input type="hidden" name="requestId" value=${request.id}>
                          <input type="submit" class="btn btn-primary center-button" value="Take"></button>
                          <input type="hidden" name="_csrf" value="${_csrf.token}" />
                       </form>
                    </td>
                </#if>
            </#if>




         </tr>
         </#list>
      </tbody>
   </table>
</div>
</body>

</@c.page>