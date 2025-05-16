package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class PuzzlePlankFallPlatform extends MovingPlatform
   {
       
      
      private var m_opponents:Vector.<Number>;
      
      private var m_shakeToggle:Boolean;
      
      private var m_shakeTimer:FrameTimer;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_fallTimer:FrameTimer;
      
      private var m_regenerateTimer:FrameTimer;
      
      private var m_falling:Boolean = false;
      
      private var m_gravity:Number;
      
      public function PuzzlePlankFallPlatform(param1:MovieClip, param2:StageData)
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
         m_y_start = m_platform.y;
         this.m_shakeTimer = new FrameTimer(30 * 3);
         this.m_fallTimer = new FrameTimer(30 * 10);
         this.m_regenerateTimer = new FrameTimer(30 * 5);
         this.m_blinkTimer = new FrameTimer(30 * 3);
         this.m_shakeToggle = false;
         this.m_blinkToggle = false;
         this.m_gravity = 1;
         m_ySpeed = 0;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         var _loc1_:Number = 0;
         _loc1_ = 0;
         while(_loc1_ < this.m_opponents.length && !this.m_falling)
         {
            if(STAGEDATA.getPlayer(this.m_opponents[_loc1_]) != null && STAGEDATA.getPlayer(this.m_opponents[_loc1_]).CollisionObj.ground && STAGEDATA.getPlayer(this.m_opponents[_loc1_]).CurrentPlatform == this)
            {
               this.m_falling = true;
               this.m_shakeTimer.reset();
               this.m_fallTimer.reset();
               this.m_regenerateTimer.reset();
               m_ySpeed = 0;
            }
            _loc1_++;
         }
         if(this.m_falling)
         {
            if(!this.m_shakeTimer.IsComplete)
            {
               this.m_shakeTimer.tick();
               this.m_shakeToggle = !this.m_shakeToggle;
               m_platform.y = m_platform.y + (!!this.m_shakeToggle?3:-3);
            }
            else if(this.m_shakeTimer.IsComplete)
            {
               if(!this.m_fallTimer.IsComplete)
               {
                  m_platform.alpha = 0;
                  this.m_fallTimer.tick();
                  m_ySpeed = m_ySpeed + (m_ySpeed < 14?this.m_gravity:0);
                  m_platform.y = m_platform.y + m_ySpeed;
                  this.m_blinkTimer.reset();
               }
               else
               {
                  this.m_regenerateTimer.tick();
                  if(this.m_regenerateTimer.IsComplete)
                  {
                     this.m_blinkTimer.tick();
                     this.m_blinkToggle = !this.m_blinkToggle;
                     m_platform.alpha = !!this.m_blinkToggle?Number(0.35):Number(0.7);
                     if(this.m_blinkTimer.IsComplete)
                     {
                        this.m_falling = false;
                        m_platform.alpha = 1;
                        m_platform.y = m_y_start;
                     }
                  }
               }
            }
         }
         super.move();
      }
   }
}
