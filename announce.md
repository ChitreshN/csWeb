---
layout: default
title: Announcements
---

<div class="container">
 {% if site.data.announce.list %}
  {% assign sortedByDate = site.data.announce.list | sort: 'date' | reverse %}
   <div class="row">
   <ul> 
  {% for item in sortedByDate %}
    <li> <strong>{{item.date | date_to_long_string }} </strong> - {{item.title | markdownify  | remove: '<p>' | remove: '</p>' }}  </li>
  {% endfor %}
   </ul>
   </div>
 {% endif %}
</div>

