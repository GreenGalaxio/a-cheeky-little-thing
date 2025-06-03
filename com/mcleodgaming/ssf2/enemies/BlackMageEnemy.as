package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class BlackMageEnemy extends Enemy
   {
       
      
      protected var WALKSPEED:Number = 3;
      
      private var m_action:uint;
      
      private var m_destroyTimer:FrameTimer;
      
      private var m_hurtTimer:FrameTimer;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_justHurt:Boolean;
      
      public function BlackMageEnemy(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super(m_linkage_id,param1,param2,param3,param4);
         m_gravity = 1;
         m_max_ySpeed = 10;
         this.m_action = 0;
         m_width = 40;
         m_height = 40;
         m_attack.IsAttacking = true;
         this.m_destroyTimer = new FrameTimer(425);
         m_fadeTimer.reset();
         this.m_blinkTimer = new FrameTimer(2);
         this.m_blinkToggle = true;
         this.m_hurtTimer = new FrameTimer(15);
         this.m_hurtTimer.CurrentTime = this.m_hurtTimer.MaxTime;
         this.m_justHurt = false;
         if(Utils.random() > 0.5)
         {
            m_faceLeft();
         }
         var _loc5_:int = 0;
         while(_loc5_ < 400 && !testGroundWithCoord(m_sprite.x,m_sprite.y + 2))
         {
            m_sprite.y++;
            _loc5_++;
         }
         m_sprite.y = m_sprite.y - m_height;
      }
      
      private function runAI() : void
      {
         var _loc1_:Boolean = false;
         if(this.m_action != 2 && this.m_justHurt)
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
            if(this.m_hurtTimer.IsComplete && this.m_justHurt)
            {
               if(this.m_blinkToggle)
               {
                  this.m_blinkToggle = false;
                  setTint(1,1,1,1,0,0,0,0);
               }
               this.m_justHurt = false;
               Attack("walk");
               this.m_action = 0;
            }
         }
         if(this.m_action == 0)
         {
            m_xSpeed = !!m_facingForward?Number(this.WALKSPEED):Number(-this.WALKSPEED);
            if(m_gravity > 0 && !m_collision.ground)
            {
               m_xSpeed = 0;
            }
            _loc1_ = m_gravity > 0 && m_collision.ground && !testCoordCollision(m_xSpeed > 0?Number(m_sprite.x + m_xSpeed + 9):Number(m_sprite.x + m_xSpeed - 5),m_sprite.y + 9);
            m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
            m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
            if(_loc1_ || m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
            {
               if(m_facingForward)
               {
                  m_faceLeft();
                  m_xSpeed = m_xSpeed * -1;
               }
               else
               {
                  m_faceRight();
                  m_xSpeed = m_xSpeed * -1;
               }
            }
         }
         else if(this.m_action != 1)
         {
            if(this.m_action == 2)
            {
               fadeOut();
               this.m_blinkTimer.tick();
               if(this.m_blinkTimer.IsComplete && !this.m_hurtTimer.IsComplete)
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
               if(m_fadeTimer.IsComplete)
               {
                  destroy();
               }
            }
         }
         this.m_destroyTimer.tick();
         if(this.m_destroyTimer.IsComplete && this.m_action != 2)
         {
            m_xSpeed = 0;
            m_ySpeed = 0;
            m_fadeTimer.reset();
            this.m_action = 2;
            playFrame("hurt");
            this.m_hurtTimer.reset();
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         var _loc3_:Number = NaN;
         if(param1.BypassEnemies)
         {
            return false;
         }
         if(this.m_hurtTimer.IsComplete && param1.PlayerID != m_player_id)
         {
            _loc3_ = Utils.calculateChargeDamage(param1);
            _loc3_ = _loc3_ * param1.StaleMultiplier;
            if(param1.Damage > 0 && _loc3_ <= 0)
            {
               _loc3_ = 1;
            }
            this.m_justHurt = true;
            this.m_hurtTimer.reset();
            m_xSpeed = 0;
            m_ySpeed = -6;
            unnattachFromGround();
            playFrame("hurt");
            this.m_action = 1;
            return true;
         }
         return false;
      }
      
      override protected function move() : void
      {
         m_attemptToMove(m_xSpeed,0);
         m_attemptToMove(0,m_ySpeed);
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
               this.move();
               gravity();
               m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
