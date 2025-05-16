package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.BowsersCastleLava;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class BowsersCastleLavaHazard extends StageHazard
   {
       
      
      public function BowsersCastleLavaHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         m_safe = true;
      }
      
      override protected function runHazard() : void
      {
         STAGEDATA.spawnEnemy(BowsersCastleLava,235.5,264.5);
      }
   }
}
