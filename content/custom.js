jQuery(document).ready(function ($) {
	"use strict";


	//===== count down timer =====//
	if (jQuery('.kf-countdown-1').length) {
		jQuery('.kf-countdown-1').downCount({ date: '08/08/2018 12:00:00', offset: +1 });
	}
	//===== write Effect =====//
	if (jQuery('.write').length) {
		jQuery(".write").typed({
			stringsElement: jQuery('.add-write'),
			typeSpeed: 100,
			contentType: 'html', // or text
		});
	}
	if (jQuery('[data-toggle="tooltip"]').length) {
		jQuery('[data-toggle="tooltip"]').tooltip();
	}
	//===== search menu =====//
	if (jQuery('.control-search').length) {
		jQuery('.control-search').click(function () {
			jQuery('body').addClass('mode-search');
			jQuery('.input-search').focus();
		});
	}
	if (jQuery('.search-icon-close').length) {
		jQuery('.search-icon-close').click(function () {
			jQuery('body').removeClass('mode-search');
		});
	}
	//===== input label =====//
	if (jQuery('.ipd').length) {
		jQuery(".ipd").label_better({
			easing: "bounce"
		});
	}
	// //===== Water Effect =====//
	// if (jQuery('.kode_banner').length) {
	// 	jQuery('.kode_banner').ripples({
	// 		resolution: 512,
	// 		dropRadius: 20,
	// 		perturbance: 0.01,
	// 	});
	// }
	// if (jQuery("a[rel^='prettyPhoto']").length) {
	// 	jQuery("a[rel^='prettyPhoto']").prettyPhoto();
	// }
	// //===== Water Effect =====//
	// if (jQuery('.banner-img').length) {
	// 	jQuery('.banner-img').ripples({
	// 		resolution: 512,
	// 		dropRadius: 20,
	// 		perturbance: 0.01,
	// 	});
	// }
	//===== picture Effect =====//
	if (jQuery('.tilt').length) {
		jQuery('.tilt').tilt({
			sensitivity: 5,
			perspective: 2000,
			shine: true
		})
	}
	//===== zoom Effect =====//
	if (jQuery('.zoom-picture1').length) {
		jQuery('.zoom-picture1').zoom();
	}

	/*
    ==============================================================
	       BANNER SLIDER
    ============================================================== 
    */
	if (jQuery('.banner-slider').length) {
		jQuery('.banner-slider').slick({
			slidesToShow: 1,
			dots: false,
			arrows: false,
			loop: false,
			autoplay: true

		});
	}

	if (jQuery('.tabscontrol').length) {
		jQuery('.tabscontrol').tabs({ fxFade: true, fxSpeed: 'slow' });
	}
	if (jQuery('.kf_testimonial').length) {
		jQuery('.kf_testimonial').slick({
			centerMode: true,
			dots: false,
			arrows: false,
			slidesToShow: 2,
			responsive: [
				{
					breakpoint: 768,
					settings: {
						arrows: false,
						centerMode: true,
						centerPadding: '40px',
						slidesToShow: 1
					}
				},
				{
					breakpoint: 480,
					settings: {
						arrows: false,
						centerMode: true,
						dots: true,
						centerPadding: '40px',
						slidesToShow: 1
					}
				}
			]
		});
	}

	if (jQuery('.kf_instagram_updates').length) {
		jQuery('.kf_instagram_updates').slick({
			dots: false,
			arrows: false,
			slidesToShow: 13,
			slidesToScroll: 1,
			autoplay: true,
			autoplaySpeed: 0,
			speed: 8000,
			cssEase: 'linear',
			responsive: [
				{
					breakpoint: 768,
					settings: {
						dots: false,
						arrows: false,
						slidesToShow: 8,
						slidesToScroll: 1,
						autoplay: true,
						autoplaySpeed: 0,
						speed: 8000,
						cssEase: 'linear'
					}
				},
				{
					breakpoint: 480,
					settings: {
						dots: false,
						arrows: false,
						slidesToShow: 4,
						slidesToScroll: 1,
						autoplay: true,
						autoplaySpeed: 0,
						speed: 8000,
						cssEase: 'linear'
					}
				}
			]
		});
	}

	if (jQuery('.blog-slider-6items').length) {
		jQuery('.blog-slider-6items').slick({
			dots: true,
			arrows: false,
			centerMode: true,
			slidesToShow: 6,
			infinite: true,
			autoplay: false,
			cssEase: 'linear',
			responsive: [
				{
					breakpoint: 1200,
					settings: {
						dots: false,
						arrows: false,
						centerMode: true,
						slidesToShow: 4,
						slidesToScroll: 1,
						cssEase: 'linear'
					}
				},
				{
					breakpoint: 992,
					settings: {
						dots: false,
						arrows: false,
						centerMode: true,
						slidesToShow: 3,
						slidesToScroll: 1,
						cssEase: 'linear'
					}
				},
				{
					breakpoint: 676,
					settings: {
						dots: false,
						arrows: false,
						centerMode: true,
						slidesToShow: 1,
						slidesToScroll: 1,
						cssEase: 'linear'
					}
				},
				{
					breakpoint: 480,
					settings: {
						dots: false,
						arrows: false,
						centerMode: true,
						slidesToShow: 1,
						slidesToScroll: 1,
						cssEase: 'linear'
					}
				}
			]
		});
	}


	if (jQuery('.widget-slider').length) {
		jQuery('.widget-slider').slick({
			dots: true,
			arrows: false,
			centerMode: true,
			slidesToShow: 1,
			infinite: true,
			autoplay: false,
			cssEase: 'linear',
			responsive: [
				{
					breakpoint: 768,
					settings: {
						dots: false,
						arrows: false,
						centerMode: true,
						slidesToShow: 1,
						slidesToScroll: 1,
						speed: 8000,
						cssEase: 'linear'
					}
				},
				{
					breakpoint: 480,
					settings: {
						dots: false,
						arrows: false,
						centerMode: true,
						slidesToShow: 1,
						slidesToScroll: 1,
						speed: 8000,
						cssEase: 'linear'
					}
				}
			]
		});
	}


	if (jQuery('.brands-slider').length) {
		jQuery('.brands-slider').slick({
			dots: true,
			arrows: false,
			slidesToShow: 6,
			infinite: true,
			autoplay: false,
			cssEase: 'linear',
			responsive: [
				{
					breakpoint: 768,
					settings: {
						dots: true,
						arrows: false,
						centerMode: true,
						slidesToShow: 4,
						slidesToScroll: 1,
						speed: 8000,
						cssEase: 'linear'
					}
				},
				{
					breakpoint: 480,
					settings: {
						dots: false,
						arrows: false,
						centerMode: true,
						slidesToShow: 2,
						slidesToScroll: 1,
						speed: 8000,
						cssEase: 'linear'
					}
				}
			]
		});
	}

	if (jQuery('.travel-slider-items').length) {
		jQuery('.travel-slider-items').slick({
			slidesToShow: 1,
			slidesToScroll: 2,
			arrows: true,
			fade: true,
			asNavFor: '.travel-slider-items-nav',
			responsive: [
				{
					breakpoint: 768,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 2,
						arrows: true,
						fade: true,
						dots: false,
						cssEase: 'linear'
					}
				},
				{
					breakpoint: 480,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 2,
						arrows: false,
						fade: true,
						dots: false,
						cssEase: 'linear'
					}
				}
			]
		});
	}

	if (jQuery('.travel-slider-items-nav').length) {
		jQuery('.travel-slider-items-nav').slick({
			slidesToShow: 5,
			slidesToScroll: 2,
			asNavFor: '.travel-slider-items',
			arrows: false,
			focusOnSelect: true,
			responsive: [
				{
					breakpoint: 768,
					settings: {
						dots: false,
						arrows: false,
						centerMode: true,
						slidesToShow: 2,
						slidesToScroll: 1,
						cssEase: 'linear'
					}
				},
				{
					breakpoint: 480,
					settings: {
						dots: false,
						arrows: false,
						centerMode: true,
						slidesToShow: 2,
						slidesToScroll: 1,
						cssEase: 'linear'
					}
				}
			]
		});
	}

	if (jQuery('.rateing').length) {
		jQuery(".rateing").rateYo({
			rating: 3.6
		});
	}


	/*
    ==============================================================
	       FADE SLIDER TOP ROW 1
    ============================================================== 
    */
	if (jQuery('.fade-slider').length) {
		jQuery('.fade-slider').slick({
			slidesToShow: 1,
			dots: false,
			arrows: false,
			loop: false,
			autoplay: true,
			fade: true

		});
	}
	/*
	==============================================================
			 SELECTRIC SCRIPTS
	============================================================== 
	*/
	if (jQuery(".select").length) {
		jQuery('.select').selectric();
	}
	if (jQuery(".select-menu").length) {
		jQuery('.select-menu').selectric();
	}



	/*
    ==============================================================
	       DATEPICKER CALENDER SCRIPT ENDS
    ============================================================== 
    */
	if (jQuery("a[href*='#']").length) {
		// Select all links with hashes
		jQuery('a[href*="#"]')
			// Remove links that don't actually link to anything
			.not('[href="#"]')
			.not('[href="#0"]')
			.on('click', function (event) {
				// On-page links
				if (
					location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
					&&
					location.hostname == this.hostname
				) {
					// Figure out element to scroll to
					var target = jQuery(this.hash);
					target = target.length ? target : jQuery('[name=' + this.hash.slice(1) + ']');
					// Does a scroll target exist?
					if (target.length) {
						// Only prevent default if animation is actually gonna happen
						event.preventDefault();
						jQuery('html, body').animate({
							scrollTop: target.offset().top
						}, 1000, function () {
							// Callback after animation
							// Must change focus!
							var jQuerytarget = jQuery(target);
							jQuerytarget.focus();
							if (jQuerytarget.is(":focus")) { // Checking if the target was focused
								return false;
							} else {
								jQuerytarget.attr('tabindex', '-1'); // Adding tabindex for elements not focusable
								jQuerytarget.focus(); // Set focus again
							};
						});
					}
				}
			});
	}

	if (jQuery('.btn-weel').length > 0) {
		jQuery('.btn-weel').on('mouseenter', function (e) {

			var parentOffset = jQuery(this).offset(),
				relX = e.pageX - parentOffset.left,
				relY = e.pageY - parentOffset.top;

			if (jQuery(this).find('span')) {
				jQuery('.btn-weel span').css({
					top: relY,
					left: relX,
				});
			}
		});
		jQuery('.btn-weel').on('mouseout', function (e) {

			var parentOffset = jQuery(this).offset(),
				relX = e.pageX - parentOffset.left,
				relY = e.pageY - parentOffset.top;

			if (jQuery(this).find('span')) {
				jQuery('.btn-weel span').css({
					top: relY,
					left: relX,
				});
			}
		});
	}

	/*
	==============================================================
			 WEATHER DETAIL
	============================================================== 
	*/
	/*if(jQuery(".weather").length){
		jQuery(".weather").weatherFeed({relativeTimeZone:true});
}*/

	if (jQuery('#live-date').length) {
		var d = new Date();
		document.getElementById("live-date").innerHTML = d.toDateString();
	}
	/*
    ==============================================================
	       Jplayer 
    ============================================================== 
    */
	if (jQuery(".video-play").length) {
		jQuery(".video-play").jPlayer({
			ready: function () {
				jQuery(this).jPlayer("setMedia", {
					m4v: "js/videoplay/history.m4v",
					ogv: "js/videoplay/history.ogv",
					webmv: "js/videoplay/history.webm",
					poster: "extra-images/history-img01.jpg"
				});
			},
			swfPath: "../../dist/jplayer",
			supplied: "webmv, ogv, m4v",
			size: {
				width: "",
				height: "345px",
				cssClass: ""
			},
			useStateClassSkin: true,
			autoBlur: false,
			smoothPlayBar: true,
			keyEnabled: true,
			remainingDuration: true,
			toggleDuration: true
		});
	}
	/*
    ==============================================================
	       range slider
    ============================================================== 
    */
	if (jQuery(".slider-range").length) {
		jQuery(".slider-range").slider({
			range: true,
			min: 0,
			max: 500,
			values: [50, 450],
			slide: function (event, ui) {
				jQuery(".amount").val("jQuery" + ui.values[0] + " - jQuery" + ui.values[1]);
			}
		});
		jQuery(".amount").val("jQuery" + jQuery(".slider-range").slider("values", 0) +
			" - jQuery" + jQuery(".slider-range").slider("values", 1));
	}

	/*
    ==============================================================
	       Accordion tabs
    ============================================================== 
    */
	if (jQuery(".accordion").length) {
		jQuery.fn.slideFadeToggle = function (speed, easing, callback) {
			return this.animate({ opacity: 'toggle', height: 'toggle' }, speed, easing, callback);
		};
		jQuery('.accordion').accordion({
			defaultOpen: 'section1',
			speed: 'slow',
			cookieName: '',
			animateOpen: function (elem, opts) { //replace the standard slideUp with custom function
				elem.next().stop(true, true).slideFadeToggle(opts.speed);
			},
			animateClose: function (elem, opts) { //replace the standard slideDown with custom function
				elem.next().stop(true, true).slideFadeToggle(opts.speed);
			}
		});
	}
	/*
	 ==============================================================
				FILTRABLE GALLERY
	 ============================================================== 
	 */
	if (jQuery("#filterable-item-holder-1").length) {
		jQuery(window).load(function (jQuery) {
			var filter_container = jQuery('#filterable-item-holder-1');

			filter_container.children().css('position', 'relative');
			filter_container.masonry({
				singleMode: true,
				itemSelector: '.filterable-item:not(.hide)',
				animate: true,
				animationOptions: { duration: 800, queue: false }
			});
			jQuery(window).resize(function () {
				var temp_width = filter_container.children().filter(':first').width();
				filter_container.masonry({
					columnWidth: temp_width,
					singleMode: true,
					itemSelector: '.filterable-item:not(.hide)',
					animate: true,
					animationOptions: { duration: 800, queue: false }
				});
			});

			jQuery('ul#filterable-item-filter-1 a').on('click', function (e) {

				jQuery(this).addClass("active");
				jQuery(this).parents("li").siblings().children("a").removeClass("active");
				e.preventDefault();

				var select_filter = jQuery(this).attr('data-value');

				if (select_filter == "All" || jQuery(this).parent().index() == 0) {
					filter_container.children().each(function () {
						if (jQuery(this).hasClass('hide')) {
							jQuery(this).removeClass('hide');
							jQuery(this).fadeIn();
						}
					});
				} else {
					filter_container.children().not('.' + select_filter).each(function () {
						if (!jQuery(this).hasClass('hide')) {
							jQuery(this).addClass('hide');
							jQuery(this).fadeOut();
						}
					});
					filter_container.children('.' + select_filter).each(function () {
						if (jQuery(this).hasClass('hide')) {
							jQuery(this).removeClass('hide');
							jQuery(this).fadeIn();
						}
					});
				}

				filter_container.masonry();

			});
		});
	}
	/*
	 ==============================================================
				popup
	 ============================================================== 
	 */
	if (jQuery("[data-popup-open]").length) {
		//----- OPEN
		jQuery('[data-popup-open]').on('click', function (e) {
			var targeted_popup_class = jQuery(this).attr('data-popup-open');
			jQuery('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
			e.preventDefault();
		});
	}
	if (jQuery("[data-popup-close]").length) {
		//----- CLOSE
		jQuery('[data-popup-close]').on('click', function (e) {
			var targeted_popup_class = jQuery(this).attr('data-popup-close');
			jQuery('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
			e.preventDefault();
		});
	}
	/*
============================================================== 
		DL Responsive Menu
============================================================== 
*/
	if (typeof (jQuery.fn.dlmenu) == 'function') {
		jQuery('.dl-menuwrapper').each(function () {
			jQuery(this).find('.dl-submenu').each(function () {
				if (jQuery(this).siblings('a').attr('href') && jQuery(this).siblings('a').attr('href') != '#') {
					var parent_nav = jQuery('<li class="menu-item"></li>');
					parent_nav.append(jQuery(this).siblings('a').clone());

					jQuery(this).prepend(parent_nav);
				}
			});
			jQuery(this).dlmenu();
		});
	}

	/*
	  ==============================================================
			 sticky header
	  ============================================================== 
	  */
	jQuery(window).scroll(function () {
		if (jQuery(window).scrollTop() >= 480) {
			jQuery('.sticky_nav_menu').addClass('fixed-header');
		}
		else {
			jQuery('.sticky_nav_menu').removeClass('fixed-header');
		}
	});
	jQuery(window).scroll(function () {
		if (jQuery(window).scrollTop() >= 10) {
			jQuery('.header-v1_navigation_row').addClass('fixed-header-nav');
		}
		else {
			jQuery('.header-v1_navigation_row').removeClass('fixed-header-nav');
		}
	});



	/*		
    =======================================================================
            Map Script
    =======================================================================
  */
	if (jQuery('#travel-map-pins').length) {
		google.maps.event.addDomListener(window, 'load', initialize);
	}
	/*		
	=======================================================================
					bottom to top
	=======================================================================
*/
	$(window).scroll(function () {
		if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
			$('#top-btn').fadeIn(200);    // Fade in the arrow
		} else {
			$('#top-btn').fadeOut(200);   // Else fade out the arrow
		}
	});
    $('#top-btn').click(function (e) {
        e.preventDefault()// When arrow is clicked
		$('body,html').animate({
			scrollTop: 0                       // Scroll to top of body
        }, 500);
	});

});

