package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.enemies.AngryCucco;
   import com.mcleodgaming.ssf2.enemies.GoldAngryCucco;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class Cucco extends Item
   {
       
      
      private var m_action:Number;
      
      private var m_idleTimer:FrameTimer;
      
      private var m_walkTimer:FrameTimer;
      
      private var m_runTimer:FrameTimer;
      
      private var m_squawkTimer:FrameTimer;
      
      private var m_changeDirections:Boolean;
      
      private var m_health:Number;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_peckTimer:FrameTimer;
      
      private var m_target:Target;
      
      private var m_targetTimer:FrameTimer;
      
      private var m_spawns:Number;
      
      public function Cucco(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_action = 0;
         this.m_idleTimer = new FrameTimer(Utils.random() * (60 - 30) + 30);
         this.m_walkTimer = new FrameTimer(Utils.random() * (90 - 30) + 30);
         this.m_squawkTimer = new FrameTimer(Utils.randomInteger(45,120));
         this.m_runTimer = new FrameTimer(60);
         this.m_runTimer.CurrentTime = this.m_runTimer.MaxTime;
         this.m_changeDirections = false;
         this.m_health = 25;
         this.m_blinkTimer = new FrameTimer(2);
         this.m_blinkToggle = true;
         this.m_peckTimer = new FrameTimer(10);
         this.m_targetTimer = new FrameTimer(3);
         this.m_target = new Target();
         this.m_spawns = 0;
         m_lastHitID = -1;
         STAGEDATA.CuccoCount++;
      }
      
      override public function activate(param1:AttackDamage, param2:Class = null) : void
      {
         if(m_thrown)
         {
         }
      }
      
      override public function reactivate(param1:AttackDamage, param2:Class = null) : void
      {
         if(m_thrown && m_reactivationDelay.IsComplete && param1)
         {
         }
      }
      
      private function customBehavior() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         if(!m_thrown && !m_pickedUp && m_collision.ground)
         {
            if(this.m_action == 0)
            {
               this.m_peckTimer.tick();
               this.m_idleTimer.tick();
               if(this.m_idleTimer.IsComplete)
               {
                  if(this.m_changeDirections)
                  {
                     if(m_facingForward)
                     {
                        m_faceLeft();
                     }
                     else
                     {
                        m_faceRight();
                     }
                     this.m_changeDirections = false;
                  }
                  this.m_action = 1;
                  if(m_facingForward)
                  {
                     m_xSpeed = 1;
                  }
                  else
                  {
                     m_xSpeed = -1;
                  }
                  this.m_idleTimer.reset();
                  this.m_walkTimer.MaxTime = Math.round(Utils.random() * (90 - 30) + 30);
                  stancePlayFrame("walk");
               }
               else if(this.m_peckTimer.IsComplete && this.m_idleTimer.MaxTime - this.m_idleTimer.CurrentTime > 10 && Utils.random() > 0.75)
               {
                  if(Utils.random() < 0.2)
                  {
                     STAGEDATA.SoundQueueRef.playVoiceEffect("cucco1");
                  }
                  stancePlayFrame("peck");
                  this.m_peckTimer.reset();
               }
            }
            else if(this.m_action == 1)
            {
               _loc1_ = m_collision.ground && !testTerrainWithCoord(m_xSpeed > 0?Number(m_sprite.x + m_xSpeed + 9):Number(m_sprite.x + m_xSpeed - 5),m_sprite.y + 9);
               m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
               m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
               if(_loc1_ || m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
               {
                  m_xSpeed = 0;
                  if(m_facingForward)
                  {
                     m_faceLeft();
                  }
                  else
                  {
                     m_faceRight();
                  }
                  this.m_action = 0;
                  stancePlayFrame("stand");
               }
               else
               {
                  this.m_walkTimer.tick();
                  if(this.m_walkTimer.IsComplete)
                  {
                     m_xSpeed = 0;
                     this.m_action = 0;
                     this.m_walkTimer.reset();
                     this.m_idleTimer.MaxTime = Math.round(Utils.random() * (60 - 30) + 30);
                     stancePlayFrame("stand");
                     this.m_changeDirections = Utils.random() > 0.35;
                  }
               }
            }
            else if(this.m_action == 2)
            {
               this.m_runTimer.tick();
               this.m_blinkTimer.tick();
               _loc2_ = m_collision.ground && !testCoordCollision(m_xSpeed > 0?Number(m_sprite.x + m_xSpeed + 9):Number(m_sprite.x + m_xSpeed - 5),m_sprite.y + 9);
               m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
               m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
               if(_loc2_ || m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
               {
                  m_xSpeed = m_xSpeed * -1;
                  if(m_facingForward)
                  {
                     m_faceLeft();
                  }
                  else
                  {
                     m_faceRight();
                  }
               }
               if(this.m_runTimer.IsComplete)
               {
                  this.m_action = 0;
                  setTint(1,1,1,1,0,0,0,0);
                  stancePlayFrame("stand");
                  m_xSpeed = 0;
                  m_itemStats.CanPickup = true;
               }
               else if(this.m_blinkTimer.IsComplete)
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
            }
            else if(this.m_action == 3)
            {
               this.m_targetTimer.tick();
               if(this.m_targetTimer.IsComplete)
               {
                  this.m_spawns++;
                  if(this.m_spawns == 12)
                  {
                     AngryCucco(STAGEDATA.spawnEnemy(GoldAngryCucco,m_sprite.x + (Utils.random() * 80 + -40),m_sprite.y - 30)).setTarget(STAGEDATA.getPlayer(m_lastHitID));
                  }
                  else
                  {
                     AngryCucco(STAGEDATA.spawnEnemy(AngryCucco,m_sprite.x + (Utils.random() * 80 + -40),m_sprite.y - 30)).setTarget(STAGEDATA.getPlayer(m_lastHitID));
                  }
                  this.m_targetTimer.reset();
               }
               if(this.m_spawns >= 12)
               {
                  destroy();
                  STAGEDATA.CuccoCount--;
               }
            }
         }
         else if(m_pickedUp && !STAGEDATA.getPlayer(m_player_id).CollisionObj.ground && STAGEDATA.getPlayer(m_player_id).YSpeed > 0 && STAGEDATA.getPlayer(m_player_id).inFreeState())
         {
            Attack(Item.ATTACK_HOLD,m_facingForward);
            STAGEDATA.getPlayer(m_player_id).Attack("item",1);
            STAGEDATA.getPlayer(m_player_id).updateAttackStats({
               "doubleJumpCancelAttack":true,
               "airCancel":true,
               "airCancelSpecial":true,
               "air_ease":3,
               "allowControl":true,
               "allowDoubleJump":true
            });
         }
         else if(m_pickedUp)
         {
            this.m_squawkTimer.tick();
            if(this.m_squawkTimer.IsComplete)
            {
               this.m_squawkTimer.reset();
               this.m_squawkTimer.MaxTime = Utils.randomInteger(45,120);
               STAGEDATA.SoundQueueRef.playVoiceEffect("cucco2");
            }
            if(STAGEDATA.getPlayer(m_player_id).inState(CState.ATTACKING) && STAGEDATA.getPlayer(m_player_id).AttackStateData.Frame === "item" && STAGEDATA.getPlayer(m_player_id).YSpeed > 3)
            {
               STAGEDATA.getPlayer(m_player_id).setYSpeed(3);
            }
         }
      }
      
      override protected function m_checkDead() : void
      {
         m_totalTime++;
         if(m_thrown)
         {
            m_tossTimer++;
         }
         if(m_itemStats.TimeMax > 0 && !m_dead && !m_pickedUp)
         {
            m_time--;
            if(m_time <= 0)
            {
               destroy();
               STAGEDATA.CuccoCount--;
            }
         }
         if(m_itemStats.RemoveAfterUse && m_uses >= m_itemStats.UsesMax && !m_dead)
         {
            if(!m_itemStats.RemoveWhileHolding && !m_pickedUp && m_collision.ground)
            {
               destroy();
               STAGEDATA.CuccoCount--;
            }
            else if(m_itemStats.RemoveWhileHolding && m_pickedUp && !STAGEDATA.getPlayer(m_player_id).AttackStateData.IsAttacking)
            {
               destroy();
               STAGEDATA.CuccoCount--;
            }
         }
         if(!m_dead && getVar("finished",true))
         {
            destroy();
            STAGEDATA.CuccoCount--;
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:MovieClip = null;
         if(param1.BypassEnemies)
         {
            return false;
         }
         var _loc3_:Boolean = super.takeDamage(param1,param2);
         if(_loc3_ && this.m_runTimer.IsComplete)
         {
            _loc4_ = Utils.calculateChargeDamage(param1);
            _loc4_ = _loc4_ * param1.StaleMultiplier;
            if(param1.Damage > 0 && _loc4_ <= 0)
            {
               _loc4_ = 1;
            }
            m_lastHitID = param1.PlayerID;
            this.m_health = this.m_health - _loc4_;
            if(this.m_health <= 0 && param1.PlayerID > 0)
            {
               this.m_action = 3;
               m_itemStats.CanPickup = false;
               this.customBehavior();
               m_itemStats.CanHit = false;
               m_time = m_itemStats.TimeMax;
            }
            else
            {
               this.m_runTimer.reset();
               this.m_action = 2;
               stancePlayFrame("run");
               if(param1.IsForward)
               {
                  m_xSpeed = 2;
                  m_faceRight();
               }
               else
               {
                  m_xSpeed = -2;
                  m_faceLeft();
               }
               m_itemStats.CanPickup = false;
               unnattachFromGround();
               m_ySpeed = -6;
            }
            STAGEDATA.SoundQueueRef.playVoiceEffect("cucco2");
            m_thrown = false;
            m_player_id = 0;
            m_wasReversed = false;
            m_team_id = -1;
            _loc5_ = STAGEDATA.attachEffectOverlay("cucco_feathers");
            _loc5_.x = OverlayX;
            _loc5_.y = OverlayY - 8;
            _loc5_ = STAGEDATA.attachEffectOverlay("cucco_feathers");
            _loc5_.x = OverlayX - 8;
            _loc5_.y = OverlayY;
            _loc5_ = STAGEDATA.attachEffectOverlay("cucco_feathers");
            _loc5_.x = OverlayX + 8;
            _loc5_.y = OverlayY;
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
            m_bounce_limit.reset();
            m_itemStats.Bounce = m_bounceOrig;
            m_thrown = false;
            m_attack.IsAttacking = false;
            playFrame(Item.ATTACK_IDLE);
            stancePlayFrame("stand");
            m_wasReversed = false;
            m_team_id = -1;
            this.m_action = 0;
            m_xSpeed = 0;
         }
      }
      
      override protected function m_pushAwayItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Vector.<HitBoxCollisionResult> = null;
         var _loc3_:Item = null;
         if(HasHitBox && !m_dead)
         {
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.ItemsRef.ItemsInUse.length)
            {
               _loc2_ = null;
               _loc3_ = STAGEDATA.ItemsRef.ItemsInUse[_loc1_];
               if(_loc1_ != m_slot && _loc3_ != null && !_loc3_.Dead && !_loc3_.PickedUp && _loc3_.Ground && !_loc3_.Attacking && (_loc2_ = HitBoxSprite.hitTestArray(CurrentAnimation.getHitBoxes(CurrentFrameNum,HitBoxSprite.HIT),_loc3_.CurrentAnimation.getHitBoxes(_loc3_.CurrentFrameNum,HitBoxSprite.HIT),Location,_loc3_.Location,!m_facingForward,!_loc3_.FacingForward,CurrentScale,_loc3_.CurrentScale,CurrentRotation,_loc3_.CurrentRotation)).length > 0)
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
               _loc1_++;
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(m_pickedUp && !m_dead)
         {
            checkTimers();
            this.customBehavior();
            m_itemAttack();
            m_checkDeathBounds();
            this.m_checkDead();
         }
         else if(!m_pickedUp && !m_dead)
         {
            checkTimers();
            this.customBehavior();
            this.m_pushAwayItems();
            m_itemAttack();
            this.m_groundCollisionTest();
            m_checkReverse();
            m_itemFall();
            m_itemMove();
            checkRichochetTimer();
            m_checkDeathBounds();
            this.m_checkDead();
         }
      }
   }
}
