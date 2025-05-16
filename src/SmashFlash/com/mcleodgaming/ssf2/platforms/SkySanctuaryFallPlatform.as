package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class SkySanctuaryFallPlatform extends MovingPlatform
   {
       
      
      private var m_opponents:Vector.<Number>;
      
      private var m_shakeToggle:Boolean;
      
      private var m_shakeTimer:FrameTimer;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_fallTimer:FrameTimer;
      
      private var m_regenerateTimer:FrameTimer;
      
      private var m_gravity:Number;
      
      private var m_action:int;
      
      public function SkySanctuaryFallPlatform(param1:MovieClip, param2:StageData)
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
         this.m_shakeTimer = new FrameTimer(5);
         this.m_fallTimer = new FrameTimer(30 * 10);
         this.m_regenerateTimer = new FrameTimer(30 * 10);
         this.m_blinkTimer = new FrameTimer(30 * 1);
         this.m_shakeToggle = false;
         this.m_blinkToggle = false;
         this.m_gravity = 1;
         m_ySpeed = 0;
         this.m_action = 0;
         m_findLedges = false;
         if(!param2.HazardsOn)
         {
            fallthrough = true;
            m_platform.visible = false;
            this.m_action = -1;
         }
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         var _loc1_:Number = 0;
         if(this.m_action >= 0)
         {
            if(this.m_action == 0)
            {
               _loc1_ = 0;
               while(_loc1_ < this.m_opponents.length)
               {
                  if(STAGEDATA.getPlayer(this.m_opponents[_loc1_]) != null && STAGEDATA.getPlayer(this.m_opponents[_loc1_]).CollisionObj.ground && STAGEDATA.getPlayer(this.m_opponents[_loc1_]).CurrentPlatform == this)
                  {
                     this.m_action = 1;
                     this.m_shakeTimer.reset();
                     this.m_fallTimer.reset();
                     this.m_regenerateTimer.reset();
                     m_ySpeed = 0;
                     break;
                  }
                  _loc1_++;
               }
               _loc1_ = 0;
               while(_loc1_ < STAGEDATA.Enemies.length)
               {
                  if(STAGEDATA.Enemies[_loc1_] != null)
                  {
                     if(STAGEDATA.Enemies[_loc1_].CollisionObj.ground && STAGEDATA.Enemies[_loc1_].CurrentPlatform == this)
                     {
                        this.m_action = 1;
                        this.m_shakeTimer.reset();
                        this.m_fallTimer.reset();
                        this.m_regenerateTimer.reset();
                        m_ySpeed = 0;
                        break;
                     }
                  }
                  _loc1_++;
               }
            }
            else if(this.m_action == 1)
            {
               this.m_shakeTimer.tick();
               if(this.m_shakeTimer.IsComplete)
               {
                  this.m_action = 2;
                  STAGEDATA.playSpecificSound("skysanctuary_fallplatform");
               }
            }
            else if(this.m_action == 2)
            {
               this.m_fallTimer.tick();
               m_ySpeed = m_ySpeed + (m_ySpeed < 14?this.m_gravity:0);
               m_platform.y = m_platform.y + m_ySpeed;
               this.m_blinkTimer.reset();
               if(this.m_fallTimer.IsComplete)
               {
                  this.m_action = 3;
                  m_platform.y = m_y_start;
                  fallthrough = true;
                  m_platform.alpha = 0;
               }
            }
            else if(this.m_action == 3)
            {
               this.m_regenerateTimer.tick();
               if(this.m_regenerateTimer.IsComplete)
               {
                  this.m_blinkTimer.tick();
                  this.m_blinkToggle = !this.m_blinkToggle;
                  m_platform.alpha = !!this.m_blinkToggle?Number(0.35):Number(0.7);
                  if(this.m_blinkTimer.IsComplete)
                  {
                     this.m_action = 0;
                     fallthrough = false;
                     m_platform.alpha = 1;
                  }
               }
            }
         }
         super.move();
      }
   }
}
