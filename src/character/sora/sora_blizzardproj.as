package
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import flash.display.MovieClip;
   
   public dynamic class sora_blizzardproj extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var self;
      
      public function sora_blizzardproj()
      {
         super();
         addFrameScript(0,this.frame1,32,this.frame33);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         if(root != null && parent != null && MovieClip(root).stageData != null)
         {
            MovieClip(root).stageData.getPlayer(this.player_id).playSpecificSound("Sora_blizzard");
         }
      }
      
      function frame33() : *
      {
         gotoAndPlay("redo");
      }
   }
}
