package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_thunder_gif_92 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var self;
      
      public var character;
      
      public function sora_thunder_gif_92()
      {
         super();
         addFrameScript(0,this.frame1,6,this.frame7,10,this.frame11,18,this.frame19,19,this.frame20);
      }
      
      function frame1() : *
      {
         this.self = SSF2API.getProjectile(this);
         if(SSF2API.isReady() && this.self)
         {
            this.character = SSF2API.getCharacter(this.self.getID());
         }
      }
      
      function frame7() : *
      {
         SSF2API.playSound("Sora_lightning");
         this.self.refreshAttackID();
      }
      
      function frame11() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame19() : *
      {
         stop();
      }
      
      function frame20() : *
      {
         gotoAndStop("stopped");
      }
   }
}
