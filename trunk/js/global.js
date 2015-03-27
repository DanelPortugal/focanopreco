$(document).ready(function(){
	$("#divPleaseWait").hide();
	$("#divErrorCode").hide();
	$("#contentEnable").hide();
	
	$(document).on('click', '.alert', function(){
		$(this).hide();
	});
    
    $('.containerInst').css('min-height', ($( document ).height() - 52));
});

var PleaseWait = {
	Show: function(){
		$("#divPleaseWait").show();
		$("#contentEnable").show();
	},
	
	Hide: function(){
		$("#divPleaseWait").hide();
		$("#contentEnable").hide();
	}
};

var AlertError = {
	Show: function(){
		$("#divErrorCode").show();
	},
	Hide: function(){
		$("#divErrorCode").hide();
	},
	Message: function(data){
		$("#errorDescription").html(data);
	},
	Console: function(data){
		console.log(data);
	},
    DialogShow: function(){
		$("#divErrorCodeDialog").show();
	},
	DialogHide: function(){
		$("#divErrorCodeDialog").hide();
	},
	DialogMessage: function(data){
		$("#errorDescriptionDialog").html(data);
	}
};

var FormatNumber = {
	Price: function (int) {
		int = int.toFixed(2) + '';
		x = int.split('.');
		x1 = x[0];
		x2 = x.length > 3 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + '.' + '$2');
		}
		return x1 + x2;
	}
};

var Validate ={
    AllForm: function (form){
        var check;
        var content;
        check = true;
        $("input, select, textarea").each(function( i ) {
            if($(this).attr("required"))
            {
                if($(this).val() == "")
                {
                    $(this).css("border-color", "red");
                    check = false;
                    //AlertError.DialogShow();
                    //AlertError.DialogMessage("Preencha todos os campos.");
                    //console.log("lsal");
                }else{
                    $(this).css("border-color", "#ccc");
                }
            }
            
        });
        return check;
    }
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}