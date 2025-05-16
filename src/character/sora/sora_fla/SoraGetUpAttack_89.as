package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class SoraGetUpAttack_89 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var self;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function SoraGetUpAttack_89()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,5,this.frame6,6,this.frame7,23,this.frame24);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         if(parent && SSF2API.isReady() && this.self)
         {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
         }
         if(parent && SSF2API.isReady())
         {
            this.self.setIntangibility(true);
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
      }
      
      function frame6() : *
      {
         this.self.setIntangibility(false);
      }
      
      function frame7() : *
      {
         this.self.playAttackSound(1);
      }
      
      function frame24() : *
      {
         this.self.endAttack();
      }
   }
}
