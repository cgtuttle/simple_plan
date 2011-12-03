// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery-ui
//= require jquery
//= require jquery_ujs

$(function (){
	$('#program_start_date').datepicker({
    dateFormat: "mm/dd/yy"
  });
});

$(function (){
	$('#program_end_date').datepicker();
});

$(function (){
	$('#deal_product_start_date').datepicker();
});

$(function (){
	$('#deal_product_end_date').datepicker();
});

$(function (){
	$('#deal_offered_on').datepicker();
});

$(function (){
	$('#deal_accepted_on').datepicker();
});

$(function (){
	$('#deal_activity_start_date').datepicker();
});

$(function (){
	$('#deal_activity_end_date').datepicker();
});

$(function (){
	$('#plan_start_date').datepicker();
});

$(function (){
	$('#plan_end_date').datepicker();
});