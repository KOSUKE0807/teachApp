// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require Chart.min
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
    
    $(".home-total-ave-circle").addClass("hide-area");
    $(".home-total-ave-circle").eq(0).removeClass("hide-area");
    
    $(".rank-table").addClass("hide-area");
    $(".rank-table").eq(0).removeClass("hide-area");
    
    $(".test-type-name").addClass("hide-area");
    $(".test-type-name").eq(0).removeClass("hide-area");
    
    
    $(".test-type-list").click(function(){
        var listIndex = $(".test-type-list").index($(this));
        $(".home-total-ave-circle").addClass("hide-area");
        $(".rank-table").addClass("hide-area");
        $(".test-type-name").addClass("hide-area");
        // listIndex = listIndex + 1
        console.log(listIndex);
        $(".home-total-ave-circle").eq(listIndex).toggleClass("hide-area");
        $(".rank-table").eq(listIndex).toggleClass("hide-area");
        $(".test-type-name").eq(listIndex).toggleClass("hide-area");
        
        $(".test-type-list").removeClass("active-type");
        $(this).addClass("active-type");
        $("type-list-1").removeClass("hide-area");
    });
});