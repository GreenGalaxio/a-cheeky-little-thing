package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class ButtonPlatform extends MovingPlatform
   {
       
      
      private var m_action:int;
      
      private var m_type:String;
      
      private var m_hideTimer:FrameTimer;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      public function ButtonPlatform(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_type = m_collisionClipContainer.name;
         this.m_action = 0;
         this.m_hideTimer = new FrameTimer(30 * 17);
         this.m_blinkTimer = new FrameTimer(30 * 3);
         this.m_blinkToggle = true;
         findForegroundPieces();
         setAlpha(0);
         fallthrough = true;
      }
      
      public function get Type() : String
      {
         return this.m_type;
      }
      
      public function activate() : void
      {
         setAlpha(1);
         this.m_action = 1;
         this.m_hideTimer.reset();
         fallthrough = false;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               this.m_hideTimer.tick();
               if(this.m_hideTimer.IsComplete)
               {
                  this.m_hideTimer.reset();
                  this.m_action = 2;
               }
            }
            else if(this.m_action == 2)
            {
               this.m_blinkToggle = !this.m_blinkToggle;
               setAlpha(!!this.m_blinkToggle?Number(0.8):Number(0));
               this.m_blinkTimer.tick();
               if(this.m_blinkTimer.IsComplete)
               {
                  setAlpha(0);
                  this.m_blinkTimer.reset();
                  this.m_action = 0;
                  fallthrough = true;
               }
            }
         }
         super.move();
      }
   }
}
