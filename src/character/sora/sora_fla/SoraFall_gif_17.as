package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class SoraFall_gif_17 extends MovieClip
   {
       
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function SoraFall_gif_17()
      {
         super();
         addFrameScript(0,this.frame1,8,this.frame9,33,this.frame34);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
      }
      
      function frame9() : *
      {
         gotoAndPlay("redo");
      }
      
      function frame34() : *
      {
         gotoAndPlay("again");
      }
   }
}
