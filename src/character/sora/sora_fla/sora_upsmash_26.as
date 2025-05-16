package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_upsmash_26 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var pLockBox:MovieClip;
      
      public var self;
      
      public var xframe:String;
      
      public function sora_upsmash_26()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,10,this.frame11,11,this.frame12,14,this.frame15,25,this.frame26,30,this.frame31);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         this.xframe = null;
      }
      
      function frame6() : *
      {
         this.xframe = "charging";
      }
      
      function frame11() : *
      {
         this.gotoAndPlay("charging");
      }
      
      function frame12() : *
      {
         this.xframe = "attack";
      }
      
      function frame15() : *
      {
         this.self.fireProjectile("sora_wind");
         this.self.playVoiceSound(1);
         this.self.playAttackSound(1);
      }
      
      function frame26() : *
      {
      }
      
      function frame31() : *
      {
         this.self.endAttack();
      }
   }
}
