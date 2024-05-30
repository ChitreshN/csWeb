---
layout: default
title: B.Tech Alumni details
---

This page list all B.Tech alumni who have graduated from the CSE department, IIT Palakkad according to the year of graduation. (\*) against a student name stands for graduation with honors.


## B.Tech Alumni 
<div class="container">
 {% if site.data.btechAlumni.list[0] %}
<div class="col-md-6">
    {% assign sortedByYear = site.data.btechAlumni.list | sort: 'year'  %}
     {% for studsInYear in sortedByYear %}
	<details>
	<summary> <strong> {{ studsInYear.year }} </strong>  </summary>
	<table class="table table-sm">
	<thead> <tr> 
		<th> Name </th>
		<th> Roll number </th>
		</tr>
	</thead>
	<tbody>
	 {% assign sortedGraduants = studsInYear.graduants | sort: 'rollno' %}
         {% for stud in sortedGraduants %}
		<tr>
		<td class="text-capitalize"> {{ stud.name | downcase }} </td>
		<td>  {{ stud.rollno }}   </td>
		</tr>
	 {% endfor %}
	</tbody>
	</table>
	</details>
     {% endfor %}
</div>
 {% endif %}
</div>

