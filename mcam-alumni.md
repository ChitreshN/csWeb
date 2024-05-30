---
layout: default
title: MCaM Alumni details
---

This page list all MCaM alumni who have graduated from the CSE department, IIT Palakkad according to the year of graduation.


## Alumni List
<div class="container">
 {% if site.data.mcamAlumni.list[0] %}
<div class="col-md-6">
    {% assign sortedByYear = site.data.mcamAlumni.list | sort: 'year'  %}
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
         {% for stud in studsInYear.graduants %}
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

