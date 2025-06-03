package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.GHZCheckpoint;
   import com.mcleodgaming.ssf2.enemies.GHZChunk;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class GreenHillZoneHazard extends StageHazard
   {
       
      
      private var m_checkpointTimer:FrameTimer;
      
      public function GreenHillZoneHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_checkpointTimer = new FrameTimer(Utils.randomInteger(30 * 20,30 * 40));
         var _loc4_:GHZChunk = null;
         if(STAGEDATA.HazardsOn)
         {
            _loc4_ = GHZChunk(STAGEDATA.spawnEnemy(GHZChunk,63.7,212.9));
            _loc4_.setType("leftChunk");
            _loc4_ = GHZChunk(STAGEDATA.spawnEnemy(GHZChunk,126.3,213.2));
            _loc4_.setType("middleChunk");
            _loc4_ = GHZChunk(STAGEDATA.spawnEnemy(GHZChunk,189.2,210.55));
            _loc4_.setType("rightChunk");
         }
      }
      
      override protected function runHazard() : void
      {
         this.m_checkpointTimer.tick();
         if(this.m_checkpointTimer.IsComplete)
         {
            this.m_checkpointTimer.reset();
            if(!STAGEDATA.hasEnemy(GHZCheckpoint))
            {
               STAGEDATA.spawnEnemy(GHZCheckpoint,Utils.random() < 0.4?Number(Utils.randomInteger(-144,118)):Number(Utils.randomInteger(325,55)),14);
               this.m_checkpointTimer.MaxTime = Utils.randomInteger(30 * 30,30 * 60);
            }
         }
      }
   }
}
