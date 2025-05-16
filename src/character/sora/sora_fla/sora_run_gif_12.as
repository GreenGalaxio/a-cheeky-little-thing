package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_run_gif_12 extends MovieClip
   {
       
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function sora_run_gif_12()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,11,this.frame12,12,this.frame13,13,this.frame14,20,this.frame21,25,this.frame26);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
      }
      
      function frame6() : *
      {
         SSF2API.playSound("sora_step1");
      }
      
      function frame12() : *
      {
         SSF2API.playSound("sora_step2");
      }
      
      function frame13() : *
      {
         gotoAndPlay("run");
      }
      
      function frame14() : *
      {
         SSF2API.playSound("Run_start");
      }
      
      function frame21() : *
      {
         gotoAndPlay("run");
      }
      
      function frame26() : *
      {
         gotoAndPlay("run");
      }
   }
}
