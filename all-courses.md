---
layout: minimal
full-width: true
title: Yearwise Courses and Instructors details
---


This page gives the yearwise lists of all [core courses](#core-courses) and [elective courses](#elective-courses) offered so far in the department in the past semesters along with the instructors.

**Tentative Page. Under construction.**

## Core courses

{% assign  pastCourseListAllYears = site.data.pastCourses.list | sort: 'year' | reverse %}
<table class="table table-hover table-striped w-auto table-bordered ">
  <thead  class="thead-dark ">
    <tr>
      <th scope="col">Course Code</th>
      <th scope="col">Course Name</th>
      <th scope="col">Category</th>
      {%- for item in pastCourseListAllYears -%}
       {%- assign sem = item.semester | append: " " | append: item.year  -%}
       <th scope="col">{{sem}}</th>
      {%- endfor -%}
    </tr>
  </thead>
  <tbody>
 {%- assign coursesSorted = site.pages | sort: 'code' -%}
 {%- for course in coursesSorted -%}
    {%- assign courseCode = course.code | downcase -%}
    {%- if course.layout == "syllabus" and course.category != "PME" and course.category != "GCE" and course.category != "ERC" -%}
    <tr>
    <th scope="row"> {{course.code}} </th> <td> {{course.title}} </td>  <td> {{course.category}} </td> 
  {%- for pastCourseInfo in pastCourseListAllYears -%}
     {%- assign found = false -%}
      {%- for pcourse in pastCourseInfo.courselist -%}
       {%- assign pcourseCode = pcourse.code | downcase -%}
         {%- if courseCode == pcourseCode -%}
         <td> {{pcourse.faculty}} </td>
 	 {%- assign found = true -%}
         {%- endif -%}
      {%- endfor -%}
     {%- unless found -%}
       <td> </td>
     {%- endunless -%}
       
  {%- endfor -%}
   </tr>
    {%- endif -%}
 {%- endfor -%}
 </tbody>
</table>


## Elective Courses
<table class="table table-hover table-striped w-auto table-bordered ">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Course Code</th>
      <th scope="col">Course Name</th>
      <th scope="col">Category</th>
      {%- for item in pastCourseListAllYears -%}
       {%- assign sem = item.semester | append: " " | append: item.year  -%}
       <th scope="col">{{sem}}</th>
      {%- endfor -%}
    </tr>
  </thead>
  <tbody>
 {%- assign coursesSorted = site.pages | sort: 'code' -%}
 {%- for course in coursesSorted -%}
    {%- assign courseCode = course.code | downcase -%}
    {%- if course.layout == "syllabus" and course.category == "PME" or course.category == "GCE" or course.category == "ERC" -%}
    <tr>
    <th scope="row"> {{course.code}} </th> <td> {{course.title}} </td>  <td> {{course.category}} </td> 
  {%- for pastCourseInfo in pastCourseListAllYears  -%}
     {%- assign found = false -%}
      {%- for pcourse in pastCourseInfo.courselist -%}
       {%- assign pcourseCode = pcourse.code | downcase -%}
         {%- if courseCode == pcourseCode -%}
         <td> {{pcourse.faculty}} </td>
 	 {%- assign found = true -%}
         {%- endif -%}
      {%- endfor -%}
     {%- unless found -%}
       <td> </td>
     {%- endunless -%}
       
  {%- endfor -%}
   </tr>
    {%- endif -%}
 {%- endfor -%}
 </tbody>
</table>


