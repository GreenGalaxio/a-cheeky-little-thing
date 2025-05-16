package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class SoraStunned_gif_70 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function SoraStunned_gif_70()
      {
         super();
         addFrameScript(0,this.frame1,21,this.frame22);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
      }
      
      function frame22() : *
      {
         this.gotoAndPlay("again");
      }
   }
}
