---
layout: default
title: Courses in the past semesters
---

{%- assign allPastCoursesSorted = site.data.pastCourses.list | sort: 'year' -%}

This page lists the courses offered in the department in the previous semesters
<div markdown="0">
<strong>Semester:</strong>
<select class="m-4" id="myselect">
    <option value="">Select</option>
	{%- for item in allPastCoursesSorted -%}
     <option value="{{item.semester}}-{{item.year}}">{{item.semester}} {{item.year}}</option>
	{%- endfor -%}
</select>
</div>


{%- for item in allPastCoursesSorted -%}
<div id='tble{{item.semester}}-{{item.year}}'>
<table class="table table-hover">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Code</th>
      <th scope="col">Name</th>
      <th scope="col">Faculty</th>
      <th scope="col">Slot</th>
      <th scope="col">Room</th>
    </tr>
  </thead>
  <tbody>
{%- assign coursesSorted = item.courselist | sort: 'code' -%}
 {%- for mycourse in coursesSorted-%}
   {%- assign found = false -%}
    {%- for course in site.pages -%}
         {%- if course.layout == "syllabus" -%} 
           {%- assign code =  course.code | downcase  -%}
           {%- assign mycode =  mycourse.code | downcase  -%}
	    {%- if code == mycode  -%}
		    <tr>
		  {%- if course.prerevisioncode -%}
      	           <th scope="row">  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}"> {{ course.code }} </a>/ {{course.prerevisioncode}}   </th>
		  {%- else -%}
      	           <th scope="row">  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}"> {{ mycourse.code }} </a>   </th>
		  {%- endif -%}
	              <td>  {% if mycourse.name %} {{mycourse.name}} {% else %} {{course.title }} {% endif %}  </td>
	              <td>  {{ mycourse.faculty }}   </td>
	              <td>  {{ mycourse.slot }}   </td>
	              <td>  {{ mycourse.room }}   </td>
		    </tr>
	      {%- assign found = true -%}
	    {%- endif -%}
	  {%- endif -%}
	{%- endfor -%}
   {%- unless found  -%}
   {%- assign revisionnotfound = true -%}
    {%- for course in site.pages -%}
         {%- if course.layout == "syllabus" -%} 
           {%- assign code =  course.prerevisioncode | downcase  -%}
           {%- assign mycode =  mycourse.code | downcase  -%}
	    {%- if code == mycode  -%}
		    <tr>
		  {%- if course.prerevisioncode -%}
      	           <th scope="row">  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}"> {{ course.code }} </a>/ {{course.prerevisioncode}}   </th>
		  {%- else -%}
      	           <th scope="row">  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}"> {{ mycourse.code }} </a>   </th>
		  {%- endif -%}
	              <td>  {% if mycourse.name %} {{mycourse.name}} {% else %} {{course.title }} {% endif %}  </td>
	              <td>  {{ mycourse.faculty }}   </td>
	              <td>  {{ mycourse.slot }}   </td>
	              <td>  {{ mycourse.room }}   </td>
		    </tr>
	        {%- assign revisionnotfound = false -%}
	    {%- endif -%}
	  {%- endif -%}
	{%- endfor -%}
	{%- if revisionnotfound -%}
		    <tr>
      	           <th scope="row">  {{ mycourse.code }}   </th>
	              <td>  {% if mycourse.name %} {{mycourse.name}} {% else %} {{course.title }} {% endif %}  </td>
	              <td>  {{ mycourse.faculty }}   </td>
	              <td>  {{ mycourse.slot }}   </td>
	              <td>  {{ mycourse.room }}   </td>
		    </tr>
	{%- endif -%}
   {%- endunless -%}
     {%- endfor -%}
  </tbody>
</table>
</div>
{%- endfor -%}
<script>
{% for item in allPastCoursesSorted %}
	$('#tble{{item.semester}}-{{item.year}}').hide()
{% endfor %}

$('#myselect').change(function(){
var val = $(this).val();
	{% for item in allPastCoursesSorted %}
$('#tble{{item.semester}}-{{item.year}}').hide()
	{% endfor %}
 $('#tble'+val).show();   

});
</script>


