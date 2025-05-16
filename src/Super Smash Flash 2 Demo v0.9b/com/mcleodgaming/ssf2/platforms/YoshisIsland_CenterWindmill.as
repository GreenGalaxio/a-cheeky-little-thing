package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   
   public class YoshisIsland_CenterWindmill extends MovingPlatform
   {
       
      
      public function YoshisIsland_CenterWindmill(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         m_platform.rotation++;
      }
   }
}
