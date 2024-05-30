---
layout: default
title: List of courses running currently
---
<ul>

 {% for item_name in site.data.currentCourses.list %}
   {% assign found = false %}
    {% for course in site.pages %}
         {% if course.layout == "syllabus" %} 
           {% assign code =  course.code | downcase  %}
	    {% if code == item_name.code %}
              <li>   <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}"> {{ course.title }} </a>  </li>
	      {% assign found = true %}
            {% endif %}
         {% endif %}
    {% endfor %}
   {% unless found  %}
     <li> Course {{item_name.code}} not found </li>
   {% endunless %}
 {% endfor  %}
</ul>
