package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class Metroid extends AssistTrophy
   {
       
      
      private var m_action:uint;
      
      private var m_nextActionTimer:FrameTimer;
      
      private var m_attackTimer:FrameTimer;
      
      private var m_hurtTimer:FrameTimer;
      
      private var m_aimLoc:Point;
      
      private var m_angleX:Number;
      
      private var m_angleY:Number;
      
      private var m_xOverride:Number;
      
      private var m_yOverride:Number;
      
      private var m_latchCount:int;
      
      private var m_health:Number;
      
      private var m_rotation:FrameTimer;
      
      private var m_rotationToggle:Boolean;
      
      private var m_maximumIdleTimer:FrameTimer;
      
      public function Metroid(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("metroid",param1,param2,param3,param4);
         m_gravity = 0;
         m_max_ySpeed = 10;
         m_width = 40;
         m_height = 40;
         this.m_action = 0;
         this.m_nextActionTimer = new FrameTimer(30 * 1);
         this.m_maximumIdleTimer = new FrameTimer(30 * 5);
         this.m_attackTimer = new FrameTimer(30 * 5);
         this.m_hurtTimer = new FrameTimer(15);
         this.m_hurtTimer.CurrentTime = this.m_hurtTimer.MaxTime;
         this.m_aimLoc = new Point();
         this.m_angleX = 0;
         this.m_angleY = 180;
         this.m_xOverride = 8;
         this.m_yOverride = 4;
         this.m_latchCount = 0;
         this.m_health = 0;
         this.m_rotation = new FrameTimer(20);
         this.m_rotationToggle = true;
         m_attackData.importAttacks(Main.getEnemyAttackData("metroid_stats"));
         STAGEDATA.playSpecificSound("metroid_spawn");
      }
      
      private function runAI() : void
      {
         var _loc1_:Vector.<HitBoxCollisionResult> = null;
         if(this.m_action == 0)
         {
            this.m_angleX = this.m_angleX + 5;
            this.m_angleY = this.m_angleY + 5;
            if(this.m_angleX > 360)
            {
               this.m_angleX = Utils.forceBase360(this.m_angleX);
            }
            if(this.m_angleY > 360)
            {
               this.m_angleY = Utils.forceBase360(this.m_angleY);
            }
            if(this.m_angleX == 90 || this.m_angleX == 270)
            {
               m_currentTarget = getNearestTarget();
               if(m_currentTarget != null)
               {
                  if(Math.cos((this.m_angleX + 4) * Math.PI / 180) > 0)
                  {
                     this.m_xOverride = m_currentTarget.CurrentTarget.X > m_sprite.x?Number(Utils.fastAbs(this.m_xOverride)):Number(-Utils.fastAbs(this.m_xOverride));
                  }
                  else
                  {
                     this.m_xOverride = m_currentTarget.CurrentTarget.X > m_sprite.x?Number(-Utils.fastAbs(this.m_xOverride)):Number(Utils.fastAbs(this.m_xOverride));
                  }
               }
            }
            if(this.m_angleY == 0 || this.m_angleY == 180 || this.m_angleY == 360)
            {
               m_currentTarget = getNearestTarget();
               if(m_currentTarget != null && m_currentTarget.PlayerSprite != null && !m_currentTarget.PlayerSprite.StandBy)
               {
                  if(Math.sin((this.m_angleY + 4) * Math.PI / 180) > 0)
                  {
                     this.m_yOverride = m_currentTarget.CurrentTarget.Y > m_sprite.y?Number(Utils.fastAbs(this.m_yOverride)):Number(-Utils.fastAbs(this.m_yOverride));
                  }
                  else
                  {
                     this.m_yOverride = m_currentTarget.CurrentTarget.Y > m_sprite.y?Number(-Utils.fastAbs(this.m_yOverride)):Number(Utils.fastAbs(this.m_yOverride));
                  }
               }
            }
            m_xSpeed = this.m_xOverride * Math.cos(this.m_angleX * Math.PI / 180);
            m_ySpeed = this.m_yOverride * Math.sin(this.m_angleY * Math.PI / 180);
            this.m_maximumIdleTimer.tick();
            this.m_nextActionTimer.tick();
            if(this.m_nextActionTimer.IsComplete)
            {
               m_currentTarget = getNearestTarget();
               if(m_currentTarget != null && m_currentTarget.PlayerSprite != null && !m_currentTarget.PlayerSprite.StandBy)
               {
                  m_currentTarget.setDistance(new Point(m_sprite.x,m_sprite.y));
                  if(m_currentTarget.Distance < 150)
                  {
                     this.m_aimLoc.x = m_currentTarget.CurrentTarget.X;
                     this.m_aimLoc.y = m_currentTarget.CurrentTarget.Y - m_currentTarget.CurrentTarget.Height / 2;
                     this.m_action = 1;
                     Attack("attack");
                     this.m_nextActionTimer.reset();
                  }
                  else
                  {
                     this.m_nextActionTimer.reset();
                  }
               }
            }
            if(this.m_maximumIdleTimer.IsComplete)
            {
               this.m_action = 4;
               m_xSpeed = 0;
               m_ySpeed = 0;
               m_fadeTimer.reset();
            }
         }
         else if(this.m_action == 1)
         {
            m_xSpeed = (this.m_aimLoc.x - m_sprite.x) / 8;
            m_ySpeed = (this.m_aimLoc.y - m_sprite.y) / 8;
            if(Utils.getDistance(new Point(m_sprite.x,m_sprite.y),this.m_aimLoc) < 1)
            {
               this.m_maximumIdleTimer.reset();
               this.m_action = 0;
               this.m_angleX = 0;
               this.m_angleY = 180;
               playFrame("idle");
            }
            else if(m_currentTarget != null && m_currentTarget.PlayerSprite && !m_currentTarget.PlayerSprite.StandBy && (_loc1_ = HitBoxSprite.hitTestArray(CurrentAnimation.getHitBoxes(CurrentFrameNum,HitBoxSprite.GRAB),m_currentTarget.PlayerSprite.CurrentAnimation.getHitBoxes(m_currentTarget.PlayerSprite.CurrentFrameNum,HitBoxSprite.HIT),Location,m_currentTarget.PlayerSprite.Location,!m_facingForward,!m_currentTarget.PlayerSprite.FacingForward,CurrentScale,m_currentTarget.PlayerSprite.CurrentScale,CurrentRotation,m_currentTarget.PlayerSprite.CurrentRotation)).length > 0)
            {
               this.m_action = 2;
               this.m_attackTimer.reset();
               this.m_latchCount++;
               STAGEDATA.playSpecificSound("metroid_latch");
            }
         }
         else if(this.m_action == 2)
         {
            this.m_rotation.tick();
            m_sprite.rotation = 10 * Math.sin(360 * (this.m_rotation.CurrentTime / this.m_rotation.MaxTime) * Math.PI / 180);
            if(this.m_rotation.IsComplete)
            {
               this.m_rotation.reset();
               this.m_rotationToggle = !this.m_rotationToggle;
            }
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete || m_currentTarget != null && (m_currentTarget.PlayerSprite.StandBy || m_currentTarget.PlayerSprite.Dead || m_currentTarget.PlayerSprite.Revival) || m_currentTarget != null && Utils.getDistanceFrom(this,m_currentTarget.CurrentTarget) > 100 || m_currentTarget != null && m_currentTarget.PlayerSprite.Dodging)
            {
               m_sprite.rotation = 0;
               this.m_angleX = 0;
               this.m_angleY = 180;
               this.m_action = this.m_latchCount >= 3?uint(4):uint(0);
               playFrame("idle");
               if(this.m_action == 4)
               {
                  m_xSpeed = 0;
                  m_ySpeed = 0;
                  m_fadeTimer.reset();
               }
            }
            else if(m_currentTarget != null && m_currentTarget.PlayerSprite != null && !m_currentTarget.PlayerSprite.StandBy)
            {
               m_sprite.x = m_currentTarget.CurrentTarget.X;
               m_sprite.y = m_currentTarget.CurrentTarget.Y - m_currentTarget.CurrentTarget.Height / 2;
            }
         }
         else if(this.m_action == 3)
         {
            m_sprite.rotation = 0;
            this.m_hurtTimer.tick();
            if(this.m_hurtTimer.IsComplete)
            {
               playFrame("idle");
               this.m_action = this.m_latchCount >= 3?uint(4):uint(0);
               if(this.m_action == 4)
               {
                  m_xSpeed = 0;
                  m_ySpeed = 0;
                  m_fadeTimer.reset();
               }
               this.m_maximumIdleTimer.reset();
            }
         }
         else if(this.m_action == 4)
         {
            if(m_fadeTimer.IsComplete)
            {
               destroy();
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         var _loc3_:Number = NaN;
         if(param1.BypassEnemies)
         {
            return false;
         }
         if(this.m_hurtTimer.IsComplete && param1.PlayerID != m_player_id && !attackIDArrayContains(param1.AttackID))
         {
            stackAttackID(param1.AttackID);
            _loc3_ = Utils.calculateChargeDamage(param1);
            _loc3_ = _loc3_ * param1.StaleMultiplier;
            if(param1.Damage > 0 && _loc3_ <= 0)
            {
               _loc3_ = 1;
            }
            this.m_health = this.m_health + _loc3_;
            if(this.m_health > 10)
            {
               this.m_hurtTimer.reset();
               m_ySpeed = -2;
               m_xSpeed = !!param1.IsForward?Number(5):Number(-5);
               this.m_health = 0;
               this.m_action = 3;
               playFrame("hurt");
            }
            return true;
         }
         return false;
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
               if(this.m_action == 0)
               {
                  fadeIn();
               }
               else
               {
                  fadeOut();
               }
               performAttackChecks();
               attackCollisionTest();
               this.move();
               gravity();
               checkDeath();
            }
         }
      }
   }
}
