function addLanguageCheckboxes(languages) {
  // insert checkboxes 
  var choiceContainer = $("#choices");
  $.each(languages, function(key, val) {
      choiceContainer.append('<li class="language"><span><input type="checkbox" name="' + val.id +
                             '" id="' + val.name + '">' +
                             '<label for="' + val.name + '">'
                              + val.name + '</label></span></li>');
  });
  choiceContainer.find("input").click(addDataAndReplot);
}

function selectDefaultLanguages() {
  // Select Clojure
  $("#Clojure").trigger('click');
}
