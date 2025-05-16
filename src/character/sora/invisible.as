package
{
   import flash.display.MovieClip;
   
   public dynamic class invisible extends MovieClip
   {
       
      
      public var stance:MovieClip;
      
      public function invisible()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
