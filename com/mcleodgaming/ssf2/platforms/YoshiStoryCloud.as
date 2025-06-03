package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class YoshiStoryCloud extends MovingPlatform
   {
       
      
      private var m_opponents:Vector.<Number>;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_fallTimer:FrameTimer;
      
      private var m_regenerateTimer:FrameTimer;
      
      private var m_action:int;
      
      private var m_fadeTimer:FrameTimer;
      
      public function YoshiStoryCloud(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_opponents = new Vector.<Number>();
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < STAGEDATA.PlayerList.length)
         {
            this.m_opponents.push(STAGEDATA.PlayerList[_loc3_]);
            _loc3_++;
         }
         this.m_fallTimer = new FrameTimer(30 * 3);
         this.m_fadeTimer = new FrameTimer(8);
         this.m_regenerateTimer = new FrameTimer(30 * 5);
         this.m_blinkTimer = new FrameTimer(30 * 3);
         this.m_blinkToggle = false;
         this.m_action = 0;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         var _loc1_:Number = 0;
         var _loc2_:Boolean = false;
         if(this.m_action == 0)
         {
            _loc1_ = 0;
            while(_loc1_ < this.m_opponents.length)
            {
               if(STAGEDATA.getPlayer(this.m_opponents[_loc1_]) != null && STAGEDATA.getPlayer(this.m_opponents[_loc1_]).CollisionObj.ground && STAGEDATA.getPlayer(this.m_opponents[_loc1_]).OnPlatform && STAGEDATA.getPlayer(this.m_opponents[_loc1_]).CurrentPlatform == this)
               {
                  _loc2_ = true;
                  break;
               }
               _loc1_++;
            }
            if(!_loc2_)
            {
               this.m_fallTimer.reset();
            }
            else
            {
               this.m_fallTimer.tick();
               if(this.m_fallTimer.IsComplete)
               {
                  this.m_fallTimer.reset();
                  this.m_regenerateTimer.reset();
                  this.m_action = 1;
                  fallthrough = true;
                  this.m_fadeTimer.reset();
               }
            }
         }
         else if(this.m_action == 1)
         {
            this.m_fadeTimer.tick();
            setAlpha(1 - this.m_fadeTimer.CurrentTime / this.m_fadeTimer.MaxTime);
            if(this.m_fadeTimer.IsComplete)
            {
               this.m_action = 2;
               this.m_fadeTimer.reset();
            }
         }
         else if(this.m_action == 2)
         {
            this.m_regenerateTimer.tick();
            if(this.m_regenerateTimer.IsComplete)
            {
               this.m_fadeTimer.tick();
               setAlpha(this.m_fadeTimer.CurrentTime / this.m_fadeTimer.MaxTime);
               if(this.m_fadeTimer.IsComplete)
               {
                  this.m_action = 0;
                  this.m_fallTimer.reset();
                  fallthrough = false;
               }
            }
         }
         super.move();
      }
   }
}
