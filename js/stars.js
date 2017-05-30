function get_id_publication(id_publication, valuation,id){
	jQuery.each($("#"+id+" input"), function(i, val){
		if(val.value <= valuation){
			$("#label"+val.value+"_"+id_publication).css("color","yellow");
		}else{
			$("#label"+val.value+"_"+id_publication).css("color","#ddd");
		}
	});
    var valuation = valuation;
    var id_publication = id_publication;
    $.ajax({
        url: 'valuation.php',
        type: 'POST',
        data: "valuation="+valuation+"&id_publication="+id_publication,
        dataType: 'json',
    });
};

function paint_stars(id_publication, valuation, id){
	$(("#"+id+" input"), function(i, val){
		for (var i = 0; i<=valuation ;i++) {
			$("#label"+i+"_"+id_publication).css("color","yellow");
		}
	});
}