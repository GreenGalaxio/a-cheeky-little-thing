package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class FoursideSpaceship extends MovingPlatform
   {
       
      
      private var m_action:int;
      
      private var m_waitTimer:FrameTimer;
      
      private var m_idleTimer:FrameTimer;
      
      public function FoursideSpaceship(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_action = 0;
         this.m_waitTimer = new FrameTimer(30 * 25);
         this.m_idleTimer = new FrameTimer(30 * 12);
         m_platform.visible = false;
      }
      
      public function activate() : void
      {
         this.m_action = 1;
         m_platform.visible = true;
         fallthrough = false;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               if(m_platform.y < -200)
               {
                  m_platform.y++;
               }
               else
               {
                  this.m_action = 2;
               }
            }
            else if(this.m_action == 2)
            {
               this.m_idleTimer.tick();
               if(this.m_idleTimer.IsComplete)
               {
                  this.m_idleTimer.reset();
                  this.m_action = 3;
               }
            }
            else if(this.m_action == 3)
            {
               if(m_platform.y > STAGEDATA.DeathBounds.y - 15)
               {
                  m_platform.y--;
               }
               else
               {
                  this.m_action = 0;
                  m_platform.visible = false;
                  fallthrough = true;
               }
            }
         }
         super.move();
      }
   }
}
