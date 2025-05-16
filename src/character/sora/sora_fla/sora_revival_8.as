package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_revival_8 extends MovieClip
   {
       
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function sora_revival_8()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
      }
   }
}
