package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class RedShell extends Item
   {
       
      
      private var m_target:Target;
      
      private var m_targetTimer:FrameTimer;
      
      public function RedShell(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_target = new Target();
         this.m_targetTimer = new FrameTimer(5);
         this.m_target = findClosestOpponent();
      }
      
      override public function Toss(param1:Number, param2:Number, param3:Number, param4:Number, param5:Boolean = false) : void
      {
         super.Toss(param1,param2,param3,param4,param5);
         m_attackData.getAttack(Item.ATTACK_THROW).OverrideMap.setKey("attackBox",{"hurtSelf":false});
      }
      
      override public function activate(param1:AttackDamage, param2:Class = null) : void
      {
         if(!m_thrown && param1)
         {
            m_pickedUp = false;
            m_player_id = param1.PlayerID;
            m_team_id = param1.TeamID;
            m_time = m_itemStats.TimeMax;
            m_xSpeed = !!param1.IsForward?Number(m_itemStats.ThrowSpeed):Number(-m_itemStats.ThrowSpeed);
            if(!param1.IsForward)
            {
               m_xSpeed = m_xSpeed * -1;
            }
            if(m_xSpeed < 0)
            {
               m_faceLeft();
            }
            else if(m_xSpeed > 0)
            {
               m_faceRight();
            }
            if(param1.Direction >= 45 && param1.Direction < 135)
            {
               m_ySpeed = -(1 - Utils.fastAbs(90 - param1.Direction) / 45) * 12 - 4;
               unnattachFromGround();
            }
            m_attack.IsForward = m_facingForward;
            m_thrown = true;
            m_tossTimer = 0;
            STAGEDATA.playSpecificSound("shell_hit");
            if(param2 == Character && STAGEDATA.getPlayer(param1.PlayerID) != null)
            {
               STAGEDATA.getPlayer(param1.PlayerID).startActionShot(param1.HitStun);
            }
            if(param1.EffectID != null)
            {
               attachEffectOverlay(param1.EffectID);
            }
            Attack(Item.ATTACK_THROW,param1.IsForward);
         }
      }
      
      override public function itemAttackCollisionTest() : void
      {
         if(m_bypassCollisionTesting)
         {
            return;
         }
         super.itemAttackCollisionTest();
         if(m_tmpVar && m_thrown)
         {
            m_xSpeed = m_xSpeed * -1;
         }
      }
      
      override public function reactivate(param1:AttackDamage, param2:Class = null) : void
      {
         if(m_reactivationDelay.IsComplete)
         {
            m_xSpeed = m_xSpeed * -1;
            if(m_xSpeed < 0)
            {
               m_faceLeft();
            }
            else if(m_xSpeed > 0)
            {
               m_faceRight();
            }
            if(param1.Direction >= 45 && param1.Direction < 135)
            {
               m_ySpeed = -(1 - Utils.fastAbs(90 - param1.Direction) / 45) * 12 - 4;
               unnattachFromGround();
            }
            m_attack.IsForward = m_facingForward;
            m_reactivationDelay.reset();
            STAGEDATA.playSpecificSound("shell_hit");
            if(!m_thrown)
            {
               Attack(Item.ATTACK_THROW,param1.IsForward);
               m_player_id = param1.PlayerID;
               m_team_id = param1.TeamID;
               m_thrown = true;
               m_tossTimer = 0;
               m_attack.IsAttacking = true;
               m_xSpeed = !!param1.IsForward?Number(m_itemStats.ThrowSpeed):Number(-m_itemStats.ThrowSpeed);
            }
            if(param1.EffectID != null)
            {
               attachEffectOverlay(param1.EffectID);
            }
         }
      }
      
      private function customBehavior() : void
      {
         var _loc5_:Boolean = false;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:AttackDamage = null;
         var _loc4_:Character = null;
         if(m_thrown)
         {
            if(m_collision.ground)
            {
               m_itemStats.CanPickup = false;
            }
            _loc5_ = false;
            m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
            m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
            if(_loc5_ || m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
            {
               m_xSpeed = m_xSpeed * -1;
               if(m_facingForward)
               {
                  m_faceLeft();
                  m_attack.IsForward = false;
               }
               else
               {
                  m_faceRight();
                  m_attack.IsForward = true;
               }
               if(_loc5_)
               {
                  m_xSpeed = m_xSpeed > 0?Number(m_itemStats.ThrowSpeed):Number(-m_itemStats.ThrowSpeed);
               }
            }
            this.m_targetTimer.tick();
            if(this.m_targetTimer.IsComplete)
            {
               this.m_target = findClosestOpponent();
               this.m_targetTimer.reset();
            }
            if(this.m_target != null)
            {
               if(m_collision.ground && this.m_target.CurrentTarget != null)
               {
                  if(m_sprite.x < this.m_target.CurrentTarget.X && m_xSpeed < m_itemStats.ThrowSpeed)
                  {
                     m_xSpeed = m_xSpeed + 1 / 2;
                  }
                  else if(m_sprite.x > this.m_target.CurrentTarget.X && m_xSpeed > -m_itemStats.ThrowSpeed)
                  {
                     m_xSpeed = m_xSpeed - 1 / 2;
                  }
               }
            }
         }
         else
         {
            _loc1_ = false;
            _loc2_ = 0;
            while(_loc2_ < STAGEDATA.PlayerList.length && !_loc1_)
            {
               _loc4_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc2_]);
               if(!_loc4_.Ground && _loc4_.YSpeed >= 0 && _loc4_.Y < m_sprite.y && Utils.fastAbs(_loc4_.Y - m_sprite.y) < m_height && Utils.fastAbs(_loc4_.X - m_sprite.x) < m_width && (_loc4_.currentFrameIs("fall") || _loc4_.currentFrameIs("jump") || _loc4_.currentFrameIs("jump_midair")) && !_loc4_.Gliding)
               {
                  _loc3_ = new AttackDamage(m_player_id,this);
                  _loc3_.IsForward = _loc4_.X < m_sprite.x;
                  this.activate(_loc3_.syncState(m_attack),Character);
                  _loc1_ = true;
                  _loc4_.setYSpeed(-10);
                  STAGEDATA.playSpecificSound("shell_hit");
               }
               _loc2_++;
            }
         }
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
         if(m_collision.ground && !m_pickedUp && !m_thrown)
         {
            m_xSpeed = 0;
         }
         if(!_loc1_ && m_collision.ground && m_thrown)
         {
            m_attackData.getAttack(Item.ATTACK_THROW).OverrideMap.setKey("attackBox",{"hurtSelf":true});
         }
      }
      
      override public function PERFORMALL() : void
      {
         m_reactivationDelay.tick();
         if(m_pickedUp && !m_dead)
         {
            checkTimers();
            m_itemStats.TimeMax = 300;
            m_itemAttack();
            m_checkDeathBounds();
            m_checkDead();
         }
         else if(!m_pickedUp && !m_dead)
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
            m_checkDeathBounds();
            m_checkDead();
         }
      }
   }
}
