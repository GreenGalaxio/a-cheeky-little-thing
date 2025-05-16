package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class ClockTownFairy extends Item
   {
       
      
      private var m_action:int;
      
      public function ClockTownFairy(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         m_gravity = 0;
         this.m_action = 0;
      }
      
      private function customBehavior() : void
      {
         if(this.m_action == 0)
         {
            m_xSpeed = !!m_facingForward?Number(4):Number(-4);
            if(m_facingForward && m_sprite.x > STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width + 50)
            {
               destroy();
            }
            else if(m_facingForward && m_sprite.x < STAGEDATA.DeathBounds.x - 50)
            {
               destroy();
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
            m_checkDead();
         }
         else if(!m_pickedUp && !m_dead)
         {
            checkTimers();
            this.customBehavior();
            m_pushAwayItems();
            m_itemAttack();
            m_checkReverse();
            m_itemFall();
            m_itemMove();
            checkRichochetTimer();
            m_checkDead();
         }
      }
   }
}
