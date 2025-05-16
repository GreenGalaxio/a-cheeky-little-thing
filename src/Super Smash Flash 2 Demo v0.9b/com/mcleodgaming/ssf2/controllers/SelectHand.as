package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.util.Controller;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class SelectHand
   {
       
      
      protected var BOUNDS_RECT:Rectangle;
      
      protected var START_POSITION:Point;
      
      protected var HAND_SPEED:Number = 10;
      
      protected var HAND_ACCEL:Number = 1.5;
      
      protected var m_targetMC:MovieClip;
      
      protected var m_hand:MovieClip;
      
      protected var m_hand_xSpeed:Number;
      
      protected var m_hand_ySpeed:Number;
      
      protected var m_players:Vector.<Controller>;
      
      protected var m_leftRightID:int;
      
      protected var m_upDownID:int;
      
      protected var m_buttons:Vector.<HandButton>;
      
      protected var m_rollOverID:int;
      
      protected var m_backFunc:Function;
      
      protected var m_startLetGo:Boolean;
      
      protected var m_selectLetGo:Boolean;
      
      protected var m_backLetGo:Boolean;
      
      protected var m_autoKillEvents:Boolean;
      
      protected var m_clickEventClipsCheckBounds:Vector.<DisplayObject>;
      
      protected var m_clickEventClipsHitTest:Vector.<DisplayObject>;
      
      public function SelectHand(param1:MovieClip, param2:Vector.<HandButton>, param3:Function)
      {
         this.BOUNDS_RECT = new Rectangle();
         this.START_POSITION = new Point();
         super();
         this.m_targetMC = param1;
         this.m_backFunc = param3;
         this.m_hand = MovieClip(this.m_targetMC.addChild(Main.getLibraryMC("stageselect_hand")));
         this.m_hand.visible = false;
         this.m_hand_xSpeed = 0;
         this.m_hand_ySpeed = 0;
         this.m_players = new Vector.<Controller>();
         var _loc4_:int = 1;
         while(_loc4_ <= Main.MAXPLAYERS)
         {
            if(SaveData["Controller" + _loc4_] != null)
            {
               this.m_players.push(Controller(SaveData["Controller" + _loc4_]));
            }
            _loc4_++;
         }
         this.m_leftRightID = -1;
         this.m_upDownID = -1;
         this.m_buttons = param2;
         this.m_rollOverID = -1;
         this.m_startLetGo = false;
         this.m_selectLetGo = false;
         this.m_backLetGo = false;
         this.m_autoKillEvents = true;
         this.BOUNDS_RECT = new Rectangle();
         this.START_POSITION = new Point();
         this.START_POSITION.x = -246;
         this.START_POSITION.y = -132;
         this.BOUNDS_RECT.x = -303;
         this.BOUNDS_RECT.y = -145;
         this.BOUNDS_RECT.width = 600;
         this.BOUNDS_RECT.height = 320;
         this.HAND_SPEED = 10;
         this.HAND_ACCEL = 3;
         this.m_clickEventClipsCheckBounds = new Vector.<DisplayObject>();
         this.m_clickEventClipsHitTest = new Vector.<DisplayObject>();
      }
      
      public function setBackFunction(param1:Function) : void
      {
         this.m_backFunc = param1;
      }
      
      public function setAutoKillEvents(param1:Boolean) : void
      {
         this.m_autoKillEvents = param1;
      }
      
      public function addClickEventClipCheckBounds(param1:DisplayObject) : void
      {
         if(this.m_clickEventClipsCheckBounds.indexOf(param1) < 0)
         {
            this.m_clickEventClipsCheckBounds.push(param1);
         }
      }
      
      public function removeClickEventClipCheckBounds(param1:DisplayObject) : void
      {
         var _loc2_:int = this.m_clickEventClipsCheckBounds.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.m_clickEventClipsCheckBounds.splice(_loc2_,1);
         }
      }
      
      public function addClickEventClipHitTest(param1:DisplayObject) : void
      {
         if(this.m_clickEventClipsHitTest.indexOf(param1) < 0)
         {
            this.m_clickEventClipsHitTest.push(param1);
         }
      }
      
      public function removeClickEventClipHitTest(param1:DisplayObject) : void
      {
         var _loc2_:int = this.m_clickEventClipsHitTest.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.m_clickEventClipsHitTest.splice(_loc2_,1);
         }
      }
      
      public function makeEvents() : void
      {
         this.m_startLetGo = false;
         this.m_selectLetGo = false;
         this.m_backLetGo = false;
         Main.Root.stage.addEventListener(Event.ENTER_FRAME,this.checkControls);
         Main.Root.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.checkHit);
         this.resetPosition();
      }
      
      public function killEvents() : void
      {
         Main.Root.stage.removeEventListener(Event.ENTER_FRAME,this.checkControls);
         Main.Root.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.checkHit);
      }
      
      public function get HandMC() : MovieClip
      {
         return this.m_hand;
      }
      
      public function resetPosition() : void
      {
         this.m_hand.x = this.START_POSITION.x;
         this.m_hand.y = this.START_POSITION.y;
      }
      
      public function resetControlsLetGo() : void
      {
         this.m_startLetGo = false;
         this.m_backLetGo = false;
         this.m_selectLetGo = false;
      }
      
      protected function validateLeftRightID(param1:int) : Boolean
      {
         return param1 == this.m_leftRightID || this.m_leftRightID == -1;
      }
      
      protected function validateUpDownID(param1:int) : Boolean
      {
         return param1 == this.m_upDownID || this.m_upDownID == -1;
      }
      
      protected function move() : void
      {
         this.m_hand.x = this.m_hand.x + this.m_hand_xSpeed;
         this.m_hand.y = this.m_hand.y + this.m_hand_ySpeed;
         this.checkHit(new KeyboardEvent(KeyboardEvent.KEY_DOWN));
      }
      
      protected function checkControls(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < this.m_players.length)
         {
            if(this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._START))
            {
               _loc2_ = true;
            }
            if(this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._BUTTON2))
            {
               _loc3_ = true;
            }
            if(this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._BUTTON1))
            {
               _loc4_ = true;
            }
            if(this.validateUpDownID(_loc5_) && this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._UP) && !this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._DOWN))
            {
               this.m_hand.visible = true;
               this.m_hand_ySpeed = this.m_hand_ySpeed - (this.m_hand_ySpeed > -this.HAND_SPEED && this.m_hand.y > this.BOUNDS_RECT.y?this.HAND_ACCEL:0);
               this.m_upDownID = _loc5_;
               if(this.m_hand.y <= this.BOUNDS_RECT.y || this.m_hand_ySpeed > 0)
               {
                  this.m_hand_ySpeed = 0;
               }
            }
            else if(this.validateUpDownID(_loc5_) && this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._DOWN) && !this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._UP))
            {
               this.m_hand.visible = true;
               this.m_hand_ySpeed = this.m_hand_ySpeed + (this.m_hand_ySpeed < this.HAND_SPEED && this.m_hand.y < this.BOUNDS_RECT.y + this.BOUNDS_RECT.height?this.HAND_ACCEL:0);
               this.m_upDownID = _loc5_;
               if(this.m_hand.y >= this.BOUNDS_RECT.y + this.BOUNDS_RECT.height || this.m_hand_ySpeed < 0)
               {
                  this.m_hand_ySpeed = 0;
               }
            }
            else if(this.m_upDownID == _loc5_ && this.m_upDownID != -1)
            {
               this.m_hand_ySpeed = 0;
               this.m_upDownID = -1;
            }
            if(this.validateLeftRightID(_loc5_) && this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._LEFT) && !this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._RIGHT))
            {
               this.m_hand.visible = true;
               this.m_hand_xSpeed = this.m_hand_xSpeed - (this.m_hand_xSpeed > -this.HAND_SPEED && this.m_hand.x > this.BOUNDS_RECT.x?this.HAND_ACCEL:0);
               this.m_leftRightID = _loc5_;
               if(this.m_hand.x <= this.BOUNDS_RECT.x || this.m_hand_xSpeed > 0)
               {
                  this.m_hand_xSpeed = 0;
               }
            }
            else if(this.validateLeftRightID(_loc5_) && this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._RIGHT) && !this.m_players[_loc5_].IsDown(this.m_players[_loc5_]._LEFT))
            {
               this.m_hand.visible = true;
               this.m_hand_xSpeed = this.m_hand_xSpeed + (this.m_hand_xSpeed < this.HAND_SPEED && this.m_hand.x < this.BOUNDS_RECT.x + this.BOUNDS_RECT.width?this.HAND_ACCEL:0);
               this.m_leftRightID = _loc5_;
               if(this.m_hand.x >= this.BOUNDS_RECT.x + this.BOUNDS_RECT.width || this.m_hand_xSpeed < 0)
               {
                  this.m_hand_xSpeed = 0;
               }
            }
            else if(this.m_leftRightID == _loc5_ && this.m_leftRightID != -1)
            {
               this.m_hand_xSpeed = 0;
               this.m_leftRightID = -1;
            }
            _loc5_++;
         }
         if(!_loc2_)
         {
            this.m_startLetGo = true;
         }
         if(!_loc4_)
         {
            this.m_backLetGo = true;
         }
         if(!_loc3_)
         {
            this.m_selectLetGo = true;
         }
         else if(_loc3_ && this.m_selectLetGo)
         {
            this.m_selectLetGo = false;
         }
         this.move();
      }
      
      protected function checkHit(param1:KeyboardEvent) : void
      {
         var _loc4_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.m_targetMC.root == null)
         {
            this.killEvents();
         }
         else
         {
            _loc4_ = false;
            _loc2_ = 0;
            while(_loc2_ < this.m_buttons.length && !_loc4_)
            {
               _loc3_ = 0;
               while(_loc3_ < this.m_players.length)
               {
                  if(this.m_players[_loc3_].IsDown(this.m_players[_loc3_]._BUTTON1) && this.m_backLetGo)
                  {
                     if(this.m_backFunc != null)
                     {
                        if(this.m_autoKillEvents)
                        {
                           this.killEvents();
                        }
                        this.m_backFunc(null);
                        return;
                     }
                  }
                  _loc3_++;
               }
               if(this.checkBounds(this.m_buttons[_loc2_].ButtonInstance) && this.m_hand.visible)
               {
                  if(this.m_rollOverID != _loc2_)
                  {
                     if(this.m_rollOverID != -1)
                     {
                        this.m_buttons[this.m_rollOverID].rollout();
                     }
                     this.m_buttons[_loc2_].rollover();
                  }
                  this.m_rollOverID = _loc2_;
                  _loc4_ = true;
                  _loc3_ = 0;
                  while(_loc3_ < this.m_players.length)
                  {
                     if(this.m_selectLetGo && this.m_players[_loc3_].IsDown(this.m_players[_loc3_]._BUTTON2) || this.m_players[_loc3_].IsDown(this.m_players[_loc3_]._START) && this.m_startLetGo)
                     {
                        this.m_buttons[_loc2_].click();
                        this.resetControlsLetGo();
                        return;
                     }
                     _loc3_++;
                  }
               }
               _loc2_++;
            }
            this.evaluateExtraButtons();
            if(!_loc4_)
            {
               if(this.m_rollOverID != -1)
               {
                  this.m_buttons[this.m_rollOverID].rollout();
               }
               this.m_rollOverID = -1;
            }
         }
      }
      
      protected function evaluateExtraButtons() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.m_clickEventClipsCheckBounds.length)
         {
            if(this.checkBounds(this.m_clickEventClipsCheckBounds[_loc1_]) && this.m_hand.visible && this.m_selectLetGo)
            {
               _loc2_ = 0;
               while(_loc2_ < this.m_players.length)
               {
                  if(this.m_selectLetGo && this.m_players[_loc2_].IsDown(this.m_players[_loc2_]._BUTTON2))
                  {
                     this.m_clickEventClipsCheckBounds[_loc1_].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                  }
                  _loc2_++;
               }
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.m_clickEventClipsHitTest.length)
         {
            if(this.m_hand.hitTestObject(this.m_clickEventClipsHitTest[_loc1_]) && this.m_hand.visible && this.m_selectLetGo)
            {
               _loc2_ = 0;
               while(_loc2_ < this.m_players.length)
               {
                  if(this.m_selectLetGo && this.m_players[_loc2_].IsDown(this.m_players[_loc2_]._BUTTON2))
                  {
                     this.m_clickEventClipsHitTest[_loc1_].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                  }
                  _loc2_++;
               }
            }
            _loc1_++;
         }
      }
      
      protected function checkBounds(param1:DisplayObject) : Boolean
      {
         var _loc2_:Rectangle = param1.getBounds(param1.parent);
         return param1.visible && _loc2_.containsPoint(new Point(this.m_hand.x,this.m_hand.y));
      }
   }
}
