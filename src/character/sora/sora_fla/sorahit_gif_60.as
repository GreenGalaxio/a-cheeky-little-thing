package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sorahit_gif_60 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public var xframe:String;
      
      public function sorahit_gif_60()
      {
         super();
         addFrameScript(0,this.frame1,8,this.frame9,9,this.frame10,10,this.frame11,13,this.frame14,14,this.frame15);
      }
      
      function frame1() : *
      {
         this.self = SSF2API.getCharacter(this);
         if(SSF2API.isReady())
         {
            this.self.setAttackEnabled(true,"b_up");
            this.self.setAttackEnabled(true,"b_up_air");
         }
         this.xframe = "hurt1";
      }
      
      function frame9() : *
      {
         this.xframe = "done1";
         stop();
      }
      
      function frame10() : *
      {
         gotoAndStop("done1");
      }
      
      function frame11() : *
      {
         this.xframe = "hurt2";
      }
      
      function frame14() : *
      {
         this.xframe = "done2";
         stop();
      }
      
      function frame15() : *
      {
         gotoAndStop("done2");
      }
   }
}
