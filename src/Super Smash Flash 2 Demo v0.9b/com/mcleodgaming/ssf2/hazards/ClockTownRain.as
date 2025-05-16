package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class ClockTownRain extends StageHazard
   {
       
      
      private var m_offset:int = 50;
      
      private var m_dropsNumber:int;
      
      private var m_dropsVector:Vector.<MovieClip>;
      
      private var m_container:MovieClip;
      
      private var m_moveLeft:Boolean;
      
      private var m_rainReady:Boolean;
      
      private var m_state:int;
      
      private var m_rainTimer:FrameTimer;
      
      public function ClockTownRain(param1:uint, param2:StageData, param3:int = -1)
      {
         this.m_dropsVector = new Vector.<MovieClip>();
         super(param1,param2,param3);
         this.m_container = STAGEDATA.WeatherRef;
         this.m_moveLeft = true;
         this.m_rainReady = false;
         m_delayStart = false;
         m_safe = true;
         this.init(100,50,5,550,400,"right");
         this.m_container.alpha = 0;
         this.m_state = 0;
         this.m_rainTimer = new FrameTimer(30 * 3);
      }
      
      override protected function runHazard() : void
      {
         this.runRain();
      }
      
      private function runRain() : void
      {
         if(!this.m_rainReady && (this.m_container.visible && this.m_container.parent != null && this.m_container.parent.visible))
         {
            this.prepRain();
            this.m_rainReady = true;
         }
         if(this.m_state != 0)
         {
            this.rainMover();
         }
         if(this.m_state == 0)
         {
            if(STAGEDATA.CamRef.BGs != null && STAGEDATA.CamRef.BGs.length > 0 && STAGEDATA.CamRef.BGs[0].currentFrame == 1370)
            {
               this.m_rainTimer.reset();
               this.m_state = 1;
            }
         }
         else if(this.m_state == 1)
         {
            this.m_rainTimer.tick();
            this.m_container.alpha = this.m_rainTimer.CurrentTime / this.m_rainTimer.MaxTime;
            if(this.m_rainTimer.IsComplete)
            {
               this.m_state = 2;
            }
         }
         else if(this.m_state == 2)
         {
            if(STAGEDATA.CamRef.BGs != null && STAGEDATA.CamRef.BGs.length > 0 && STAGEDATA.CamRef.BGs[0].currentFrame == 1980)
            {
               this.m_rainTimer.reset();
               this.m_state = 3;
            }
         }
         else if(this.m_state == 3)
         {
            this.m_rainTimer.tick();
            this.m_container.alpha = 1 - this.m_rainTimer.CurrentTime / this.m_rainTimer.MaxTime;
            if(this.m_rainTimer.IsComplete)
            {
               this.m_state = 0;
            }
         }
      }
      
      private function prepRain() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 30 * 5)
         {
            this.rainMover();
            _loc1_++;
         }
      }
      
      public function init(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String) : void
      {
         var _loc8_:MovieClip = null;
         this.m_dropsNumber = param1;
         this.m_moveLeft = param6 == "left";
         if(param6 == "right")
         {
            this.m_offset = this.m_offset * -1;
         }
         var _loc7_:int = 0;
         while(_loc7_ < param1)
         {
            _loc8_ = Main.getLibraryMC("RainDrop");
            _loc8_.fallSpeed = param2;
            _loc8_.windSpeed = param3;
            _loc8_.dir = param6;
            _loc8_.hArea = param4;
            _loc8_.vArea = param5;
            _loc8_.x = Utils.random() * (param4 + this.m_offset);
            _loc8_.y = Utils.random() * param5;
            _loc8_.scaleX = Math.round((Utils.random() * 0.8 + 0.3) * 10) / 10;
            _loc8_.scaleY = _loc8_.scaleX;
            if(param6 == "right")
            {
               _loc8_.scaleX = _loc8_.scaleX * -1;
            }
            this.m_dropsVector.push(_loc8_);
            this.m_container.addChild(_loc8_);
            _loc7_++;
         }
      }
      
      private function moveLeft(param1:MovieClip) : void
      {
         param1.x = param1.x - param1.windSpeed;
         param1.y = param1.y + Utils.random() * param1.fallSpeed;
         if(param1.y > param1.vArea + param1.height)
         {
            param1.x = Utils.random() * (param1.hArea + this.m_offset * 2);
            param1.y = -param1.height;
         }
      }
      
      private function moveRight(param1:MovieClip) : void
      {
         param1.x = param1.x + param1.windSpeed;
         param1.y = param1.y + Utils.random() * param1.fallSpeed;
         if(param1.y > param1.vArea + param1.height)
         {
            param1.x = Utils.random() * (param1.hArea - this.m_offset * 2) + this.m_offset * 2;
            param1.y = -param1.height;
         }
      }
      
      private function rainMover() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_dropsVector.length)
         {
            if(this.m_moveLeft)
            {
               this.moveLeft(this.m_dropsVector[_loc1_]);
            }
            else
            {
               this.moveRight(this.m_dropsVector[_loc1_]);
            }
            _loc1_++;
         }
      }
   }
}
