---
layout: default
title:  Program Overview
---
This page gives an overview of all the programs offered by CSE, IIT Palakkad.

### Overview of our programs
The BTech in CSE program was started in 2015 with an intake of 30 students,
which has grown to 50 in the last cycle of admissions. 
<!-- BTech -->
{% if site.data.btech.list[0] %}
  {% assign total_btech = 0 %}
 {% for batch in site.data.btech.list %}
	{% assign total_btech = total_btech |plus: batch.studentlist.size %}
 {% endfor %}
{% endif %}
<!-- Scholars -->
{% if site.data.scholars.list[0] %}
  {% assign total_ms = 0 %}
  {% assign total_phd = 0 %}
  {% for scholar in site.data.scholars.list %}
    {% if scholar.program == "PhD" %}
      {% assign total_phd = total_phd | plus: 1 %}
    {% endif %}

    {% if scholar.program == "MS" %}
      {% assign total_ms = total_ms | plus: 1 %}
    {% endif %}

  {% endfor %}
{% endif %}
<!-- Masters -->
{% if site.data.mcam.list[0] and site.data.msocd.list[0] %}
  {% assign total_mtech = 0 %}
 {% for batch in site.data.mcam.list %}
	{% assign total_mtech = total_mtech |plus: batch.studentlist.size %}
 {% endfor %}
 {% for batch in site.data.msocd.list %}
	{% assign total_mtech = total_mtech |plus: batch.studentlist.size %}
 {% endfor %}
{% endif %}
Currently, there are [{{total_btech}}](/ug/)
undergraduate students. The curriculum is developed with a special emphasis on
practical learning and exposure to state-of-the-art topics. Placements have
been consistently good and the alumni have a strong presence in reputed
universities both in India and abroad. The CSE stream started its research
programs in 2017 and launched two interdisciplinary MTech programs, namely
MTech in Computing and Mathematics and MTech in
System-On-Chip Design in 2020, jointly with other disciplines. Currently, there
are [{{total_mtech}}](/mtech/) students in post graduate and [{{ total_ms | plus: total_phd}}](/scholars/) in research programs. These programs
are designed to prepare students for career paths of their choice in academia
and industry.


### Student Distribution 

<!-- Chartjs needs to be loaded before it can be used -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js" integrity="sha384-hjtEWSfxVipaKknyGUhJZbhSbbepyHXBQlM78R56XnihJKl1YPeepRjUWc3aMMHH" crossorigin="anonymous"></script>

{% if total_btech != 0 and total_mtech != 0 and total_ms != 0 and total_phd != 0 %}
<div markdown="0">

<div class="col-md-8 center">
<canvas id="myChart" width="300" height="150"></canvas>

<script>

new Chart("myChart", {
type: 'pie',
    data: {
      labels: ["B.Tech", "M.Tech", "MS", "PhD"],
      datasets: [{
        label: "Number of students",
        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
        data: [{{total_btech}}, {{total_mtech}}, {{total_ms}}, {{total_phd}}]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Current student distribution'
      }
    }
   });
</script>
</div>
</div>
{% endif %}




