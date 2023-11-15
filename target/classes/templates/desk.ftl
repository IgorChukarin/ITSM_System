<#import "parts/common.ftl" as c>
<@c.page>


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
         <tr>
            <th scope="row">${request.id}</th>
            <td>${request.status}</td>
            <td>${request.formattedCreationTime}</td>
            <td>${request.email}</td>
            <td>${request.name}</td>
            <td>${request.businessService.name}</td>
            <td>${request.subject}</td>
            <td>${request.text}</td>
            <td>
               <#if request.contractor??>
                  ${request.contractor.username}
               <#else>
                  <span style="color: #a5a5a5">not assigned</span>
               </#if>
            </td>
            <td style="padding: 0px">
               <form method="post" action="/desk">
                  <input type="hidden" name="requestId" value=${request.id}>
                  <input type="submit" class="btn btn-primary" value="Take"></button>
                  <input type="hidden" name="_csrf" value="${_csrf.token}" />
               </form>
            </td>
         </tr>
         </#list>
      </tbody>
   </table>
</div>

</@c.page>