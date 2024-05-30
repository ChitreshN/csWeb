---
layout: default
title: Ph.D Alumni details
---

This page list all the Ph.D alumni who have graduated from the CSE department, IIT Palakkad.


## Alumni list
<div class="container">
 {% if site.data.phdAlumni.list[0] %}
<div class="col-md-6">
    {% assign sortedByYear = site.data.phdAlumni.list | sort: 'year'  %}
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
    {% assign stud_list = studsInYear.graduants | sort: 'rollno'  %}
         {% for stud in stud_list %}
		<tr>
		<td> {{ stud.name }} </td>
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

