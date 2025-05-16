package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class SpikeShell extends Item
   {
       
      
      private var m_target:Target;
      
      private var m_targetTimer:FrameTimer;
      
      private var m_ready:Boolean;
      
      public function SpikeShell(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_target = new Target();
         this.m_targetTimer = new FrameTimer(90);
         this.m_ready = false;
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
            m_attack.IsForward = m_facingForward;
            m_thrown = true;
            m_tossTimer = 0;
            STAGEDATA.playSpecificSound("shell_hit");
            Attack(Item.ATTACK_THROW,param1.IsForward);
         }
      }
      
      private function customBehavior() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(m_thrown)
         {
            m_itemStats.CanPickup = false;
            this.m_targetTimer.tick();
            if(!this.m_ready && this.m_targetTimer.IsComplete)
            {
               this.m_ready = true;
               STAGEDATA.updateRanks();
               _loc1_ = new Array();
               _loc2_ = 0;
               _loc2_ = 0;
               while(_loc2_ < STAGEDATA.PlayerList.length)
               {
                  if(STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc2_]).getMatchResults().Rank == 1)
                  {
                     _loc1_.push(STAGEDATA.PlayerList[_loc2_]);
                  }
                  _loc2_++;
               }
               _loc2_ = 0;
               while(_loc2_ < _loc1_.length)
               {
                  if(STAGEDATA.getPlayer(_loc1_[_loc2_]).StandBy || STAGEDATA.getPlayer(_loc1_[_loc2_]).Team > 0 && STAGEDATA.getPlayer(_loc1_[_loc2_]).Team == m_team_id || STAGEDATA.getPlayer(_loc1_[_loc2_]).ID == m_player_id)
                  {
                     _loc1_.splice(_loc2_,1);
                     _loc2_--;
                  }
                  _loc2_++;
               }
               if(_loc1_.length > 0)
               {
                  this.m_target.CurrentTarget = STAGEDATA.getPlayer(_loc1_[Math.round(Utils.random() * (_loc1_.length - 1))]);
               }
               if(this.m_target.CurrentTarget != null)
               {
                  m_sprite.x = this.m_target.CurrentTarget.X;
                  m_sprite.y = STAGEDATA.DeathBounds.y;
                  m_xSpeed = 0;
                  m_ySpeed = 0;
                  m_gravity = 1;
                  m_attackData.getAttack(Item.ATTACK_THROW).OverrideMap.setKey("attackBox",{
                     "power":140,
                     "kbConstant":120,
                     "damage":20,
                     "hitLag":-1,
                     "effect_id":"blueshellexplode"
                  });
               }
            }
            else if(this.m_ready)
            {
               if(this.m_target.CurrentTarget != null)
               {
                  if(m_sprite.y < this.m_target.CurrentTarget.Y)
                  {
                     _loc3_ = (this.m_target.CurrentTarget.X - m_sprite.x) / 10;
                     m_xSpeed = m_xSpeed + _loc3_;
                     m_attack.IsForward = m_xSpeed > 0;
                  }
               }
               else
               {
                  destroy();
               }
            }
            else
            {
               m_gravity = 0;
               m_xSpeed = m_xSpeed > 0?Number(20):Number(-20);
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
      }
      
      private function m_itemMove2() : void
      {
         m_sprite.x = m_sprite.x + m_xSpeed;
      }
      
      protected function m_itemFall2() : void
      {
         if(m_ySpeed < m_max_ySpeed)
         {
            m_ySpeed = m_ySpeed + m_gravity;
         }
         m_sprite.y = m_sprite.y + m_ySpeed;
      }
      
      override public function PERFORMALL() : void
      {
         m_reactivationDelay.tick();
         if(m_pickedUp && !m_dead)
         {
            checkTimers();
            m_itemStats.TimeMax = 300;
            m_itemAttack();
            m_checkDead();
         }
         else if(!m_pickedUp && !m_dead)
         {
            checkTimers();
            this.customBehavior();
            if(!m_thrown)
            {
               m_pushAwayItems();
            }
            m_itemAttack();
            if(!m_thrown)
            {
               this.m_groundCollisionTest();
            }
            m_checkReverse();
            if(!m_thrown)
            {
               m_itemFall();
            }
            else
            {
               this.m_itemFall2();
            }
            if(!m_thrown)
            {
               m_itemMove();
            }
            else
            {
               this.m_itemMove2();
            }
            checkRichochetTimer();
            m_checkDead();
         }
      }
   }
}
