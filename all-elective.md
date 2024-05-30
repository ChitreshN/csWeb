---
layout: default
title: List of all Elective Courses
---
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.min.js" integrity="sha512-qzgd5cYSZcosqpzpn7zF2ZId8f/8CHmFKZ8j7mU4OUXTNRd5g+ZHBPsgKEwoqxCtdQvExE5LprwwPAgoicguNg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script id="js">$(function() {

        // initial sort set using sortList option
        $(".table").tablesorter({
                theme : 'blue',
                // sort on the first column and second column in ascending order
                sortList: [[0,0],[1,0]]
        });
});</script>



This page gives a list of all the elective courses that are offered in the CSE department of IIT Palakkad for B.Tech, MCaM and MSoCD programs.  A list of core courses is available [here](/all-core).


## Elective Courses
<table class="table table-hover">
  <thead class="thead-light">
    <tr>
      <th scope="col">Code</th>
      <th scope="col">Name</th>
      <th scope="col">Credits</th>
      <th scope="col">Category</th>
      <th scope="col">Past offerings</th>
    </tr>
  </thead>
  <tbody>

 {% assign coursesSorted = site.pages | sort: 'code' %}
 {% for course in coursesSorted %}
   {% if course.show %}
    {% if course.layout == "syllabus" and course.faculty != "ee" and  course.category == "PME" or course.category == "GCE" or course.category == "ERC" %}
     <tr> 
	 {% if course.previouscode %}
          <th scope="row">  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}">  {{ course.code }} </a> / {{course.previouscode}}  </th>
	 {% else %}
          <th scope="row">  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}">  {{ course.code }} </a>  </th>
	 {% endif %}
                      <td>  {{ course.title }}  </td>
                      <td>  {{ course.credits }}   </td>
                      <td>  {{ course.category}}   </td>
                      <td>  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}#past-offerings">Details</a>   </td>
		</tr>

    {% endif %}
   {% endif %}
 {% endfor %}

  </tbody>
</table>

    



