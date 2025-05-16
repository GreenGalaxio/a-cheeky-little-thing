package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class BM_Wolf extends BlackMageEnemy
   {
       
      
      public function BM_Wolf(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         m_linkage_id = "bm_wolf";
         super(param1,param2,param3,param4);
         WALKSPEED = 3.5;
         m_attackData.importAttacks(Main.getEnemyAttackData("blackmage_wolf_stats"));
         Attack("walk");
      }
   }
}
