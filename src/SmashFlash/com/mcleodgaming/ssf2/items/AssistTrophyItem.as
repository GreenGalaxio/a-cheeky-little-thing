package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class AssistTrophyItem extends Item
   {
       
      
      private var m_assistClass:Class;
      
      private var m_done:Boolean;
      
      public function AssistTrophyItem(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_done = false;
         STAGEDATA.AssistCount++;
         this.m_assistClass = STAGEDATA.getRandomAssist();
      }
      
      public function get AssistClass() : Class
      {
         return this.m_assistClass;
      }
      
      public function set AssistClass(param1:Class) : void
      {
         this.m_assistClass = param1;
      }
      
      override public function consumeAction() : void
      {
         if(!this.m_done && m_pickedUp)
         {
            this.m_done = true;
            STAGEDATA.getPlayer(m_player_id).MC.x;
            STAGEDATA.getPlayer(m_player_id).m_useItem();
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
         if(m_collision.ground && !m_collision.leftSide && !m_collision.rightSide)
         {
            attachToGround();
         }
         if(m_collision.ground && !m_pickedUp && !m_thrown)
         {
            m_xSpeed = 0;
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
               STAGEDATA.AssistCount--;
            }
         }
         if(m_itemStats.RemoveAfterUse && m_uses >= m_itemStats.UsesMax && !m_dead)
         {
            if(!m_itemStats.RemoveWhileHolding && !m_pickedUp && m_collision.ground)
            {
               destroy();
            }
            else if(m_itemStats.RemoveWhileHolding && m_pickedUp && !STAGEDATA.getPlayer(m_player_id).AttackStateData.IsAttacking)
            {
               destroy();
            }
         }
         if(!m_dead && getVar("finished",true))
         {
            destroy();
         }
      }
      
      override protected function m_checkDeathBounds() : void
      {
         var _loc1_:Boolean = m_dead;
         super.m_checkDeathBounds();
         if(!_loc1_ && m_dead)
         {
            STAGEDATA.AssistCount--;
         }
      }
      
      private function customBehavior() : void
      {
         if(this.m_done)
         {
            if(m_pickedUp && !STAGEDATA.getPlayer(m_player_id).AttackStateData.IsAttacking)
            {
               destroy();
               STAGEDATA.getPlayer(m_player_id).checkItemDeath();
            }
            else if(!m_pickedUp)
            {
               destroy();
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         m_reactivationDelay.tick();
         if(m_pickedUp && !m_dead)
         {
            checkTimers();
            this.customBehavior();
            m_itemAttack();
            this.m_checkDeathBounds();
            this.m_checkDead();
         }
         else if(!m_pickedUp && !m_dead)
         {
            checkTimers();
            this.customBehavior();
            m_pushAwayItems();
            m_itemAttack();
            this.m_groundCollisionTest();
            m_checkBounce();
            m_checkReverse();
            m_itemFall();
            m_itemMove();
            checkRichochetTimer();
            this.m_checkDeathBounds();
            this.m_checkDead();
         }
      }
   }
}
