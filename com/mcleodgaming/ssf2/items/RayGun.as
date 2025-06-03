package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class RayGun extends Item
   {
       
      
      public function RayGun(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
      }
      
      private function customBehavior() : void
      {
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:Boolean = m_collision.ground;
         var _loc2_:Boolean = m_thrown;
         var _loc3_:Boolean = m_ySpeed > 0;
         super.m_groundCollisionTest();
         if(!_loc2_ && !_loc1_ && (m_collision.ground || m_ySpeed < 0 && _loc3_))
         {
            STAGEDATA.playSpecificSound(m_landSound);
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(m_pickedUp && !m_dead)
         {
            checkTimers();
            m_itemAttack();
            this.customBehavior();
            m_checkDeathBounds();
            m_checkDead();
         }
         else if(!m_pickedUp && !m_dead)
         {
            checkTimers();
            m_pushAwayItems();
            m_itemAttack();
            this.customBehavior();
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
