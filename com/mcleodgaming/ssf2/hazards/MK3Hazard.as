package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.MK3PSwitch;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class MK3Hazard extends StageHazard
   {
       
      
      public function MK3Hazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Point = null;
         if(!STAGEDATA.hasEnemy(MK3PSwitch))
         {
            _loc1_ = [new Point(566,180),new Point(-214,180)];
            _loc2_ = _loc1_[Utils.randomInteger(0,_loc1_.length - 1)];
            STAGEDATA.spawnEnemy(MK3PSwitch,_loc2_.x,_loc2_.y);
         }
      }
   }
}
