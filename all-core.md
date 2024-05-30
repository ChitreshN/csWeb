---
layout: default
title: List of all Core Courses
---


This page gives a list of all the core and elective courses that are offered in the CSE department of IIT Palakkad for B.Tech, MCaM and MSoCD programs. A list of electives offered by the department is available [here](/all-elective).

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.min.js" integrity="sha512-qzgd5cYSZcosqpzpn7zF2ZId8f/8CHmFKZ8j7mU4OUXTNRd5g+ZHBPsgKEwoqxCtdQvExE5LprwwPAgoicguNg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script id="js">$(function() {

	// initial sort set using sortList option
	$(".table").tablesorter({
		theme : 'blue',
		// sort on the second column in ascending order
		sortList: [[1,0],[1,1]]
	});
});</script>

<div markdown="0">
<strong> Courses for</strong>
<select class="m-4" id="progselect">
    <option value="all">All programs</option>
     <option value="ug"> Undergraduate (B.Tech) </option>
     <option value="mcam"> Math and Computing (MCaM) </option>
     <option value="msocd"> System on Chip Design (MSoCD) </option>
</select>
<strong>offered to the CSE students by </strong>
<select class="m-4" id="deptselect">
    <option value="all">All</option>
     <option value="cs"> CSE Department </option>
     <option value="ds"> DS Department </option>
     <option value="ee"> EE Department </option>
     <option value="hs"> Humanities Department </option>
     <option value="math"> Mathematics Department </option>
</select>
</div>


## Core Courses
<table class="table table-hover">
  <thead class="thead-light">
    <tr>
      <th scope="col">Code (New/Old)</th>
      <th scope="col">Name</th>
      <th scope="col">Credits</th>
      <th scope="col">Category</th>
      <th scope="col">Curriculum</th>
    </tr>
  </thead>
  <tbody>

 {% assign coursesSorted = site.pages | sort: 'code' %}
 {% for course in coursesSorted %}
   {% if course.show and course.status != "old" %}
    {% if course.layout == "syllabus" and course.category != "PME" and course.category != "GCE" and course.category != "ERC" %}
	<tr
	{% if course.core %}
	   {% if course.faculty %}
	     class="{{course.core | join: ' '}} {{course.faculty}}"  
	   {% else %}
	     class="{{course.core | join: ' '}} cs" 
	   {% endif %}
	{% else %}
	   {% if course.faculty %}
	     class="{{course.faculty}}"
	   {% else %}
	     class="cs"
	   {% endif %}
	{% endif %}
	> 
	      {% if course.status == "NEW" and course.prerevisioncode  %}
		  {% for e in coursesSorted %}
		    {% if e.code == course.prerevisioncode %}
			{% assign earlier = e %}
		    {% endif %}
 		  {% endfor %} 
               <th scope="row">  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}">  {{ course.code }} </a> /  <a href="/courses/{{earlier.code | downcase }}-{{ earlier.title | replace: " ", "-" }}">  {{ earlier.code }} </a>  </th>
                      <td> {% if earlier.title == course.title %} {{ course.title }} {% else %}  {{ course.title }} / {{ earlier.title }} {%endif %}  </td>
                      <td>  {% if earlier.credits == course.credits %} {{ course.credits }} {% else %}  {{ course.credits }} / {{ earlier.credits }} {% endif %}  </td>
                      <td>  {% if earlier.category == course.category %} {{ course.category }} {% else %} {{ course.category }} / {{ earlier.category }} {% endif %}   </td>
                      <td>
                        {% for prog in course.core %} 
                         {% if prog == "ug" and course.curriculum  %}
                          <a href="/btech-curriculum-{{course.curriculum}}/">UG {{course.curriculum}}</a> 
                         {% elsif prog == "mcam" %}
                          <a href="/mcam-curriculum/">MCaM {{course.curriculum}}</a> 
                         {% elsif prog == "msocd" %}
                          <a href="/msocd-curriculum/">MSoCD {{course.curriculum}}</a> 
                         {% endif %}
                        {% endfor %}/
			{% for prog in earlier.core %} 
                         {% if prog == "ug" and earlier.curriculum  %}
                          <a href="/btech-curriculum-{{earlier.curriculum}}/">UG {{earlier.curriculum}}</a> 
                         {% elsif prog == "mcam" %}
                          <a href="/mcam-curriculum/">MCaM {{earlier.curriculum}}</a> 
                         {% elsif prog == "msocd" %}
                          <a href="/msocd-curriculum/">MSoCD {{earlier.curriculum}}</a> 
                         {% endif %}
                        {% endfor %}

                        </td>
		{% else %}
		       <th scope="row">  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}">  {{ course.code }} </a> </th>
                      <td> {{ course.title }}  </td>
                      <td>  {{ course.credits }}  </td>
                      <td>  {{ course.category }}   </td>
                      <td>
                        {% for prog in course.core %} 
                         {% if prog == "ug" and course.curriculum  %}
			   {% if course.curriculum.first %}
                          <a href="/btech-curriculum-{{course.curriculum[0]}}/">UG {{course.curriculum[0]}}</a> & <a href="/btech-curriculum-{{course.curriculum[1]}}/">UG {{course.curriculum[1]}}</a>  
			   {% else %}
                          <a href="/btech-curriculum-{{course.curriculum}}/">UG {{course.curriculum}}</a> 
			   {% endif %}
                         {% elsif prog == "mcam" %}
                          <a href="/mcam-curriculum/">MCaM {{course.curriculum}}</a> 
                         {% elsif prog == "msocd" %}
                          <a href="/msocd-curriculum/">MSoCD {{course.curriculum}}</a> 
                         {% endif %}
                        {% endfor %}
                        </td>
		{% endif %}
		</tr>
    {% endif %}
   {% endif %}
 {% endfor %}

  </tbody>
</table>


<script>

$('#deptselect').change(function(){
     var d = $(this).val();
     if (d == 'all'){
	     $('.cs').show();
	     $('.ee').show() ;
	     $('.math').show();
	     $('.hs').show();
	     $('.ds').show();
     }else {
	
	     $('.cs').hide();
	     $('.ee').hide() ;
	     $('.math').hide();
	     $('.hs').hide();
	     $('.ds').hide();

     var p = $('#progselect').val();

     if (p != 'all') { 
	/*     $('.ug').hide();
	     $('.mcam').hide();
	     $('.msocd').hide(); */
	     $('.'+p+'.'+d).show();   
       } else
         {$('.'+d).show();   } 
	
     }

  //   console.log("dept d = " + d + " p = " + p);
});
$('#progselect').change(function(){
     var p = $(this).val();
     if (p == 'all'){
	     $('.ug').show();
	     $('.mcam').show() ;
	     $('.msocd').show();
     }else {
	
     $('.ug').hide();
     $('.mcam').hide();
     $('.msocd').hide();

     var d = $('#deptselect').val();
     if (d != 'all'){
	     $('.'+p+'.'+d).show();   
	
      } else{
	     $('.'+p).show();   
	} 
	
     }
//     console.log("dept d = " + d + " p = " + p);
});


</script>


