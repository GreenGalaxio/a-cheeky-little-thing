package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class BandanaDee extends AssistTrophy
   {
       
      
      private var m_action:Number;
      
      private var m_walkTimer:FrameTimer;
      
      private var m_jumpTimer:FrameTimer;
      
      private var m_hurtTimer:FrameTimer;
      
      private var m_deathTimer:FrameTimer;
      
      private var m_health:Number;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_hitFromRight:Boolean;
      
      private var m_justHurt:Boolean;
      
      private var m_endTimer:FrameTimer;
      
      public function BandanaDee(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("bandanadee",param1,param2,param3,param4);
         m_ySpeed = -5;
         m_gravity = 1;
         m_max_ySpeed = 10;
         m_width = 20;
         m_height = 20;
         this.m_action = 0;
         this.m_walkTimer = new FrameTimer(Utils.random() * (180 - 60) + 60);
         this.m_jumpTimer = new FrameTimer(4);
         this.m_hurtTimer = new FrameTimer(15);
         this.m_deathTimer = new FrameTimer(60);
         this.m_hurtTimer.CurrentTime = this.m_hurtTimer.MaxTime;
         this.m_health = 0;
         this.m_blinkTimer = new FrameTimer(2);
         this.m_blinkToggle = true;
         this.m_hitFromRight = false;
         this.m_justHurt = false;
         STAGEDATA.SoundQueueRef.playSoundEffect("kssu_1up");
         if(Utils.random() > 0.5)
         {
            m_faceLeft();
         }
         m_attackData.importAttacks(Main.getEnemyAttackData("bandanadee_stats"));
         Attack("idle");
         this.m_endTimer = new FrameTimer(30 * 20);
      }
      
      private function runAI() : void
      {
         var _loc1_:Boolean = false;
         if(!isHitStunOrParalysis())
         {
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
               if(this.m_hurtTimer.IsComplete && this.m_justHurt)
               {
                  if(this.m_blinkToggle)
                  {
                     this.m_blinkToggle = false;
                     setTint(1,1,1,1,0,0,0,0);
                  }
                  this.m_justHurt = false;
                  Attack("walk");
               }
            }
            if(this.m_action == 0)
            {
               if(m_collision.ground)
               {
                  this.m_action = 1;
                  Attack("walk");
               }
            }
            else if(this.m_action == 1)
            {
               this.m_walkTimer.tick();
               m_xSpeed = !!m_facingForward?Number(1.5):Number(-1.5);
               _loc1_ = m_collision.ground && !testCoordCollision(m_xSpeed > 0?Number(m_sprite.x + m_xSpeed + 9):Number(m_sprite.x + m_xSpeed - 5),m_sprite.y + 9);
               m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
               m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
               if(_loc1_ || m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
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
                  this.m_jumpTimer.reset();
                  this.m_walkTimer.reset();
                  this.m_walkTimer.MaxTime = Utils.random() * (180 - 60) + 60;
                  Attack("jump");
                  this.m_action = 2;
               }
            }
            else if(this.m_action == 2)
            {
               this.m_jumpTimer.tick();
               if(this.m_jumpTimer.IsComplete)
               {
                  STAGEDATA.playSpecificSound("bandanadee_jump");
                  unnattachFromGround();
                  m_ySpeed = -10;
                  m_xSpeed = !!m_facingForward?Number(3):Number(-3);
                  this.m_action = 0;
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
            if(!m_dead)
            {
               this.m_endTimer.tick();
               if(this.m_endTimer.IsComplete)
               {
                  destroy();
               }
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
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
            _loc4_ = Utils.calculateVelocity(Utils.calculateKnockback(param1.KBConstant,param1.Power,param1.WeightKB,Utils.calculateChargeDamage(param1),this.m_health,100,false,1));
            this.m_justHurt = true;
            if(_loc4_ > 16 && param1.PlayerID > 0)
            {
               this.m_action = 3;
               m_xSpeed = !!param1.IsForward?Number(5):Number(-5);
               m_ySpeed = -15;
            }
            else
            {
               this.m_hurtTimer.reset();
               m_ySpeed = -6;
            }
            unnattachFromGround();
            playFrame("hurt");
            return true;
         }
         return false;
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
               fadeIn();
               performAttackChecks();
               attackCollisionTest();
               move();
               checkHitStun();
               gravity();
               if(this.m_action != 3)
               {
                  _loc1_ = m_collision.ground;
                  m_groundCollisionTest();
                  if(!_loc1_ && m_collision.ground)
                  {
                     STAGEDATA.playSpecificSound("bandanadee_land");
                  }
               }
               checkDeath();
            }
         }
      }
   }
}
