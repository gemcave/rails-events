import 'selectize'
import $ from 'jquery';

$(document).on("turbolinks:load", function() {	
	$('.selectize').selectize({
		delimiter: ',',
		persist: false,
		placeholder: '-',
		maxItems: 5,
		preload: true,
		render: {
			option_create: function(data, escape) {
				return `<div class="create">Добавить <strong>${escape(data.input)}</strong></div>`;
			}
		},
		create: function (input, callback){
			var self = this;
			var fd = new FormData();
			fd.append("name", input)			
			for (let [key, value] of Object.entries(self.options)) {
				if (value.text == input) {
					return callback();
				}
			}
			$.ajax({
						url: '/categories/',
						type: 'post',
						data: fd,
						processData: false,
            contentType: false,
						success: function (result) {
								var res = { value: result.data.id, text: result.data.name }
								if (res) {
									 return callback({ value: result.data.id, text: result.data.name });
								}
						}
				});
	 },    
	})
})