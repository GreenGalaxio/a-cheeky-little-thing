package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.BonzaiBill;
   import com.mcleodgaming.ssf2.enemies.PeachsCastleSwitch;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class PeachsCastleHazard extends StageHazard
   {
       
      
      public function PeachsCastleHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
      }
      
      override protected function runHazard() : void
      {
         var _loc4_:PeachsCastleSwitch = null;
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:Point = null;
         if(!STAGEDATA.hasEnemy(PeachsCastleSwitch) && Utils.random() > 0.5)
         {
            _loc2_ = [new Point(181,-54),new Point(236,-134),new Point(288,-53)];
            _loc3_ = _loc2_[Utils.randomInteger(0,_loc2_.length - 1)];
            _loc4_ = PeachsCastleSwitch(STAGEDATA.spawnEnemy(PeachsCastleSwitch,_loc3_.x,_loc3_.y));
         }
         else if(!STAGEDATA.hasEnemy(BonzaiBill))
         {
            _loc2_ = [new Point(-353,-212),new Point(98,-450),new Point(393,-450),new Point(865,-288)];
            _loc3_ = _loc2_[Utils.randomInteger(0,_loc2_.length - 1)];
            STAGEDATA.spawnEnemy(BonzaiBill,_loc3_.x,_loc3_.y);
         }
      }
   }
}
