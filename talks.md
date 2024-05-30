---
layout: default
title: All Talks
---
  <script>
  MathJax = {
    tex: {inlineMath: [['$', '$'], ['\\(', '\\)']]}
  };
  </script>

<script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js" integrity="sha384-Wuix6BuhrWbjDBs24bXrjf4ZQ5aFeFWBuKkFekO2t8xFU0iNaLQfp2K6/1Nxveei" crossorigin="anonymous"></script>

This page lists all the talks (offline and online) and the details at the department of Computer Science and Engineering, IIT Palakkad.
<div class="container">
 {% if site.data.talks.list %}
  {% assign sortedByDate = site.data.talks.list | reverse %}
   <div class="row">
  {% for item in sortedByDate %}
    {% if item.show %}
    <div class="col-md-12 m-4 border rounded  flex-md-row shadow-sm">
    <h3><a name="{{item.title | slugify }}">{{item.title}}</a> </h3>
	   <ul> 
	    <li> <strong>Speaker</strong>: {{item.speaker}} </li> 
	    <li> <strong>Date </strong>: {{item.date | date_to_long_string}}  </li>
	{% if item.time %}
	    <li> <strong>Time </strong>: {{item.time}}  </li>
 	{% endif %}
	    <li> <strong> Venue</strong>:  {{ item.venue | markdownify | remove: '<p>' | remove: '</p>'  }}  </li>
	    <li> <strong> Abstract</strong>:  {{ item.description | markdownify  }}  </li>
	   </ul>
     </div>
    {% endif %}
  {% endfor %}
   </div>
 {% endif %}
</div>

