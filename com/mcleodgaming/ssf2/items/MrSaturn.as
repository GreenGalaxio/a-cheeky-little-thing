package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class MrSaturn extends Item
   {
       
      
      private var m_action:Number;
      
      private var m_idleTimer:FrameTimer;
      
      private var m_walkTimer:FrameTimer;
      
      private var m_hurtTimer:FrameTimer;
      
      private var m_tripTimer:FrameTimer;
      
      private var m_getUpTimer:FrameTimer;
      
      private var m_deathTimer:FrameTimer;
      
      private var m_health:Number;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_hitFromRight:Boolean;
      
      private var m_justHurt:Boolean;
      
      public function MrSaturn(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_action = 1;
         this.m_idleTimer = new FrameTimer(Utils.random() * (180 - 60) + 60);
         this.m_walkTimer = new FrameTimer(Utils.random() * (300 - 180) + 180);
         this.m_tripTimer = new FrameTimer(Utils.random() * (360 - 240) + 240);
         this.m_getUpTimer = new FrameTimer(57);
         this.m_hurtTimer = new FrameTimer(15);
         this.m_deathTimer = new FrameTimer(60);
         this.m_hurtTimer.CurrentTime = this.m_hurtTimer.MaxTime;
         this.m_health = 10;
         this.m_blinkTimer = new FrameTimer(2);
         this.m_blinkToggle = true;
         this.m_hitFromRight = false;
         this.m_justHurt = false;
         playFrame("walk");
         m_attackData.getAttack(Item.ATTACK_THROW).OverrideMap.setKey("attackBox",{"effectSound":"mrsaturn" + Utils.randomInteger(1,3)});
      }
      
      override public function activate(param1:AttackDamage, param2:Class = null) : void
      {
         if(!m_thrown && param1)
         {
         }
      }
      
      override public function reactivate(param1:AttackDamage, param2:Class = null) : void
      {
         if(m_thrown && m_reactivationDelay.IsComplete && param1)
         {
         }
      }
      
      override public function Attack(param1:String, param2:Boolean) : void
      {
         super.Attack(param1,param2);
         updateAttackBoxStats(1,{"effectSound":"mrsaturn" + Utils.randomInteger(1,3)});
      }
      
      private function customBehavior() : void
      {
         var _loc1_:Boolean = false;
         if(!m_thrown && !m_pickedUp)
         {
            if(this.m_action != 3 && this.m_justHurt)
            {
               this.m_blinkTimer.tick();
               this.m_hurtTimer.tick();
               if(this.m_justHurt && this.m_blinkTimer.IsComplete && !this.m_hurtTimer.IsComplete)
               {
                  this.m_blinkToggle = !this.m_blinkToggle;
                  this.m_blinkTimer.reset();
               }
               if(this.m_hurtTimer.IsComplete && this.m_justHurt)
               {
                  if(this.m_blinkToggle)
                  {
                     this.m_blinkToggle = false;
                  }
                  this.m_justHurt = false;
               }
            }
            if(this.m_action == 0)
            {
               this.m_idleTimer.tick();
               m_xSpeed = 0;
               if(this.m_idleTimer.IsComplete)
               {
                  this.m_idleTimer.reset();
                  this.m_idleTimer.MaxTime = Utils.random() * (180 - 60) + 60;
                  this.m_action = 1;
                  playFrame("walk");
               }
            }
            else if(this.m_action == 1)
            {
               this.m_walkTimer.tick();
               this.m_tripTimer.tick();
               m_xSpeed = !!m_facingForward?Number(0.5):Number(-0.5);
               _loc1_ = willFallOffRange(m_sprite.x + m_xSpeed * 2,m_sprite.y);
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
               if(this.m_walkTimer.IsComplete)
               {
                  this.m_walkTimer.reset();
                  this.m_walkTimer.MaxTime = Utils.random() * (300 - 180) + 180;
                  this.m_action = 0;
                  playFrame("idle");
               }
               else if(this.m_tripTimer.IsComplete && m_collision.ground)
               {
                  this.m_action = 2;
                  playFrame("trip");
                  this.m_tripTimer.reset();
                  this.m_tripTimer.MaxTime = Utils.random() * (360 - 240) + 240;
                  STAGEDATA.playSpecificSound("mrsaturn_trip");
               }
            }
            else if(this.m_action == 2)
            {
               m_xSpeed = 0;
               this.m_getUpTimer.tick();
               if(this.m_getUpTimer.IsComplete)
               {
                  this.m_action = 0;
                  this.m_getUpTimer.tick();
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
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc3_:Boolean = super.takeDamage(param1,param2);
         if(_loc3_ && this.m_hurtTimer.IsComplete && !m_thrown)
         {
            _loc4_ = Utils.calculateChargeDamage(param1);
            _loc4_ = _loc4_ * param1.StaleMultiplier;
            if(param1.Damage > 0 && _loc4_ <= 0)
            {
               _loc4_ = 1;
            }
            this.m_justHurt = true;
            if(this.m_health <= 0 && param1.PlayerID > 0)
            {
               this.m_action = 3;
               m_itemStats.CanPickup = false;
               this.customBehavior();
               m_itemStats.CanHit = false;
               m_time = m_itemStats.TimeMax;
               playFrame("toss");
               m_xSpeed = !!param1.IsForward?Number(15):Number(-15);
               m_ySpeed = -15;
            }
            else
            {
               this.m_hurtTimer.reset();
               m_ySpeed = -6;
            }
            unnattachFromGround();
         }
         return _loc3_;
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:Boolean = Boolean(m_collision.ground);
         if(m_collision.ground)
         {
            attachToGround();
         }
         m_collision.ground = (m_currentPlatform = testGroundWithCoord(m_sprite.x,m_sprite.y + 1)) != null;
         m_checkBounce();
         if(m_collision.ground && !m_collision.leftSide && !m_collision.rightSide)
         {
            attachToGround();
         }
         if(m_thrown && m_collision.ground)
         {
            m_thrown = false;
            m_bounce_limit.reset();
            m_itemStats.Bounce = m_bounceOrig;
            m_attack.IsAttacking = false;
            playFrame(Item.ATTACK_IDLE);
            stancePlayFrame("walk");
            m_player_id = 0;
            m_wasReversed = false;
            m_team_id = -1;
            this.m_action = 1;
            this.customBehavior();
         }
      }
      
      override protected function m_pushAwayItems() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Vector.<HitBoxCollisionResult> = null;
         var _loc3_:Item = null;
         if(HasHitBox && m_collision.ground && !m_pickedUp && !m_dead)
         {
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.ItemsRef.ItemsInUse.length)
            {
               if(m_collision.ground && STAGEDATA.ItemsRef.ItemsInUse[_loc1_] != null)
               {
                  _loc2_ = null;
                  _loc3_ = STAGEDATA.ItemsRef.ItemsInUse[_loc1_];
                  if(_loc1_ != m_slot && !_loc3_.Dead && !_loc3_.PickedUp && _loc3_.Ground && !_loc3_.Attacking && !_loc3_.IsSmashBall && _loc3_.HasHitBox && (_loc2_ = HitBoxSprite.hitTestArray(CurrentAnimation.getHitBoxes(CurrentFrameNum,HitBoxSprite.HIT),_loc3_.CurrentAnimation.getHitBoxes(_loc3_.CurrentFrameNum,HitBoxSprite.HIT),Location,_loc3_.Location,!m_facingForward,!_loc3_.FacingForward,CurrentScale,_loc3_.CurrentScale,CurrentRotation,_loc3_.CurrentRotation)).length > 0)
                  {
                     if(m_sprite.x > _loc3_.X)
                     {
                        _loc3_.pushAway(false);
                     }
                     else if(m_sprite.x < _loc3_.X)
                     {
                        _loc3_.pushAway(true);
                     }
                     else if(m_sprite.x == _loc3_.X)
                     {
                        _loc3_.pushAway(true);
                        pushAway(false);
                     }
                  }
               }
               _loc1_++;
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(m_pickedUp && !m_dead)
         {
            checkTimers();
            m_itemAttack();
            m_checkDeathBounds();
            m_checkDead();
         }
         else if(!m_pickedUp && !m_dead)
         {
            checkTimers();
            this.customBehavior();
            if(this.m_action != 3)
            {
               m_pushAwayOpponents();
               this.m_pushAwayItems();
               m_itemAttack();
               this.m_groundCollisionTest();
               m_checkReverse();
               m_itemFall();
               m_itemMove();
               checkRichochetTimer();
               m_checkDeathBounds();
               m_checkDead();
            }
         }
      }
   }
}