/*
    ==============================================================
	       SLIDER
    ============================================================== 
    */

if ($('.travel-carousel').length > 0) {
	$('.travel-carousel').owlCarousel({
		animateOut: 'fadeOut',
		animateIn: 'fadeIn',
		loop: true,
		margin: 0,
		nav: true,
		lazyLoad: true,
		lazyLoadEager: 1,
		autoplay: true,
		autoplayHoverPause: false,
		autoplayTimeout: 6000,
		items: 1,
        navText: ['<span class="travel-carousel-nav travel-carousel-prev"><i class="fa fa-chevron-left"></span>', '<span class="travel-carousel-nav travel-carousel-next"><i class="fa fa-chevron-right"></span>']
	});
}

if ($('.instagram-carousel').length > 0) {
	$('.instagram-carousel').owlCarousel({
		loop: true,
		margin: 0,
		nav: true,
		dots: false,
		autoplay: true,
		autoplayHoverPause: false,
		autoplayTimeout: 5000,
		items: 7,
        navText: ['<span class="instagram-carousel-nav instagram-carousel-prev"><i class="fa fa-chevron-left"></span>', '<span class="instagram-carousel-nav instagram-carousel-next"><i class="fa fa-chevron-right"></span>']
	});
}

if ($('.testimonials-carousel').length > 0) {
	$('.testimonials-carousel').owlCarousel({
		loop: true,
		margin: 0,
		nav: false,
		autoplay: true,
		autoplayHoverPause: true,
		autoplayTimeout: 6000,
		items: 1,
	});
}

