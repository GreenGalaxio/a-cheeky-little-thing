package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_fowardthrow_49 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function sora_fowardthrow_49()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,6,this.frame7,7,this.frame8,17,this.frame18,18,this.frame19,25,this.frame26);
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
      
      function frame7() : *
      {
         this.playsound = SSF2API.random();
         this.audio = this.self.getGlobalVariable("audio");
      }
      
      function frame8() : *
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
         this.self.refreshAttackID();
      }
      
      function frame18() : *
      {
         this.playsound = SSF2API.random();
         this.audio = this.self.getGlobalVariable("audio");
      }
      
      function frame19() : *
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
         this.self.updateAttackBoxStats(1,{
            "damage":5,
            "hasEffect":true,
            "effectSound":"key_hit4"
         });
         this.self.playAttackSound(1);
         this.self.refreshAttackID();
      }
      
      function frame26() : *
      {
         this.self.endAttack();
      }
   }
}
