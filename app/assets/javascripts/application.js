// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require dataTables/jquery.dataTables
//= require chartkick
//= require_tree .
//= require turbolinks

$(document).on('turbolinks:load', function() {
	$('form').on('click', '.remove_record', function(event) {
		$(this).prev('input[type=hidden]').val('1');
		$(this).closest('tr').hide();
		return event.preventDefault();
	});

	$('form').on('click', '.add_fields', function(event){
		var regexp, time;
		time = new Date().getTime();
		regexp = new RegExp($(this).data('id'), 'g');
		$('.add-row').before($(this).data('fields').replace(regexp, time));
		return event.preventDefault();
	});
	$('.table-items').change(function(){
		var total_netto = 0;
		var total_vat_value = 0;
		var total = 0;
		$('.item-row').each(function(){
			var sum = 0;
			sum = Number($(this).find('.price_netto').find('input').val()) * Number($(this).find('.quantity').find('input').val());
			if (sum != 0){
				$(this).find('.total_netto').text(sum.toFixed(2));
			}
			total_netto += sum;

			var vat_value = 0;
			vat_value = sum * Number($(this).find('.vat').find('select').val()) / 100;
			if (vat_value != 0){
				$(this).find('.vat_value').text(vat_value.toFixed(2));
			}
			total_vat_value += vat_value;

			var total_brutto = 0;
			total_brutto = sum + vat_value;
			if (total_brutto != 0){
				$(this).find('.total_brutto').text(total_brutto.toFixed(2));
			}
			total += total_brutto;

			
		});
		$('#total_netto').text(total_netto.toFixed(2));
		$('#total_vat_value').text(total_vat_value.toFixed(2));
		$('#total').text(total.toFixed(2));
	});
})