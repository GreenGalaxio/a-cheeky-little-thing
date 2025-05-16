package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.Phase8_LavaWaterfall;
   import com.mcleodgaming.ssf2.enemies.Phase8_RisingLava;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Phase8Hazard extends StageHazard
   {
       
      
      private var m_startTimer:FrameTimer;
      
      private var m_delayTimer:FrameTimer;
      
      public function Phase8Hazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_startTimer = new FrameTimer(30 * 12);
         this.m_delayTimer = new FrameTimer(30 * 24);
         this.m_delayTimer.finish();
      }
      
      override protected function runHazard() : void
      {
         if(this.m_delayTimer.IsComplete)
         {
            this.m_startTimer.tick();
            if(this.m_startTimer.IsComplete)
            {
               STAGEDATA.CamRef.shake(8);
               if(Utils.random() > 0.75)
               {
                  STAGEDATA.spawnEnemy(Phase8_RisingLava,265,STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height);
               }
               else
               {
                  STAGEDATA.spawnEnemy(Phase8_LavaWaterfall,179,-945);
               }
               this.m_startTimer.reset();
               this.m_delayTimer.reset();
            }
         }
         else
         {
            this.m_delayTimer.tick();
         }
      }
   }
}
