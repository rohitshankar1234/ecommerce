<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<style>
/* Full Screen jQuery Content Slider <https://github.com/jacobxperez/full-screen-jquery-content-slider>
 * Copyright (C) 2020 Jacob Perez <jacobxperez@gmx.com>
 * Licensed under the Apache License, Version 2.0
 * http://www.apache.org/licenses/LICENSE-2.0
------------------------------------------------------------------------------*/

/* Reset
------------------------------------------------------------------------------*/
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    border: 0 none;
    font-size: inherit;
    font-family: inherit;
    line-height: inherit;
    text-align: inherit;
    vertical-align: baseline;
    background-color: transparent;
    color: inherit;
    outline: 0;
}

audio,
canvas,
embed,
iframe,
img,
object,
svg,
video {
    display: block;
    height: auto;
    max-width: 100%;
    width: 100%;
    vertical-align: middle;
}

summary {
    display: list-item;
}

body,
html {
    height: 100%;
}

html {
    font-size: 100%;
}

body {
    overflow: auto;
    font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Nimbus Sans L", "Liberation Sans", FreeSans, sans-serif;
    font-weight: 400;
    line-height: 1.5;
    text-align: left;
    color: #555;
    background-color: #fff;
}
/* Content Slider
------------------------------------------------------------------------------*/
.slider {
    position: absolute;
    width: 100%;
    height: 100%;
    overflow: hidden;
    background-color: #555;
}

.slide {
    position: absolute;
    top: 0;
    left: 0;
    display: none;
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.slide img {
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    width: 100%;
    height: 100%;
    cursor: default;
}

.slide-content {
    position: absolute;
    bottom: 20%;
    width: 100%;
    text-align: center;
    color: #fff;
    text-shadow: 0 .125em .3125em rgba(0, 0, 0, 0.6), 0 0 .3125em rgba(0, 0, 0, 0.5);
}

.slide-title {
    font-size: 10vw;
}

.slider-nav {
    position: absolute;
    top: 50%;
    right: 0;
    width: 100%;
    z-index: 10;
}

.next-slide,
.prev-slide {
    position: absolute;
    display: inline-block;
    width: 3.125rem;
    height: 3.125rem;
    line-height: 3.125;
    margin: 0;
    border: .125rem solid white;
    backface-visibility: hidden;
    background-color: rgba(0, 0, 0, 0.3);
    color: white;
    overflow: hidden;
    cursor: pointer;
    z-index: 20;
    transition: all .3s ease-in-out 0s;
    -webkit-user-select: none;
    user-select: none;
}

.prev-slide {
    left: 2%;
}

.next-slide {
    right: 2%;
}

.next-slide:hover,
.prev-slide:hover {
    background-color: rgba(0, 0, 0, 0.6);
}

.next-slide::before,
.prev-slide::before {
    position: absolute;
    top: 33%;
    display: inline-block;
    width: .8125rem;
    height: .8125rem;
    content: "";
    border-left: .25rem solid white;
    border-top: .25rem solid white;
    backface-visibility: hidden;
}

.prev-slide::before {
    transform: rotate(-45deg);
    right: 25%;
}

.next-slide::before {
    transform: rotate(135deg);
    left: 25%;
}
@media screen and (max-width: 42.5em) {
    .next-slide,
    .prev-slide {
        display: none;
    }
}
@media screen and (max-width: 61.25em) {
    .slider {
        max-height: 57.95918367vw;
    }
}
@media screen and (min-height: 61.25em) {
    .slider {
        max-height: 57.95918367vw;
    }
}

</style>

<script>
/* full-screen-jquery-content-slider
 * <https://github.com/jacobxperez/full-screen-jquery-content-slider>
 * Copyright (C) 2020 Jacob Perez <jacobxperez@gmx.com>
 * Licensed under the Apache License, Version 2.0
 * http://www.apache.org/licenses/LICENSE-2.0
------------------------------------------------------------------------------*/
$(function() {

	// Slider
	$(".slider").each(function() {
		var slider = $(this),
			slides = slider.find(".slide"),
			totalSlides = slides.length,
			currIndex = 0,
			imgCache = [],
			intervalTime = 5000,
			sliderInterval;

		// fades in and out slides
		function cycleItems() {
			var currSlide = slides.eq(currIndex);

			slides.fadeOut(500).css("z-index", 1);
			currSlide.fadeIn(500).css("z-index", 5);
		} // end cycleItem

		// Changes slides
		function changeSlide() {
			currIndex += 1;

			if (currIndex > totalSlides - 1) {
				currIndex = 0;
			}

			cycleItems();
		} // end changeSlide

		// Timer for changeSlide
		function startSlider() {
			clearInterval(sliderInterval);

			sliderInterval = setInterval(function() {
				changeSlide();
			}, intervalTime);
		} // end startSlider

		// preload the img before starting the Slider
		(function preloader() {
			if (currIndex < totalSlides) {
				// load img
				imgCache[currIndex] = new Image();
				imgCache[currIndex].src = slides.eq(currIndex).find("img").attr("src");
				imgCache[currIndex].onload = function() {
					currIndex += 1;
					preloader();
				};
			} else {
				currIndex = 0;
				cycleItems();
				startSlider();
			}
		}()); // end preloader

		// click on next
		$(".next-slide").on("click", function() {
			currIndex += 1;

			if (currIndex > totalSlides - 1) {
				currIndex = 0;
			}

			cycleItems();
			startSlider(intervalTime = 10000);
		}); // end click of next

		// click on prev
		$(".prev-slide").on("click", function() {
			currIndex -= 1;

			if (currIndex < 0) {
				currIndex = totalSlides - 1;
			}

			cycleItems();
			startSlider(intervalTime = 10000);
		}); // end click on prev
	}); // end Slider

});

</script>
 <section id="aa-slider">
 <div class="aa-slider-area">
      <div id="sequence" class="seq">
<div>
	<!-- Slider -->
	<article class="slider">
		<section class="slide">
			<img src="https://source.unsplash.com/lrSj8M1UpKo/1280x720" alt="">

			<div class="slide-content">
				<p class="slide-title">Slide 1</p>
			</div>
		</section>

		<section class="slide">
			<img src="/ecommerce/img/women/girl-1.png" alt="">

			<div class="slide-content">
				<p class="slide-title">Slide 2</p>
			</div>
		</section>

		<section class="slide">
			<img src="https://source.unsplash.com/yp0vrzZlqUQ/1280x720" alt="">

			<div class="slide-content">
				<p class="slide-title">Slide 3</p>
			</div>
		</section>

		<section class="slide">
			<img src="https://source.unsplash.com/oigq0Qf-r6Y/1280x720" alt="">

			<div class="slide-content">
				<p class="slide-title">Slide 4</p>
			</div>
		</section>

		<nav class="slider-nav">
			<span class="prev-slide"></span>
			<span class="next-slide"></span>
		</nav>
	</article>
  </div>
  </div>
  </div>
  </section>
	<!-- end Slider -->

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha384-vk5WoKIaW/vJyUAd9n/wmopsmNhiy+L2Z+SBxGYnUkunIxVxAv/UtMOhba/xskxh" crossorigin="anonymous"></script>


 
