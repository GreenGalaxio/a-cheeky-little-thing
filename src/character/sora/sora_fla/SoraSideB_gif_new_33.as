package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class SoraSideB_gif_new_33 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var self;
      
      public function SoraSideB_gif_new_33()
      {
         super();
         addFrameScript(0,this.frame1,8,this.frame9,14,this.frame15,34,this.frame35,44,this.frame45,45,this.frame46,50,this.frame51);
      }
      
      function frame1() : *
      {
         this.self = SSF2API.getCharacter(this);
      }
      
      function frame9() : *
      {
         this.self.fireProjectile("sora_strikeraid");
         this.self.playVoiceSound(1);
         this.self.playAttackSound(1);
      }
      
      function frame15() : *
      {
      }
      
      function frame35() : *
      {
         gotoAndPlay("finish");
      }
      
      function frame45() : *
      {
         this.self.endAttack();
      }
      
      function frame46() : *
      {
      }
      
      function frame51() : *
      {
         this.self.endAttack();
      }
   }
}
