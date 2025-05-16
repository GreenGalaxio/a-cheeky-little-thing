package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class SoraCrash_gif_72 extends MovieClip
   {
       
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public var ready;
      
      public function SoraCrash_gif_72()
      {
         super();
         addFrameScript(0,this.frame1,4,this.frame5,5,this.frame6,6,this.frame7,15,this.frame16,18,this.frame19);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         this.ready = false;
      }
      
      function frame5() : *
      {
         stop();
         this.ready = true;
      }
      
      function frame6() : *
      {
         gotoAndStop("dead");
      }
      
      function frame7() : *
      {
         if(!this.self.isForcedCrash())
         {
            this.self.setIntangibility(true);
         }
      }
      
      function frame16() : *
      {
         if(!this.self.isForcedCrash())
         {
            this.self.setIntangibility(false);
         }
      }
      
      function frame19() : *
      {
         this.self.endAttack();
      }
   }
}
