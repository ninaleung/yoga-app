/** Place/load this code after scripts.js **/
$(window).ready(function() {

  /** jQuery UI **/

        /** Slider 2
        ******************** **/
        $( "#slider2" ).slider({
          range: "min",
          animate: true,
          value: 0,
          min: 0,
          max: 50,
          step: 10,
          slide: function(event, ui) {
            $("#amount").val("$" + ui.value);
          }
        });
              
        $("#amount").val( "$" + $("#slider2").slider("value"));
        $("#slider2").slider("pips", { rest: "label", prefix: "$", suffix: "" });
        $("#slider2").slider("float", { prefix: "$", suffix: "", pips: true });

});