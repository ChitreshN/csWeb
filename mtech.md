---
layout: default
title: Masters program student List
---

This page list all the students of MCaM and MSoCD masters programmes who are currently enrolled in the CSE department. For former members, please check the [alumni page](/alumni).


# MSoCD student list
<div class="container">
 {% if site.data.msocd.list[0] %}
  {% assign sortedByYear = site.data.msocd.list | sort: 'year'  %}
  {% for batch in sortedByYear %}
    <h3> Joined in year {{batch.year }} </h3> 
   <div class=" col-md-6 justify-content-center align-items-center">
        <table class="table table-sm"> 
        <thead> <tr>  
                <th> Roll number </th> 
                <th> Name </th> 
                </tr> 
        </thead> 
        <tbody> 
	{% assign sortedStuds = batch.studentlist | sort : 'rollno' %}
         {% for stud in sortedStuds  %} 
                <tr> 
                <td>  {{ stud.rollno }}   </td> 
                <td class="text-capitalize"> {{ stud.name | downcase }} </td> 
                </tr> 
         {% endfor %} 
        </tbody> 
        </table>
  </div>
  {% endfor %}
 {% endif %}
</div>


# MCaM student list
<div class="container">
 {% if site.data.mcam.list[0] %}
  {% assign sortedByYear = site.data.mcam.list | sort: 'year'  %}
  {% for batch in sortedByYear %}
    <h3> Joined in year {{batch.year }} </h3> 
   <div class="col-md-6 justify-content-center align-items-center">
        <table class="table table-sm"> 
        <thead> <tr>  
                <th> Roll number </th> 
                <th> Name </th> 
                </tr> 
        </thead> 
        <tbody> 
	{% assign sortedStuds = batch.studentlist | sort : 'rollno' %}
         {% for stud in sortedStuds  %} 
                <tr> 
                <td>  {{ stud.rollno }}   </td> 
                <td class="text-capitalize"> {{ stud.name | downcase }} </td> 
                </tr> 
         {% endfor %} 
        </tbody> 
        </table>
  </div>
  {% endfor %}
 {% endif %}
</div>


