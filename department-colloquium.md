---
layout: default
title: CSE Department Colloquium
---

This page lists the colloquiums conducted by the Department of CSE, IIT Palakkad.

##  Talks

<script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js" integrity="sha384-Wuix6BuhrWbjDBs24bXrjf4ZQ5aFeFWBuKkFekO2t8xFU0iNaLQfp2K6/1Nxveei" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/photoset-grid/1.0.1/jquery.photoset-grid.min.js" integrity="sha512-0qNyuq+mtLXeXTYTcjYb74Nm8N04DaQHtxcggNGi1aIeL8PAcDlsi0ShHdKSyfiE8fl9MOhRckG2XGwslYPW4Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
{% assign sortedByDate = site.data.colloquium.list | reverse %}
{% assign count = sortedByDate | size %}
 {% for talk in sortedByDate %}
<h3> ({{count}})  {{talk.date | date_to_long_string }} :  <a name= '{{talk.title | slugify}}' > {{talk.title}} </a> </h3>
<ul>
<li> <strong>Speaker</strong>: {{talk.speaker}}  </li>
<li> <strong>Venue</strong>: {{talk.venue}}  </li>
<li> <strong>Abstract</strong>: {{talk.description }} </li>
</ul>

<div class="photoset-grid-custom" data-layout="{{talk.images-layout}}"  style="visibility: hidden;">
{% for img in talk.images %}
          <img src="{{img.item}}.lowres.jpg" alt="{{talk.speaker}} photos" data-highres="{{img.item}}">
{% endfor %}
</div>
{% assign count = count | minus: 1 %}
{% endfor %}

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
