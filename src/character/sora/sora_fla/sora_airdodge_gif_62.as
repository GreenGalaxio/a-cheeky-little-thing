package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_airdodge_gif_62 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function sora_airdodge_gif_62()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,14,this.frame15,23,this.frame24);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
      }
      
      function frame3() : *
      {
         this.self.setIntangibility(true);
      }
      
      function frame15() : *
      {
         this.self.setIntangibility(false);
      }
      
      function frame24() : *
      {
         this.self.endAttack();
      }
   }
}
