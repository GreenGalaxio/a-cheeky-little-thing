package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class Starfy extends AssistTrophy
   {
       
      
      private var m_action:Number;
      
      private var m_idleTimer:FrameTimer;
      
      private var m_walkTimer:FrameTimer;
      
      private var m_preAttackTimer:FrameTimer;
      
      private var m_attackTimer:FrameTimer;
      
      private var m_hurtTimer:FrameTimer;
      
      private var m_deathTimer:FrameTimer;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_hitFromRight:Boolean;
      
      private var m_justHurt:Boolean;
      
      private var m_endTimer:FrameTimer;
      
      public function Starfy(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("starfy",param1,param2,param3,param4);
         m_ySpeed = -5;
         m_gravity = 1;
         m_max_ySpeed = 10;
         m_width = 20;
         m_height = 20;
         this.m_action = -1;
         this.m_walkTimer = new FrameTimer(Utils.random() * (180 - 60) + 60);
         this.m_attackTimer = new FrameTimer(30 * 2);
         this.m_hurtTimer = new FrameTimer(15);
         this.m_deathTimer = new FrameTimer(60);
         this.m_idleTimer = new FrameTimer(30 * 1);
         this.m_hurtTimer.CurrentTime = this.m_hurtTimer.MaxTime;
         this.m_blinkTimer = new FrameTimer(2);
         this.m_preAttackTimer = new FrameTimer(15);
         this.m_blinkToggle = true;
         this.m_hitFromRight = false;
         this.m_justHurt = false;
         var _loc5_:Target = getNearestTarget();
         if(_loc5_ == null)
         {
            if(Utils.random() > 0.5)
            {
               m_faceLeft();
            }
         }
         else if(_loc5_.CurrentTarget.X < m_sprite.x)
         {
            m_faceLeft();
         }
         m_attackData.importAttacks(Main.getEnemyAttackData("starfy_stats"));
         this.m_endTimer = new FrameTimer(30 * 20);
         unnattachFromGround();
         m_ySpeed = -8;
         STAGEDATA.playSpecificSound("starfy_spawn");
      }
      
      private function runAI() : void
      {
         var _loc1_:Target = null;
         if(this.m_action != 3 && this.m_justHurt)
         {
            this.m_blinkTimer.tick();
            this.m_hurtTimer.tick();
            if(this.m_justHurt && this.m_blinkTimer.IsComplete && !this.m_hurtTimer.IsComplete)
            {
               this.m_blinkToggle = !this.m_blinkToggle;
               if(this.m_blinkToggle)
               {
                  setTint(1,1,1,1,0,0,0,0);
               }
               else
               {
                  setTint(1,1,1,1,180,0,0,0);
               }
               this.m_blinkTimer.reset();
            }
            if(this.m_hurtTimer.IsComplete && this.m_justHurt || m_collision.ground)
            {
               if(this.m_blinkToggle)
               {
                  this.m_blinkToggle = false;
                  setTint(1,1,1,1,0,0,0,0);
               }
               this.m_justHurt = false;
               playFrame("walk");
            }
         }
         if(this.m_action == -1)
         {
            if(m_collision.ground)
            {
               this.m_action = 0;
               playFrame("idle");
            }
         }
         else if(this.m_action == 0)
         {
            m_xSpeed = 0;
            this.m_idleTimer.tick();
            if(this.m_idleTimer.IsComplete)
            {
               this.m_action = 1;
               playFrame("walk");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_walkTimer.tick();
            m_xSpeed = !!m_facingForward?Number(1):Number(-1);
            m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
            m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
            if(m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
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
            if(this.m_walkTimer.IsComplete && m_collision.ground)
            {
               m_xSpeed = 0;
               this.m_attackTimer.reset();
               this.m_walkTimer.reset();
               this.m_walkTimer.MaxTime = Utils.random() * (180 - 60) + 60;
               Attack("attack");
               this.m_action = 2;
               STAGEDATA.playSpecificSound("starfy_spin");
            }
            else
            {
               this.m_preAttackTimer.tick();
               if(this.m_preAttackTimer.IsComplete)
               {
                  _loc1_ = getNearestTarget();
                  if(_loc1_ != null)
                  {
                     _loc1_.setDistance(new Point(m_sprite.x,m_sprite.y));
                     if(_loc1_.Distance < 80)
                     {
                        this.m_preAttackTimer.reset();
                        this.m_walkTimer.CurrentTime = this.m_walkTimer.MaxTime;
                     }
                  }
               }
            }
         }
         else if(this.m_action == 2)
         {
            this.m_attackTimer.tick();
            m_xSpeed = !!m_facingForward?Number(4):Number(-4);
            m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
            m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
            if(m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
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
            if(this.m_attackTimer.IsComplete)
            {
               this.m_action = 0;
               m_xSpeed = 0;
               playFrame("idle");
            }
         }
         else if(this.m_action == 3)
         {
            m_sprite.x = m_sprite.x + m_xSpeed;
            m_sprite.y = m_sprite.y + m_ySpeed;
            this.m_deathTimer.tick();
            if(this.m_deathTimer.IsComplete)
            {
               destroy();
            }
         }
         else if(this.m_action == 4)
         {
            fadeOut();
            if(m_fadeTimer.IsComplete)
            {
               destroy();
            }
         }
         if(!m_dead && this.m_action != 4)
         {
            this.m_endTimer.tick();
            if(this.m_endTimer.IsComplete)
            {
               m_fadeTimer.reset();
               this.m_action = 4;
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
         if(this.m_hurtTimer.IsComplete && param1.PlayerID != m_player_id && this.m_action != 4 && !attackIDArrayContains(param1.AttackID))
         {
            stackAttackID(param1.AttackID);
            _loc3_ = Utils.calculateChargeDamage(param1);
            _loc3_ = _loc3_ * param1.StaleMultiplier;
            if(param1.Damage > 0 && _loc3_ <= 0)
            {
               _loc3_ = 1;
            }
            this.m_hurtTimer.reset();
            m_xSpeed = !!param1.IsForward?Number(7):Number(-7);
            m_ySpeed = -6;
            unnattachFromGround();
            playFrame("hurt");
            startActionShot(param1.HitStun);
            this.m_justHurt = true;
            return true;
         }
         return false;
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               if(this.m_action != 3 && this.m_action != 4)
               {
                  fadeIn();
               }
               checkHitStun();
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
