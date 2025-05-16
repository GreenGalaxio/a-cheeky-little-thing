package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class LunarCoreLaser extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_type:int;
      
      private var m_waitTimer:FrameTimer;
      
      public function LunarCoreLaser(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("lunarLaser",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("lunarCore_stats"));
         this.m_action = 0;
         this.m_type = Utils.randomInteger(1,3);
         Attack("attack" + this.m_type);
         STAGEDATA.StageFG.gotoAndStop("attack" + this.m_type);
         this.m_waitTimer = new FrameTimer(126);
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            this.m_waitTimer.tick();
            if(this.m_waitTimer.IsComplete)
            {
               STAGEDATA.StageFG.gotoAndStop("idle");
               destroy();
            }
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
