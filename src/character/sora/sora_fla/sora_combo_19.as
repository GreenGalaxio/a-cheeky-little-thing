package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_combo_19 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var self;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public var continuePlaying:Boolean;
      
      public var handled:Boolean;
      
      public var time:Number;
      
      public var controls:Object;
      
      public var used:Boolean;
      
      public var used2:Boolean;
      
      public var cont:Boolean;
      
      public function sora_combo_19()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3,6,this.frame7,7,this.frame8,8,this.frame9,9,this.frame10,14,this.frame15,16,this.frame17,17,this.frame18,19,this.frame20,26,this.frame27);
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
      
      function frame2() : *
      {
         this.continuePlaying = false;
         this.handled = false;
         this.time = this.self.getLastUsed();
         this.controls = this.self.getControls();
         this.used = this.self.getGlobalVariable("jab");
         this.used2 = this.self.getGlobalVariable("jab2");
         this.cont = false;
         if(this.used && this.time <= 13)
         {
            gotoAndPlay("hit2");
         }
         if(this.used2 && this.time <= 13)
         {
            gotoAndPlay("hit3");
         }
      }
      
      function frame3() : *
      {
         this.self.playAttackSound(1);
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
         this.self.setGlobalVariable("jab",true);
         this.self.setGlobalVariable("jab2",false);
      }
      
      function frame7() : *
      {
         if(this.continuePlaying)
         {
            gotoAndPlay("hit2");
         }
      }
      
      function frame8() : *
      {
         this.self.endAttack();
      }
      
      function frame9() : *
      {
         this.continuePlaying = false;
         this.handled = false;
         this.self.setGlobalVariable("jab",false);
         this.self.setGlobalVariable("jab2",true);
         this.self.setLastUsed("a",0);
      }
      
      function frame10() : *
      {
         this.self.playAttackSound(1);
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
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{
            "direction":45,
            "hitStun":4,
            "power":0
         });
      }
      
      function frame15() : *
      {
         if(this.continuePlaying)
         {
            gotoAndPlay("hit3");
         }
      }
      
      function frame17() : *
      {
         this.self.endAttack();
      }
      
      function frame18() : *
      {
         this.self.refreshAttackID();
         this.self.setGlobalVariable("jab",false);
         this.self.setGlobalVariable("jab2",false);
         this.self.updateAttackBoxStats(1,{
            "damage":5,
            "direction":45,
            "power":50,
            "kbConstant":70,
            "weightKB":0
         });
      }
      
      function frame20() : *
      {
         this.self.playAttackSound(1);
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
      }
      
      function frame27() : *
      {
         this.self.endAttack();
      }
   }
}
