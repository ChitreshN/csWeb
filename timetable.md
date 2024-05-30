---
layout: default
title: Schedule and Timetable
---
This page lists the semester schedule and course slotting information for the current semester.

# Institute-wide slot system

|Time|8:00-8:50|9:00-9:50|10:00-10:50| 11:00-11:50| 12:05-12:55|13:00-13.50| 14:00-15:15 | 15:30-16:45 | 17:10-18:00 |
|---|:---:|:---:|:---:|:---:|:--:|:---:|:---:|:---:|:-:|
|Mon|M1|A|B|C|H| :  : |I|J|E1|
|^^ |^^ |^^|  PM1 |||^^ Lunch    | PA1||^^ |
|Wed|M3|A|B|C|H| ^^ Break |Q (14:00 -- 14:50) |R (15:00 -- 15:50)|EML from 16:00 |
|^^ |^^ |^^|  PM3 |||^^    | PA3||^^ |^^ |
|Fri|M5|A|B|C|H| ^^  |I|J|E5|
|^^ |^^ |^^|  PM5 |||^^    | PA5||^^ |

<br>

|Time|08:00-08:50|09:00-10:15|10:30-11:45| 12:00-12:50| 13:00-13.50| 14:00-15:15 | 15:30-16:45 | 17:10-18:00|
|---|:---:|:---:|:---:|:---:|:--:|:---:|:---:|:---:|:-:|
|Tue|M2|F|G|D| :  : |K| L|E2|
|^^ |^^ | PM2 ||^^|^^ Lunch|PA2 ||^^|
|Thu|M4|F|G|D|^^ Break  |K| L|E4|
|^^ |^^ | PM4 ||^^| ^^       |PA4 ||^^|

**Overview of Slots**
* Note - Numbers in slot names refer to the days of the week. For example, 1=Monday, 2=Tuesday etc.
* A, B, C and H - 3 credit slots (3 * 50 mins each)
* F, G, I , J, K and L - 3 credit slots (2 * 75 mins each)
* D is a 2 credit slot (2 * 50 mins) 
* M1-M5, E1-E2, E4-E5, Q and R are 1 credit slot (50 mins each) 
* PM1, PM3 and PM5 are morning lab slots (10:00 hrs to 12:45 hrs) 
* PM2 and PM4 are morning lab slots (09:00 hrs to 11:45 hrs)
* PA1, PA2, PA4 and PA5 are afternoon lab slots of 2 hrs 45 mins (14:00 to 16:45 hrs)
* PA3 is an afternoon lab slot of 1hr 50 mins (14:00 hrs to 15:50 hrs)

# Courses to slots mapping for the current semester

## Regular courses
<table class="table table-hover">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Code</th>
      <th scope="col">Name</th>
      <th scope="col">Faculty</th>
      <th scope="col">Slot</th>
      <th scope="col">Room</th>
    </tr>
  </thead>
  <tbody>
        {% assign allCoursesSorted = site.data.currentCourses.list | sort: 'code' %}
	 {% for item_name in allCoursesSorted %}
	    {% for course in site.pages %}
        	 {% if course.layout == "syllabus" %}
        	    {% if course.code == item_name.code %}
		    <tr>
            {% if course.curriculum.first %}
                           <th scope="row">  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}#curriculum-2017">  {{ course.code }} </a> </th>
                       {% else %}
                           <th scope="row">  <a href="/courses/{{course.code | downcase }}-{{ course.title | replace: " ", "-" }}">  {{ course.code }} </a> </th>
                       {% endif %}
	              <td>  {{ course.title }}  </td>
	              <td>  {{ item_name.faculty }}   </td>
	              <td>  {{ item_name.slot }}   </td>
	              <td>  {{ item_name.room }}   </td>
		    </tr>
	            {% endif %}
        	 {% endif %}
	    {% endfor %}
	 {% endfor  %}
  </tbody>
</table>

## NPTEL courses

<table class="table table-hover">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Code</th>
      <th scope="col">Name</th>
      <th scope="col">Url</th>
    </tr>
  </thead>
  <tbody>
{% assign allNPTELCoursesSorted = site.data.currentNPTELCourses.list | sort : 'code' %}
 {% for course in allNPTELCoursesSorted %}
  <tr> 
   <th scope="row"> {{course.code}} </th>
   <td> {{course.title}} </td>
   <td> <a href="{{course.link}}">Link</a> </td>
  </tr>
 {% endfor %}
  </tbody>

</table>
