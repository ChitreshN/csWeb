---
layout: default
title: Staff and Post Doctoral Fellows
---
This page lists the staff and post doctoral fellows in the department.
# Staff members of CS Office
<div class="container">
 {% if site.data.staff.list[0] %}
  {% assign sortedByRollno = site.data.staff.list | sort: 'name'  %}
  {% for person in sortedByRollno %}
    {% if person.name %}
   <div class="row m-4 justify-content-center align-items-center">
     <div class="col-md-4">
        <img src="/assets/img/staff/{{person.email}}.jpg" class="rounded img-thumbnail">
     </div>
	   <div class="col-md-7">
	    <h5>{{ person.name }}</h5>
	   <ul> 
	    <li> <strong> Office</strong>:  {{ person.office }}  </li>
	    <li> <strong> Designation</strong>:  {{ person.designation }}  </li>
	    <li> <strong>Email: </strong> {{person.email}}@iitpkd.ac.in  </li>
	    <li> <strong>Details: </strong> {{person.details}}  </li>
	   </ul>
	   </div>
    </div>
    {% endif %}
	<br>
  {% endfor %}
 {% endif %}
</div>



# Post Doctoral Fellows
<div class="container">
 {% if site.data.postdoc.list[0] %}
  {% assign sortedByRollno = site.data.postdoc.list | sort: 'name'  %}
  {% for pdf in sortedByRollno %}
    {% if pdf.name %}
   <div class="row m-4 justify-content-center align-items-center">
     <div class="col-md-4">
        <img src="/assets/img/postdoc/{{ pdf.email}}.jpg" class="rounded img-thumbnail">
     </div>
	   <div class="col-md-7">
       {% if pdf.url %}
	    <a href="{{pdf.url}}"><h5>{{ pdf.name }}</h5></a> 
       {% else %}
	    <a href="https://iitpkd.ac.in/people/{{pdf.email}}"><h5>{{ pdf.name }}</h5></a> 
       {% endif %}
	   <ul> 
	    <li> <strong> Research area</strong>:  {{ pdf.research}}  </li>
	    <li> <strong> Host</strong>:  {{ pdf.host }}  </li>
	    <li> <strong>Email: </strong> {{pdf.email}}@iitpkd.ac.in  </li>
	   </ul>
	   </div>
    </div>
    {% endif %}
	<br>
  {% endfor %}
 {% else %}
   Currently there are no postdocs in the department.
 {% endif %}

</div>


