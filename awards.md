---
layout: default
title: Awards and achievements
---

<div class="container">
 {% if site.data.awards.list %}
  {% assign sortedByDate = site.data.awards.list | sort: 'date' | reverse %}
   <div class="row">
  {% for item in sortedByDate %}
    <div class="p-4 card card-primary full-width-fixed">
     <div class="card-header text-success"> <strong>{{item.date | date_to_long_string}} </strong> - {{item.title}} </div>
      <div class="card-body">
      {{item.description | markdownify | remove: '<p>' | remove: '</p>' }} 
      </div>
    </div>
  {% endfor %}
 {% endif %}
</div>

