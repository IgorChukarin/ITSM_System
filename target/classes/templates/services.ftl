<#import "parts/common.ftl" as c>
<@c.page>


<h4 class="margintop50">Business Services</h4>
<div class="table-responsive">
   <table class="table table-bordered">
      <thead>
         <tr>
            <th scope="col">#</th>
            <th scope="col">Service Line</th>
            <th scope="col">Name</th>
            <th scope="col">Work Composition</th>
            <th scope="col">Price</th>
         </tr>
      </thead>
      <tbody>
         <#list businessServices as businessService>
         <tr>
            <th scope="row">${businessService.id}</th>
            <td>${businessService.serviceLine}</td>
            <td>${businessService.name}</td>
            <td>${businessService.workComposition}</td>
            <td>${businessService.price}₽</td>
         </tr>
         </#list>
      </tbody>
   </table>
</div>
<a class="btn btn-outline-success" data-toggle="collapse" href="#colBusAdd" role="button" aria-expanded="false" aria-controls="collapseExample">
Add service
</a>
<a class="btn btn-outline-warning" data-toggle="collapse" href="#colBusUpd" role="button" aria-expanded="false" aria-controls="collapseExample">
Edit service
</a>
<a class="btn btn-outline-danger" data-toggle="collapse" href="#colBusDel" role="button" aria-expanded="false" aria-controls="collapseExample">
Delete service
</a>
<div class="collapse" id="colBusAdd">
   <div class="form-group mt-3">
      <form method="post" action="/add">
         <div class="form-group">
            <input type="text" name="serviceLine" placeholder="Service line" required/>
         </div>
         <div class="form-group">
            <input type="text" name="name" placeholder="Name" required/>
         </div>
         <div class="form-group">
            <input type="text" name="workComposition" placeholder="Work composition" required/>
         </div>
         <div class="form-group">
            <input type="number" name="price" placeholder="Price" required/>
         </div>
         <div class="checkbox-container mb-3">
            <#list technicalServices as technicalService>
               <div class="form-check">
                  <input class="form-check-input" name="selectedTechnicalServiceIds" type="checkbox" value=${technicalService.id} id="flexCheckDefault">
                  <label class="form-check-label" for="flexCheckDefault">${technicalService.name}</label>
               </div>
            </#list>
         </div>
         <input type="hidden" name="_csrf" value="${_csrf.token}" />
         <div>
            <button type="submit" class="btn btn-primary">Add</button>
         </div>
      </form>
   </div>
</div>
<div class="collapse" id="colBusDel">
   <div class="form-group mt-3">
      <form method="post" action="delete">
         <div class="form-group">
            <input type="number" name="id" placeholder="Id" required>
         </div>
         <input type="hidden" name="_csrf" value="${_csrf.token}" />
         <div>
            <button type="submit" class="btn btn-primary">Delete</button>
         </div>
      </form>
   </div>
</div>
<div class="collapse" id="colBusUpd">
   <div class="form-group mt-3">
      <form method="post" action="update">
         <div class="form-group">
            <input type="number" name="id" placeholder="Id" required>
         </div>
         <div class="form-group">
            <input type="text" name="serviceLine" placeholder="New service line">
         </div>
         <div class="form-group">
            <input type="text" name="name" placeholder="New name">
         </div>
         <div class="form-group">
            <input type="text" name="workComposition" placeholder="New work composition">
         </div>
         <div class="form-group">
            <input type="number" name="price" placeholder="New price">
         </div>
         <div class="checkbox-container mb-3">
            <#list technicalServices as technicalService>
               <div class="form-check">
                  <input class="form-check-input" name="selectedTechnicalServiceIds" type="checkbox" value=${technicalService.id} id="flexCheckDefault">
                  <label class="form-check-label" for="flexCheckDefault">${technicalService.name}</label>
               </div>
            </#list>
         </div>
         <input type="hidden" name="_csrf" value="${_csrf.token}" />
         <div>
            <button type="submit" class="btn btn-primary">Update</button>
         </div>
      </form>
   </div>
</div>


<h4 class="margintop50">Technical Services</h4>
<div class="table-responsive">
   <table class="table table-bordered">
      <thead>
         <tr>
            <th scope="col">#</th>
            <th scope="col">Service Line</th>
            <th scope="col">Name</th>
            <th scope="col">Auxiliary Element</th>
         </tr>
      </thead>
      <tbody>
         <#list technicalServices as technicalService>
         <tr>
            <th scope="row">${technicalService.id}</th>
            <td>${technicalService.serviceLine}</td>
            <td>${technicalService.name}</td>
            <td>${technicalService.auxiliaryElement}</td>
         </tr>
         </#list>
      </tbody>
   </table>
</div>
<a class="btn btn-outline-success" data-toggle="collapse" href="#colTecAdd" role="button" aria-expanded="false" aria-controls="collapseExample">
Add service
</a>
<a class="btn btn-outline-warning" data-toggle="collapse" href="#colTecUpd" role="button" aria-expanded="false" aria-controls="collapseExample">
Edit service
</a>
<a class="btn btn-outline-danger" data-toggle="collapse" href="#colTecDel" role="button" aria-expanded="false" aria-controls="collapseExample">
Delete service
</a>
<div class="collapse" id="colTecAdd">
   <div class="form-group mt-3">
      <form method="post" action="addTechnicalService">
         <div class="form-group">
            <input type="text" name="serviceLine" placeholder="Service line" required/>
         </div>
         <div class="form-group">
            <input type="text" name="name" placeholder="Name" required/>
         </div>
         <div class="form-group">
            <input type="text" name="auxiliaryElement" placeholder="AuxiliaryElement" required/>
         </div>
         <input type="hidden" name="_csrf" value="${_csrf.token}" />
         <div>
            <button type="submit" class="btn btn-primary">Добавить</button>
         </div>
      </form>
   </div>
</div>
<div class="collapse" id="colTecDel">
   <div class="form-group mt-3">
      <form method="post" action="deleteTechnicalService">
         <div class="form-group">
            <input type="number" name="id" placeholder="Id" required>
         </div>
         <input type="hidden" name="_csrf" value="${_csrf.token}" />
         <div>
            <button type="submit" class="btn btn-primary">Delete</button>
         </div>
      </form>
   </div>
</div>
<div class="collapse" id="colTecUpd">
   <div class="form-group mt-3">
      <form method="post" action="updateTechnicalService">
         <div class="form-group">
            <input type="number" name="id" placeholder="Id" required>
         </div>
         <div class="form-group">
            <input type="text" name="serviceLine" placeholder="Service line" required/>
         </div>
         <div class="form-group">
            <input type="text" name="name" placeholder="Name" required/>
         </div>
         <div class="form-group">
            <input type="text" name="auxiliaryElements" placeholder="AuxiliaryElement" required/>
         </div>
         <input type="hidden" name="_csrf" value="${_csrf.token}" />
         <div>
            <button type="submit" class="btn btn-primary">Update</button>
         </div>
      </form>
   </div>
</div>
<div style="margin-bottom: 250px">
</div>
</@c.page>