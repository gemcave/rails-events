import 'selectize'
import $ from 'jquery';

$(document).on("turbolinks:load", function() {	
	$('.selectize').selectize({
		delimiter: ',',
		persist: false,
		placeholder: '-',
		create: function (input, callback){
			var self = this;
			var fd = new FormData();
			fd.append("name", input)			
			console.log(input)
			console.log(self.options)
			for (let [key, value] of Object.entries(self.options)) {
				if (value.text == input) {
					self.placeholder = "-"
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