package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_lose_gif_10 extends MovieClip
   {
       
      
      public var self;
      
      public function sora_lose_gif_10()
      {
         super();
         addFrameScript(0,this.frame1,7,this.frame8);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
      }
      
      function frame8() : *
      {
         this.gotoAndPlay("again");
      }
   }
}
