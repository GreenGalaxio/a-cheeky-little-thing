package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_uptilt_28 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var self;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function sora_uptilt_28()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,6,this.frame7,11,this.frame12);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         if(parent && SSF2API.isReady())
         {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
         }
      }
      
      function frame4() : *
      {
         this.self.playAttackSound(1);
      }
      
      function frame7() : *
      {
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{
            "power":60,
            "kbConstant":70,
            "damage":7
         });
      }
      
      function frame12() : *
      {
         this.self.endAttack();
      }
   }
}
