package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   
   public class PikminLeaf extends MovingPlatform
   {
       
      
      private var m_opponents:Vector.<Number>;
      
      private var m_level:int;
      
      public function PikminLeaf(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_opponents = new Vector.<Number>();
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < STAGEDATA.PlayerList.length)
         {
            this.m_opponents.push(STAGEDATA.PlayerList[_loc3_]);
            _loc3_++;
         }
         this.m_level = 0;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         if(m_foregroundPiece != null)
         {
            this.checkWeight();
         }
         super.move();
      }
      
      private function checkWeight() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         _loc1_ = 0;
         while(_loc1_ < this.m_opponents.length)
         {
            if(STAGEDATA.getPlayer(this.m_opponents[_loc1_]) != null && !STAGEDATA.getPlayer(this.m_opponents[_loc1_]).Dead && !STAGEDATA.getPlayer(this.m_opponents[_loc1_]).StandBy && STAGEDATA.getPlayer(this.m_opponents[_loc1_]).CurrentPlatform == this)
            {
               _loc2_ = _loc2_ + 1;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < STAGEDATA.Enemies.length)
         {
            if(STAGEDATA.Enemies[_loc1_] != null && STAGEDATA.Enemies[_loc1_].CurrentPlatform == this)
            {
               _loc2_ = _loc2_ + 0.5;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < STAGEDATA.ItemsRef.MAXITEMS)
         {
            if(STAGEDATA.ItemsRef.ItemsInUse[_loc1_] != null && !STAGEDATA.ItemsRef.ItemsInUse[_loc1_].PickedUp && STAGEDATA.ItemsRef.ItemsInUse[_loc1_].CurrentPlatform == this)
            {
               _loc2_ = _loc2_ + 0.5;
            }
            _loc1_++;
         }
         if(_loc2_ > 0)
         {
            _loc3_ = 25;
            if(this.m_level == 0 && m_y_start + _loc3_ + 1 * _loc2_ - m_platform.y < 0.25)
            {
               this.m_level = 1;
            }
            if(this.m_level == 1)
            {
               _loc3_ = _loc3_ * 2;
            }
            m_platform.y = m_platform.y + (m_y_start + _loc3_ + 3 * _loc2_ - m_platform.y) / 5;
         }
         else
         {
            this.m_level = 0;
            m_platform.y = m_platform.y + (m_y_start - m_platform.y) / 8;
         }
      }
   }
}
