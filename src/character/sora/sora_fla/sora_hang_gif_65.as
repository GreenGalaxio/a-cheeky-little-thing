package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_hang_gif_65 extends MovieClip
   {
       
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var self;
      
      public function sora_hang_gif_65()
      {
         super();
         addFrameScript(0,this.frame1,20,this.frame21);
      }
      
      function frame1() : *
      {
         this.self = SSF2API.getCharacter(this);
         if(SSF2API.isReady() && this.self)
         {
            this.self.setAttackEnabled("b_up",true);
            this.self.setAttackEnabled("b_up_air",true);
         }
      }
      
      function frame21() : *
      {
         this.gotoAndPlay("again");
      }
   }
}
