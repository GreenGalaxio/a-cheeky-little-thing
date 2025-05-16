package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_crouch_57 extends MovieClip
   {
       
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function sora_crouch_57()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,4,this.frame5);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
      }
      
      function frame4() : *
      {
         stop();
      }
      
      function frame5() : *
      {
         this.gotoAndStop("stopped");
      }
   }
}
