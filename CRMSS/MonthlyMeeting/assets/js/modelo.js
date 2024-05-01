/*
 * Modelo - Just Another jQuery Modal
 *
 * Author: Vanessa Coles
 * Version: 1.0
 * License: MIT
 * Description: A simple jQuery modal plugin for use in your next project.
*/

'use_strict';

(function ($) {

	$.fn.modelo = function (options) {

		/* Setup */

		// Plugin Defaults
		var defaults = $.extend({
			top: 60,
			maxWidth: 600,
			centered: false,
			fadeDuration: 600
		}, options);

		// Plugin Start
		return this.each(function () {

			// Cache important variables.
			var el = $(this),
				modal = $('[data-modal]');
				modalContent = $('.modal-content');
				width = el.width(),
				height = el.height(),
				win = $(window),
				body = $('body'),
				overlay = $('<div class="modal-overlay"></div>'),
				overlayClone = overlay.clone();
				btnOpen = $('[data-modal="open-modal"]'),
				btnClose = $('[data-modal="close-modal"]');

			// Set data-modal attribute to hidden by default.
			el.attr('data-modal', 'hidden');

			// Set up our CSS.
			el.css({
				'top': defaults.top,
				'max-width': defaults.maxWidth + 70
			});
			modalContent.css('max-width', defaults.maxWidth);

			// If 'centered' is set to true, center the modal.
			if (defaults.centered == true) {
				el.css({
					'top': '50%',
					'transform': 'translate(-50%, -50%)'
				});
			}

			// If the modal height is greater than the height
			// of the window, set its position to absolute.
			if (win.height() < height) {
				el.css('position', 'absolute');
			}

			// Check for the same on Window resize.
			win.resize(function () {
				if ($(this).height() < height) {
					if (el.css('position') !== 'absolute') {
						el.css('position', 'absolute');
					}
				} else {
					if(el.css('position') == 'absolute') {
						el.css('position', 'fixed');
					}
				}
			});

			/* Actions */

			// Open the modal with the open button.
			btnOpen.click(function () {
				openModal();
			});

			// Close the modal.
			btnClose.click(function () {
				closeModal();
			});

			// Close the modal when the overlay is clicked.
			overlay.click(function () {
				closeModal();
			});

			/* Functions */

			// Open the modal.
			function openModal (duration) {
				if (el && el.attr('data-modal') === 'hidden') {
					// Set the fade duration to our default.
					duration = defaults.fadeDuration;

					// Add the overlay.
					body.prepend(overlay);

					// Fade in overlay and modal.
					overlay.fadeIn(duration);
					el.fadeIn(duration);

					// Update attributes to indicate active state.
					el.attr({
						'aria-hidden': 'false',
						'data-modal': 'active',
					}).css('visibility', 'visible');
				}
			}

			// Close the modal.
			function closeModal (duration) {
				if (el && el.attr('data-modal') === 'active') {
					// Set the fade duration to our default.
					duration = defaults.fadeDuration;

					// Fade out the overlay and modal.
					el.fadeOut(duration);
					overlay.fadeOut(duration, function () {
						body.on('click', overlay, function () {
							overlayClone.detach();
						});
					});

					// Update attributes to indicate hidden state.
					el.attr({
						'aria-hidden': 'true',
						'data-modal': 'hidden',
					});
				}
			}

			// Close the modal when the ESC key is pressed.
			$(document).keyup(function (event) {
				if (event.keyCode == 27) {
					if (el && el.attr('data-modal') === 'active') {
						closeModal();
					}
				}
			});

		}); // return
	} // function

}(jQuery));