package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.items.ItemsListData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class MrSaturnHazard extends StageHazard
   {
       
      
      private var m_ready:Boolean;
      
      private var m_readyTimer:FrameTimer;
      
      private var m_toggle:Boolean;
      
      private const DOOR_XLOC1:Number = 340.15;
      
      private const DOOR_YLOC1:Number = 136.05;
      
      private const SATURN_XLOC1:Number = 113;
      
      private const SATURN_YLOC1:Number = 95;
      
      private const DOOR_XLOC2:Number = 785.15;
      
      private const DOOR_YLOC2:Number = 222;
      
      private const SATURN_XLOC2:Number = 558;
      
      private const SATURN_YLOC2:Number = 182;
      
      public function MrSaturnHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_ready = false;
         this.m_readyTimer = new FrameTimer(31);
         this.m_toggle = false;
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:MovieClip = null;
         if(STAGEDATA.ItemsRef.CanMakeItem && false)
         {
            if(Utils.random() > 0.5)
            {
            }
            this.m_ready = true;
            this.m_readyTimer.reset();
            _loc1_ = STAGEDATA.StageParentRef.background.getChildByName(STAGEDATA.attachUniqueMovieBG("saturn_door"));
            if(_loc1_ != null)
            {
               _loc1_.x = !!this.m_toggle?Number(this.DOOR_XLOC1):Number(this.DOOR_XLOC2);
               _loc1_.y = !!this.m_toggle?Number(this.DOOR_YLOC1):Number(this.DOOR_YLOC2);
            }
         }
      }
      
      override protected function excess() : void
      {
         var _loc1_:ItemData = null;
         if(this.m_ready)
         {
            this.m_readyTimer.tick();
            if(this.m_readyTimer.IsComplete)
            {
               this.m_ready = false;
               _loc1_ = new ItemData();
               _loc1_.importItemData(ItemsListData.getItemByID("mrsaturn"));
               STAGEDATA.ItemsRef.generateItemObj(_loc1_,!!this.m_toggle?Number(this.SATURN_XLOC1):Number(this.SATURN_XLOC2),!!this.m_toggle?Number(this.SATURN_YLOC1):Number(this.SATURN_YLOC2));
            }
         }
      }
   }
}
