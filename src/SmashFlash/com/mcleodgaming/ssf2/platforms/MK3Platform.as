package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   
   public class MK3Platform extends MovingPlatform
   {
       
      
      private var m_opponents:Vector.<Number>;
      
      private var m_action:int;
      
      public function MK3Platform(param1:MovieClip, param2:StageData)
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
         this.m_action = 0;
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
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < STAGEDATA.ItemsRef.MAXITEMS)
         {
            if(STAGEDATA.ItemsRef.ItemsInUse[_loc1_] != null && STAGEDATA.ItemsRef.ItemsInUse[_loc1_].CurrentPlatform == this)
            {
            }
            _loc1_++;
         }
         if(_loc2_ > 0)
         {
            if(this.m_action == 0)
            {
               m_platform.x = m_platform.x + 4;
               if(m_platform.x >= 262)
               {
                  m_platform.x = 262;
                  this.m_action = 1;
               }
            }
            else if(this.m_action == 1)
            {
               m_platform.x = m_platform.x - 4;
               if(m_platform.x <= -34)
               {
                  m_platform.x = -34;
                  this.m_action = 0;
               }
            }
         }
      }
   }
}
