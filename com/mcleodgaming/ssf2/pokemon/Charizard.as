package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class Charizard extends Pokemon
   {
       
      
      private var m_action:int;
      
      private var m_targetTimer:FrameTimer;
      
      private var m_chaseTimer:FrameTimer;
      
      private var m_distanceTimer:FrameTimer;
      
      private var m_attackTimer:FrameTimer;
      
      public function Charizard(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("charizard",param1,param2,param3,param4);
         m_gravity = 1.5;
         m_max_ySpeed = 30;
         m_attackData.importAttacks(Main.getEnemyAttackData("charizard_stats"));
         m_attackData.importProjectiles(Main.getEnemyAttackData("charizard_projectiles"));
         this.m_action = 0;
         this.m_attackTimer = new FrameTimer(30 * 1);
         this.m_targetTimer = new FrameTimer(15);
         this.m_chaseTimer = new FrameTimer(90);
         this.m_distanceTimer = new FrameTimer(10);
         Attack("idle");
         m_width = 30;
         m_height = 50;
         m_currentTarget = getNearestTarget();
         if(m_currentTarget != null)
         {
            if(m_currentTarget.CurrentTarget.X > m_sprite.x + m_width / 2)
            {
               m_faceRight();
            }
            else if(m_currentTarget.CurrentTarget.X < m_sprite.x - m_width / 2)
            {
               m_faceLeft();
            }
         }
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            fadeIn();
            this.m_attackTimer.tick();
            if(this.m_attackTimer.CurrentTime == 1)
            {
               fireProjectile("hitbox");
            }
            if(this.m_attackTimer.IsComplete)
            {
               if(m_currentTarget == null || m_currentTarget.PlayerSprite == null || m_currentTarget.PlayerSprite.StandBy)
               {
                  m_attack.IsAttacking = false;
                  this.m_action = 2;
                  Attack("idle");
                  m_fadeTimer.reset();
               }
               else
               {
                  m_currentTarget.setDistance(new Point(m_sprite.x,m_sprite.y));
                  if(m_currentTarget.PlayerSprite != null && m_currentTarget.Distance < 100)
                  {
                     this.m_attackTimer.reset();
                     this.m_attackTimer.MaxTime = 30 * 8;
                     m_attack.IsAttacking = true;
                     STAGEDATA.playSpecificVoice("charizard_roar");
                     Attack("attack");
                     this.m_action = 1;
                     if(m_currentTarget.CurrentTarget.X > m_sprite.x)
                     {
                        m_faceRight();
                     }
                     else if(m_currentTarget.CurrentTarget.X < m_sprite.x)
                     {
                        m_faceLeft();
                     }
                  }
                  else
                  {
                     this.m_attackTimer.reset();
                     this.m_attackTimer.MaxTime = 30 * 8;
                     STAGEDATA.playSpecificSound("charizard_dash");
                     Attack("chase");
                     this.m_action = 3;
                  }
               }
            }
         }
         else if(this.m_action == 1)
         {
            this.m_attackTimer.tick();
            this.m_targetTimer.tick();
            if(this.m_targetTimer.IsComplete)
            {
               this.m_targetTimer.reset();
               m_currentTarget = getNearestTarget();
               if(m_currentTarget != null && !m_currentTarget.PlayerSprite.StandBy)
               {
                  if(m_currentTarget.PlayerSprite.X > m_sprite.x + m_width / 2)
                  {
                     m_faceRight();
                  }
                  else if(m_currentTarget.PlayerSprite.X < m_sprite.x - m_width / 2)
                  {
                     m_faceLeft();
                  }
               }
            }
            if(this.m_attackTimer.IsComplete)
            {
               m_attack.IsAttacking = false;
               this.m_action = 2;
               Attack("idle");
               m_fadeTimer.reset();
            }
         }
         else if(this.m_action == 2)
         {
            fadeOut();
            if(m_fadeTimer.IsComplete)
            {
               destroyAllProjectiles();
               destroy();
            }
         }
         else if(this.m_action == 3)
         {
            this.m_attackTimer.tick();
            runTargetTimer();
            runBeaconTimer();
            if(m_currentTarget != null && m_currentTarget.PlayerSprite != null && !m_currentTarget.PlayerSprite.StandBy)
            {
               this.m_distanceTimer.tick();
               if(this.m_distanceTimer.IsComplete)
               {
                  m_currentTarget.setDistance(new Point(m_sprite.x,m_sprite.y));
               }
               if(m_currentTarget.PlayerSprite != null && m_currentTarget.Distance < 40)
               {
                  m_xSpeed = 0;
                  m_ySpeed = 0;
                  this.m_attackTimer.reset();
                  this.m_attackTimer.MaxTime = 30 * 8;
                  m_attack.IsAttacking = true;
                  Attack("attack");
                  STAGEDATA.playSpecificVoice("charizard_roar");
                  this.m_action = 1;
                  if(m_currentTarget.CurrentTarget.X > m_sprite.x)
                  {
                     m_faceRight();
                  }
                  else if(m_currentTarget.CurrentTarget.X < m_sprite.x)
                  {
                     m_faceLeft();
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
                  if(m_collision.rightSide || m_collision.leftSide || m_currentTarget.CurrentTarget.Y < m_sprite.y)
                  {
                     if(m_collision.ground)
                     {
                        unnattachFromGround();
                     }
                     m_ySpeed = -7;
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
                  if(m_currentTarget.CurrentTarget.X > m_sprite.x + 20)
                  {
                     if(!m_facingForward)
                     {
                        m_faceRight();
                     }
                     m_xSpeed = 7;
                  }
                  else if(m_currentTarget.CurrentTarget.X < m_sprite.x - 20)
                  {
                     if(m_facingForward)
                     {
                        m_faceLeft();
                     }
                     m_xSpeed = -7;
                  }
                  else
                  {
                     m_xSpeed = 0;
                  }
               }
               this.m_chaseTimer.tick();
               if(this.m_chaseTimer.IsComplete)
               {
                  this.m_chaseTimer.reset();
                  m_currentTarget = getNearestTarget();
               }
            }
            if(this.m_attackTimer.IsComplete)
            {
               m_attack.IsAttacking = false;
               this.m_action = 2;
               Attack("idle");
               m_fadeTimer.reset();
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            this.runAI();
            if(!m_dead)
            {
               performAttackChecks();
               attackCollisionTest();
               move();
               gravity();
               m_groundCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
