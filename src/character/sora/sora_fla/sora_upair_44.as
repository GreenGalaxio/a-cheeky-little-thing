package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import com.mcleodgaming.ssf2api.core.SSF2Event;
   import flash.display.MovieClip;
   
   public dynamic class sora_upair_44 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var self;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function sora_upair_44()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,8,this.frame9,10,this.frame11);
      }
      
      public function Bounce(param1:* = null) : void
      {
         if(this.self.getYSpeed() >= 0)
         {
            this.self.setYSpeed(-5);
         }
         SSF2API.removeEventListener(this.self,SSF2Event.ATTACK_HIT,this.Bounce);
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
         if(parent && SSF2API.isReady())
         {
            SSF2API.addEventListener(this.self,SSF2Event.ATTACK_HIT,this.Bounce,{"persistent":false});
            SSF2API.removeEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toLand);
            SSF2API.addEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toIdle);
         }
      }
      
      function frame3() : *
      {
         if(this.playsound > 0.2 && this.playsound <= 0.4 && this.audio != 1)
         {
            this.self.playVoiceSound(1);
            this.self.setGlobalVariable("audio",1);
         }
         if(this.playsound > 0.4 && this.playsound <= 0.6 && this.audio != 2)
         {
            this.self.playVoiceSound(2);
            this.self.setGlobalVariable("audio",2);
         }
         if(this.playsound > 0.6 && this.playsound <= 0.8 && this.audio != 3)
         {
            this.self.playVoiceSound(3);
            this.self.setGlobalVariable("audio",3);
         }
         if(this.playsound > 0.8 && this.playsound <= 1 && this.audio != 4)
         {
            this.self.playVoiceSound(4);
            this.self.setGlobalVariable("audio",4);
         }
         this.self.playAttackSound(1);
         SSF2API.addEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toLand);
      }
      
      function frame9() : *
      {
         SSF2API.removeEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toLand);
         SSF2API.addEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toIdle);
      }
      
      function frame11() : *
      {
         this.self.endAttack();
      }
   }
}
