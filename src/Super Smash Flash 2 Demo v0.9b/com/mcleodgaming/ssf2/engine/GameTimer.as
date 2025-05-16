package com.mcleodgaming.ssf2.engine
{
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class GameTimer
   {
       
      
      private var ROOT:MovieClip;
      
      private var HUD:MovieClip;
      
      private var STAGEDATA:StageData;
      
      private var m_timer:MovieClip;
      
      private var m_startingTime:Number;
      
      private var m_currentTime:Number;
      
      private var m_on:Boolean;
      
      private var m_countdown:Boolean;
      
      private var m_paused:Boolean;
      
      private var m_elapsedTime:int;
      
      public function GameTimer(param1:Object, param2:StageData)
      {
         super();
         this.STAGEDATA = param2;
         this.ROOT = this.STAGEDATA.RootRef;
         this.HUD = this.STAGEDATA.HudRef;
         this.m_timer = this.HUD[param1["instanceName"]];
         this.m_countdown = param1["countdown"];
         this.m_startingTime = !!this.m_countdown?Number(param1["startAt"] * 60 * 30 - 30):Number(0);
         this.m_currentTime = this.m_startingTime;
         this.m_on = false;
         this.m_paused = false;
         this.m_elapsedTime = 0;
      }
      
      public function get TimeMC() : MovieClip
      {
         return this.m_timer;
      }
      
      public function get ElapsedTime() : int
      {
         return this.m_elapsedTime;
      }
      
      public function get CountDown() : Boolean
      {
         return this.m_countdown;
      }
      
      public function get CurrentTime() : int
      {
         return this.m_currentTime;
      }
      
      public function set CountDown(param1:Boolean) : void
      {
         this.m_countdown = param1;
      }
      
      public function frameElapse() : void
      {
         if(!this.STAGEDATA.Paused && !this.STAGEDATA.StageEvent && !this.STAGEDATA.GameEnded)
         {
            this.m_elapsedTime++;
         }
      }
      
      public function setCurrentTime(param1:Number) : void
      {
         if(this.m_countdown)
         {
            this.m_startingTime = param1;
         }
         else
         {
            this.m_startingTime = 0;
         }
         this.m_currentTime = param1;
      }
      
      private function updateDisplay() : void
      {
         this.m_currentTime = this.m_currentTime + (!!this.m_countdown?-1:1);
         this.updateTextFields();
         if(this.m_currentTime < -30)
         {
            this.STAGEDATA.SoundQueueRef.playVoiceEffect("narrator_time");
            this.Stop();
            this.STAGEDATA.prepareEndGame();
         }
      }
      
      public function updateTextFields() : void
      {
         var _loc1_:String = "";
         var _loc2_:String = "";
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         if(this.m_currentTime % 30 == 0)
         {
            if(this.m_countdown)
            {
               _loc3_ = Math.floor(this.m_currentTime / 30 / 60);
               _loc4_ = Math.floor(this.m_currentTime / 30 - 60 * _loc3_);
               if(_loc4_ >= 10)
               {
                  _loc1_ = _loc4_ != 60?_loc3_ + ":" + _loc4_:_loc3_ + 1 + ":" + "00";
               }
               else
               {
                  _loc1_ = _loc3_ + ":0" + _loc4_;
               }
            }
            else
            {
               _loc3_ = Math.floor(this.m_currentTime / 30 / 60);
               _loc4_ = Math.floor(this.m_currentTime / 30 - 60 * _loc3_);
               if(_loc4_ >= 10)
               {
                  _loc1_ = _loc4_ != 60?_loc3_ + ":" + _loc4_:_loc3_ + 1 + ":" + "00";
               }
               else
               {
                  _loc1_ = _loc3_ + ":0" + _loc4_;
               }
            }
            this.m_timer.display.text = _loc1_;
            if(_loc3_ == 0)
            {
               if(_loc4_ <= 4 && _loc4_ >= 0 && this.m_countdown)
               {
                  this.STAGEDATA.stopNarratorSpeech();
                  this.STAGEDATA.SoundQueueRef.playVoiceEffect("narrator_countdown" + (_loc4_ + 1));
               }
            }
         }
         if(this.m_currentTime >= 0)
         {
            _loc2_ = "" + Math.round(this.m_currentTime % 30 / 30 * 100);
         }
         else
         {
            _loc2_ = "" + (100 - Utils.fastAbs(Math.round(this.m_currentTime % 30 / 30 * 100)));
         }
         if(_loc2_.length == 1)
         {
            _loc2_ = _loc2_ == "0"?"00":_loc2_ + "0";
         }
         _loc2_ = ":" + _loc2_;
         this.m_timer.display_ms.text = _loc2_;
         if(this.m_currentTime <= -30)
         {
            _loc1_ = "0:00";
            _loc2_ = "00";
            this.m_timer.display.text = _loc1_;
            this.m_timer.display_ms.text = _loc2_;
         }
      }
      
      public function Start() : void
      {
         this.m_on = true;
         this.updateTextFields();
      }
      
      public function Stop() : void
      {
         this.m_on = false;
         this.updateTextFields();
      }
      
      public function Restart() : void
      {
         this.m_currentTime = this.m_startingTime;
         this.m_paused = false;
         this.updateTextFields();
      }
      
      public function PERFORMALL() : void
      {
         if(this.m_on && !this.STAGEDATA.Paused && !this.STAGEDATA.StageEvent && !this.STAGEDATA.GameEnded)
         {
            if(this.m_paused)
            {
               this.m_paused = false;
            }
            this.updateDisplay();
         }
         else if(this.STAGEDATA.Paused && this.m_on && !this.STAGEDATA.StageEvent)
         {
            if(!this.m_paused)
            {
               this.m_paused = true;
            }
         }
      }
   }
}
