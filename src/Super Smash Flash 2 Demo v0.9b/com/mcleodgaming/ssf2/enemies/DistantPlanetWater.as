package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class DistantPlanetWater extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_levelTimer:FrameTimer;
      
      private var m_leaveTimer:FrameTimer;
      
      public function DistantPlanetWater(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("distantPlanetWater",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("distantPlanetWater_stats"));
         STAGEDATA.StageFG.water.alpha = 0;
         m_sprite.visible = false;
         this.m_levelTimer = new FrameTimer(30 * 5);
         this.m_leaveTimer = new FrameTimer(30 * 3);
         playFrame("waterLevel0");
      }
      
      public function activate() : void
      {
         this.m_action = 1;
         Attack("waterLevel1");
      }
      
      private function runAI() : void
      {
         var _loc1_:int = 0;
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               this.m_levelTimer.tick();
               STAGEDATA.StageFG.water.alpha = 0 + 0.2 * (this.m_levelTimer.CurrentTime / this.m_levelTimer.MaxTime);
               if(this.m_levelTimer.IsComplete)
               {
                  Attack("waterLevel2");
                  this.m_levelTimer.reset();
                  this.m_action = 2;
               }
            }
            else if(this.m_action == 2)
            {
               this.m_levelTimer.tick();
               STAGEDATA.StageFG.water.alpha = 0.2 + 0.2 * (this.m_levelTimer.CurrentTime / this.m_levelTimer.MaxTime);
               if(this.m_levelTimer.IsComplete)
               {
                  Attack("waterLevel3");
                  this.m_levelTimer.reset();
                  this.m_action = 3;
               }
            }
            else if(this.m_action == 3)
            {
               this.m_levelTimer.tick();
               STAGEDATA.StageFG.water.alpha = 0.4 + 0.2 * (this.m_levelTimer.CurrentTime / this.m_levelTimer.MaxTime);
               if(this.m_levelTimer.IsComplete)
               {
                  this.m_levelTimer.reset();
                  Attack("waterLevel1");
                  this.m_action = 4;
               }
            }
            else if(this.m_action == 4)
            {
               this.m_leaveTimer.tick();
               STAGEDATA.StageFG.water.alpha = 0.6 - 0.6 * (this.m_leaveTimer.CurrentTime / this.m_leaveTimer.MaxTime);
               if(this.m_leaveTimer.IsComplete)
               {
                  this.m_leaveTimer.reset();
                  playFrame("waterLevel0");
                  this.m_action = 0;
               }
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
