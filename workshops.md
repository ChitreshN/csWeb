---
layout: default
title: Workshops
---
  <script>
  MathJax = {
    tex: {inlineMath: [['$', '$'], ['\\(', '\\)']]}
  };
  </script>

<script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js" integrity="sha384-Wuix6BuhrWbjDBs24bXrjf4ZQ5aFeFWBuKkFekO2t8xFU0iNaLQfp2K6/1Nxveei" crossorigin="anonymous"></script>

This page lists the workshops organized by the department of Computer Science and Engineering, IIT Palakkad.
<div class="container">
 {% if site.data.workshops.list %}
  {% assign sortedByDate = site.data.workshops.list | reverse %}
  {% assign count = 1 %}
  {% for item in sortedByDate %}
    <h3>({{count}}) {{item.title}} </h3>
   <div class="row">
	   <ul> 
	    <li> <strong>Date</strong>: {{item.date | date_to_long_string}}  </li>
	    <li> <strong>Link</strong>:  <a href="{{ item.link  }}">Event page</a> </li>
	   </ul>
     </div>
    {% assign count = count | plus: 1 %}
  {% endfor %}
  {% endif %}
</div>

