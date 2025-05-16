package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class ExplodingTag extends Item
   {
       
      
      private var m_action:Number;
      
      private var m_explodeTimer:FrameTimer;
      
      private var m_delayTimer:FrameTimer;
      
      private var m_latch_id:Character;
      
      private var m_latch_xOffset:Number;
      
      private var m_latch_yOffset:Number;
      
      private var m_checked:Boolean;
      
      public function ExplodingTag(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_action = 0;
         this.m_explodeTimer = new FrameTimer(31);
         this.m_delayTimer = new FrameTimer(5);
         this.m_latch_id = null;
         this.m_latch_xOffset = 0;
         this.m_latch_yOffset = 0;
         this.m_checked = false;
      }
      
      override public function activate(param1:AttackDamage, param2:Class = null) : void
      {
         if(m_thrown && this.m_action == 1 && m_reactivationDelay.IsComplete && m_itemStats.SpecialAction && param1 || !m_thrown && m_itemStats.SpecialAction)
         {
            m_attackData.getAttack(Item.ATTACK_THROW).OverrideMap.setKey("attackBox",{"hurtSelf":true});
            m_itemStats.SpecialAction = false;
            Attack(Item.ATTACK_IDLE,m_facingForward);
            stancePlayFrame("finish");
            m_xSpeed = 0;
            m_ySpeed = 0;
            m_gravity = 0;
            this.m_action = 1;
            m_itemStats.CanPickup = false;
         }
      }
      
      private function latch(param1:Character) : void
      {
         this.m_action = 1;
         m_xSpeed = 0;
         m_ySpeed = 0;
         m_gravity = 0;
         m_max_ySpeed = 0;
         this.m_latch_id = param1;
         this.m_latch_xOffset = m_sprite.x - this.m_latch_id.X;
         this.m_latch_yOffset = m_sprite.y - this.m_latch_id.Y;
         m_itemStats.CanPickup = false;
         m_thrown = false;
         STAGEDATA.playSpecificSound("kunai_stick");
         Attack(Item.ATTACK_IDLE,m_facingForward);
         stancePlayFrame("latch");
      }
      
      override public function checkBreak() : void
      {
         if(this.m_action === 1)
         {
            super.checkBreak();
         }
      }
      
      private function customBehavior() : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc1_:Item = this;
         var _loc2_:Character = null;
         if(m_thrown && m_itemStats.SpecialAction)
         {
            _loc3_ = false;
            _loc4_ = 0;
            if(this.m_action == 0)
            {
               if(testGroundWithCoord(m_sprite.x,m_sprite.y + 1))
               {
                  if(m_ySpeed < 0)
                  {
                     m_sprite.rotation = !!m_facingForward?Number(270):Number(90);
                  }
                  else if(m_ySpeed > 0)
                  {
                     m_sprite.rotation = !!m_facingForward?Number(90):Number(270);
                  }
                  if(m_xSpeed > 0)
                  {
                     while(testGroundWithCoord(m_sprite.x,m_sprite.y + 1))
                     {
                        m_sprite.x = m_sprite.x - 2;
                     }
                  }
                  else if(m_xSpeed < 0)
                  {
                     while(testGroundWithCoord(m_sprite.x,m_sprite.y + 1))
                     {
                        m_sprite.x = m_sprite.x + 2;
                     }
                  }
                  if(m_ySpeed > 0)
                  {
                     while(testGroundWithCoord(m_sprite.x,m_sprite.y + 1))
                     {
                        m_sprite.y = m_sprite.y - 2;
                     }
                  }
                  else if(m_ySpeed < 0)
                  {
                     while(testGroundWithCoord(m_sprite.x,m_sprite.y + 1))
                     {
                        m_sprite.y = m_sprite.y + 2;
                     }
                  }
                  m_xSpeed = 0;
                  m_ySpeed = 0;
                  m_gravity = 0;
                  m_max_ySpeed = 0;
                  m_itemStats.CanPickup = false;
                  this.m_action = 1;
                  m_thrown = false;
                  m_itemStats.Dangerous = true;
                  STAGEDATA.playSpecificSound("kunai_stick");
                  Attack(Item.ATTACK_IDLE,m_facingForward);
                  stancePlayFrame("latch");
               }
               else if(!m_wasReversed)
               {
                  _loc4_ = 0;
                  while(_loc4_ < m_opponents.length && !m_dead && !_loc3_)
                  {
                     _loc2_ = STAGEDATA.getPlayer(m_opponents[_loc4_]);
                     if(m_opponents[_loc4_] != m_player_id && !_loc2_.StandBy && HasHitBox && _loc2_.HasHitBox && HitBoxSprite.hitTestArray(_loc2_.CurrentAnimation.getHitBoxes(_loc2_.CurrentFrameNum,HitBoxSprite.HIT),_loc1_.CurrentAnimation.getHitBoxes(_loc1_.CurrentFrameNum,HitBoxSprite.HIT),_loc2_.Location,_loc1_.Location,!_loc2_.FacingForward,!_loc1_.FacingForward,_loc2_.CurrentScale,_loc1_.CurrentScale,_loc2_.CurrentRotation,_loc1_.CurrentRotation).length > 0)
                     {
                        this.latch(STAGEDATA.getPlayer(m_opponents[_loc4_]));
                        _loc3_ = true;
                     }
                     _loc4_++;
                  }
               }
               else
               {
                  _loc2_ = STAGEDATA.getPlayer(m_player_id);
                  if(!_loc2_.StandBy && HasHitBox && _loc2_.HasHitBox && HitBoxSprite.hitTestArray(_loc2_.CurrentAnimation.getHitBoxes(_loc2_.CurrentFrameNum,HitBoxSprite.HIT),_loc1_.CurrentAnimation.getHitBoxes(_loc1_.CurrentFrameNum,HitBoxSprite.HIT),_loc2_.Location,_loc1_.Location,!_loc2_.FacingForward,!_loc1_.FacingForward,_loc2_.CurrentScale,_loc1_.CurrentScale,_loc2_.CurrentRotation,_loc1_.CurrentRotation).length > 0)
                  {
                     this.latch(_loc2_);
                  }
               }
            }
            else if(this.m_action == 1)
            {
               m_time = m_itemStats.TimeMax;
               this.m_delayTimer.tick();
               m_attackData.getAttack(Item.ATTACK_THROW).OverrideMap.setKey("attackBox",{"hurtSelf":true});
               if(this.m_delayTimer.IsComplete)
               {
                  this.m_delayTimer.reset();
                  if(!m_wasReversed)
                  {
                     _loc4_ = 0;
                     while(_loc4_ < m_opponents.length && !m_dead && !_loc3_)
                     {
                        _loc2_ = STAGEDATA.getPlayer(m_opponents[_loc4_]);
                        if(m_opponents[_loc4_] != m_player_id && !STAGEDATA.getPlayer(m_opponents[_loc4_]).StandBy && HasHitBox && STAGEDATA.getPlayer(m_opponents[_loc4_]).HasHitBox && HitBoxSprite.hitTestArray(_loc2_.CurrentAnimation.getHitBoxes(_loc2_.CurrentFrameNum,HitBoxSprite.HIT),_loc1_.CurrentAnimation.getHitBoxes(_loc1_.CurrentFrameNum,HitBoxSprite.HIT),_loc2_.Location,_loc1_.Location,!_loc2_.FacingForward,!_loc1_.FacingForward,_loc2_.CurrentScale,_loc1_.CurrentScale,_loc2_.CurrentRotation,_loc1_.CurrentRotation).length > 0)
                        {
                           m_itemStats.SpecialAction = false;
                           stancePlayFrame("finish");
                           _loc3_ = true;
                        }
                        _loc4_++;
                     }
                  }
                  else
                  {
                     _loc2_ = STAGEDATA.getPlayer(m_player_id);
                     if(!_loc2_.StandBy && HasHitBox && _loc2_.HasHitBox && HitBoxSprite.hitTestArray(_loc2_.CurrentAnimation.getHitBoxes(_loc2_.CurrentFrameNum,HitBoxSprite.HIT),_loc1_.CurrentAnimation.getHitBoxes(_loc1_.CurrentFrameNum,HitBoxSprite.HIT),_loc2_.Location,_loc1_.Location,!_loc2_.FacingForward,!_loc1_.FacingForward,_loc2_.CurrentScale,_loc1_.CurrentScale,_loc2_.CurrentRotation,_loc1_.CurrentRotation).length > 0)
                     {
                        m_itemStats.SpecialAction = false;
                        stancePlayFrame("finish");
                     }
                  }
               }
            }
         }
         if(!m_itemStats.SpecialAction)
         {
            this.m_explodeTimer.tick();
            if(this.m_explodeTimer.CurrentTime == this.m_explodeTimer.MaxTime - 1)
            {
               playGlobalSound("bombexplode");
            }
         }
         if(this.m_latch_id != null)
         {
            if(this.m_latch_id.Revival)
            {
               destroy();
            }
            else
            {
               m_sprite.x = this.m_latch_id.X;
               m_sprite.y = this.m_latch_id.Y + this.m_latch_yOffset;
            }
         }
      }
      
      override protected function m_itemFall() : void
      {
         if(!m_thrown || m_thrown && !m_itemStats.SpecialAction)
         {
            super.m_itemFall();
         }
         else
         {
            m_sprite.y = m_sprite.y + m_ySpeed;
         }
      }
      
      override protected function m_itemMove() : void
      {
         if(!m_thrown || m_thrown && !m_itemStats.SpecialAction)
         {
            m_sprite.x = m_sprite.x + m_xSpeed;
            super.m_itemFall();
         }
         else
         {
            m_sprite.x = m_sprite.x + m_xSpeed;
         }
      }
      
      override public function Toss(param1:Number, param2:Number, param3:Number, param4:Number, param5:Boolean = false) : void
      {
         super.Toss(param1,param2,param3,param4,param5);
         if(m_ySpeed < 0 && m_xSpeed === 0)
         {
            m_sprite.rotation = !!m_facingForward?Number(270):Number(90);
         }
         else if(m_ySpeed > 0 && m_xSpeed === 0)
         {
            m_sprite.rotation = !!m_facingForward?Number(90):Number(270);
         }
         else
         {
            m_sprite.y = m_sprite.y + STAGEDATA.getPlayer(m_player_id).Height / 2;
            m_ySpeed = 0;
         }
         var _loc6_:int = 0;
         while(_loc6_ < 20 && testGroundWithCoord(m_sprite.x,m_sprite.y + 1))
         {
            m_sprite.y--;
            _loc6_++;
         }
         if(_loc6_ >= 20)
         {
            m_sprite.y = m_sprite.y + 20;
         }
         else
         {
            m_sprite.y = m_sprite.y - m_height / 2;
         }
         if(m_ySpeed < 0)
         {
            m_gravity = 0;
         }
         STAGEDATA.playSpecificSound("kunai_throw");
      }
      
      override protected function attachToGround() : Boolean
      {
         if(this.m_action !== 1 && !m_thrown)
         {
            return super.attachToGround();
         }
         return false;
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:Boolean = Boolean(m_collision.ground);
         if(m_collision.ground)
         {
            this.attachToGround();
         }
         m_collision.ground = (m_currentPlatform = testGroundWithCoord(m_sprite.x,m_sprite.y + 1)) != null;
         m_checkBounce();
         if(m_collision.ground && !m_collision.leftSide && !m_collision.rightSide)
         {
            this.attachToGround();
         }
         if(m_collision.ground && !m_pickedUp && !m_thrown && m_itemStats.SpecialAction)
         {
            m_xSpeed = 0;
         }
      }
      
      override public function pushAway(param1:Boolean, param2:int = 1) : void
      {
         if(!m_thrown && !m_pickedUp && this.m_action !== 1)
         {
            super.pushAway(param1,param2);
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
            m_itemAttack();
            this.customBehavior();
            if(!m_thrown)
            {
               m_pushAwayItems();
            }
            if(!m_thrown)
            {
               this.m_groundCollisionTest();
            }
            m_checkReverse();
            this.m_itemFall();
            this.m_itemMove();
            checkRichochetTimer();
            m_checkDeathBounds();
            m_checkDead();
         }
      }
   }
}
