---
layout: default
title: Open Positions and Internship Information
---
# Open positions
Following are a list of positions that are funded open project positions available. Each of these positions lists the qualifications, responsibilities, number of open positions and how to apply for these positions.
<div class="container ">
 {% if site.data.project.list[0] %}
       {% assign projcount =  1 %}
  {% for proj in site.data.open-pos.list %}
   <div class="row align-items-center">
           <div class="col-md-12">
            <h3>{{ projcount }}. {{ proj.name }}</h3>
           <ul>
            <li> <strong> Faculty</strong>:  {{ proj.faculty }}  </li>
            <li> <strong> Qualifications</strong>:  {{ proj.quals }}  </li>
            <li> <strong> Number of positions available: </strong> {{proj.numpos}} </li>
            <li> <strong> Responsibility: </strong> {{proj.responsibility}} </li>
            <li> <strong> How to apply: </strong>  {{ proj.apply | markdownify |  remove: '<p>' | remove: '</p>' }}</li>
           </ul>
           </div>
    </div>
      {% assign projcount = projcount | plus: 1 %}
  {% endfor %}
 {% endif %}
</div>




# Internship information
Following are a list of positions that are funded internship project positions available, where you will be guided by CSE faculty. These positions are typically aimed at UG students.
<div class="container ">
 {% if site.data.internship.list[0] %}
       {% assign projcount =  1 %}
  {% for int  in site.data.internship.list %}
   <div class="row align-items-center">
           <div class="col-md-12">
            <h3>{{ projcount}}. {{ int.name }}</h3>
           <ul>
            <li> <strong> Faculty</strong>:  {{ int.faculty }}  </li>
            <li> <strong> Number of positions available: </strong> {{int.numpos}} </li>
            <li> <strong> Duration: </strong> {{int.duration}} </li>
            <li> <strong> How to apply: </strong>  {{ int.apply | markdownify |  remove: '<p>' | remove: '</p>' }}</li>
           </ul>
           </div>
    </div>
      {% assign projcount = projcount | plus: 1 %}
  {% endfor %}
 {% endif %}
</div>



