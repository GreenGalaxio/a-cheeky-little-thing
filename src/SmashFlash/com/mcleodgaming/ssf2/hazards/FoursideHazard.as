package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.platforms.FoursideSpaceship;
   
   public class FoursideHazard extends StageHazard
   {
       
      
      public function FoursideHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < STAGEDATA.MovingPlatforms.length)
         {
            if(STAGEDATA.MovingPlatforms[_loc1_] is FoursideSpaceship)
            {
               FoursideSpaceship(STAGEDATA.MovingPlatforms[_loc1_]).activate();
               break;
            }
            _loc1_++;
         }
         m_interval.MaxTime = 30 * 80;
      }
   }
}
