
$(document).ready(function(){
    SyntaxHighlighter.highlight();
    
    if ($('div#example1').length > 0) {
        $('#example1').qbox();
        $('#example1 li').colorize();
    }
    
    if ($('div#example2').length > 0) {
        $('#example2').qbox({
            slide: {
                effect: 'easeInElastic',
                duration: 2000,
                from: 'top',
                by: 'desc'
            },
            box: {
                selector: 'a', //box jQuery selector
                rows: 1, //number of row
                cols: 3 //number by row
            },
            qtime: {
                interval: 3,
                step: 1000
            }
        });
		$('#example2 a').colorbox();
    }
    
});




