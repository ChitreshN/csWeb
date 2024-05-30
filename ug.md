---
layout: default
title: Undergraduate Student List
---

This page list all the student of the undergraduate programme who are currently enrolled in the CSE department. For former members, please check the [alumni page](/alumni).

# Student list
<div class="container">
<div class="row">
 {% if site.data.btech.list[0] %}
  {% assign sortedByYear = site.data.btech.list | sort: 'year' | reverse %}
  {% for batch in sortedByYear %}
   <div class="col-md-6 justify-content-center align-items-center">
    <h3> Year {{batch.year }} batch </h3>
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
</div>


