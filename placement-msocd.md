---
layout: default
title: Placement statistics
---

{% if site.data.placement.list[0] %}
<!-- Chartjs needs to be loaded before it can be used -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js" integrity="sha384-9MhbyIRcBVQiiC7FSd7T38oJNj2Zh+EfxS7/vjhBi4OOT78NlHSnzM31EZRWR1LZ" crossorigin="anonymous"></script>

{% include placement.html program="MSoCD" %}

{% endif %}
