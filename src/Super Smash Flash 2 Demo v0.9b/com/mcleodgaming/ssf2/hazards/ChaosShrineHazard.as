package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class ChaosShrineHazard extends StageHazard
   {
       
      
      protected var m_spiritTimer:FrameTimer;
      
      public function ChaosShrineHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_spiritTimer = new FrameTimer(30 * 15);
         m_safe = true;
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:int = 0;
         this.m_spiritTimer.tick();
         if(this.m_spiritTimer.IsComplete)
         {
            this.m_spiritTimer.reset();
            _loc1_ = Utils.randomInteger(1,4);
            if(STAGEDATA.StageBG.getChildByName("spirit" + _loc1_) != null && !STAGEDATA.StageBG.getChildByName("spirit" + _loc1_).visible)
            {
               MovieClip(STAGEDATA.StageBG.getChildByName("spirit" + _loc1_)).gotoAndPlay("show");
            }
         }
      }
   }
}
