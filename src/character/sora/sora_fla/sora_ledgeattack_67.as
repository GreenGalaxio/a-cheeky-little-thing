package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_ledgeattack_67 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var self;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public var damage:Number;
      
      public function sora_ledgeattack_67()
      {
         super();
         addFrameScript(0,this.frame1,7,this.frame8,9,this.frame10,12,this.frame13,17,this.frame18,18,this.frame19,20,this.frame21,23,this.frame24,24,this.frame25,27,this.frame28,28,this.frame29,30,this.frame31,31,this.frame32,33,this.frame34,34,this.frame35,36,this.frame37,37,this.frame38,39,this.frame40,40,this.frame41,42,this.frame43,43,this.frame44,45,this.frame46,46,this.frame47,47,this.frame48,53,this.frame54);
      }
      
      function frame1() : *
      {
         this.self = SSF2API.getCharacter(this);
         if(this.self && SSF2API.isReady())
         {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
         }
         if(SSF2API.isReady() && this.self)
         {
            this.self.setIntangibility(true);
         }
      }
      
      function frame8() : *
      {
         this.damage = 0;
         this.damage = this.self.getDamage();
         if(this.damage >= 100)
         {
            gotoAndPlay("heavy");
         }
      }
      
      function frame10() : *
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
         this.self.setIntangibility(false);
      }
      
      function frame13() : *
      {
         this.self.playAttackSound(1);
      }
      
      function frame18() : *
      {
         this.self.endAttack();
      }
      
      function frame19() : *
      {
         this.self.setIntangibility(true);
      }
      
      function frame21() : *
      {
         this.self.setXSpeed(15,false);
      }
      
      function frame24() : *
      {
         this.self.setXSpeed(0);
      }
      
      function frame25() : *
      {
         this.self.setXSpeed(15,false);
      }
      
      function frame28() : *
      {
         this.self.setXSpeed(0);
      }
      
      function frame29() : *
      {
         this.self.setXSpeed(15,false);
      }
      
      function frame31() : *
      {
         this.self.setXSpeed(0);
         this.self.updateAttackBoxStats(1,{"effectSound":"key_hit2"});
      }
      
      function frame32() : *
      {
         this.self.setXSpeed(15,false);
      }
      
      function frame34() : *
      {
         this.self.setXSpeed(0);
      }
      
      function frame35() : *
      {
         this.self.setXSpeed(15,false);
         this.self.setIntangibility(false);
      }
      
      function frame37() : *
      {
         this.self.setXSpeed(0);
      }
      
      function frame38() : *
      {
         this.self.setXSpeed(15,false);
      }
      
      function frame40() : *
      {
         this.self.setXSpeed(0);
      }
      
      function frame41() : *
      {
         this.self.setXSpeed(15,false);
      }
      
      function frame43() : *
      {
         this.self.setXSpeed(0);
      }
      
      function frame44() : *
      {
         this.self.setXSpeed(15,false);
      }
      
      function frame46() : *
      {
         this.self.updateAttackBoxStats(1,{
            "damage":11,
            "direction":50,
            "power":0
         });
         this.self.setXSpeed(0);
      }
      
      function frame47() : *
      {
         this.self.flip();
      }
      
      function frame48() : *
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
      }
      
      function frame54() : *
      {
         this.self.endAttack();
      }
   }
}
