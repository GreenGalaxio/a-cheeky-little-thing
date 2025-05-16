package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class CentralHighwayRightPlatform extends MovingPlatform
   {
       
      
      private var m_action:int;
      
      private var m_fadeTimer:FrameTimer;
      
      private var m_nextActionTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      public function CentralHighwayRightPlatform(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_action = -1;
         this.m_nextActionTimer = new FrameTimer(30 * 25);
         this.m_fadeTimer = new FrameTimer(20);
         fallthrough = true;
         this.m_blinkToggle = true;
         setAlpha(0);
      }
      
      public function activate() : void
      {
         this.m_action = 0;
      }
      
      override protected function move() : void
      {
         Utils.advanceFrame(STAGEDATA.StageRef.plat2);
         Utils.recursiveMovieClipPlay(STAGEDATA.StageRef.plat2,true);
         storeOldLocation();
         if(this.m_action != -1)
         {
            if(this.m_action == 0)
            {
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.m_nextActionTimer.reset();
                  this.m_nextActionTimer.MaxTime = 30 * 55;
                  this.m_action = 1;
                  STAGEDATA.StageRef.plat2.gotoAndStop("intro");
                  STAGEDATA.StageRef.plat2.visible = true;
               }
            }
            else if(this.m_action == 1)
            {
               this.m_fadeTimer.tick();
               if(this.m_fadeTimer.IsComplete)
               {
                  this.m_fadeTimer.reset();
                  this.m_action = 2;
                  fallthrough = false;
               }
            }
            else if(this.m_action == 2)
            {
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.m_nextActionTimer.reset();
                  this.m_nextActionTimer.MaxTime = 30 * 25;
                  this.m_action = 4;
                  this.m_fadeTimer.MaxTime = 30 * 3;
               }
            }
            else if(this.m_action == 3)
            {
               STAGEDATA.StageRef.plat2.alpha = !!this.m_blinkToggle?0.8:0;
               setAlpha(!!this.m_blinkToggle?Number(0.8):Number(0));
               this.m_blinkToggle = !this.m_blinkToggle;
               this.m_fadeTimer.tick();
               if(this.m_fadeTimer.IsComplete)
               {
                  this.m_fadeTimer.reset();
                  this.m_action = -1;
                  fallthrough = true;
                  setAlpha(0);
                  STAGEDATA.StageRef.plat2.alpha = 0;
               }
            }
            else if(this.m_action == 4)
            {
               STAGEDATA.StageRef.plat2.y = STAGEDATA.StageRef.plat2.y + 3;
               m_platform.y = m_platform.y + 3;
               if(m_platform.y > STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height)
               {
                  fallthrough = true;
                  this.m_action = -1;
               }
            }
         }
         super.move();
      }
   }
}
