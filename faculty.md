---
layout: default
title: Faculty @ CSE, IIT Palakkad
---

This page lists all the regular and adjunct faculty members associated with the CSE department of IIT Palakkad. 

* [Regular Faculties](#faculty-members)
* [Adjunct Faculties](#adjunct-faculty-members)



# Faculty Members
<div class="container">
 {% if site.data.faculty.list[0] %}
  {% assign sortedByName = site.data.faculty.list | sort: 'name' %}
  {% for prof in sortedByName %}
   <div class="row justify-content-center align-items-center">
     <div class="col-md-5">
        <img src="/assets/img/{{ prof.email }}.jpg" class="rounded img-thumbnail">
     </div>
     <div class="col-sm-7">
    <a href="{{ prof. url }}"><h3>{{ prof.name }}</h3></a> 
    <h4> {{prof.designation }} </h4> 
     {{prof.edu }} <br/>
    <strong>Area:</strong> {{ prof.research }}  <br/> 
    <strong> Email: </strong>{{ prof.email }} @ iitpkd.ac.in  
     </div>
   </div>
   <br> 
  {% endfor %}
 {% endif %}
</div>

# Adjunct Faculty members
<div class="container">
 {% if site.data.adjfaculty.list[0] %}
  {% assign sortedByName = site.data.adjfaculty.list | sort: 'name' %}
  {% for prof in sortedByName %}
   <div class="row justify-content-center align-items-center">
     <div class="col-md-5">
        <img src="/assets/img/{{ prof.email }}.jpg" class="rounded img-thumbnail">
     </div>
     <div class="col-sm-7">
    <a href="{{ prof.url }}"><h3>{{ prof.name }}</h3></a> 
    <h4> {{prof.designation }} </h4> 
     {{prof.affiliation }} <br/>
    <strong>Expertise:</strong> {{ prof.expertise}}  <br/> 
    <strong> Email: </strong>{{ prof.email }}  @ iitpkd.ac.in
     </div>
   </div>
   <br> 
  {% endfor %}
 {% endif %}
</div>



<div class="container">
 {% if site.data.vfaculty.list[0] %}
# Visiting Faculty members
  {% assign sortedByName = site.data.vfaculty.list | sort: 'name' %}
  {% for prof in sortedByName %}
   <div class="row justify-content-center align-items-center">
     <div class="col-md-5">
        <img src="/assets/img/{{ prof.email }}.jpg" class="rounded img-thumbnail">
     </div>
     <div class="col-sm-7">
    <a href="{{ prof. url }}"><h3>{{ prof.name }}</h3></a> 
    <h4> {{prof.designation }} </h4> 
     {{prof.edu }} <br/>
    <strong>Area:</strong> {{ prof.research }}  <br/> 
    <strong> Email: </strong>{{ prof.email }}
     </div>
   </div>
   <br> 
  {% endfor %}
 {% endif %}
</div>


