package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_grab_59 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var grabBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self;
      
      public var xframe:String;
      
      public function sora_grab_59()
      {
         super();
         addFrameScript(0,this.frame1,14,this.frame15,15,this.frame16,16,this.frame17,18,this.frame19,26,this.frame27);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         this.xframe = "grab";
      }
      
      function frame15() : *
      {
         this.self.endAttack();
      }
      
      function frame16() : *
      {
         this.xframe = "grab";
         stop();
      }
      
      function frame17() : *
      {
         gotoAndStop("grabbed");
      }
      
      function frame19() : *
      {
         this.xframe = "attack";
      }
      
      function frame27() : *
      {
         this.gotoAndStop("grabbed");
      }
   }
}
