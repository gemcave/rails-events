import 'selectize'
import $ from 'jquery';

$(document).on("turbolinks:load", function() {
		$(function () {
			console.log('loaded')
		})

		$('.selectize').selectize({
    delimiter: ',',
    persist: false,
    create: function(input) {
        return {
            value: input,
            text: input
        }
    }
	});
})