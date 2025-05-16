package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.SectorZLaser;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class SectorZHazard extends StageHazard
   {
       
      
      private var m_laserTimer:FrameTimer;
      
      private var m_arwingTimer:FrameTimer;
      
      public function SectorZHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_laserTimer = new FrameTimer(30 * 50);
         this.m_arwingTimer = new FrameTimer(30 * 45);
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:int = 0;
         this.m_laserTimer.tick();
         if(this.m_laserTimer.IsComplete)
         {
            this.m_laserTimer.reset();
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.Enemies.length)
            {
               if(STAGEDATA.Enemies[_loc1_] is SectorZLaser)
               {
                  SectorZLaser(STAGEDATA.Enemies[_loc1_]).activate();
                  break;
               }
               _loc1_++;
            }
         }
      }
   }
}
