// a lot of this was taken from Laurence Penney's UI on codepen: https://codepen.io/lorp/pen/KeKogL


// init
let buttonTimer = false;
let advancedUI = false;

document.addEventListener("DOMContentLoaded", function() {

		// Italicize Button: Click: sets roman/italic
    	document.getElementById("italicButton").addEventListener("click", function(){
		  if (!buttonTimer)
			return;
		  clearTimeout(buttonTimer);
			var v = document.getElementById("italicNumber").value
			var i = v
			if (v == 100) {	i = 0 } else { i = 100 };
			updateUI(i)
			changeFont()

			}
		);

		// Italicize Button: Hold Down
		document.getElementById("italicButton").addEventListener("mousedown", function(){
		  buttonTimer = setTimeout(function(e) {
			advancedUI = !advancedUI;
			advControls = document.getElementsByClassName("hidden");
			for (let c=0; c<advControls.length; c++) {
			  advControls[c].style.display = advancedUI ? "inline" : "none";
			}
			buttonTimer = false;
		  }, 1000);
		});

		// manual Italicize button
		var expand = document.getElementById("expandControls");
	  expand.onclick = function(){
			advancedUI = !advancedUI;
			advControls = document.getElementsByClassName("hidden");
			for (let c=0; c<advControls.length; c++) {
			  advControls[c].style.display = advancedUI ? "inline" : "none";
			};
			document.getElementById("expandControls").innerHTML = advancedUI ? "&#8855" : "&#8853;" ;
		};


		var italicSlider = document.getElementById("italicSlider");
		italicSlider.oninput = function(){ italicSliderChange() };


		var italicNumber = document.getElementById("italicNumber");
		italicNumber.oninput = function(){ italicNumberChange() 
		};
		
});


function updateUI(i) {
	// convert input to a value
	if (i == "Roman") { i = 0 }
	else if (i == "Italic") {i = 100 } 
	else { i = i };

	document.getElementById("italicSlider").value = i;
	document.getElementById("italicNumber").value = i;
};


// Controls

function italicSliderChange(){
	var v = 	document.getElementById("italicSlider").value
	updateUI(v)
	changeFont()
	};
	
function italicNumberChange(){
	var v = document.getElementById("italicNumber").value
	if (v > 100 ) {v = 100}
	updateUI(v)
	changeFont()
	};

// Font Family

// function selectFont() {
// 	changeFont()
// };


function changeFont() {	
	// get font family
// 	v = document.getElementById("italicStyleSelect").value
// 	if (v == "progressive") {f = "RobotoSerifTextItalic"}
// 	else if (v == "sloped") {f = "RobotoSerifTextSlant"}
// 	else if (v == "cursiveUpright") {f = "RobotoSerifTextItalic1" }
// 	else if (v == "cursiveItalic") {f = "RobotoSerifTextItalic2"}
// 	else {f = "RobotoSerifTextItalic" };

	// use italicNumber for ital value
	var v = document.getElementById("italicNumber").value/100
	
	var c = document.getElementsByClassName("testFont");
	for (i = 0; i < c.length; i++) {
		c[i].style = "font-variation-settings: 'ital' " + v + ";";
// 		c[i].style.fontFamily = f;
		};

// 	var c = document.getElementsByClassName("roman");
// 	for (i = 0; i < c.length; i++) {
// 		c[i].style.fontFamily = f;
// 		};


};
