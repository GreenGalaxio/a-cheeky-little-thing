package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_thunderMove_42 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var self;
      
      public function sora_thunderMove_42()
      {
         super();
         addFrameScript(0,this.frame1,12,this.frame13,15,this.frame16,31,this.frame32,32,this.frame33);
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
      
      function frame13() : *
      {
         this.self.playAttackSound(1);
         this.self.fireProjectile("sora_thunder");
      }
      
      function frame16() : *
      {
         this.self.playAttackSound(2);
      }
      
      function frame32() : *
      {
         this.self.setAttackEnabled(false,"b_down",20);
         this.self.setAttackEnabled(false,"b_down_air",20);
      }
      
      function frame33() : *
      {
         this.self.endAttack();
      }
   }
}
