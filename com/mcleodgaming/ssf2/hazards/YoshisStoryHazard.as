package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.FlyGuy;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class YoshisStoryHazard extends StageHazard
   {
       
      
      private var m_spawnTimer:FrameTimer;
      
      private var m_spawnLocation:Point;
      
      private var m_spawnCount:int;
      
      private var m_vertical:Boolean;
      
      public function YoshisStoryHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_spawnTimer = new FrameTimer(15);
         this.m_spawnCount = 0;
         this.m_spawnLocation = new Point();
         this.m_vertical = false;
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:int = 0;
         this.m_spawnCount = Utils.randomInteger(1,6);
         this.m_spawnLocation.x = -387;
         this.m_spawnLocation.y = Utils.randomInteger(-76,45);
         this.m_vertical = this.m_spawnCount <= 3;
         if(this.m_vertical)
         {
            _loc1_ = 0;
            while(_loc1_ < this.m_spawnCount)
            {
               STAGEDATA.spawnEnemy(FlyGuy,this.m_spawnLocation.x,this.m_spawnLocation.y - 40 * _loc1_);
               _loc1_++;
            }
            this.m_spawnCount = 0;
         }
      }
      
      override protected function excess() : void
      {
         if(this.m_spawnCount > 0)
         {
            this.m_spawnTimer.tick();
            if(this.m_spawnTimer.IsComplete)
            {
               this.m_spawnCount--;
               this.m_spawnTimer.reset();
               STAGEDATA.spawnEnemy(FlyGuy,this.m_spawnLocation.x,this.m_spawnLocation.y);
            }
         }
      }
   }
}
