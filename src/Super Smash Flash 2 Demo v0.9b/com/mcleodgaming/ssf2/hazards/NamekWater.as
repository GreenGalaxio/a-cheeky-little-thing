package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   
   public class NamekWater extends StageHazard
   {
       
      
      private var m_underWaterList:Vector.<Character>;
      
      public function NamekWater(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_underWaterList = new Vector.<Character>();
         m_safe = true;
      }
      
      override protected function runHazard() : void
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         var _loc1_:int = 0;
         while(_loc1_ < STAGEDATA.PlayerList.length)
         {
            _loc2_ = STAGEDATA.PlayerList[_loc1_];
            _loc3_ = null;
            if(STAGEDATA.getPlayer(_loc2_) != null && !STAGEDATA.getPlayer(_loc2_).Dead && !STAGEDATA.getPlayer(_loc2_).StandBy && !STAGEDATA.getPlayer(_loc2_).IsCaught)
            {
               _loc4_ = this.isHittingWater(STAGEDATA.getPlayer(_loc2_));
               if(this.m_underWaterList.indexOf(STAGEDATA.getPlayer(_loc2_)) >= 0 && _loc4_ == null)
               {
                  this.m_underWaterList.splice(this.m_underWaterList.indexOf(STAGEDATA.getPlayer(_loc2_)),1);
                  _loc3_ = STAGEDATA.attachEffect("namek_splash");
                  _loc3_.x = STAGEDATA.getPlayer(_loc2_).X;
                  _loc3_.y = STAGEDATA.getPlayer(_loc2_).UnderWater.y;
                  STAGEDATA.getPlayer(_loc2_).UnderWater = null;
               }
               else if(this.m_underWaterList.indexOf(STAGEDATA.getPlayer(_loc2_)) < 0 && _loc4_ != null)
               {
                  this.m_underWaterList.push(STAGEDATA.getPlayer(_loc2_));
                  STAGEDATA.getPlayer(_loc2_).UnderWater = _loc4_;
                  _loc3_ = STAGEDATA.attachEffect("namek_splash");
                  _loc3_.x = STAGEDATA.getPlayer(_loc2_).X;
                  _loc3_.y = STAGEDATA.getPlayer(_loc2_).UnderWater.y;
               }
            }
            _loc1_++;
         }
      }
      
      private function isHittingWater(param1:Character) : MovieClip
      {
         if(STAGEDATA.StageRef.getChildByName("water1") != null)
         {
            if(STAGEDATA.StageRef.getChildByName("water1").hitTestPoint(param1.GlobalX,param1.GlobalY))
            {
               return MovieClip(STAGEDATA.StageRef.getChildByName("water1"));
            }
         }
         if(STAGEDATA.StageRef.getChildByName("water2") != null)
         {
            if(STAGEDATA.StageRef.getChildByName("water2").hitTestPoint(param1.GlobalX,param1.GlobalY))
            {
               return MovieClip(STAGEDATA.StageRef.getChildByName("water2"));
            }
         }
         return null;
      }
   }
}
