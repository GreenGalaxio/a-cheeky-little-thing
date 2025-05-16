package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class PacMan extends AssistTrophy
   {
       
      
      private var m_action:uint;
      
      private var m_nextActionTimer:FrameTimer;
      
      private var m_wakaTimer:FrameTimer;
      
      private var m_angle:Number;
      
      private var m_totalMovement:Number;
      
      private var m_justTurned:Boolean;
      
      private var m_endTimer:FrameTimer;
      
      private var m_waitTimer:FrameTimer;
      
      public function PacMan(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("pacman",param1,param2,param3,param4);
         m_gravity = 0;
         m_max_ySpeed = 10;
         m_width = 30;
         m_height = 30;
         this.m_action = 0;
         this.m_nextActionTimer = new FrameTimer(30 * 5);
         this.m_wakaTimer = new FrameTimer(21);
         this.m_angle = 0;
         this.m_totalMovement = 0;
         m_attackData.importAttacks(Main.getEnemyAttackData("pacman_stats"));
         this.m_endTimer = new FrameTimer(30 * 15);
         this.m_waitTimer = new FrameTimer(8);
         this.m_waitTimer.CurrentTime = this.m_waitTimer.MaxTime;
         STAGEDATA.SoundQueueRef.playSoundEffect("pacman_start");
      }
      
      private function runAI() : void
      {
         var _loc1_:Object = null;
         this.m_endTimer.tick();
         if(this.m_endTimer.IsComplete && this.m_action == 1)
         {
            playFrame("death");
            STAGEDATA.SoundQueueRef.playSoundEffect("pacman_death");
            this.m_action = 3;
            m_fadeTimer.reset();
         }
         if(this.m_action == 0)
         {
            this.m_nextActionTimer.tick();
            if(this.m_nextActionTimer.IsComplete)
            {
               this.m_wakaTimer.CurrentTime = this.m_wakaTimer.MaxTime;
               this.m_action = 1;
               Attack("walk");
            }
         }
         else if(this.m_action == 1)
         {
            if(m_didDamage)
            {
               this.m_waitTimer.reset();
               this.m_action = 2;
               m_didDamage = false;
               STAGEDATA.SoundQueueRef.playSoundEffect("pacman_eat");
            }
            else
            {
               this.m_wakaTimer.tick();
               if(this.m_wakaTimer.IsComplete)
               {
                  STAGEDATA.SoundQueueRef.playSoundEffect("pacman_waka");
                  this.m_wakaTimer.reset();
               }
               m_attemptToMove(6 * Math.cos(this.m_angle * Math.PI / 180),0);
               m_attemptToMove(0,-6 * Math.sin(this.m_angle * Math.PI / 180));
               this.m_totalMovement = this.m_totalMovement + 4;
               if(this.m_totalMovement >= 35)
               {
                  _loc1_ = STAGEDATA.getPlayer(m_player_id).getControls();
                  if(_loc1_.UP && !_loc1_.DOWN)
                  {
                     this.m_angle = 90;
                     m_sprite.rotation = -this.m_angle;
                     m_attackData.setAttackDamageVar(m_attack.Frame,"attackBox","direction",this.m_angle);
                  }
                  else if(!_loc1_.UP && _loc1_.DOWN)
                  {
                     this.m_angle = 270;
                     m_sprite.rotation = -this.m_angle;
                     m_attackData.setAttackDamageVar(m_attack.Frame,"attackBox","direction",90);
                  }
                  if(_loc1_.LEFT && !_loc1_.RIGHT)
                  {
                     this.m_angle = 180;
                     m_sprite.rotation = -this.m_angle;
                     m_attackData.setAttackDamageVar(m_attack.Frame,"attackBox","direction",160);
                  }
                  else if(!_loc1_.LEFT && _loc1_.RIGHT)
                  {
                     this.m_angle = 0;
                     m_sprite.rotation = -this.m_angle;
                     m_attackData.setAttackDamageVar(m_attack.Frame,"attackBox","direction",20);
                  }
                  this.m_totalMovement = 0;
               }
            }
         }
         else if(this.m_action == 2)
         {
            this.m_waitTimer.tick();
            m_sprite.stance.stop();
            if(this.m_waitTimer.IsComplete)
            {
               this.m_waitTimer.reset();
               this.m_action = 1;
            }
         }
         else if(this.m_action == 3)
         {
            fadeOut();
            if(m_fadeTimer.IsComplete)
            {
               destroy();
            }
         }
      }
      
      override protected function move() : void
      {
         if(!m_collision.ground)
         {
            m_attemptToMove(m_xSpeed,m_ySpeed);
         }
         else
         {
            m_sprite.x = m_sprite.x + m_xSpeed;
            attachToGround();
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
               if(this.m_action == 0)
               {
                  fadeIn();
               }
               performAttackChecks();
               attackCollisionTest();
               gravity();
               checkDeath();
            }
         }
      }
   }
}
