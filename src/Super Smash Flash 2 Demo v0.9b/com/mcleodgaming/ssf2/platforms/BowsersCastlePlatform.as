package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class BowsersCastlePlatform extends MovingPlatform
   {
       
      
      private var SINK_SPEED:Number = 30;
      
      private var RISE_SPEED:Number = 1;
      
      private var m_action:int;
      
      private var m_shakeToggle:Boolean;
      
      private var m_waitTimer:FrameTimer;
      
      public function BowsersCastlePlatform(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_action = 0;
         this.m_waitTimer = new FrameTimer(30 * 13);
         this.m_shakeToggle = false;
         findLedges();
      }
      
      public function sink() : void
      {
         if(this.m_action == 0)
         {
            this.m_action = 1;
         }
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               m_platform.x = m_platform.x + (!!this.m_shakeToggle?1:-1);
               this.m_shakeToggle = !this.m_shakeToggle;
               if(m_platform.y < 300)
               {
                  m_platform.y = m_platform.y + this.SINK_SPEED;
               }
               else
               {
                  this.m_action = 2;
                  m_platform.y = 300;
                  m_platform.x = m_x_start;
               }
            }
            else if(this.m_action == 2)
            {
               this.m_waitTimer.tick();
               if(this.m_waitTimer.IsComplete)
               {
                  this.m_waitTimer.reset();
                  this.m_action = 3;
               }
            }
            else if(this.m_action == 3)
            {
               if(m_platform.y > 155)
               {
                  m_platform.y = m_platform.y - this.RISE_SPEED;
               }
               else
               {
                  m_platform.y = 155;
                  this.m_action = 0;
               }
            }
         }
         super.move();
      }
   }
}
