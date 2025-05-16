package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class BowsersCastleLava extends Enemy
   {
       
      
      public function BowsersCastleLava(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("bowserscastle_lava",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("bowserscastle_lava_stats"));
         Attack("idle");
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            if(!m_dead)
            {
               checkTimers();
               move();
               gravity();
               m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
