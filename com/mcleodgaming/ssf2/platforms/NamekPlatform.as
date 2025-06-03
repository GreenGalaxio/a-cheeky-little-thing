package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   
   public class NamekPlatform extends MovingPlatform
   {
       
      
      private var m_opponents:Vector.<Number>;
      
      public function NamekPlatform(param1:MovieClip, param2:StageData)
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
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
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
            if(STAGEDATA.ItemsRef.ItemsInUse[_loc1_] != null && STAGEDATA.ItemsRef.ItemsInUse[_loc1_].CurrentPlatform == this)
            {
               _loc2_ = _loc2_ + 0.5;
            }
            _loc1_++;
         }
         if(_loc2_ > 0)
         {
            if(_loc2_ == 1)
            {
               m_platform.y = m_platform.y + (m_y_start + 25 + 1 * _loc2_ - m_platform.y) / 3;
            }
            else
            {
               m_platform.y = m_platform.y + (m_y_start + 25 + 5 * _loc2_ - m_platform.y) / 3;
            }
         }
         else
         {
            m_platform.y = m_platform.y + (m_y_start - m_platform.y) / 8;
         }
      }
   }
}
