document.addEventListener("turbo:load", function() {
    let forms = document.getElementsByTagName("form");
    let inputs = document.getElementsByClassName("quantity");

    console.log(forms)
    console.log(inputs)

    for (let i = 0; i < inputs.length; i++) {
        inputs[i].addEventListener("change", function() {
            forms[i].submit();
        })
    }
})