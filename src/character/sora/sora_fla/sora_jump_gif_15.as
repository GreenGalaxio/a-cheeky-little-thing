package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_jump_gif_15 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public var done:Boolean;
      
      public function sora_jump_gif_15()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         this.done = false;
         if(parent && SSF2API.isReady())
         {
            SSF2API.playSound("sora_jump1");
         }
      }
      
      function frame6() : *
      {
         this.self.endAttack();
      }
   }
}
