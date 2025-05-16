package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class StageHazard
   {
       
      
      protected var STAGEDATA:StageData;
      
      protected var m_interval:FrameTimer;
      
      protected var m_active:Boolean;
      
      protected var m_runCount:int;
      
      protected var m_delayStart:Boolean;
      
      protected var m_safe:Boolean;
      
      public function StageHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super();
         this.m_interval = new FrameTimer(param1);
         this.STAGEDATA = param2;
         this.m_active = true;
         this.m_runCount = param3;
         this.m_delayStart = true;
         this.m_safe = false;
      }
      
      public function get Safe() : Boolean
      {
         return this.m_safe;
      }
      
      public function get Active() : Boolean
      {
         return this.m_active;
      }
      
      public function set Active(param1:Boolean) : void
      {
         this.m_active = param1;
      }
      
      public function get DelayStart() : Boolean
      {
         return this.m_delayStart;
      }
      
      public function set DelayStart(param1:Boolean) : void
      {
         this.m_delayStart = param1;
      }
      
      public function get RunCount() : int
      {
         return this.m_runCount;
      }
      
      public function set RunCount(param1:int) : void
      {
         this.m_runCount = param1;
      }
      
      protected function runHazard() : void
      {
         trace("Empty stage hazard triggered");
      }
      
      protected function excess() : void
      {
      }
      
      public function PERFORMALL() : void
      {
         if(!this.STAGEDATA.Paused && (!this.STAGEDATA.StageEvent || this.STAGEDATA.StageEvent && !this.m_delayStart))
         {
            this.excess();
            this.m_interval.tick();
            if(this.m_interval.IsComplete && this.m_runCount != 0 && this.m_active)
            {
               this.runHazard();
               this.m_interval.reset();
               this.m_runCount--;
            }
         }
      }
      
      public function PREPERFORM() : void
      {
      }
      
      public function POSTPERFORM() : void
      {
      }
   }
}
