package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class Protoman extends AssistTrophy
   {
       
      
      private var m_action:Number;
      
      private var m_idleTimer:FrameTimer;
      
      private var m_walkTimer:FrameTimer;
      
      private var m_jumpTimer:FrameTimer;
      
      private var m_targetTimer:FrameTimer;
      
      private var m_attackTimer:FrameTimer;
      
      private var m_totalTimer:FrameTimer;
      
      private var m_health:Number;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_hitFromRight:Boolean;
      
      private var m_justHurt:Boolean;
      
      private var m_endTimer:FrameTimer;
      
      public function Protoman(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("protoman",param1,param2,param3,param4);
         playFrame("entrance");
         m_gravity = 1;
         m_max_ySpeed = 10;
         m_width = 20;
         m_height = 20;
         this.m_action = -2;
         this.m_idleTimer = new FrameTimer(60);
         this.m_walkTimer = new FrameTimer(20);
         this.m_jumpTimer = new FrameTimer(4);
         this.m_targetTimer = new FrameTimer(30 * 3);
         this.m_attackTimer = new FrameTimer(30 * 2);
         this.m_totalTimer = new FrameTimer(30 * 15);
         this.m_health = 0;
         this.m_blinkTimer = new FrameTimer(2);
         this.m_blinkToggle = true;
         this.m_hitFromRight = false;
         this.m_justHurt = false;
         STAGEDATA.SoundQueueRef.playSoundEffect("protoman_whistle");
         m_currentTarget = getNearestTarget();
         if(m_currentTarget == null)
         {
            if(Utils.random() > 0.5)
            {
               m_faceLeft();
            }
         }
         else if(m_currentTarget.CurrentTarget.X < m_sprite.x)
         {
            m_faceLeft();
         }
         m_attackData.importAttacks(Main.getEnemyAttackData("protoman_stats"));
         m_attackData.importProjectiles(Main.getEnemyAttackData("protoman_projectiles"));
         this.m_endTimer = new FrameTimer(30 * 20);
      }
      
      private function runAI() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         if(this.m_action != 7 && this.m_action >= 0)
         {
            this.m_totalTimer.tick();
            if(this.m_totalTimer.IsComplete || m_currentTarget == null || m_currentTarget.PlayerSprite == null)
            {
               this.m_action = 7;
               m_fadeTimer.reset();
            }
         }
         this.m_targetTimer.tick();
         if(this.m_targetTimer.IsComplete)
         {
            this.m_targetTimer.reset();
            m_currentTarget = getNearestTarget();
            if(m_currentTarget != null)
            {
               m_currentTarget.setDistance(new Point(m_sprite.x,m_sprite.y));
            }
         }
         var _loc1_:Projectile = null;
         var _loc2_:MovieClip = null;
         if(this.m_action == -2)
         {
            if(this.m_idleTimer.CurrentTime == 0)
            {
               playFrame("exit");
               m_sprite.stance.gotoAndPlay(4);
            }
            if(m_sprite.stance.currentFrame >= 20)
            {
               playFrame("entrance");
               m_sprite.visible = false;
            }
            this.m_idleTimer.tick();
            if(this.m_idleTimer.IsComplete)
            {
               this.m_idleTimer.reset();
               this.m_idleTimer.MaxTime = 15;
               this.m_action = -1;
               m_sprite.stance.gotoAndPlay(0);
               m_currentTarget = getNearestTarget();
               if(m_currentTarget == null)
               {
                  if(Utils.random() > 0.5)
                  {
                     m_faceLeft();
                  }
               }
               else
               {
                  if(Utils.random() > 0.5)
                  {
                     m_faceLeft();
                  }
                  _loc3_ = m_sprite.x;
                  _loc4_ = m_sprite.y;
                  m_sprite.x = m_currentTarget.CurrentTarget.X;
                  m_sprite.y = m_currentTarget.CurrentTarget.Y;
                  while(!testGroundWithCoord(m_sprite.x,m_sprite.y) && m_sprite.y - _loc4_ < 200)
                  {
                     m_sprite.y++;
                  }
                  if(m_sprite.y - _loc4_ >= 200)
                  {
                     m_sprite.x = _loc3_;
                     m_sprite.y = _loc4_;
                  }
                  else
                  {
                     m_groundCollisionTest();
                     attachToGround();
                  }
               }
               m_sprite.visible = true;
            }
         }
         if(this.m_action == -1)
         {
            if(m_sprite.stance.currentFrame >= 19)
            {
               this.m_action = 0;
               playFrame("idle");
            }
         }
         else if(this.m_action == 0)
         {
            this.m_idleTimer.tick();
            if(this.m_idleTimer.IsComplete)
            {
               this.m_action = 1;
               Attack("dash");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_walkTimer.tick();
            m_xSpeed = !!m_facingForward?Number(12):Number(-12);
            if(this.m_walkTimer.IsComplete && m_collision.ground)
            {
               m_xSpeed = 0;
               this.m_walkTimer.reset();
               this.m_walkTimer.MaxTime = 15;
               if(m_currentTarget != null && m_currentTarget.PlayerSprite != null && !m_currentTarget.PlayerSprite.StandBy)
               {
                  if(m_currentTarget.CurrentTarget.X < m_sprite.x)
                  {
                     if(m_facingForward)
                     {
                        _loc2_ = STAGEDATA.attachEffectOverlay("effect_run");
                        _loc2_.width = _loc2_.width * m_sizeRatio;
                        _loc2_.height = _loc2_.height * m_sizeRatio;
                        _loc2_.alpha = 0.75;
                        _loc2_.scaleX = _loc2_.scaleX * -1;
                        _loc2_.x = OverlayX;
                        _loc2_.y = OverlayY;
                     }
                     m_faceLeft();
                  }
                  else
                  {
                     if(!m_facingForward)
                     {
                        _loc2_ = STAGEDATA.attachEffectOverlay("effect_run");
                        _loc2_.width = _loc2_.width * m_sizeRatio;
                        _loc2_.height = _loc2_.height * m_sizeRatio;
                        _loc2_.alpha = 0.75;
                        _loc2_.x = OverlayX;
                        _loc2_.y = OverlayY;
                     }
                     m_faceRight();
                  }
               }
               if(Utils.random() > 0.75)
               {
                  this.m_jumpTimer.reset();
                  playFrame("jump");
                  STAGEDATA.playSpecificSound("protoman_jump");
                  this.m_action = 5;
                  unnattachFromGround();
                  m_ySpeed = -14;
               }
               else if(Utils.random() < 0.25)
               {
                  this.m_action = 3;
                  m_xSpeed = 0;
                  m_ySpeed = 0;
                  playFrame("shoot");
                  STAGEDATA.playSpecificSound("protoman_unchargedshot");
               }
               else
               {
                  this.m_action = 4;
                  m_xSpeed = 0;
                  m_ySpeed = 0;
                  playFrame("charge_shoot");
                  STAGEDATA.playSpecificSound("protoman_charging");
               }
            }
            else
            {
               _loc5_ = m_collision.ground && !testCoordCollision(m_xSpeed > 0?Number(m_sprite.x + m_xSpeed + 9):Number(m_sprite.x + m_xSpeed - 5),m_sprite.y + 9);
               m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
               m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
               if(_loc5_ || m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
               {
                  if(m_facingForward)
                  {
                     m_faceLeft();
                  }
                  else
                  {
                     m_faceRight();
                  }
               }
            }
         }
         else if(this.m_action == 2)
         {
            this.m_jumpTimer.tick();
            if(m_ySpeed >= 0 && !currentFrameIs("fall"))
            {
               playFrame("fall");
            }
            if(m_collision.ground)
            {
               this.m_idleTimer.reset();
               this.m_action = 0;
               playFrame("idle");
            }
         }
         else if(this.m_action == 3)
         {
            if(m_sprite.stance.currentFrame == 12)
            {
               if(fireProjectile("shot1"))
               {
                  STAGEDATA.playSpecificSound("protoman_unchargedshot");
                  _loc1_ = m_projectile[m_lastProjectile];
               }
            }
            else if(m_sprite.stance.currentFrame >= 26)
            {
               this.m_action = 0;
            }
         }
         else if(this.m_action == 4)
         {
            if(m_sprite.stance.currentFrame == 29)
            {
               if(fireProjectile("chargeblast"))
               {
                  STAGEDATA.playSpecificSound("protoman_chargedshot");
                  _loc1_ = m_projectile[m_lastProjectile];
               }
            }
            else if(m_sprite.stance.currentFrame >= 40)
            {
               this.m_action = 0;
            }
         }
         else if(this.m_action == 5)
         {
            if(m_ySpeed >= -4 && !m_collision.ground)
            {
               playFrame("spread_shoot");
               this.m_action = 6;
            }
            else if(m_collision.ground)
            {
               this.m_idleTimer.reset();
               this.m_action = 0;
               playFrame("idle");
            }
         }
         else if(this.m_action == 6)
         {
            if(m_sprite.stance.currentFrame == 4 || m_sprite.stance.currentFrame == 7 || m_sprite.stance.currentFrame == 10 || m_sprite.stance.currentFrame == 13)
            {
               if(fireProjectile("shot2"))
               {
                  STAGEDATA.playSpecificSound("protoman_unchargedshot");
                  _loc1_ = m_projectile[m_lastProjectile];
                  _loc1_.setXSpeed((!!m_facingForward?7:-7) * Math.cos((270 + 90 * ((m_sprite.stance.currentFrame - 4) / 9)) * (Math.PI / 180)));
                  _loc1_.setYSpeed(-7 * Math.sin((270 + 90 * ((m_sprite.stance.currentFrame - 4) / 9)) * (Math.PI / 180)));
               }
            }
            else if(m_sprite.stance.currentFrame >= 18)
            {
               this.m_action = 0;
            }
         }
         else if(this.m_action == 7)
         {
            if(m_fadeTimer.IsComplete)
            {
               destroyAllProjectiles();
               destroy();
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         var _loc1_:Boolean = false;
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               if(this.m_action == -2)
               {
                  fadeIn();
               }
               else if(this.m_action == 7)
               {
                  fadeOut();
               }
               performAttackChecks();
               attackCollisionTest();
               move();
               gravity();
               _loc1_ = m_collision.ground;
               m_groundCollisionTest();
               if(!_loc1_ && m_collision.ground && this.m_action > 0)
               {
                  STAGEDATA.playSpecificSound("protoman_land");
               }
               checkDeath();
            }
         }
      }
   }
}
