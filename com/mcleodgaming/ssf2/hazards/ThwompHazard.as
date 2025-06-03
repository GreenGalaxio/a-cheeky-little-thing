package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.Thwomp;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class ThwompHazard extends StageHazard
   {
       
      
      private var m_action:int;
      
      private var m_spawnTimer:FrameTimer;
      
      private var m_spawnDelayTimer:FrameTimer;
      
      private var m_waitTimer:FrameTimer;
      
      public function ThwompHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_spawnTimer = new FrameTimer(30 * 10);
         this.m_spawnDelayTimer = new FrameTimer(30);
         this.m_waitTimer = new FrameTimer(30 * 10);
         this.m_action = 0;
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:Array = null;
         if(this.m_action == 0)
         {
            this.m_spawnTimer.tick();
            if(this.m_spawnTimer.IsComplete)
            {
               this.m_action = 1;
               this.m_spawnTimer.reset();
            }
         }
         else if(this.m_action == 1)
         {
            this.m_action = 2;
            _loc1_ = [-93,21,122,405,505];
            STAGEDATA.spawnEnemy(Thwomp,_loc1_[Utils.randomInteger(0,_loc1_.length - 1)],STAGEDATA.DeathBounds.y);
         }
         else if(this.m_action == 2)
         {
            this.m_waitTimer.tick();
            if(this.m_waitTimer.IsComplete)
            {
               this.m_waitTimer.reset();
               this.m_action = 0;
            }
         }
      }
   }
}
