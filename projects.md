---
layout: default
title: Projects
---

# Sponsored Projects 
This page lists the set of ongoing and completed funded projects undertaken by faculty members.
## Ongoing projects




 {% if site.data.phdAlumni.list[0] %}
<div class="col-md-12">
    {% assign projectList = site.data.projects.list  %}
    <table class="table table-sm">
    <thead> <tr>
        <th> Project Name  </th>
        <th> Duration </th>
        <th> Principal Investigators  </th>
        <th> Funding agency </th>
        </tr>
    </thead>
    <tbody>
     {% for project in projectList %}
        <tr>
        <td> {{ project.projectdetails }} </td>
        <td> {{ project.duration}} </td>
        <td> {{ project.principalinvestigators}} </td>
        <td> {{ project.fundingagency }} </td>
        </tr>
     {% endfor %}
    </tbody>
    </table>
</div>
 {% endif %}

## Completed Projects
