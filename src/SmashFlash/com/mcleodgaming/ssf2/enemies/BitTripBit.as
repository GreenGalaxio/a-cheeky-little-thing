package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class BitTripBit extends Enemy
   {
       
      
      private var m_destroyTimer:FrameTimer;
      
      public function BitTripBit(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("bitProjectile",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("n3ds_hazard_stats"));
         m_attack.IsAttacking = true;
         m_attack.IsAttacking = true;
         Attack("bit");
         this.m_destroyTimer = new FrameTimer(30 * 4);
      }
      
      public function toBit() : void
      {
         Attack("bit");
      }
      
      public function toByte() : void
      {
         Attack("byte");
      }
      
      private function runAI() : void
      {
         this.m_destroyTimer.tick();
         if(this.m_destroyTimer.IsComplete)
         {
            destroy();
         }
         else
         {
            checkDeath();
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               move();
               gravity();
               performAttackChecks();
               attackCollisionTest();
               updateSelfPlatform();
            }
         }
      }
   }
}
