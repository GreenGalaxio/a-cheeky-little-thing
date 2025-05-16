package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_downthrow_50 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self;
      
      public function sora_downthrow_50()
      {
         super();
         addFrameScript(0,this.frame1,13,this.frame14,19,this.frame20,29,this.frame30);
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
      
      function frame14() : *
      {
         this.self.playVoiceSound(2);
      }
      
      function frame20() : *
      {
         this.self.playAttackSound(1);
      }
      
      function frame30() : *
      {
         this.self.endAttack();
      }
   }
}
