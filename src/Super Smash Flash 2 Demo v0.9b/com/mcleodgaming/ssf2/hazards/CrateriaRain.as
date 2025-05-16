package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackData;
   import com.mcleodgaming.ssf2.engine.AttackState;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.platforms.CollisionBoundary;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class CrateriaRain extends StageHazard
   {
       
      
      private var m_offset:int = 50;
      
      private var m_dropsNumber:int;
      
      private var m_dropsVector:Vector.<MovieClip>;
      
      private var m_acidDropsVector:Vector.<MovieClip>;
      
      private var m_container:MovieClip;
      
      private var m_moveLeft:Boolean;
      
      private var m_rainReady:Boolean;
      
      private var m_safeMC:CollisionBoundary;
      
      private var m_cautionMC:MovieClip;
      
      private var m_cautionTimer:FrameTimer;
      
      private var m_safeTimer:FrameTimer;
      
      private var m_hazardTimer:FrameTimer;
      
      private var m_transitionTimer:FrameTimer;
      
      private var m_action:int;
      
      private var m_opponents:Vector.<Number>;
      
      private var m_acidOn:Boolean;
      
      private var m_attack:AttackState;
      
      private var m_attackData:AttackData;
      
      public function CrateriaRain(param1:uint, param2:StageData, param3:int = -1)
      {
         this.m_dropsVector = new Vector.<MovieClip>();
         this.m_acidDropsVector = new Vector.<MovieClip>();
         super(param1,param2,param3);
         this.m_opponents = new Vector.<Number>();
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < STAGEDATA.PlayerList.length)
         {
            this.m_opponents.push(STAGEDATA.PlayerList[_loc4_]);
            _loc4_++;
         }
         this.m_container = STAGEDATA.WeatherRef;
         this.m_moveLeft = true;
         this.m_rainReady = false;
         m_delayStart = false;
         m_safe = true;
         this.m_cautionMC = STAGEDATA.StageBG.caution;
         this.m_safeMC = new CollisionBoundary(STAGEDATA.StageRef.safezone,param2);
         this.m_cautionTimer = new FrameTimer(28 * 3);
         this.m_safeTimer = new FrameTimer(30 * 25);
         this.m_hazardTimer = new FrameTimer(30 * 3);
         this.m_transitionTimer = new FrameTimer(30);
         this.init(200,50,5,Main.Width,Main.Height,"left");
         this.m_action = 0;
         this.m_attack = new AttackState(null);
         this.m_attackData = new AttackData(null);
         this.m_attackData.importAttacks(Main.getEnemyAttackData("crateria_rain_stats"));
         this.m_attack.RefreshRate = this.m_attackData.getAttack("attack").RefreshRate;
         this.m_acidOn = STAGEDATA.HazardsOn;
      }
      
      override protected function runHazard() : void
      {
         if(!this.m_rainReady && (this.m_container.visible && this.m_container.parent != null && this.m_container.parent.visible))
         {
            this.prepRain();
            this.m_rainReady = true;
         }
         this.rainMover();
         this.hazardCheck();
      }
      
      private function hazardCheck() : void
      {
         if(this.m_action == 0 && this.m_acidOn)
         {
            this.m_safeTimer.tick();
            if(this.m_safeTimer.IsComplete)
            {
               this.m_cautionMC.visible = true;
               this.m_cautionMC.gotoAndPlay("show");
               this.m_cautionTimer.reset();
               this.m_action = 1;
               STAGEDATA.StageFG.gotoAndStop("rainStart");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_cautionTimer.tick();
            if(this.m_cautionTimer.IsComplete)
            {
               this.m_action = 2;
               this.m_transitionTimer.reset();
               this.m_attack.ExecTime = 0;
            }
         }
         else if(this.m_action == 2)
         {
            this.checkDamage();
            this.m_transitionTimer.tick();
            this.setAlpha(this.m_transitionTimer.CurrentTime / this.m_transitionTimer.MaxTime);
            if(this.m_transitionTimer.IsComplete)
            {
               this.m_hazardTimer.reset();
               this.m_action = 3;
            }
         }
         else if(this.m_action == 3)
         {
            this.checkDamage();
            this.m_hazardTimer.tick();
            if(this.m_hazardTimer.IsComplete)
            {
               this.m_transitionTimer.reset();
               this.m_action = 4;
            }
         }
         else if(this.m_action == 4)
         {
            this.checkDamage();
            this.m_transitionTimer.tick();
            this.setAlpha(1 - this.m_transitionTimer.CurrentTime / this.m_transitionTimer.MaxTime);
            if(this.m_transitionTimer.IsComplete)
            {
               STAGEDATA.StageFG.gotoAndStop("rainEnd");
               this.m_cautionMC.gotoAndPlay("stopped");
               this.m_cautionMC.visible = false;
               this.m_safeTimer.reset();
               this.m_action = 0;
            }
         }
      }
      
      private function checkDamage() : void
      {
         this.m_attack.ExecTime++;
         this.m_attack.RefreshRateTimer++;
         if(this.m_attack.RefreshRateReady && this.m_attack.RefreshRateTimer % this.m_attack.RefreshRate == 0)
         {
            this.m_attack.AttackID++;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.m_opponents.length)
         {
            if(STAGEDATA.getPlayer(this.m_opponents[_loc1_]) != null && !STAGEDATA.getPlayer(this.m_opponents[_loc1_]).StandBy && !this.m_safeMC.hitTestPoint(STAGEDATA.getPlayer(this.m_opponents[_loc1_]).X,STAGEDATA.getPlayer(this.m_opponents[_loc1_]).Y,true))
            {
               if(STAGEDATA.getPlayer(this.m_opponents[_loc1_]).takeDamage(this.m_attackData.getAttack("attack").AttackBoxes["attackBox"].syncState(this.m_attack),null))
               {
                  STAGEDATA.getPlayer(this.m_opponents[_loc1_]).throbDamageCounter();
               }
            }
            _loc1_++;
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
         while(_loc7_ < param1 * 2)
         {
            _loc8_ = _loc7_ < 50?Main.getLibraryMC("RainDrop"):Main.getLibraryMC("GreenRainDrop");
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
            if(_loc7_ < 50)
            {
               this.m_dropsVector.push(_loc8_);
            }
            else
            {
               this.m_acidDropsVector.push(_loc8_);
               _loc8_.alpha = 0;
            }
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
      
      private function setAlpha(param1:Number) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.m_acidDropsVector.length)
         {
            this.m_acidDropsVector[_loc2_].alpha = param1;
            _loc2_++;
         }
      }
      
      private function rainMover() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
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
         _loc1_ = 0;
         while(_loc1_ < this.m_acidDropsVector.length)
         {
            if(this.m_moveLeft)
            {
               this.moveLeft(this.m_acidDropsVector[_loc1_]);
            }
            else
            {
               this.moveRight(this.m_acidDropsVector[_loc1_]);
            }
            _loc1_++;
         }
      }
   }
}
