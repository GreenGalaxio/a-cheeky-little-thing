package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_TechRoll_88 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function sora_TechRoll_88()
      {
         super();
         addFrameScript(0,this.frame1,10,this.frame11,19,this.frame20);
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
      
      function frame20() : *
      {
         this.self.endAttack();
      }
   }
}
