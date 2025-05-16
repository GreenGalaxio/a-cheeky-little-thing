package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class GoldAngryCucco extends AngryCucco
   {
       
      
      public function GoldAngryCucco(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         m_isGold = true;
         super(param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("goldcucco_peck"));
         m_attack.Frame = "goldcucco_peck";
      }
   }
}
