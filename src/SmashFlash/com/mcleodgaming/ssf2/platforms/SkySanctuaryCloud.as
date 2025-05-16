package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import flash.display.MovieClip;
   
   public class SkySanctuaryCloud extends MovingPlatform
   {
       
      
      private var m_opponents:Vector.<Number>;
      
      public function SkySanctuaryCloud(param1:MovieClip, param2:StageData)
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
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.m_opponents.length)
         {
            if(STAGEDATA.getPlayer(this.m_opponents[_loc1_]) != null && STAGEDATA.getPlayer(this.m_opponents[_loc1_]).CollisionObj.ground && STAGEDATA.getPlayer(this.m_opponents[_loc1_]).CurrentPlatform == this)
            {
               STAGEDATA.getPlayer(this.m_opponents[_loc1_]).unnattachFromGround();
               STAGEDATA.getPlayer(this.m_opponents[_loc1_]).YSpeed = -18;
               if(STAGEDATA.getPlayer(this.m_opponents[_loc1_]).Grabbed.length > 0)
               {
                  STAGEDATA.getPlayer(this.m_opponents[_loc1_]).setState(CState.JUMP_RISING);
                  STAGEDATA.getPlayer(this.m_opponents[_loc1_]).releaseOpponent();
               }
               STAGEDATA.playSpecificSound("cloud_bounce");
            }
            _loc1_++;
         }
         super.move();
      }
   }
}
