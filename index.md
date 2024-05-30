---
layout: home
title: CSE @ IIT Palakkad
---


<div class="container-fluid">
    <div class="row mb-3 mt-4 mt-md-0">
        <div class="col-lg-2 align-text-top">
            <h4 class="text-center"> Quick Links </h4> 
		<ul class="list-group">
		  <li class="list-group-item"> <a href="/feed.xml">  <strong> Notifications </strong> <i class="fas fa-rss sm" style="color: #f57900;"></i> </a></li>
		  <li class="list-group-item"><a href="/admissions"> Admissions</a></li> 
		  <li class="list-group-item"><a href="/dgrc"> Grievance Redressal Cell </a></li> 
		  <li class="list-group-item"><a href="/awards">Awards</a></li>
		  <li class="list-group-item"><a href="/department-colloquium">Department Colloquium</a></li>
		  <li class="list-group-item"><a href="/talks">Talks</a></li>
		  <li class="list-group-item"><a href="/timetable">Courses & Timetable</a></li>
		  <li class="list-group-item"><a href="/positions">Open Positions</a></li>
		
		</ul>
        </div>
	<div class="text-justify col-lg-9">
	The Computer Science and Engineering (CSE) department at Indian
	Institute of Technology Palakkad is a vibrant discipline that is committed to
	the advancement of knowledge through world-class teaching and high-impact
	research. It unravels the fundamentals of CSE to the students in a systematic
	and logical manner. Students are prepared for pioneering roles in the industry
	and academia by being trained in state-of-the-art topics through courses and
	projects. Faculty members, through their research, contribute to expanding the
	boundaries of scientific knowledge and develop innovative technologies for
	solving real-world problems.

	<div class="center col-lg-8 p-4">
	  {% include carousel.html duration="6500" %}
	</div>

	The department currently offers an undergraduate program (BTech in CSE), two
	interdisciplinary postgraduate programs (MTech in Computing and Mathematics,
	and MTech in System-on-Chip Design), and two research programs (MS and PhD). 

	The curricula introduces students to state-of-the-art technologies through well
	designed courses and encourages innovation through projects. The curriculum
	undergoes regular revisions to keep pace with the ever-changing needs of the
	community.
        </div>
    </div>
</div>
<div class="mobile-view">
<h2> Activities </h2>
<ul>
<li> <a href="/announce">Announcements</a> </li>
<li> <a href="/awards">Awards</a> </li>
<li> <a href="/workshops">Workshops</a> </li>
<li> <a href="/talk-series">Talk Series</a> </li>
</ul>
</div>


<!-- flex-md-row -->
<div class="desktop-view">
<div class="d-flex justify-content-center"> 
      <div class="col-md-5 m-4 border rounded  shadow-sm"> 
        <h2>Announcements  </h2>
        {% assign sortedAnnounce = site.data.announce.list | sort: "date" | reverse %}
			<ul>
	        {% for i  in (0..2) %}
		 	 <li> <strong> {{sortedAnnounce[i].date| date_to_long_string }} </strong>:  {{sortedAnnounce[i].title | markdownify | remove: '<p>' | remove: '</p>' }}  </li>
		 	{% endfor %}
			</ul>   
	<div class="text-lg-right"> <a href="/announce">(see all)</a> </div>
      </div>
      <div class="col-md-5 m-4 border rounded  shadow-sm"> 
        <h2>Awards and achievements</h2>
        {% assign sortedAnnounce = site.data.announce.list | sort: "date" | reverse %}
			{% assign sortedAwards = site.data.awards.list | sort: "date" | reverse %}
		<ul>
        {% for i in (0..2) %}
 		 <li> <strong> {{sortedAwards[i].date | date_to_long_string }} </strong>:  {{sortedAwards[i].title}}  </li>
 		{% endfor %}
		</ul>   
	<div class="text-lg-right"> <a href="/awards">(see all)</a> </div>
      </div>
</div>
</div>
 <div class="d-flex justify-content-center">
    <div class="col-md-11 m-4 border rounded  flex-md-row shadow-sm">
    <h2>Upcoming Talks and Seminars <a href="/past-talks">(Past talks)</a></h2>
        {% assign allSortedTalks = site.data.talks.list |  reverse%}
        {% capture today %}{{ 'now' | date: '%s' }}{% endcapture %}
        {% assign found = false %}
		<ul>
        {% for talk in allSortedTalks %}
        	{% capture talkdate %}{{talk.date | date: '%s'}}{% endcapture %}
			{% comment %} Ugly fix to force jekyll to treat strings as numbers {% endcomment %}
			{% assign talkdate = talkdate | plus: 0 %}
			{% assign today = today | plus: 0 %}
			{% if talkdate > today and talk.show  %}
		 		 <li> <strong> {{talk.date | date_to_long_string}} </strong>: ({{talk.speaker}}) - <a href="/talks#{{talk.title | slugify}}">{{talk.title}}</a>  </li>
		 		 {% assign found = true %}
			{% endif %}
	 	{% endfor %}
	{% assign allSortedTalkSeries = site.data.talkseries.list | reverse %}
        {% for talk in allSortedTalkSeries %}
        	{% capture talkdate %}{{talk.date | date: '%s'}}{% endcapture %}
			{% comment %} Ugly fix to force jekyll to treat strings as numbers {% endcomment %}
			{% assign talkdate = talkdate | plus: 0 %}
			{% assign today = today | plus: 0 %}
			{% if talkdate > today and talk.show  %}
		 		 <li> <strong> {{talk.date | date_to_long_string}} </strong>: ({{talk.speaker}}) - <a href="/talk-series#{{talk.title | slugify}}">{{talk.title}}</a>  </li>
		 		 {% assign found = true %}
			{% endif %}
	 	{% endfor %}

 
		  {% unless found  %}
		     <li> No upcoming talks </li>
		   {% endunless %}
		</ul>
     </div>
   </div>

