function list_days(){
	for(var i = 1; i <= 31;  i++){
      document.write('<option value="'+i+'">'+i+'</option>');
    }
}

function list_years(){
	var myDate = new Date();
    var year = myDate.getFullYear();
    for(var i = 1900; i < year+1; i++){
      document.write('<option value="'+i+'">'+i+'</option>');
    }
}

function image(evt) {
  var files = evt.target.files; // FileList object
   
    //Obtenemos la imagen del campo "file". 
  for (var i = 0, f; f = files[i]; i++) {         
       //Solo admitimos imágenes.
       if (!f.type.match('image.*')) {
            continue;
       }
   
       var reader = new FileReader();
       
       reader.onload = (function(theFile) {
           return function(e) {
           // Creamos la imagen.
                  document.getElementById("list").innerHTML = ['<img class="image-preload" src="', e.target.result,'" title="', escape(theFile.name), '"/>'].join('');
           };
       })(f);

       reader.readAsDataURL(f);
   }
}

function edit_information(show){
    if(show==1)
      document.getElementById("registration_form").style.display="none";
    else
      document.getElementById("registration_form").style.display="block";
}

$("#timeline-nav-bar hidden-sm hidden-xs").click(function() {
  alert( "clicked" );
});