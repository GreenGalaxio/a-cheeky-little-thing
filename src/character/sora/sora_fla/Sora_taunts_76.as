package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class Sora_taunts_76 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var self;
      
      public function Sora_taunts_76()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,31,this.frame32,32,this.frame33,49,this.frame50,52,this.frame53,88,this.frame89);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
      }
      
      function frame3() : *
      {
         SSF2API.playSound("khII_whatever");
      }
      
      function frame32() : *
      {
         this.self.endAttack();
      }
      
      function frame33() : *
      {
         SSF2API.playSound("sora_taunt2");
      }
      
      function frame50() : *
      {
         this.self.endAttack();
      }
      
      function frame53() : *
      {
         SSF2API.playSound("khII_hey");
      }
      
      function frame89() : *
      {
         this.self.endAttack();
      }
   }
}
