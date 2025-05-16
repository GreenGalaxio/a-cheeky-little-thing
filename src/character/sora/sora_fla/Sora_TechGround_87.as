package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class Sora_TechGround_87 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function Sora_TechGround_87()
      {
         super();
         addFrameScript(0,this.frame1,10,this.frame11,12,this.frame13);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         if(parent && SSF2API.isReady())
         {
            this.self.setIntangibility(true);
         }
      }
      
      function frame11() : *
      {
         this.self.setIntangibility(false);
      }
      
      function frame13() : *
      {
         this.self.endAttack();
      }
   }
}
