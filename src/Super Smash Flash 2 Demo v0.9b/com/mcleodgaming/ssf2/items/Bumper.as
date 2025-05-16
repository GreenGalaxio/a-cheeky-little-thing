package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Bumper extends Item
   {
       
      
      protected var m_hitBoxRect:Rectangle;
      
      private var m_set:Boolean;
      
      private var m_setTimer:FrameTimer;
      
      private var m_suspended:Boolean;
      
      public function Bumper(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_set = false;
         this.m_suspended = true;
         this.m_setTimer = new FrameTimer(10);
      }
      
      override public function extraHitTests(param1:Number, param2:Number, param3:InteractiveSprite = null) : Boolean
      {
         if(!(param3 is Character) || m_pickedUp || m_dead || !this.m_set)
         {
            return false;
         }
         var _loc4_:Character = param3 as Character;
         var _loc5_:Rectangle = _loc4_.BoundsRect;
         _loc5_.offset(param1,param2);
         if(Utils.fastAbs(m_attack.AttackID - _loc4_.PreviousAttackID) > 1 && !_loc4_.IsCaught && BoundsRect.intersects(_loc5_))
         {
            this.bouncePlayer(_loc4_,null);
            return true;
         }
         return false;
      }
      
      protected function bouncePlayer(param1:InteractiveSprite, param2:HitBoxCollisionResult) : void
      {
         var _loc4_:Number = NaN;
         var _loc3_:Character = Boolean(param1 as Character)?Character(param1):null;
         if(_loc3_)
         {
            _loc4_ = Utils.getAngleBetween(new Point(m_sprite.x,m_sprite.y),new Point(_loc3_.X,_loc3_.Y - _loc3_.Height / 2 * _loc3_.SizeRatio));
            if(m_attackData.getAttack(m_attack.Frame).OverrideMap.containsKey("attackBox"))
            {
               m_attackData.getAttack(m_attack.Frame).OverrideMap.getKey("attackBox").direction = _loc4_;
            }
            else
            {
               m_attackData.getAttack(m_attack.Frame).OverrideMap.setKey("attackBox",{"direction":_loc4_});
            }
            m_attack.IsForward = true;
            if(_loc3_.takeDamage(m_attackData.getAttackBoxData(m_attack.Frame,"attackBox").syncState(m_attack)))
            {
               STAGEDATA.playSpecificSound("bumper_clang");
               this.setBumper(!this.m_suspended);
               playFrame(Item.ATTACK_IDLE);
               stancePlayFrame(!!this.m_suspended?"hit":"continuehit");
            }
         }
      }
      
      override public function activate(param1:AttackDamage, param2:Class = null) : void
      {
         if(this.m_set && param2 == Character && param1)
         {
         }
      }
      
      private function customBehavior() : void
      {
         if(m_thrown && !this.m_set)
         {
            this.m_setTimer.tick();
            if(this.m_setTimer.IsComplete)
            {
               this.setBumper(m_collision.ground);
            }
         }
         else if(this.m_set)
         {
            this.checkBounce();
         }
         else if(!m_thrown && !this.m_set)
         {
            this.m_setTimer.reset();
         }
      }
      
      private function setBumper(param1:Boolean) : void
      {
         if(!this.m_set)
         {
            this.m_set = true;
            m_xSpeed = 0;
            m_ySpeed = 0;
            m_itemStats.CanHit = true;
            m_itemStats.CanPickup = false;
            m_attack.IsAttacking = false;
            m_attack.Frame = Item.ATTACK_IDLE;
            m_attack.RefreshRateReady = true;
            if(m_attackData.getAttack(m_attack.Frame).OverrideMap.containsKey("attackBox"))
            {
               m_attackData.getAttack(m_attack.Frame).OverrideMap.getKey("attackBox").hurtSelf = true;
            }
            else
            {
               m_attackData.getAttack(m_attack.Frame).OverrideMap.setKey("attackBox",{"hurtSelf":true});
            }
            STAGEDATA.playSpecificSound("bumper_stop");
            playFrame(Item.ATTACK_IDLE);
            if(param1)
            {
               stancePlayFrame("continue");
               this.m_suspended = false;
            }
            else
            {
               m_gravity = 0;
               m_max_ySpeed = 0;
               this.m_suspended = true;
               stancePlayFrame("toss");
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         return false;
      }
      
      private function checkBounce() : void
      {
         var _loc1_:Character = null;
         if(!isHitStunOrParalysis())
         {
            m_attack.ExecTime++;
            m_attack.RefreshRateTimer++;
            if(m_attack.RefreshRateReady && m_attack.RefreshRateTimer % m_attack.RefreshRate == 0)
            {
               m_attack.AttackID++;
            }
         }
         var _loc2_:Number = 0;
         _loc2_ = 0;
         while(_loc2_ < m_opponents.length)
         {
            _loc1_ = STAGEDATA.getPlayer(m_opponents[_loc2_]);
            if(_loc1_ != null && !_loc1_.StandBy && !_loc1_.Dead && !_loc1_.IsTeching && !_loc1_.inState(CState.STAR_KO) && !_loc1_.inState(CState.SCREEN_KO) && !_loc1_.inState(CState.REVIVAL))
            {
               InteractiveSprite.hitTest(this,_loc1_,HitBoxSprite.CATCH,HitBoxSprite.ATTACK,this.bouncePlayer);
               InteractiveSprite.hitTest(this,_loc1_,HitBoxSprite.CATCH,HitBoxSprite.HIT,this.bouncePlayer);
            }
            _loc2_++;
         }
      }
      
      override public function Toss(param1:Number, param2:Number, param3:Number, param4:Number, param5:Boolean = false) : void
      {
         super.Toss(param3 > 0?Number(param1 + m_width / 2):Number(param1 - m_width / 2),param2,param3,param4,param5);
      }
      
      override public function checkBreak() : void
      {
         super.checkBreak();
         if(m_itemStats.Ricochet)
         {
            if(m_attackData.getAttack(m_attack.Frame).OverrideMap.containsKey("attackBox"))
            {
               m_attackData.getAttack(m_attack.Frame).OverrideMap.getKey("attackBox").hurtSelf = true;
            }
            else
            {
               m_attackData.getAttack(m_attack.Frame).OverrideMap.setKey("attackBox",{"hurtSelf":true});
            }
            if(this.m_set)
            {
               m_ySpeed = 0;
            }
         }
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         if(!m_isSmashball)
         {
            _loc1_ = Boolean(m_collision.ground);
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
            if(m_collision.ground && !this.m_set && m_thrown)
            {
               this.setBumper(true);
            }
            if(m_collision.ground && !m_pickedUp && !m_thrown)
            {
               if(m_itemStats.SlideDecay >= 0)
               {
                  m_xSpeed = m_xSpeed * m_itemStats.SlideDecay;
               }
               else if(m_xSpeed != 0)
               {
                  _loc2_ = m_xSpeed > 0;
                  m_xSpeed = m_xSpeed - (m_xSpeed > 0?Utils.fastAbs(m_itemStats.SlideDecay):-Utils.fastAbs(m_itemStats.SlideDecay));
                  if(_loc2_ && m_xSpeed < 0 || !_loc2_ && m_xSpeed > 0)
                  {
                     m_xSpeed = 0;
                  }
                  if(Utils.fastAbs(m_xSpeed) <= 0.5)
                  {
                     m_xSpeed = 0;
                  }
               }
            }
         }
      }
      
      override public function pushAway(param1:Boolean, param2:int = 1) : void
      {
         if(!this.m_set)
         {
            super.pushAway(param1,param2);
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_pickedUp && !m_dead)
         {
            checkTimers();
            this.customBehavior();
            m_pushAwayItems();
            m_itemAttack();
            this.m_groundCollisionTest();
            m_checkReverse();
            m_itemFall();
            m_itemMove();
            checkRichochetTimer();
            checkHitStun();
            m_checkDeathBounds();
            m_checkDead();
         }
      }
   }
}
