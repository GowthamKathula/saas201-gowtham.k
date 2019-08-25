// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(function() {
  var initialize = function() {
    /*
      1. Add all your event bindings here. Please avoid binding events inline and add your event listeners here.

      onSubmit callback
      disableDuplicateSecondaryDepartment callback,...
    */
    var name=document.querySelector("#name");
    var phno=document.querySelector("#phno");
    var emailaddress=document.querySelector("#emailaddress");
    var department1=document.querySelector("#department1");
    var department2=document.querySelector("#department2");
    var button=document.querySelector(".button");
    button.addEventListener('click',onSubmit);
    department1.addEventListener("change",disableDuplicateSecondaryDepartment);
    disableDuplicateSecondaryDepartment();
    
    return [name,phno,emailaddress,department1,department2];
  };

  var disableDuplicateSecondaryDepartment = function(event) {
    
    // 2. in department2, Should disable the option selected in department1
    for(let i=0;i<4;i++){  
      if(department2.children[i].innerText==department1.value){
        department2.children[i].disabled=true;
        if(i<3){
          department2.children[i+1].selected=true;
        }
        else{
          department2.children[2].selected=true;
        }
      }
      else{
        department2.children[i].disabled=false;
      }
    }

  };

  var constructData = function() {
    var data = {};
    var values=initialize();

    // 3. Construct data from the form here. Please ensure that the keys are the names of input elements
    data.name=values[0].value;
    data.phno=values[1].value;
    data.emailaddress=values[2].value;
    data.department1=values[3].value;
    data.department2=values[4].value;
    console.log(data);
    return data;
  }

  var validateResults = function(data) {
    var isValid = true;

    // 4. Check if the data passes all the validations here
    if(data.name.length>100||data.name.length==0){
      isValid=false;
    }
    else if(data.phno.length==0||data.phno.length>10){
      isValid=false;
    }
    else if(!(/^[a-zA-Z0-9.]+@college+(?:\.edu+)$/).test(data.emailaddress)){
      isValid=false;
    }

    return isValid;
  };

  var onSubmit = function(event) {
    // 5. Figure out how to avoid the redirection on form submit
      event.preventDefault();
    var data = constructData();
    if (validateResults(data)) {
      printResults(data);
    } else {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    }
  };

  var printResults = function(data) {
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) {
      debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };

  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener('DOMContentLoaded', initialize);
})();
