package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   
   public class YoshisIsland_2 extends YoshisIsland_RotatingPlatform
   {
       
      
      public function YoshisIsland_2(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         m_angle = 45;
      }
   }
}
