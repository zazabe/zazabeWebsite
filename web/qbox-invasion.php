<?php
$nbrowbox = isset($_GET['nb_invader_by_row']) ? $_GET['nb_invader_by_row'] : 25;

?><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>qBox jQuery plugin invasion demo, just for fun</title>
        
    </head>
    <body>
        <h1><a href="http://www.michel-meyer.fr/articles/qbox-plugin-sliding-boxes">qBox jQuery plugin</a> <?php echo ($nbrowbox*$nbrowbox)+2; ?> (<?php echo $nbrowbox; ?>x<?php echo $nbrowbox; ?>)+2 boxes invasion demo, just for fun</h1>
        
		<a href="qbox-invasion.php?nb_invader_by_row=<?php echo $nbrowbox + 5; ?>" title="add five more box by row/col">5x5 more</a>
        <a href="qbox-invasion.php?nb_invader_by_row=<?php echo $nbrowbox - 5; ?>" title="remove five box by row/col">5x5 less</a>
            
		<p>This demonstration can crash your browser, don't start it if you play with an old computer or browser</p>
		
		
	    <style type="text/css">
            #invasion {
                width: <?php echo 20*$nbrowbox; ?>px;
                height: <?php echo 20*$nbrowbox; ?>px;
                position: relative;
                overflow: hidden;
				margin: 10px auto;
            }
            
            #invasion div.invader {
                width: 20px;
                height: 20px;
				margin:0;
				padding:0;
                display: block;
            }
        </style>
		
            <a class="debug-mode" href="#" title="demonstration with outside box positions"><span>show</span> outside box position</a>
            <a class="resume-pause" href="#" title="demonstration pause/resume"><span>resume</span> the animation</a>
            
			
			<div id="invasion" class="demos">
				<?php for($i=0;$i<($nbrowbox*$nbrowbox)+2;$i++){echo '<div class="invader"></div>';}?>
			</div>
        </div>

        <script type="text/javascript" src="/themeZazabe2/js/jquery.js">
        </script>
        <script type="text/javascript" src="/themeZazabe2/js/qcolor.js">
        </script>
		<script type="text/javascript" src="/themeZazabe2/js/qtime.js">
        </script>
        <script type="text/javascript" src="/themeZazabe2/js/qbox.js">
        </script>
        <script type="text/javascript">
            $(document).ready(function(){
                
				$('div.invader').colorize();
				
				$('#invasion').qbox({
					slide: {
						duration:  400,
						from:      'all', 
						by:        'random' 
					},    
					qtime: {
		                 interval: 2,
		                 step: 500,
						 running: false
	                },
					box: {
						selector: 'div.invader',  //box jQuery selector
						rows:     <?php echo $nbrowbox; ?>,     //number of row
						cols:     <?php echo $nbrowbox; ?>     //number by row
					}
				});
				
            });
			
			
			
			//demo interaction
	    $('a.resume-pause').click(function(){
	        var qBox = $('#invasion').qbox();
	        
	        if (qBox.isRunning()) {
	            qBox.pause();
	            $('span', this).text('resume');
	        }
	        else {
	            qBox.resume();
	            $('span', this).text('pause');
	        }
	        return false;
	    });
	    
	    $('a.debug-mode').click(function(){
	        var qBox = $('#invasion').qbox();
	        
			if (qBox.switchOutsidePositionsDisplay()) {
	            $('span', this).text('hide');
	        	$('#invasion').css({'overflow' : 'visible'});
	        }
	        else {
	            $('span', this).text('show');
				$('#invasion').css({'overflow' : 'hidden'});
	        }
	        
	        return false;
	    });
        </script>
    </body>
</html>
