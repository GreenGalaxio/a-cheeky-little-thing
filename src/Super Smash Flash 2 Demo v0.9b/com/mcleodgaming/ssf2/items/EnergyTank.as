package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   
   public class EnergyTank extends Item
   {
       
      
      private var m_done:Boolean;
      
      public function EnergyTank(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_done = false;
      }
      
      override public function consumeAction() : void
      {
         if(!this.m_done && m_pickedUp)
         {
            this.m_done = true;
            STAGEDATA.getPlayer(m_player_id).m_useItem();
            STAGEDATA.playSpecificSound("etank_beep");
         }
      }
      
      private function customBehavior() : void
      {
         if(this.m_done)
         {
            if(m_pickedUp && !STAGEDATA.getPlayer(m_player_id).inState(CState.ATTACKING))
            {
               destroy();
               STAGEDATA.getPlayer(m_player_id).checkItemDeath();
            }
            else if(m_pickedUp)
            {
               STAGEDATA.getPlayer(m_player_id).recover(1);
            }
            else
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
            m_checkDeathBounds();
            m_checkDead();
         }
         else if(!m_pickedUp && !m_dead)
         {
            checkTimers();
            this.customBehavior();
            m_pushAwayItems();
            m_itemAttack();
            m_groundCollisionTest();
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
