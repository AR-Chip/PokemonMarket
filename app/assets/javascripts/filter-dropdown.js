document.addEventListener("turbo:load", function(e) {
    const filterDropdown = document.getElementsByClassName("filter-dropdown")[0];
    const filterContainer = document.getElementsByClassName("filter-container")[0];
    const select = document.querySelector("select#type");

    let filterClickHandler = (e) => {
        if (e.target === select || e.target.localName === "option") {
            return;
        }

        filterDropdown.style.display = 
            filterDropdown.style.display == "block" ?
            "none" : "block";
    };

    filterContainer.addEventListener("click", filterClickHandler);
});

