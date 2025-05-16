package
{
   import flash.display.MovieClip;
   
   public dynamic class kh_stars extends MovieClip
   {
       
      
      public function kh_stars()
      {
         super();
         addFrameScript(10,this.frame11);
      }
      
      function frame11() : *
      {
         stop();
         parent.removeChild(this);
      }
   }
}
