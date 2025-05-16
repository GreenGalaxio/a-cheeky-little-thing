package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class GangplankBoat extends MovingPlatform
   {
       
      
      private var DIP_DISTANCE:int = 10;
      
      private var m_action:int;
      
      private var m_dipTimer:FrameTimer;
      
      public function GangplankBoat(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_action = 0;
         this.m_dipTimer = new FrameTimer(10);
      }
      
      public function dip() : void
      {
         this.m_action = 1;
         this.m_dipTimer.reset();
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               this.m_dipTimer.tick();
               m_platform.y = m_y_start + this.DIP_DISTANCE * Math.sin(Utils.toRadians(180 * (this.m_dipTimer.CurrentTime / this.m_dipTimer.MaxTime)));
               if(this.m_dipTimer.IsComplete)
               {
                  this.m_dipTimer.reset();
                  this.m_action = 0;
               }
            }
         }
         super.move();
      }
   }
}
