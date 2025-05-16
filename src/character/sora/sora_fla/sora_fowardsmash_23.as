package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_fowardsmash_23 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var self;
      
      public var xframe:String;
      
      public function sora_fowardsmash_23()
      {
         super();
         addFrameScript(0,this.frame1,4,this.frame5,9,this.frame10,11,this.frame12,26,this.frame27);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         if(parent && SSF2API.isReady() && this.self)
         {
            this.self.playVoiceSound(1);
         }
         this.xframe = null;
      }
      
      function frame5() : *
      {
         this.xframe = "charging";
      }
      
      function frame10() : *
      {
         this.gotoAndPlay("charging");
      }
      
      function frame12() : *
      {
         this.xframe = "attack";
         this.self.playVoiceSound(2);
         this.self.playAttackSound(1);
         this.self.setXSpeed(3,false);
      }
      
      function frame27() : *
      {
         this.self.endAttack();
      }
   }
}
