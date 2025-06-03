package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class Krillin extends AssistTrophy
   {
       
      
      private var X_SPEED:Number;
      
      private var m_action:Number;
      
      private var m_attackTimer:FrameTimer;
      
      private var m_maxdiscs:int;
      
      public function Krillin(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("krillin",param1,param2,param3,param4);
         m_gravity = 1;
         m_max_ySpeed = 10;
         m_width = 30;
         m_height = 40;
         this.m_action = 0;
         this.m_attackTimer = new FrameTimer(60);
         this.m_maxdiscs = 5;
         if(Utils.random() > 0.5)
         {
            m_faceLeft();
         }
         m_attackData.importAttacks(Main.getEnemyAttackData("krillin_stats"));
         m_attackData.importProjectiles(Main.getEnemyAttackData("krillin_projectiles"));
         Attack("attack");
         this.X_SPEED = m_attackData.getProjectile("destructodisc").XSpeed;
      }
      
      private function runAI() : void
      {
         var _loc1_:Point = null;
         if(this.m_action == 0)
         {
            fadeIn();
            this.m_attackTimer.tick();
            if(m_fadeTimer.IsComplete && this.m_attackTimer.IsComplete)
            {
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 60;
               this.m_action = 1;
               m_currentTarget = getNearestTarget();
               STAGEDATA.playSpecificSound("krillin_disccharge");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_attackTimer.tick();
            if(m_currentTarget != null && m_currentTarget.PlayerSprite != null && !m_currentTarget.PlayerSprite.StandBy)
            {
               if(m_currentTarget.CurrentTarget.X >= m_sprite.x)
               {
                  m_faceRight();
                  m_attack.IsForward = true;
               }
               else
               {
                  m_faceLeft();
                  m_attack.IsForward = false;
               }
            }
            if(this.m_attackTimer.IsComplete)
            {
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 30;
               this.m_action = 2;
               STAGEDATA.playSpecificSound("krillin_destructodisc");
               Attack("shoot");
            }
         }
         else if(this.m_action == 2)
         {
            this.m_attackTimer.tick();
            if(this.m_attackTimer.CurrentTime === 11)
            {
               if(m_currentTarget != null && m_currentTarget.PlayerSprite != null && !m_currentTarget.PlayerSprite.StandBy)
               {
                  _loc1_ = Utils.getVelocityVector(this.X_SPEED,Utils.getAngleBetween(new Point(m_sprite.x,m_sprite.y),new Point(m_currentTarget.CurrentTarget.X,m_currentTarget.CurrentTarget.Y)));
                  _loc1_.x = Utils.fastAbs(_loc1_.x);
                  _loc1_.y = _loc1_.y * -1;
                  m_attackData.getProjectile("destructodisc").importProjectileData({
                     "xspeed":_loc1_.x,
                     "yspeed":_loc1_.y
                  });
               }
               else
               {
                  m_attackData.getProjectile("destructodisc").importProjectileData({
                     "xspeed":this.X_SPEED,
                     "yspeed":0
                  });
               }
               fireProjectile("destructodisc");
            }
            if(this.m_attackTimer.IsComplete)
            {
               STAGEDATA.playSpecificSound("krillin_discfire");
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 60;
               this.m_maxdiscs--;
               this.m_action = this.m_maxdiscs <= 0?Number(3):Number(1);
               if(this.m_action == 1)
               {
                  STAGEDATA.playSpecificSound("krillin_disccharge");
                  m_currentTarget = getNearestTarget();
                  Attack("attack");
               }
               else
               {
                  this.m_attackTimer.MaxTime = 30;
                  m_fadeTimer.reset();
               }
            }
         }
         else if(this.m_action == 3)
         {
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete && !(m_projectile[m_lastProjectile] != null && !m_projectile[m_lastProjectile].Dead))
            {
               fadeOut();
               if(m_fadeTimer.IsComplete)
               {
                  destroyAllProjectiles();
                  destroy();
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
               performAttackChecks();
               attackCollisionTest();
               move();
               checkHitStun();
               gravity();
               m_groundCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
