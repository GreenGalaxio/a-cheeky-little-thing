package
{
   import flash.display.MovieClip;
   
   public dynamic class boltkeyblade extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public function boltkeyblade()
      {
         super();
         addFrameScript(5,this.frame6,16,this.frame17,17,this.frame18);
      }
      
      function frame6() : *
      {
         gotoAndPlay("again");
      }
      
      function frame17() : *
      {
         stop();
      }
      
      function frame18() : *
      {
         gotoAndStop("stopped");
      }
   }
}
