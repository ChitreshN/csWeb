---
layout: default
title: Research Scholars
---


This page list all the research scholars who are currently enrolled in the CSE department. For former members, please check the [alumni page](/alumni).


<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.4/jquery.simplePagination.min.js" integrity="sha512-J4OD+6Nca5l8HwpKlxiZZ5iF79e9sgRGSf0GxLsL1W55HHdg48AEiKCXqvQCNtA1NOMOVrw15DXnVuPpBm2mPg==" crossorigin="anonymous"></script>


<div class="container">
 {% if site.data.scholars.list[0] %}
  {% assign sortedByRollno = site.data.scholars.list | sort: 'name'  %}
  {% for stud in sortedByRollno %}
    {% if stud.name %}
  <div class="paginate">  
   <div class="row justify-content-center align-items-center">
     <div class="col-md-4">
        <img src="/assets/img/scholars/{{ stud.rollno }}.jpg" class="rounded img-thumbnail">
     </div>
	   <div class="col-md-7">
            {% if stud.url %}
	    <a href="{{stud.url}}"><h5>{{ stud.name }}</h5></a> 
	    {% else %}
	    <a href="https://iitpkd.ac.in/people/{{stud.rollno}}"><h5>{{ stud.name }}</h5></a> 
	    {% endif %}
	   <ul> 
	    <li> <strong>Program: </strong> {{stud.program}} </li> 
	    <li> <strong> Advisor(s)</strong>:  {{ stud.advisor }}  </li>
	    <li> <strong> Area</strong>:  {{ stud.area }}  </li>
	    <li> <strong>Email: </strong> {{stud.rollno}} @ smail.iitpkd.ac.in  </li>
	   {% if stud.type  %}
	     <li> <em> {{ stud.type }} </em> </li>
           {% else %}
	     <li> <em> Full time (regular) </em> </li>
	   {% endif %}
	   </ul>
	   </div>
    </div>
    </div>
    {% endif %}
  {% endfor %}
 {% endif %}
</div>

<ul id="pagination-container" class="p-3 pagination"></ul>

<div markdown="0">
<script>
jQuery(function($) {
    var pageParts = $(".paginate");

    var numPages = pageParts.length;
    var perPage = 3;

    pageParts.slice(perPage).hide();
    $("#pagination-container").pagination({
        items: numPages,
        itemsOnPage: perPage,
        cssStyle: "light-theme",
        onPageClick: function(pageNum) {
            var start = perPage * (pageNum - 1);
            var end = start + perPage;

            pageParts.hide()
                     .slice(start, end).show();
        }
    });
});
</script>

</div>
