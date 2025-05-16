package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Freezie extends Item
   {
       
      
      private var m_hasHitGround:Boolean;
      
      public function Freezie(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         m_itemStats.SlideDecay = 1;
         m_bounce_remaining = 0;
         this.m_hasHitGround = false;
      }
      
      override public function activate(param1:AttackDamage, param2:Class = null) : void
      {
         if(!m_thrown)
         {
            destroy();
         }
      }
      
      private function customBehavior() : void
      {
         if(m_collision.ground && !this.m_hasHitGround && !m_thrown)
         {
            m_xSpeed = Utils.random() > 0.5?Number(2):Number(-2);
            this.m_hasHitGround = true;
         }
         m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y - m_height);
         m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y - m_height);
         if(m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
         {
            destroy();
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
            if(m_collision.ground && m_thrown && m_xSpeed == 0)
            {
               destroy();
            }
            else if(m_collision.ground && !m_pickedUp && !m_thrown)
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
