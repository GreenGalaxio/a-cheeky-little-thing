package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.enemies.DistantPlanetWater;
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.enemies.Onion;
   import com.mcleodgaming.ssf2.enemies.PelletPosie;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class DistantPlanetHazard extends StageHazard
   {
       
      
      private var m_posieTimer:FrameTimer;
      
      private var m_onionTimer:FrameTimer;
      
      private var m_rainLengthTimer:FrameTimer;
      
      private var m_rainStartTimer:FrameTimer;
      
      private var m_offset:int = 50;
      
      private var m_dropsNumber:int;
      
      private var m_dropsVector:Vector.<MovieClip>;
      
      private var m_container:MovieClip;
      
      private var m_moveLeft:Boolean;
      
      private var m_rainReady:Boolean;
      
      private var m_state:int;
      
      private var m_rainTimer:FrameTimer;
      
      public function DistantPlanetHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         this.m_dropsVector = new Vector.<MovieClip>();
         super(param1,param2,param3);
         this.m_posieTimer = new FrameTimer(30 * 8);
         this.m_onionTimer = new FrameTimer(30 * 40);
         this.m_rainLengthTimer = new FrameTimer(30 * 15);
         this.m_rainStartTimer = new FrameTimer(Utils.randomInteger(30 * 35,30 * 55));
         this.m_container = STAGEDATA.WeatherRef;
         this.m_moveLeft = true;
         this.m_rainReady = false;
         m_delayStart = false;
         this.init(200,50,5,550,400,"right");
         this.m_container.alpha = 0;
         this.m_state = 0;
         this.m_rainTimer = new FrameTimer(30 * 3);
      }
      
      override protected function runHazard() : void
      {
         this.runRain();
         var _loc1_:Array = null;
         var _loc2_:Point = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Enemy = null;
         this.m_posieTimer.tick();
         if(this.m_posieTimer.IsComplete)
         {
            this.m_posieTimer.reset();
            if(Utils.random() < 0.65)
            {
               _loc1_ = [new Point(175,43),new Point(339,29),new Point(497,15)];
               _loc4_ = Utils.randomInteger(0,_loc1_.length - 1);
               _loc2_ = _loc1_[_loc4_];
               _loc5_ = false;
               _loc3_ = 0;
               while(_loc3_ < STAGEDATA.Enemies.length)
               {
                  if(STAGEDATA.Enemies[_loc3_] is PelletPosie && PelletPosie(STAGEDATA.Enemies[_loc3_]).SLOT == _loc4_ || STAGEDATA.Enemies[_loc3_] is Onion && Onion(STAGEDATA.Enemies[_loc3_]).SLOT == _loc4_)
                  {
                     _loc5_ = true;
                     break;
                  }
                  _loc3_++;
               }
               if(!_loc5_)
               {
                  _loc6_ = STAGEDATA.spawnEnemy(PelletPosie,_loc2_.x,_loc2_.y);
                  PelletPosie(_loc6_).SLOT = _loc4_;
               }
            }
         }
         this.m_onionTimer.tick();
         if(this.m_onionTimer.IsComplete)
         {
            this.m_onionTimer.reset();
            if(this.m_state == 0)
            {
               _loc1_ = [new Point(175,STAGEDATA.DeathBounds.y),new Point(339,STAGEDATA.DeathBounds.y),new Point(497,STAGEDATA.DeathBounds.y)];
               _loc4_ = Utils.randomInteger(0,_loc1_.length - 1);
               _loc2_ = _loc1_[_loc4_];
               _loc5_ = false;
               _loc3_ = 0;
               while(_loc3_ < STAGEDATA.Enemies.length)
               {
                  if(STAGEDATA.Enemies[_loc3_] is PelletPosie && PelletPosie(STAGEDATA.Enemies[_loc3_]).SLOT == _loc4_ || STAGEDATA.Enemies[_loc3_] is Onion && Onion(STAGEDATA.Enemies[_loc3_]).SLOT == _loc4_)
                  {
                     _loc5_ = true;
                     break;
                  }
                  _loc3_++;
               }
               if(!_loc5_)
               {
                  _loc6_ = STAGEDATA.spawnEnemy(Onion,_loc2_.x,_loc2_.y);
                  Onion(_loc6_).SLOT = _loc4_;
               }
            }
         }
         this.m_rainStartTimer.tick();
         if(this.m_rainStartTimer.IsComplete)
         {
            this.m_rainStartTimer.reset();
            this.m_rainStartTimer.MaxTime = Utils.randomInteger(30 * 35,30 * 55);
            this.m_state = 1;
            STAGEDATA.StageFG.gotoAndPlay("rain");
         }
      }
      
      private function runRain() : void
      {
         var _loc1_:int = 0;
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
               _loc1_ = 0;
               while(_loc1_ < STAGEDATA.Enemies.length)
               {
                  if(STAGEDATA.Enemies[_loc1_] is Onion)
                  {
                     Onion(STAGEDATA.Enemies[_loc1_]).flyAway();
                  }
                  _loc1_++;
               }
               _loc1_ = 0;
               while(_loc1_ < STAGEDATA.Enemies.length)
               {
                  if(STAGEDATA.Enemies[_loc1_] is DistantPlanetWater)
                  {
                     DistantPlanetWater(STAGEDATA.Enemies[_loc1_]).activate();
                  }
                  _loc1_++;
               }
               this.m_state = 2;
            }
         }
         else if(this.m_state == 2)
         {
            this.m_rainLengthTimer.tick();
            if(this.m_rainLengthTimer.IsComplete)
            {
               this.m_rainLengthTimer.reset();
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
               STAGEDATA.StageFG.gotoAndPlay("sun");
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
