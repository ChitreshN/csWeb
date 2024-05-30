---
layout: default
title: Talk Series
---

This page lists all the talks series delivered at the department of Computer Science and Engineering, IIT Palakkad.

  <script>
  MathJax = {
    tex: {inlineMath: [['$', '$'], ['\\(', '\\)']]}
  };
  </script>

<script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js" integrity="sha384-Wuix6BuhrWbjDBs24bXrjf4ZQ5aFeFWBuKkFekO2t8xFU0iNaLQfp2K6/1Nxveei" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/photoset-grid/1.0.1/jquery.photoset-grid.min.js" integrity="sha512-0qNyuq+mtLXeXTYTcjYb74Nm8N04DaQHtxcggNGi1aIeL8PAcDlsi0ShHdKSyfiE8fl9MOhRckG2XGwslYPW4Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<div class="container">
 {% if site.data.talkseries %}
  {% assign sortedByDate = site.data.talkseries.list | reverse %}
   <div class="row">
  {% for talk in sortedByDate %}
    {% if talk.show %}
    <div class="col-md-12 m-4 border rounded  flex-md-row shadow-sm">
    <h3><a name="{{talk.title | slugify }}">{{talk.title}}</a> </h3>
	   <ul> 
	    <li> <strong>Date </strong>: {{talk.date }}  </li>
	{% if talk.time %}
	    <li> <strong>Time </strong>: {{talk.time}}  </li>
 	{% endif %}
	    <li> <strong>Speaker</strong>: {{talk.speaker}} </li> 
	    <li> <strong>Speaker bio</strong>: {{talk.speakerbio}} </li> 
	    <li> <strong> Venue</strong>:  {{ talk.venue | markdownify | remove: '<p>' | remove: '</p>'  }}  </li>
	    <li> <strong> Details</strong>:  {{ talk.description | markdownify | remove: '<p>' | remove: '</p>' }}  </li>
	   </ul>
	<div class="photoset-grid-custom" data-layout="{{talk.images-layout}}"  style="visibility: hidden;">
	{% for img in talk.images %}
		  <img src="{{img.item}}.lowres.jpg" alt="{{talk.speaker}} photos" data-highres="{{img.item}}">
	{% endfor %}
	</div>
     </div>
    {% endif %}
  {% endfor %}
    {% endif %}
</div>

<script>
$('.photoset-grid-custom').photosetGrid({
  // Set the gutter between columns and rows
  gutter: '5px',
  // Wrap the images in links
  highresLinks: true,

  onInit: function(){},
  onComplete: function(){
    // Show the grid after it renders
    $('.photoset-grid-custom').attr('style', '');
  }
});
</script>
