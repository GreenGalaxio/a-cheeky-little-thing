package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_upthrow_48 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self;
      
      public function sora_upthrow_48()
      {
         super();
         addFrameScript(0,this.frame1,14,this.frame15);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         if(parent && SSF2API.isReady())
         {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
         }
      }
      
      function frame15() : *
      {
         this.self.endAttack();
      }
   }
}
