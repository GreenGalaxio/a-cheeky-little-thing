package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_dodge_63 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function sora_dodge_63()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,10,this.frame11,12,this.frame13);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
      }
      
      function frame2() : *
      {
         this.self.setIntangibility(true);
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
