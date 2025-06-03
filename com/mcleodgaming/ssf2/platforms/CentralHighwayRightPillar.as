package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class CentralHighwayRightPillar extends MovingPlatform
   {
       
      
      private var m_action:int;
      
      private var m_shakeToggle:Boolean;
      
      private var m_nextActionTimer:FrameTimer;
      
      public function CentralHighwayRightPillar(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_action = -1;
         this.m_shakeToggle = true;
         this.m_nextActionTimer = new FrameTimer(30 * 60);
      }
      
      public function activate() : void
      {
         this.m_action = 0;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         if(this.m_action != -1)
         {
            if(this.m_action == 0)
            {
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.m_nextActionTimer.reset();
                  this.m_action = 1;
                  this.m_nextActionTimer.MaxTime = 30 * 5;
                  STAGEDATA.CamRef.setStageFocus(30 * 15);
               }
            }
            else if(this.m_action == 1)
            {
               if(this.m_shakeToggle)
               {
                  m_platform.x = m_platform.x + 2;
               }
               else
               {
                  m_platform.x = m_platform.x - 2;
               }
               this.m_shakeToggle = !this.m_shakeToggle;
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.m_nextActionTimer.reset();
                  this.m_action = 2;
                  this.m_nextActionTimer.MaxTime = 30 * 10;
               }
            }
            else if(this.m_action == 2)
            {
               m_platform.y = m_platform.y + 2;
               if(this.m_shakeToggle)
               {
                  m_platform.x = m_platform.x + 2;
               }
               else
               {
                  m_platform.x = m_platform.x - 2;
               }
               this.m_shakeToggle = !this.m_shakeToggle;
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.m_nextActionTimer.reset();
                  this.m_action = -1;
                  this.m_nextActionTimer.MaxTime = 30 * 5;
                  fallthrough = true;
               }
            }
         }
         super.move();
      }
   }
}
