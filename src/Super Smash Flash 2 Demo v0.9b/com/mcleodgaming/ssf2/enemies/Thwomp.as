package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.platforms.BowsersCastlePlatform;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class Thwomp extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_waitTimer:FrameTimer;
      
      private var m_delayTimer:FrameTimer;
      
      public function Thwomp(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("thwomp_mc",param1,param2,param3,param4);
         m_gravity = 30;
         m_max_ySpeed = 30;
         m_attackData.importAttacks(Main.getEnemyAttackData("thwomp_stats"));
         Attack("fall");
         m_width = 110;
         m_height = 130;
         this.m_action = -1;
         this.m_delayTimer = new FrameTimer(60);
         this.m_waitTimer = new FrameTimer(30 * 3);
         createSelfPlatform(-55,-120,120,130);
         m_attack.IsAttacking = false;
         m_selfPlatform.fallthrough = true;
         setCamBoxSize(110 + 30,130 + 30,-15,-15);
         STAGEDATA.CamRef.addTarget(m_sprite);
      }
      
      private function runAI() : void
      {
         if(this.m_action == -1)
         {
            this.m_delayTimer.tick();
            if(this.m_delayTimer.IsComplete)
            {
               this.m_action = 0;
               m_attack.IsAttacking = true;
               m_selfPlatform.fallthrough = false;
            }
         }
         else if(this.m_action == 0)
         {
            if(m_collision.ground)
            {
               this.m_action = 1;
               playFrame("idle");
               STAGEDATA.playSpecificSound("stg_thwomp");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_waitTimer.tick();
            if(this.m_waitTimer.IsComplete)
            {
               this.m_action = 2;
               unnattachFromGround();
               m_gravity = 0;
               m_ySpeed = -6;
               this.m_waitTimer.reset();
            }
         }
         else if(this.m_action == 2)
         {
            if(m_sprite.y < m_y_start)
            {
               destroy();
            }
         }
      }
      
      override protected function move() : void
      {
         if(this.m_action == -1)
         {
            return;
         }
         m_attemptToMove(m_xSpeed,0);
         m_attemptToMove(0,m_ySpeed);
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:Boolean = m_collision.ground;
         super.m_groundCollisionTest();
         if(!_loc1_ && m_collision.ground)
         {
            if(m_currentPlatform is BowsersCastlePlatform)
            {
               STAGEDATA.CamRef.shake(8);
               BowsersCastlePlatform(m_currentPlatform).sink();
               STAGEDATA.CamRef.deleteTarget(m_sprite);
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
               this.move();
               gravity();
               this.m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
               updateSelfPlatform();
            }
         }
      }
   }
}
