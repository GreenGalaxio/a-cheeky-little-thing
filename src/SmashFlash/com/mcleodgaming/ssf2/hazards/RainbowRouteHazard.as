package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.util.*;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class RainbowRouteHazard extends StageHazard
   {
       
      
      private var m_goldMirror:MovieClip;
      
      private var m_allMirrors:Vector.<MovieClip>;
      
      private var m_openMirrors:Vector.<MovieClip>;
      
      private var m_closedMirrors:Vector.<MovieClip>;
      
      private var m_capturingMirrors:Vector.<MovieClip>;
      
      private var m_releasingMirrors:Vector.<MovieClip>;
      
      private var m_capturedPlayers:Vector.<Character>;
      
      private var m_capturedPlayerTimers:Vector.<int>;
      
      private var m_releasingPlayerTimers:Vector.<int>;
      
      private var m_goldMirrorTimer:FrameTimer;
      
      private var m_nextMirrorTimer:FrameTimer;
      
      private var MIRROR_WIDTH:Number = 40;
      
      private var MIRROR_HEIGHT:Number = 70;
      
      private var GOLD_MIRROR_WIDTH:Number = 108;
      
      private var GOLD_MIRROR_HEIGHT:Number = 92;
      
      public function RainbowRouteHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         var _loc5_:MovieClip = null;
         super(param1,param2,param3);
         this.m_goldMirrorTimer = new FrameTimer(60);
         this.m_nextMirrorTimer = new FrameTimer(30 * 12);
         this.m_capturedPlayers = new Vector.<Character>();
         this.m_capturedPlayerTimers = new Vector.<int>();
         this.m_releasingPlayerTimers = new Vector.<int>();
         this.m_releasingMirrors = new Vector.<MovieClip>();
         this.m_allMirrors = new Vector.<MovieClip>();
         this.m_openMirrors = new Vector.<MovieClip>();
         this.m_closedMirrors = new Vector.<MovieClip>();
         this.m_capturingMirrors = new Vector.<MovieClip>();
         this.m_goldMirror = STAGEDATA.StageRef["goldMirror"];
         var _loc4_:int = 1;
         while(STAGEDATA.StageRef["mirror" + _loc4_])
         {
            _loc5_ = STAGEDATA.StageRef["mirror" + _loc4_];
            this.m_allMirrors.push(_loc5_);
            this.m_closedMirrors.push(_loc5_);
            this.m_openMirrors.push(null);
            this.m_capturingMirrors.push(null);
            this.m_releasingMirrors.push(null);
            this.m_capturedPlayers.push(null);
            this.m_capturedPlayerTimers.push(0);
            this.m_releasingPlayerTimers.push(0);
            _loc5_.x_offset = this.MIRROR_WIDTH / 2;
            _loc5_.y_offset = this.MIRROR_HEIGHT;
            _loc5_.cam_width = this.MIRROR_WIDTH + 30;
            _loc5_.cam_height = this.MIRROR_HEIGHT + 30;
            _loc4_++;
         }
         this.m_allMirrors.push(this.m_goldMirror);
      }
      
      private function openMirrorCount() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.m_openMirrors.length)
         {
            if(this.m_openMirrors[_loc2_])
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function closedMirrorCount() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.m_closedMirrors.length)
         {
            if(this.m_closedMirrors[_loc2_])
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function randomClosedMirror() : int
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this.m_closedMirrors.length)
         {
            if(this.m_closedMirrors[_loc2_])
            {
               _loc1_.push(_loc2_);
            }
            _loc2_++;
         }
         if(_loc1_.length <= 0)
         {
            return -1;
         }
         return _loc1_[Utils.randomInteger(0,_loc1_.length - 1)];
      }
      
      override protected function runHazard() : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Character = null;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Character = null;
         var _loc4_:Number = int.MAX_VALUE;
         _loc1_ = 0;
         while(_loc1_ < this.m_allMirrors.length)
         {
            Utils.advanceFrame(this.m_allMirrors[_loc1_]);
            _loc1_++;
         }
         this.m_nextMirrorTimer.tick();
         if(this.m_nextMirrorTimer.IsComplete)
         {
            this.m_nextMirrorTimer.reset();
            _loc1_ = this.randomClosedMirror();
            if(_loc1_ >= 0)
            {
               STAGEDATA.CamRef.addTimedTarget(this.m_closedMirrors[_loc1_],30 * 2);
               this.m_closedMirrors[_loc1_].gotoAndStop("opening");
               this.m_openMirrors[_loc1_] = this.m_closedMirrors[_loc1_];
               this.m_closedMirrors[_loc1_] = null;
            }
         }
         _loc2_ = 0;
         while(_loc2_ < this.m_openMirrors.length)
         {
            if(this.m_openMirrors[_loc2_])
            {
               _loc5_ = 0;
               _loc6_ = 0;
               if(this.m_openMirrors[_loc2_].currentLabel == "opening")
               {
                  _loc5_ = 80;
                  _loc6_ = 80;
               }
               else if(this.m_openMirrors[_loc2_].currentLabel == "open")
               {
                  _loc5_ = 20;
                  _loc6_ = 35;
               }
               _loc7_ = null;
               _loc1_ = 0;
               while(_loc1_ < STAGEDATA.PlayerList.length)
               {
                  _loc8_ = STAGEDATA.PlayerList[_loc1_];
                  _loc3_ = STAGEDATA.getPlayer(_loc8_);
                  if(this.m_capturedPlayers.indexOf(_loc3_) < 0 && _loc3_ != null && !_loc3_.Dead && !_loc3_.StandBy && !_loc3_.IsCaught)
                  {
                     _loc9_ = Utils.getDistance(new Point(_loc3_.X,_loc3_.Y - _loc3_.Height / 2),new Point(this.m_openMirrors[_loc2_].x + this.MIRROR_WIDTH / 2,this.m_openMirrors[_loc2_].y + this.MIRROR_HEIGHT / 2));
                     if(Utils.fastAbs(_loc3_.X - (this.m_openMirrors[_loc2_].x + this.MIRROR_WIDTH / 2)) < _loc5_ && Utils.fastAbs(_loc3_.Y - _loc3_.Height / 2 - (this.m_openMirrors[_loc2_].y + this.MIRROR_HEIGHT / 2)) < _loc6_)
                     {
                        if(_loc7_ == null || _loc9_ < _loc4_)
                        {
                           _loc7_ = _loc3_;
                           _loc4_ = _loc9_;
                        }
                     }
                  }
                  _loc1_++;
               }
               if(_loc7_)
               {
                  _loc7_.killAllSpeeds();
                  _loc7_.Capture(-1,true,true);
                  this.m_capturedPlayers[_loc2_] = _loc7_;
                  this.m_capturedPlayerTimers[_loc2_] = 10;
                  this.m_capturingMirrors[_loc2_] = this.m_openMirrors[_loc2_];
                  this.m_openMirrors[_loc2_] = null;
               }
            }
            _loc2_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.m_capturingMirrors.length)
         {
            if(this.m_capturingMirrors[_loc1_])
            {
               _loc3_ = this.m_capturedPlayers[_loc1_];
               this.m_capturedPlayerTimers[_loc1_]--;
               if(this.m_capturedPlayerTimers[_loc1_] <= 0)
               {
                  this.m_capturingMirrors[_loc1_].gotoAndStop("closing");
                  this.m_releasingMirrors[_loc1_] = this.m_capturingMirrors[_loc1_];
                  this.m_releasingPlayerTimers[_loc1_] = 30;
                  this.m_capturingMirrors[_loc1_] = null;
                  _loc3_.Capture(-1,false,true);
                  _loc3_.setInvisibilityTimer(15);
                  _loc3_.X = this.m_goldMirror.x + this.GOLD_MIRROR_WIDTH / 2 * this.m_goldMirror.scaleX;
                  _loc3_.Y = this.m_goldMirror.y + this.GOLD_MIRROR_HEIGHT / 2 * this.m_goldMirror.scaleY;
               }
               else
               {
                  _loc3_.X = _loc3_.X + (this.m_capturingMirrors[_loc1_].x + this.MIRROR_WIDTH / 2 + -_loc3_.X) / 6;
                  _loc3_.Y = _loc3_.Y + (this.m_capturingMirrors[_loc1_].y + this.MIRROR_HEIGHT / 2 - _loc3_.Y) / 6;
                  _loc3_.MC.scaleX = _loc3_.MC.scaleX * 0.9;
                  _loc3_.MC.scaleY = _loc3_.MC.scaleY * 0.9;
               }
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.m_releasingMirrors.length)
         {
            if(this.m_releasingMirrors[_loc1_])
            {
               _loc3_ = this.m_capturedPlayers[_loc1_];
               this.m_releasingPlayerTimers[_loc1_]--;
               if(this.m_releasingPlayerTimers[_loc1_] < 0)
               {
                  this.m_closedMirrors[_loc1_] = this.m_releasingMirrors[_loc1_];
                  this.m_releasingMirrors[_loc1_] = null;
                  if(this.closedMirrorCount() == 1)
                  {
                     this.m_nextMirrorTimer.reset();
                  }
                  _loc3_.MC.scaleX = _loc3_.MC.scaleX > 0?Number(1 * _loc3_.SizeRatio):Number(-1 * _loc3_.SizeRatio);
                  _loc3_.MC.scaleY = 1 * _loc3_.SizeRatio;
                  _loc3_.Uncapture();
                  _loc3_.setState(CState.DISABLED);
                  this.m_capturedPlayers[_loc1_] = null;
               }
               else if(this.m_releasingPlayerTimers[_loc1_] < 15)
               {
                  _loc3_.setVisibility(true);
                  if(_loc3_.MC.scaleX > 0)
                  {
                     _loc3_.MC.scaleX = (0.25 + 0.75 * ((15 - this.m_releasingPlayerTimers[_loc1_]) / 15)) * _loc3_.SizeRatio;
                  }
                  else
                  {
                     _loc3_.MC.scaleX = -(0.25 + 0.75 * ((15 - this.m_releasingPlayerTimers[_loc1_]) / 15)) * _loc3_.SizeRatio;
                  }
                  _loc3_.MC.scaleY = 0.25 + 0.75 * ((15 - this.m_releasingPlayerTimers[_loc1_]) / 15) * _loc3_.SizeRatio;
               }
               if(this.m_releasingPlayerTimers[_loc1_] == 20)
               {
                  if(this.m_goldMirror.currentLabel != "opening" && this.m_goldMirror.currentLabel != "open")
                  {
                     this.m_goldMirror.gotoAndStop("opening");
                  }
                  this.m_goldMirrorTimer.reset();
               }
            }
            _loc1_++;
         }
         this.m_goldMirrorTimer.tick();
         if(this.m_goldMirrorTimer.IsComplete)
         {
            if(this.m_goldMirror.currentLabel != "closing" && this.m_goldMirror.currentLabel != "closed")
            {
               this.m_goldMirror.gotoAndStop("closing");
            }
         }
         _loc1_ = 0;
         while(_loc1_ < this.m_allMirrors.length)
         {
            this.m_allMirrors[_loc1_].stop();
            _loc1_++;
         }
      }
      
      override protected function excess() : void
      {
      }
   }
}
