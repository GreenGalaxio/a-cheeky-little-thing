package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.Yggdrasil;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class YggdrasilHazard extends StageHazard
   {
       
      
      public function YggdrasilHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         if(STAGEDATA.HazardsOn)
         {
            STAGEDATA.spawnEnemy(Yggdrasil,236,20);
         }
      }
      
      override protected function runHazard() : void
      {
      }
   }
}
