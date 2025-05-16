package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class RenjiAssist extends AssistTrophy
   {
       
      
      private var m_action:int;
      
      private var m_targetTimer:FrameTimer;
      
      private var m_bankaiTimer:FrameTimer;
      
      private var m_landTimer:FrameTimer;
      
      private var m_chaseTimer:FrameTimer;
      
      private var m_distanceTimer:FrameTimer;
      
      private var m_attackTimer:FrameTimer;
      
      private var m_jumpCount:Number;
      
      public function RenjiAssist(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("renjiassist",param1,param2,param3,param4);
         m_gravity = 1;
         m_max_ySpeed = 9.5;
         m_attackData.importAttacks(Main.getEnemyAttackData("renji_stats"));
         m_attack.IsAttacking = true;
         this.m_action = 0;
         this.m_attackTimer = new FrameTimer(30 * 2);
         this.m_targetTimer = new FrameTimer(15);
         this.m_chaseTimer = new FrameTimer(90);
         this.m_distanceTimer = new FrameTimer(10);
         this.m_landTimer = new FrameTimer(4);
         this.m_bankaiTimer = new FrameTimer(30 * 15);
         playFrame("entrance");
         m_width = 30;
         m_height = 50;
         m_currentTarget = getNearestTarget();
         if(m_currentTarget != null)
         {
            if(m_currentTarget.CurrentTarget.X > m_sprite.x + m_width / 2)
            {
               m_faceRight();
               m_attack.IsForward = true;
            }
            else if(m_currentTarget.CurrentTarget.X < m_sprite.x - m_width / 2)
            {
               m_faceLeft();
               m_attack.IsForward = false;
            }
         }
         this.m_jumpCount = 0;
         getTerrainData();
      }
      
      private function runAI() : void
      {
         this.m_bankaiTimer.tick();
         if(m_collision.ground)
         {
            this.m_jumpCount = 0;
         }
         if(currentFrameIs("jump") && m_ySpeed > -2 && !m_collision.ground)
         {
            playFrame("fall");
         }
         if(currentFrameIs("recovery") && this.m_action != 2 && m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
         {
            playFrame("fall");
            this.m_action = 3;
         }
         if(this.m_bankaiTimer.IsComplete && m_collision.ground && this.m_action == 3)
         {
            this.m_action = 5;
            m_xSpeed = 0;
            if(m_currentTarget != null && (m_currentTarget.BeaconSprite || m_currentTarget.PlayerSprite != null && !m_currentTarget.PlayerSprite.StandBy))
            {
               if(m_currentTarget.CurrentTarget.X < m_sprite.x)
               {
                  m_faceLeft();
               }
               else
               {
                  m_faceRight();
               }
            }
            m_attack.IsForward = m_facingForward;
            m_attack.AttackID++;
            Attack("bankai");
            STAGEDATA.SoundQueueRef.playVoiceEffect("renji_bankai");
         }
         if(this.m_action == 0)
         {
            fadeIn();
            this.m_attackTimer.tick();
            if(m_currentTarget == null || m_currentTarget.BeaconSprite == null && !(m_currentTarget.PlayerSprite != null && !m_currentTarget.PlayerSprite.StandBy))
            {
               m_fadeTimer.reset();
               this.m_action = 2;
               m_xSpeed = 0;
               m_ySpeed = 0;
            }
            else if(this.m_attackTimer.IsComplete)
            {
               m_currentTarget.setDistance(new Point(m_sprite.x,m_sprite.y));
               if(m_currentTarget.CurrentTarget != null && m_currentTarget.Distance < 100)
               {
                  this.m_attackTimer.reset();
                  this.m_attackTimer.MaxTime = 30 * 8;
                  m_attack.IsAttacking = true;
                  playFrame("run");
                  this.m_action = 3;
                  if(m_currentTarget.CurrentTarget.X > m_sprite.x)
                  {
                     m_faceRight();
                     m_attack.IsForward = true;
                  }
                  else if(m_currentTarget.CurrentTarget.X < m_sprite.x)
                  {
                     m_faceLeft();
                     m_attack.IsForward = false;
                  }
               }
               else
               {
                  this.m_attackTimer.reset();
                  this.m_attackTimer.MaxTime = 30 * 8;
                  playFrame("run");
                  this.m_action = 3;
               }
            }
         }
         else if(this.m_action == 1)
         {
            if(!m_collision.ground && currentFrameIs("combo"))
            {
               playFrame("fall");
               this.m_action = 3;
            }
            else if(m_collision.ground && (currentFrameIs("airattack") || currentFrameIs("recovery")))
            {
               playFrame("land");
               this.m_action = 4;
            }
            else if(currentFrameIs("airattack") && m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
            {
               playFrame("fall");
               this.m_action = 3;
            }
            else if(currentFrameIs("combo") && m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
            {
               playFrame("run");
               this.m_action = 3;
            }
            else if(currentFrameIs("combo"))
            {
               if(m_sprite.stance.currentFrame == 12)
               {
                  refreshAttackID();
                  STAGEDATA.SoundQueueRef.playVoiceEffect("renji_attack2");
               }
               else if(m_sprite.stance.currentFrame == 22)
               {
                  refreshAttackID();
                  STAGEDATA.SoundQueueRef.playVoiceEffect("renji_attack3");
               }
            }
         }
         else if(this.m_action == 2)
         {
            fadeOut();
            if(m_fadeTimer.IsComplete)
            {
               destroy();
            }
         }
         else if(this.m_action == 3)
         {
            if(m_collision.ground)
            {
               playFrame("run");
            }
            this.m_attackTimer.tick();
            runTargetTimer();
            runBeaconTimer();
            if(m_currentTarget != null && (m_currentTarget.BeaconSprite || m_currentTarget.PlayerSprite != null && !m_currentTarget.PlayerSprite.StandBy))
            {
               this.m_distanceTimer.tick();
               if(this.m_distanceTimer.IsComplete)
               {
                  m_currentTarget.setDistance(new Point(m_sprite.x,m_sprite.y));
               }
               if(m_currentTarget.CurrentTarget != null && m_currentTarget.XDistance < 40 && m_currentTarget.YDistance < 70 && !m_currentTarget.BeaconSprite && !m_collision.ground)
               {
                  this.m_attackTimer.reset();
                  this.m_attackTimer.MaxTime = 30 * 8;
                  m_attack.IsAttacking = true;
                  m_attack.IsForward = m_facingForward;
                  Attack("airattack");
                  STAGEDATA.SoundQueueRef.playVoiceEffect("renji_attack5");
                  this.m_action = 1;
                  if(m_currentTarget.CurrentTarget.X > m_sprite.x)
                  {
                     m_faceRight();
                     m_attack.IsForward = true;
                  }
                  else if(m_currentTarget.CurrentTarget.X < m_sprite.x)
                  {
                     m_faceLeft();
                     m_attack.IsForward = false;
                  }
               }
               else if(m_currentTarget.PlayerSprite != null && m_currentTarget.XDistance < 25 && m_currentTarget.YDistance < 60 && !m_currentTarget.BeaconSprite && m_collision.ground)
               {
                  m_xSpeed = 0;
                  m_ySpeed = 0;
                  this.m_attackTimer.reset();
                  this.m_attackTimer.MaxTime = 30 * 8;
                  m_attack.IsAttacking = true;
                  Attack("combo");
                  STAGEDATA.SoundQueueRef.playVoiceEffect("renji_attack1");
                  m_attack.IsForward = m_facingForward;
                  this.m_action = 1;
                  if(m_currentTarget.CurrentTarget.X > m_sprite.x)
                  {
                     m_faceRight();
                     m_attack.IsForward = true;
                  }
                  else if(m_currentTarget.CurrentTarget.X < m_sprite.x)
                  {
                     m_faceLeft();
                     m_attack.IsForward = false;
                  }
               }
               else if(m_currentTarget.BeaconSprite != null && m_currentTarget.Distance < 20)
               {
                  m_currentTarget.CurrentTarget = null;
                  m_shortestPath.pop();
                  if(m_shortestPath.length > 0 && !(m_targetTemp.CurrentTarget != null && m_targetTemp.CurrentTarget.checkLinearPath(this) && m_targetTemp.Distance < Utils.getDistanceFrom(this,m_shortestPath[m_shortestPath.length - 1])))
                  {
                     m_beaconTimer.reset();
                     m_currentTarget.CurrentTarget = m_shortestPath[m_shortestPath.length - 1];
                  }
                  else
                  {
                     m_shortestPath = null;
                     getNearestOpponent();
                  }
               }
               else
               {
                  m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
                  m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
                  m_currentTarget.setDistance(new Point(m_sprite.x,m_sprite.y));
                  if(m_collision.rightSide || m_collision.leftSide || (m_currentTarget.BeaconSprite != null && m_currentTarget.CurrentTarget.Y < m_sprite.y - m_height && m_currentTarget.XDistance < 20 || m_currentTarget.PlayerSprite != null && m_currentTarget.CurrentTarget.Y < m_sprite.y - m_height) && this.m_jumpCount < 1 && m_ySpeed >= -2)
                  {
                     if(m_collision.ground)
                     {
                        this.m_jumpCount--;
                        unnattachFromGround();
                     }
                     m_ySpeed = -14;
                     this.m_jumpCount++;
                     playFrame("jump");
                  }
                  else if((m_collision.rightSide || m_collision.leftSide || (m_currentTarget.BeaconSprite != null && m_currentTarget.CurrentTarget.Y < m_sprite.y - m_height && m_currentTarget.XDistance < 20 || m_currentTarget.PlayerSprite != null && m_currentTarget.CurrentTarget.Y < m_sprite.y - m_height)) && this.m_jumpCount < 2 && m_ySpeed >= -2)
                  {
                     this.m_attackTimer.reset();
                     this.m_attackTimer.MaxTime = 30 * 8;
                     m_attack.IsAttacking = true;
                     Attack("recovery");
                     STAGEDATA.SoundQueueRef.playVoiceEffect("renji_attack4");
                     this.m_jumpCount++;
                     this.m_action = 1;
                  }
                  else if(STAGEDATA.Platforms.indexOf(m_currentPlatform) >= 0 && m_ySpeed >= 0 && m_currentPlatform.noDropThrough != true)
                  {
                     while(testGroundWithCoord(m_sprite.x,m_sprite.y))
                     {
                        m_sprite.y++;
                     }
                     m_collision.ground = false;
                     m_currentPlatform = null;
                  }
                  else
                  {
                     if(m_currentTarget.CurrentTarget.X > m_sprite.x + 20)
                     {
                        if(!m_facingForward)
                        {
                           m_faceRight();
                           m_attack.IsForward = true;
                        }
                        m_xSpeed = !!m_collision.ground?Number(6):Number(4);
                     }
                     else if(m_currentTarget.CurrentTarget.X < m_sprite.x - 20)
                     {
                        if(m_facingForward)
                        {
                           m_faceLeft();
                           m_attack.IsForward = false;
                        }
                        m_xSpeed = !!m_collision.ground?Number(-6):Number(-4);
                     }
                     else
                     {
                        m_xSpeed = 0;
                     }
                     if(m_collision.lbound_lower || m_collision.lbound_upper)
                     {
                        m_xSpeed = 6;
                     }
                     else if(m_collision.rbound_lower || m_collision.rbound_upper)
                     {
                        m_xSpeed = -6;
                     }
                  }
               }
               this.m_chaseTimer.tick();
               if(this.m_chaseTimer.IsComplete)
               {
                  this.m_chaseTimer.reset();
                  m_currentTarget = getNearestTarget();
               }
            }
            else if(m_currentTarget.BeaconSprite == null && !(m_currentTarget.PlayerSprite != null && m_currentTarget.PlayerSprite.StandBy))
            {
               m_fadeTimer.reset();
               this.m_action = 2;
               m_xSpeed = 0;
               m_ySpeed = 0;
            }
         }
         else if(this.m_action == 4)
         {
            this.m_landTimer.tick();
            if(this.m_landTimer.IsComplete)
            {
               this.m_landTimer.reset();
               this.m_action = 3;
               playFrame("run");
            }
         }
         else if(this.m_action == 5)
         {
            if(m_sprite.stance.currentFrame == 30)
            {
               STAGEDATA.SoundQueueRef.playVoiceEffect("renji_zabimaru");
            }
            if(m_sprite.stance.currentFrame >= 96)
            {
               playFrame("idle");
               this.m_action = 2;
               m_fadeTimer.reset();
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
               performAttackChecks();
               attackCollisionTest();
               move();
               gravity();
               m_groundCollisionTest();
               updateWarningCollision();
               checkDeath();
            }
         }
      }
   }
}
