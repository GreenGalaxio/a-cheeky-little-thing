package sora_fla
{
   import flash.display.MovieClip;
   
   public dynamic class CollisonBox_6 extends MovieClip
   {
       
      
      public function CollisonBox_6()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         this.visible = false;
      }
   }
}
