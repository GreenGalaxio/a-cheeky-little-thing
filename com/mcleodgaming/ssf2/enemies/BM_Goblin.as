package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class BM_Goblin extends BlackMageEnemy
   {
       
      
      public function BM_Goblin(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         m_linkage_id = "bm_goblin";
         super(param1,param2,param3,param4);
         WALKSPEED = 1.75;
         m_attackData.importAttacks(Main.getEnemyAttackData("blackmage_goblin_stats"));
         Attack("walk");
      }
   }
}
