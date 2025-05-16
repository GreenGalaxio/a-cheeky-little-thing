package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_sidedodge_61 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function sora_sidedodge_61()
      {
         super();
         addFrameScript(0,this.frame1,15,this.frame16,16,this.frame17);
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
      
      function frame16() : *
      {
         this.self.setIntangibility(false);
      }
      
      function frame17() : *
      {
         this.self.endAttack();
      }
   }
}