if ($('.partners-carousel').length > 0) {
	$('.partners-carousel').owlCarousel({
		loop: true,
		margin: 0,
		nav: false,
		autoplay: true,
		autoplayHoverPause: true,
		autoplayTimeout: 5000,
		items: 6,
	});
}

if ($('.tours-carousel').length > 0) {
	$('.tours-carousel').owlCarousel({
		loop: true,
		margin: 20,
		nav: true,
		dots: true,
		items: 3,
        navText: ['<span class="tours-carousel-nav tours-carousel-prev"><i class="fa fa-chevron-left"></span>', '<span class="tours-carousel-nav tours-carousel-next"><i class="fa fa-chevron-right"></span>']
	});
}

jQuery(window).on('load', function () { // makes sure the whole site is loaded 
	jQuery('.pre-loader').fadeOut(); // will first fade out the loading animation 
	jQuery('.pre-loader-img').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website. 
	jQuery('body').delay(350).css({ 'overflow': 'visible' });
});
/*
==============================================================
		tabs active
============================================================== 
*/
function openCity(evt, cityName) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

$('.tabs-nav a').on('click', function (e) {
	e.preventDefault();
	var tabcontent = $(this).attr('href');
	$(this).parent().siblings().removeClass('active');
	$(this).parent().addClass('active');
	$(tabcontent).siblings().css('display', 'none');
	$(tabcontent).css('display', 'block')
})
/*
 =======================================================================
			Map Custom Style Script Script
 =======================================================================
*/
function initialize() {
	var MY_MAPTYPE_ID = 'custom_style';
	var map;
	var brooklyn = new google.maps.LatLng(40.6743890, -73.9455);
	var featureOpts = [
		{
			"featureType": "administrative",
			"elementType": "all",
			"stylers": [
				{
					"saturation": "-100"
				}
			]
		},
		{
			"featureType": "administrative.province",
			"elementType": "all",
			"stylers": [
				{
					"visibility": "off"
				}
			]
		},
		{
			"featureType": "landscape",
			"elementType": "all",
			"stylers": [
				{
					"saturation": -100
				},
				{
					"lightness": 65
				},
				{
					"visibility": "on"
				}
			]
		},
		{
			"featureType": "poi",
			"elementType": "all",
			"stylers": [
				{
					"saturation": -100
				},
				{
					"lightness": "50"
				},
				{
					"visibility": "simplified"
				}
			]
		},
		{
			"featureType": "road",
			"elementType": "all",
			"stylers": [
				{
					"saturation": "-100"
				}
			]
		},
		{
			"featureType": "road.highway",
			"elementType": "all",
			"stylers": [
				{
					"visibility": "simplified"
				}
			]
		},
		{
			"featureType": "road.arterial",
			"elementType": "all",
			"stylers": [
				{
					"lightness": "30"
				}
			]
		},
		{
			"featureType": "road.local",
			"elementType": "all",
			"stylers": [
				{
					"lightness": "40"
				}
			]
		},
		{
			"featureType": "transit",
			"elementType": "all",
			"stylers": [
				{
					"saturation": -100
				},
				{
					"visibility": "simplified"
				}
			]
		},
		{
			"featureType": "water",
			"elementType": "geometry",
			"stylers": [
				{
					"hue": "#ffff00"
				},
				{
					"lightness": -25
				},
				{
					"saturation": -97
				}
			]
		},
		{
			"featureType": "water",
			"elementType": "labels",
			"stylers": [
				{
					"lightness": -25
				},
				{
					"saturation": -100
				}
			]
		}
	];

	var mapOptions = {
		zoom: 14,
		scrollwheel: false,
		center: brooklyn,
		mapTypeControlOptions: {
			mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
		},
		mapTypeId: MY_MAPTYPE_ID
	};


	map = new google.maps.Map(document.getElementById('travel-map-pins'),
		mapOptions);

	var styledMapOptions = {
		name: 'Custom Style'
	};

	var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);

	map.mapTypes.set(MY_MAPTYPE_ID, customMapType);
	var marker = new google.maps.Marker({
		position: brooklyn,
		icon: 'images/map.png'
	});

	marker.setMap(map);
}





