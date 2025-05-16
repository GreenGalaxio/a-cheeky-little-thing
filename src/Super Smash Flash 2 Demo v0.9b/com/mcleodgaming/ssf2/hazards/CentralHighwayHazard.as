package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.platforms.CentralHighwayLeftPillar;
   import com.mcleodgaming.ssf2.platforms.CentralHighwayLeftPlatform;
   import com.mcleodgaming.ssf2.platforms.CentralHighwayRightPillar;
   import com.mcleodgaming.ssf2.platforms.CentralHighwayRightPlatform;
   import com.mcleodgaming.ssf2.platforms.Platform;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class CentralHighwayHazard extends StageHazard
   {
       
      
      private var m_action:int;
      
      private var m_nextActionTimer:FrameTimer;
      
      private var m_nextTransitionTimer:FrameTimer;
      
      public function CentralHighwayHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_nextActionTimer = new FrameTimer(30 * 20);
         this.m_action = 0;
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Vector.<Platform> = STAGEDATA.Terrains;
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            if(_loc2_[_loc1_] is CentralHighwayLeftPillar)
            {
               CentralHighwayLeftPillar(_loc2_[_loc1_]).activate();
            }
            if(_loc2_[_loc1_] is CentralHighwayRightPillar)
            {
               CentralHighwayRightPillar(_loc2_[_loc1_]).activate();
            }
            _loc1_++;
         }
         var _loc3_:Vector.<Platform> = STAGEDATA.Platforms;
         _loc1_ = 0;
         while(_loc1_ < _loc3_.length)
         {
            if(_loc3_[_loc1_] is CentralHighwayLeftPlatform)
            {
               CentralHighwayLeftPlatform(_loc3_[_loc1_]).activate();
            }
            if(_loc3_[_loc1_] is CentralHighwayRightPlatform)
            {
               CentralHighwayRightPlatform(_loc3_[_loc1_]).activate();
            }
            _loc1_++;
         }
      }
   }
}
