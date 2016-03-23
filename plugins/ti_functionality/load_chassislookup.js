			$(document).ready(function(){
				$("#link-get-chassis-lookup").click(function(){
					$("#iframe-lookup").attr('src','http://www.tracintermodal.com/unitlookup/tlookup_eao.asp')
					$("#chassis-lookup,#chassis-lookup-lightbox").fadeIn();
				});
				$("#link-get-unit-lookup").click(function(){
					$("#iframe-lookup").attr('src','http://www.tracintermodal.com/unitlookup/lookup.asp')
					$("#chassis-lookup,#chassis-lookup-lightbox").fadeIn();
				});
				$('#close-button').css('cursor','pointer');
				$('#close-button')
					.click(function(){
							$("#chassis-lookup,#chassis-lookup-lightbox").fadeOut();
					}
				);
				
			});
