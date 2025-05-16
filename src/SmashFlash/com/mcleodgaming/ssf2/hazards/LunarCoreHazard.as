package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.LunarCoreLaser;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class LunarCoreHazard extends StageHazard
   {
       
      
      public function LunarCoreHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
      }
      
      override protected function runHazard() : void
      {
         STAGEDATA.spawnEnemy(LunarCoreLaser,263,-40);
      }
   }
}
