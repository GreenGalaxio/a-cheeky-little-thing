package
{
   import flash.display.MovieClip;
   
   public dynamic class sora_thunderproj extends MovieClip
   {
       
      
      public var stance:MovieClip;
      
      public function sora_thunderproj()
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
