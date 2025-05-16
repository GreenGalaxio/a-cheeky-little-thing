package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class Bobomb extends Item
   {
       
      
      private var m_action:Number;
      
      private var m_idleTimer:FrameTimer;
      
      private var m_walkTimer:FrameTimer;
      
      private var m_explodeTimer:FrameTimer;
      
      private var m_finished:Boolean;
      
      public function Bobomb(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_action = 0;
         this.m_idleTimer = new FrameTimer(240);
         this.m_walkTimer = new FrameTimer(240);
         this.m_explodeTimer = new FrameTimer(90);
         this.m_finished = false;
      }
      
      override public function activate(param1:AttackDamage, param2:Class = null) : void
      {
         if(!m_thrown)
         {
            m_itemStats.CanPickup = false;
            this.m_finished = true;
            playGlobalSound(m_effectSound);
            stancePlayFrame("finish");
            m_xSpeed = 0;
            m_ySpeed = 0;
            m_gravity = 0;
         }
      }
      
      override public function reactivate(param1:AttackDamage, param2:Class = null) : void
      {
         if(m_thrown && m_reactivationDelay.IsComplete && param1)
         {
            m_itemStats.CanPickup = false;
            this.m_finished = true;
            playGlobalSound(m_effectSound);
            stancePlayFrame("finish");
            m_xSpeed = 0;
            m_ySpeed = 0;
            m_gravity = 0;
         }
      }
      
      private function customBehavior() : void
      {
         var _loc1_:Boolean = false;
         if(m_sprite.currentFrameLabel == "finish")
         {
            this.m_finished = true;
         }
         if(!m_thrown && !m_pickedUp && !this.m_finished)
         {
            if(this.m_action == 0)
            {
               this.m_idleTimer.tick();
               if(this.m_idleTimer.IsComplete)
               {
                  m_itemStats.CanBePushed = false;
                  this.m_action = 1;
                  m_itemStats.CanPickup = false;
                  Attack(Item.ATTACK_IDLE,m_facingForward);
                  if(m_facingForward)
                  {
                     m_xSpeed = 2;
                  }
                  else
                  {
                     m_xSpeed = -2;
                  }
                  m_itemStats.Dangerous = true;
                  stancePlayFrame("walk");
                  STAGEDATA.playSpecificSound("bobomb_startwalk");
               }
            }
            else if(this.m_action == 1)
            {
               _loc1_ = m_collision.ground && !testCoordCollision(m_xSpeed > 0?Number(m_sprite.x + m_xSpeed + 9):Number(m_sprite.x + m_xSpeed - 5),m_sprite.y + 9);
               m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
               m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
               if(_loc1_ || m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
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
               this.m_walkTimer.tick();
               if(this.m_walkTimer.IsComplete)
               {
                  this.m_action = 2;
                  stancePlayFrame("countdown");
                  m_xSpeed = 0;
               }
            }
            else if(this.m_action == 2)
            {
               this.m_explodeTimer.tick();
               if(this.m_explodeTimer.IsComplete)
               {
                  this.m_finished = true;
                  playGlobalSound(m_effectSound);
                  m_xSpeed = 0;
                  m_ySpeed = 0;
                  m_gravity = 0;
                  Attack(Item.ATTACK_IDLE,m_facingForward);
                  m_itemStats.SpecialAction = false;
                  stancePlayFrame("finish");
               }
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
         if(m_collision.ground && !m_pickedUp && !m_thrown && this.m_action == 0)
         {
            m_xSpeed = 0;
         }
         if(m_thrown && m_collision.ground && !this.m_finished)
         {
            m_bounce_limit.reset();
            m_itemStats.Bounce = m_bounceOrig;
            this.m_finished = true;
            playGlobalSound(m_effectSound);
            m_xSpeed = 0;
            m_ySpeed = 0;
            m_gravity = 0;
            Attack(Item.ATTACK_IDLE,m_facingForward);
            stancePlayFrame("finish");
            m_itemStats.SpecialAction = false;
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
