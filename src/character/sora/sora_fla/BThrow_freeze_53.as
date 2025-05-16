package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class BThrow_freeze_53 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self;
      
      public function BThrow_freeze_53()
      {
         super();
         addFrameScript(0,this.frame1,7,this.frame8,19,this.frame20);
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
         }
      }
      
      function frame8() : *
      {
         this.self.playAttackSound(1);
      }
      
      function frame20() : *
      {
         this.self.endAttack();
      }
   }
}
