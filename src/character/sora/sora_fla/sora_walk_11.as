package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_walk_11 extends MovieClip
   {
       
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public function sora_walk_11()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,21,this.frame22);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         if(parent && SSF2API.isReady())
         {
            this.self.setGlobalVariable("jab",false);
            this.self.setGlobalVariable("jab2",false);
         }
      }
      
      function frame10() : *
      {
         SSF2API.playSound("sora_step1");
      }
      
      function frame22() : *
      {
         SSF2API.playSound("sora_step2");
      }
   }
}
