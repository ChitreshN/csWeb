---
layout: default
title: Publications
---
List of publications of all faculty members and students associated with CSE department, IIT Palakkad.

<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.4/jquery.simplePagination.min.js" integrity="sha512-J4OD+6Nca5l8HwpKlxiZZ5iF79e9sgRGSf0GxLsL1W55HHdg48AEiKCXqvQCNtA1NOMOVrw15DXnVuPpBm2mPg==" crossorigin="anonymous"></script>

<ul>
{% include pubs.html %}
<ul>


<div markdown="0">
<script>
jQuery(function($) {
    var pageParts = $(".paginate");

    var numPages = pageParts.length;
    var perPage = 8;

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
<ul id="pagination-container" class="p-3 pagination"></ul>
