package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class GetupRoll_68 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function GetupRoll_68()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,16,this.frame17);
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
      
      function frame10() : *
      {
         this.self.setIntangibility(false);
      }
      
      function frame17() : *
      {
         this.self.endAttack();
      }
   }
}
