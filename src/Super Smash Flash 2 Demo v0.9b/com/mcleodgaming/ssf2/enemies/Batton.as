package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class Batton extends Enemy
   {
       
      
      private var X_SPEED:Number = 4;
      
      private var Y_SPEED:Number = 4;
      
      private var m_patternIndex:int;
      
      private var m_leftPatternTimers:Vector.<FrameTimer>;
      
      private var m_rightPatternTimers:Vector.<FrameTimer>;
      
      private var m_currentPatternTimers:Vector.<FrameTimer>;
      
      public function Batton(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("batton",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("batton_stats"));
         m_ySpeed = 0;
         this.m_patternIndex = 0;
         this.m_rightPatternTimers = new Vector.<FrameTimer>();
         this.m_rightPatternTimers.push(new FrameTimer(30 * 4.5));
         this.m_rightPatternTimers.push(new FrameTimer(30 * 0.5));
         this.m_rightPatternTimers.push(new FrameTimer(30 * 1.5));
         this.m_rightPatternTimers.push(new FrameTimer(30 * 0.7));
         this.m_rightPatternTimers.push(new FrameTimer(30 * 1));
         this.m_rightPatternTimers.push(new FrameTimer(30 * 1));
         this.m_rightPatternTimers.push(new FrameTimer(30 * 20));
         this.m_leftPatternTimers = new Vector.<FrameTimer>();
         this.m_leftPatternTimers.push(new FrameTimer(30 * 4));
         this.m_leftPatternTimers.push(new FrameTimer(30 * 0.5));
         this.m_leftPatternTimers.push(new FrameTimer(30 * 1.25));
         this.m_leftPatternTimers.push(new FrameTimer(30 * 0.7));
         this.m_leftPatternTimers.push(new FrameTimer(30 * 0.5));
         this.m_leftPatternTimers.push(new FrameTimer(30 * 0.6));
         this.m_leftPatternTimers.push(new FrameTimer(30 * 20));
         this.m_currentPatternTimers = this.m_rightPatternTimers;
         Attack("fly");
      }
      
      private function runAI() : void
      {
         if(this.m_patternIndex < this.m_currentPatternTimers.length)
         {
            this.m_currentPatternTimers[this.m_patternIndex].tick();
            if(this.m_currentPatternTimers[this.m_patternIndex].IsComplete)
            {
               this.m_patternIndex++;
               if(m_ySpeed == 0)
               {
                  m_ySpeed = this.Y_SPEED;
               }
               else
               {
                  m_ySpeed = 0;
               }
            }
         }
         if(m_sprite.x > STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width && m_facingForward || m_sprite.x < STAGEDATA.DeathBounds.x && !m_facingForward)
         {
            destroyAllProjectiles();
            destroy();
         }
      }
      
      override protected function m_faceLeft() : void
      {
         super.m_faceLeft();
         m_xSpeed = -this.X_SPEED;
         this.m_currentPatternTimers = this.m_leftPatternTimers;
      }
      
      override protected function m_faceRight() : void
      {
         super.m_faceRight();
         m_xSpeed = this.X_SPEED;
         this.m_currentPatternTimers = this.m_rightPatternTimers;
      }
      
      override protected function move() : void
      {
         m_sprite.x = m_sprite.x + m_xSpeed;
         m_sprite.y = m_sprite.y + m_ySpeed;
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
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
