package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_entrance_7 extends MovieClip
   {
       
      
      public var self;
      
      public function sora_entrance_7()
      {
         super();
         addFrameScript(0,this.frame1,35,this.frame36);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
      }
      
      function frame36() : *
      {
         this.self.endAttack();
      }
   }
}
