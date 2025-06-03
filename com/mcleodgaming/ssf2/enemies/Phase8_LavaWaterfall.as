package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class Phase8_LavaWaterfall extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_endTimer:FrameTimer;
      
      public function Phase8_LavaWaterfall(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("phase8fallinglava",param1,param2,param3,param4);
         this.m_action = 0;
         this.m_endTimer = new FrameTimer(30 * 9);
         m_attackData.importAttacks(Main.getEnemyAttackData("phase8_lava_stats"));
         Attack("lavawaterfall");
         STAGEDATA.StageBG.tubeMC.gotoAndStop("tube");
         STAGEDATA.StageFG.tubeFront.gotoAndStop("tube");
         STAGEDATA.StageFG.lavafallFG.gotoAndStop("lava");
      }
      
      private function runAI() : void
      {
         this.m_endTimer.tick();
         if(this.m_endTimer.IsComplete)
         {
            destroy();
            STAGEDATA.StageBG.tubeMC.gotoAndStop("noTube");
            STAGEDATA.StageFG.tubeFront.gotoAndStop("noTube");
            STAGEDATA.StageFG.lavafallFG.gotoAndStop("noLava");
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
            }
         }
      }
   }
}
