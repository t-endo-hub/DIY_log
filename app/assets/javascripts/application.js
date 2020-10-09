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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .



// テキストエリア高さ自動調整
function textAreaHeightSet(argObj){
		argObj.style.height = "10px";
		var wSclollHeight = parseInt(argObj.scrollHeight);
		var wLineH = parseInt(argObj.style.lineHeight.replace(/px/, ''));
		if(wSclollHeight < (wLineH * 2)){wSclollHeight=(wLineH * 2);}
		argObj.style.height = wSclollHeight + "px";
	}

// 投稿モーダル表示
document.addEventListener("turbolinks:load", function() {
	$(function(){
		$('.js-modal-open').on('click',function(){
				$(this).parent().parent().next().fadeIn();
				return false;
		});
		$('.js-modal-close').on('click',function(){
				$('.js-modal').fadeOut();
				return false;
		});
	});
})

// left nav 背景色
document.addEventListener("turbolinks:load", function() {
	$(function(){
		$('.left_nav a').removeClass('active');
		if (location.pathname != "/users/posts/like_ranking"){
			$('#menu-post').addClass('active');
			console.log('posts')
		}else{
			$('#menu-like-ranking').addClass('active')
			console.log('like-ranking')
		} 
	});
})

// 画像プレビュー
document.addEventListener("turbolinks:load", function() {
	$(function() {
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('.image-prev').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$('.select-image').change(function(){
			readURL(this);
		});
	});
})

// ユーザー詳細ページタブメニュー
document.addEventListener("turbolinks:load", function() {
	jQuery(function($){
		$('.tabcontent > div').hide();
		
		$('.tabnav a').click(function () {
			$('.tabcontent > div').hide().filter(this.hash).fadeIn();
			
			$('.tabnav a').removeClass('active');
			$(this).addClass('active');
			
			return false;
		}).filter(':eq(0)').click();
	});
})