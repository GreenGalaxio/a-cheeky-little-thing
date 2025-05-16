package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   
   public class SandOceanCeiling extends MovingPlatform
   {
       
      
      public function SandOceanCeiling(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         fallthrough = !(STAGEDATA.StageBG.currentFrame > 465 && STAGEDATA.StageBG.currentFrame < 958);
         super.move();
      }
   }
}
