package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class TOSPlatform extends MovingPlatform
   {
       
      
      private var m_moveTimer:FrameTimer;
      
      private var m_waitTimer:FrameTimer;
      
      private var m_goingUp:Boolean;
      
      private var m_wait:Boolean;
      
      public function TOSPlatform(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_moveTimer = new FrameTimer(90);
         this.m_waitTimer = new FrameTimer(90);
         this.m_goingUp = true;
         this.m_wait = false;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         if(!this.m_wait)
         {
            this.m_moveTimer.tick();
            m_platform.y = m_platform.y + (!!this.m_goingUp?-0.5:0.5);
            if(this.m_moveTimer.IsComplete)
            {
               this.m_moveTimer.reset();
               this.m_wait = true;
            }
         }
         else
         {
            this.m_waitTimer.tick();
            if(this.m_waitTimer.IsComplete)
            {
               this.m_waitTimer.reset();
               this.m_goingUp = !this.m_goingUp;
               this.m_wait = false;
            }
         }
         super.move();
      }
   }
}
