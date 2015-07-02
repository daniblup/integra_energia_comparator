// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function (){
	$("#siguiente_1").click(function(){
		$("#paso_1").addClass("oculto");
		$("#paso_2").removeClass("oculto");
	});
	
	$("#anterior_2").click(function(){
		$("#paso_1").removeClass("oculto");
		$("#paso_2").addClass("oculto");
	});
	
	$("#siguiente_2").click(function(){
		$("#paso_2").addClass("oculto");
		$("#paso_3").removeClass("oculto");
		
		for (i=1;i<$("#numero_productos").val();i++)
		{
			if ($("#cantidad_producto_"+i).val()!="" && $("#horas_producto_"+i).val()!="")
			{
				$("#mostrar_producto_"+i).removeClass("oculto");
				$("#mostrar_cantidad_producto_"+i).html($("#cantidad_producto_"+i).val());
				$("#mostrar_horas_producto_"+i).html($("#horas_producto_"+i).val());
			}
			else
			{
				$("#mostrar_producto_"+i).addClass("oculto");
			}
		}
	});
	
	$("#anterior_3").click(function(){
		$("#paso_2").removeClass("oculto");
		$("#paso_3").addClass("oculto");
	});
});
