package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_sidedodgecopy_66 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function sora_sidedodgecopy_66()
      {
         super();
         addFrameScript(0,this.frame1,13,this.frame14,23,this.frame24);
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
      
      function frame14() : *
      {
         this.self.setIntangibility(false);
      }
      
      function frame24() : *
      {
         this.self.endAttack();
      }
   }
}
