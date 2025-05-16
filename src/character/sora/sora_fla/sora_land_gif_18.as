package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_land_gif_18 extends MovieClip
   {
       
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function sora_land_gif_18()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4);
      }
      
      function frame1() : *
      {
         this.self = SSF2API.getCharacter(this);
         if(SSF2API.isReady())
         {
            this.self.setAttackEnabled(true,"b_up");
            this.self.setAttackEnabled(true,"b_up_air");
         }
      }
      
      function frame4() : *
      {
         this.self.endAttack();
      }
   }
}
