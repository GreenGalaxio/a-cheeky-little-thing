package  {
	
	import flash.display.MovieClip;
	
	
	public class ness_spark3_jump extends MovieClip {
		
		
		public function ness_spark3_jump() 
		{
         addFrameScript(9,this.frame10);
		}
		
		function frame10() : *
      {
         stop();
         parent.removeChild(this);
      }
	}
	
}
