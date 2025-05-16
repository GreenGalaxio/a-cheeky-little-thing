package
{
   import flash.display.MovieClip;
   
   public dynamic class sora_fsbox extends MovieClip
   {
       
      
      public function sora_fsbox()
      {
         super();
         addFrameScript(63,this.frame64);
      }
      
      function frame64() : *
      {
         stop();
         parent.removeChild(this);
      }
   }
}
