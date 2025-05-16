package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class ClockTownFlamingRock extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_waitTimer:FrameTimer;
      
      private var m_startXSpeed:Number;
      
      private var m_startYSpeed:Number;
      
      public function ClockTownFlamingRock(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("zeldaMeteor",param1,param2,param3,param4);
         m_gravity = 1;
         m_max_ySpeed = 6;
         this.m_action = 0;
         this.m_waitTimer = new FrameTimer(40);
         m_attackData.importAttacks(Main.getEnemyAttackData("clocktown_flamingrock_stats"));
         m_width = 60;
         m_height = 60;
         Attack("idle");
         this.m_startXSpeed = Utils.randomInteger(-10,10);
         this.m_startYSpeed = 6;
         m_xSpeed = this.m_startXSpeed;
         m_ySpeed = this.m_startYSpeed;
      }
      
      public function triggerRewind() : void
      {
         this.m_action = 1;
         m_xSpeed = 0;
         m_ySpeed = 0;
         m_gravity = 0;
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            if(m_sprite.y > STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height)
            {
               destroy();
            }
         }
         else if(this.m_action == 1)
         {
            this.m_waitTimer.tick();
            if(this.m_waitTimer.IsComplete)
            {
               m_xSpeed = -this.m_startXSpeed;
               m_ySpeed = -this.m_startYSpeed;
               this.m_action = 2;
               m_attack.IsAttacking = false;
            }
         }
         else if(this.m_action == 2)
         {
            if(m_sprite.y < STAGEDATA.DeathBounds.y)
            {
               destroy();
            }
         }
      }
      
      override protected function move() : void
      {
         m_attemptToMove(m_xSpeed,0);
         if(m_hitPlatform)
         {
            destroy();
         }
         else
         {
            m_attemptToMove(0,m_ySpeed);
            if(m_hitPlatform)
            {
               destroy();
            }
         }
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:Boolean = m_collision.ground;
         super.m_groundCollisionTest();
         if(!_loc1_ && m_collision.ground)
         {
            destroy();
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
            }
         }
      }
   }
}
