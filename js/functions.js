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

