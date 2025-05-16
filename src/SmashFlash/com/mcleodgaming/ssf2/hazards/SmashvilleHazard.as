package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.SmashvilleBalloon;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class SmashvilleHazard extends StageHazard
   {
       
      
      public function SmashvilleHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         m_safe = true;
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:SmashvilleBalloon = null;
         if(Utils.random() > 0.7)
         {
            _loc1_ = Utils.random() > 0.5;
            _loc2_ = SmashvilleBalloon(STAGEDATA.spawnEnemy(SmashvilleBalloon,!!_loc1_?Number(STAGEDATA.DeathBounds.x + 10):Number(STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width - 10),-88));
            if(!_loc1_)
            {
               _loc2_.faceLeft();
            }
         }
      }
   }
}
