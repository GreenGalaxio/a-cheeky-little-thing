package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import com.mcleodgaming.ssf2api.core.SSF2Event;
   import flash.display.MovieClip;
   
   public dynamic class sora_neutralair_43 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var self;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function sora_neutralair_43()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,3,this.frame4,5,this.frame6,6,this.frame7,10,this.frame11,13,this.frame14);
      }
      
      public function Bounce(param1:* = null) : void
      {
         if(this.self.getYSpeed() >= 0)
         {
            this.self.setYSpeed(-5);
         }
         SSF2API.removeEventListener(this.self,SSF2Event.ATTACK_HIT,this.Bounce);
      }
      
      public function bounce(param1:* = null) : void
      {
         this.self.setYSpeed(-3);
         SSF2API.removeEventListener(this.self,SSF2Event.ATTACK_HIT,this.bounce);
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
            SSF2API.addEventListener(this.self,SSF2Event.ATTACK_HIT,this.Bounce,{"persistent":false});
         }
         if(this.self && SSF2API.isReady())
         {
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
         SSF2API.addEventListener(this.self,SSF2Event.ATTACK_HIT,this.bounce,{"persistent":false});
      }
      
      function frame4() : *
      {
         SSF2API.addEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toLand);
      }
      
      function frame6() : *
      {
         this.playsound = SSF2API.random();
         this.audio = this.self.getGlobalVariable("audio");
         SSF2API.removeEventListener(this.self,SSF2Event.ATTACK_HIT,this.bounce);
      }
      
      function frame7() : *
      {
         this.self.playAttackSound(1);
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{
            "direction":50,
            "kbConstant":105,
            "effectSound":"key_hit3"
         });
         SSF2API.addEventListener(this.self,SSF2Event.ATTACK_HIT,this.bounce,{"persistent":false});
      }
      
      function frame11() : *
      {
         SSF2API.removeEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toLand);
         SSF2API.addEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toIdle);
      }
      
      function frame14() : *
      {
         this.self.endAttack();
      }
   }
}
