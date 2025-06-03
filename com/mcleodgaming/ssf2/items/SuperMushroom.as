package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class SuperMushroom extends Item
   {
       
      
      private var m_hasHitGround:Boolean;
      
      public function SuperMushroom(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_hasHitGround = false;
         m_itemStats.SlideDecay = 1;
         m_bounce_remaining = 0;
      }
      
      private function customBehavior() : void
      {
         if(m_collision.ground && !this.m_hasHitGround)
         {
            m_xSpeed = 4;
            this.m_hasHitGround = true;
         }
         if(this.m_hasHitGround)
         {
            m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y - m_height);
            m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y - m_height);
            if(m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
            {
               m_xSpeed = m_xSpeed * -1;
            }
         }
         else
         {
            m_xSpeed = 0;
         }
      }
      
      override public function consumeAction() : void
      {
         if(STAGEDATA.getPlayer(m_player_id).UsingFinalSmash || STAGEDATA.getPlayer(m_player_id).TransformedSpecial)
         {
            return;
         }
         var _loc1_:int = STAGEDATA.getPlayer(m_player_id).SizeStatus;
         STAGEDATA.getPlayer(m_player_id).setSizeStatus(1);
         if(_loc1_ != STAGEDATA.getPlayer(m_player_id).SizeStatus)
         {
            STAGEDATA.playSpecificSound("mushroom_grow");
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_pickedUp && !m_dead)
         {
            checkTimers();
            this.customBehavior();
            m_groundCollisionTest();
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
