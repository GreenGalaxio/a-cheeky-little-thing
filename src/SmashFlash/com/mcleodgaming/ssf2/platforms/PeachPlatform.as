package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class PeachPlatform extends MovingPlatform
   {
       
      
      private var m_opponents:Vector.<Number>;
      
      private var m_fallTimer:FrameTimer;
      
      private var m_riseTimer:FrameTimer;
      
      private var m_action:int;
      
      public function PeachPlatform(param1:MovieClip, param2:StageData)
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
         this.m_fallTimer = new FrameTimer(15);
         this.m_riseTimer = new FrameTimer(15);
         this.m_action = 0;
      }
      
      private function characterStandingOn() : Boolean
      {
         var _loc1_:Number = 0;
         var _loc2_:Boolean = false;
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
         return _loc2_;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         var _loc1_:Number = 0;
         var _loc2_:Boolean = false;
         if(this.m_action == 0)
         {
            if(!this.characterStandingOn())
            {
               this.m_fallTimer.tick();
               if(this.m_fallTimer.IsComplete)
               {
                  m_platform.y = m_platform.y + (m_platform.y + 1 <= m_y_start?1:0);
               }
            }
            else
            {
               this.m_fallTimer.reset();
               this.m_riseTimer.reset();
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            if(!this.characterStandingOn())
            {
               this.m_riseTimer.reset();
               this.m_fallTimer.reset();
               this.m_action = 0;
            }
            else
            {
               this.m_riseTimer.tick();
               if(this.m_riseTimer.IsComplete)
               {
                  m_platform.y = m_platform.y - (m_platform.y - 1 >= m_y_start - 95?1:0);
               }
            }
         }
         super.move();
      }
   }
}
