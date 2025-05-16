package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_downsmash_29 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var self;
      
      public var xframe:String;
      
      public function sora_downsmash_29()
      {
         super();
         addFrameScript(0,this.frame1,6,this.frame7,11,this.frame12,12,this.frame13,13,this.frame14,21,this.frame22,31,this.frame32);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         this.xframe = null;
      }
      
      function frame7() : *
      {
         this.xframe = "charging";
      }
      
      function frame12() : *
      {
         this.gotoAndPlay("charging");
      }
      
      function frame13() : *
      {
         this.xframe = "attack";
         this.self.playVoiceSound(1);
         this.self.playAttackSound(1);
      }
      
      function frame14() : *
      {
         this.self.playAttackSound(3);
      }
      
      function frame22() : *
      {
         this.self.updateAttackBoxStats(1,{
            "direction":-2,
            "damage":6,
            "power":88,
            "kbConstant":45
         });
         this.self.updateAttackStats({"refreshRate":-1});
         this.self.playAttackSound(2);
         this.self.refreshAttackID();
      }
      
      function frame32() : *
      {
         this.self.endAttack();
      }
   }
}
