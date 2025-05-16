package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.enums.ModeFeatures;
   import com.mcleodgaming.ssf2.menus.TargetTestMenu;
   import com.mcleodgaming.ssf2.menus.VSMenu;
   import com.mcleodgaming.ssf2.util.Controller;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class Chip
   {
       
      
      private var HAND_MAX_SPEED:Number = 10;
      
      private var HAND_ACCEL:Number = 1.5;
      
      private var m_chip:MovieClip;
      
      private var m_grabbedChip:Chip;
      
      private var m_hand:MovieClip;
      
      private var m_hand_xSpeed:Number;
      
      private var m_hand_ySpeed:Number;
      
      private var m_keyLetGo:Boolean;
      
      private var m_key2LetGo:Boolean;
      
      private var m_prevCostumeKey:Boolean;
      
      private var m_prevCostumeKeyLetGo:Boolean;
      
      private var m_nextCostumeKey:Boolean;
      
      private var m_nextCostumeKeyLetGo:Boolean;
      
      private var m_game:Game;
      
      private var m_playerID:int;
      
      private var m_lastHit:String;
      
      private var m_pressed:Boolean;
      
      private var m_held:Boolean;
      
      private var m_expansionNum:Number;
      
      private var m_keys:Controller;
      
      private var m_backTimer:FrameTimer;
      
      private var m_handBoundary:Rectangle;
      
      private var m_chipBoundary:Rectangle;
      
      public function Chip(param1:Game, param2:MovieClip, param3:int)
      {
         super();
         this.m_game = param1;
         this.m_chip = param2;
         this.m_grabbedChip = null;
         this.m_playerID = param3;
         this.m_lastHit = null;
         this.m_pressed = false;
         this.m_held = false;
         this.m_expansionNum = 0;
         this.m_hand_xSpeed = 0;
         this.m_hand_ySpeed = 0;
         this.m_keyLetGo = false;
         this.m_key2LetGo = false;
         this.m_prevCostumeKey = false;
         this.m_prevCostumeKeyLetGo = false;
         this.m_nextCostumeKey = false;
         this.m_nextCostumeKeyLetGo = false;
         this.m_hand = MovieClip(this.m_chip.parent.addChild(Main.getLibraryMC("charselect_hand")));
         Utils.tryToGotoAndStop(this.m_hand,"p" + this.m_playerID);
         this.m_hand.visible = false;
         this.m_hand.x = this.m_chip.x;
         this.m_hand.y = this.m_chip.y;
         this.m_keys = SaveData["Controller" + param3];
         this.m_chip.visible = false;
         this.m_backTimer = new FrameTimer(60);
         this.m_handBoundary = new Rectangle(-65,-60,610,355);
         this.m_chipBoundary = new Rectangle(-65,-20,610,310);
      }
      
      public function setCurrentGame(param1:Game) : void
      {
         this.m_game = param1;
      }
      
      public function makeEvents() : void
      {
         this.m_chip.addEventListener(MouseEvent.MOUSE_DOWN,this.press);
         this.m_chip.stage.addEventListener(MouseEvent.MOUSE_UP,this.release);
         this.m_hand.addEventListener(Event.ENTER_FRAME,this.checkGrab);
         this.m_keyLetGo = false;
         this.m_key2LetGo = false;
      }
      
      public function killEvents() : void
      {
         this.m_chip.removeEventListener(MouseEvent.MOUSE_DOWN,this.press);
         this.m_chip.stage.removeEventListener(MouseEvent.MOUSE_UP,this.release);
         this.m_hand.removeEventListener(Event.ENTER_FRAME,this.checkGrab);
      }
      
      public function incrementExpansionNum() : void
      {
         this.m_expansionNum = Main.getNextExpansionCharacter(this.m_expansionNum);
         this.m_game.setPlayer(this.m_playerID,this.m_lastHit,this.m_expansionNum);
      }
      
      public function decrementExpansionNum() : void
      {
         this.m_expansionNum = Main.getPrevExpansionCharacter(this.m_expansionNum);
         this.m_game.setPlayer(this.m_playerID,this.m_lastHit,this.m_expansionNum);
      }
      
      private function checkControls() : void
      {
         if(!(ModeFeatures.hasFeature(ModeFeatures.FORCE_SINGLE_PLAYER,this.m_game.GameMode) && this.m_playerID != 1))
         {
            if(this.m_keys.IsDown(this.m_keys._UP) && !this.m_keys.IsDown(this.m_keys._DOWN))
            {
               this.m_hand.visible = true;
               this.m_hand_ySpeed = this.m_hand_ySpeed - (this.m_hand_ySpeed > -this.HAND_MAX_SPEED && this.m_hand.y > this.m_handBoundary.y?this.HAND_ACCEL:0);
               if(this.m_hand.y <= this.m_handBoundary.y || this.m_hand_ySpeed > 0)
               {
                  this.m_hand_ySpeed = 0;
               }
            }
            else if(this.m_keys.IsDown(this.m_keys._DOWN) && !this.m_keys.IsDown(this.m_keys._UP))
            {
               this.m_hand.visible = true;
               this.m_hand_ySpeed = this.m_hand_ySpeed + (this.m_hand_ySpeed < this.HAND_MAX_SPEED && this.m_hand.y < this.m_handBoundary.y + this.m_handBoundary.height?this.HAND_ACCEL:0);
               if(this.m_hand.y >= this.m_handBoundary.y + this.m_handBoundary.height || this.m_hand_ySpeed < 0)
               {
                  this.m_hand_ySpeed = 0;
               }
            }
            else
            {
               this.m_hand_ySpeed = 0;
            }
            if(this.m_keys.IsDown(this.m_keys._LEFT) && !this.m_keys.IsDown(this.m_keys._RIGHT))
            {
               this.m_hand.visible = true;
               this.m_hand_xSpeed = this.m_hand_xSpeed - (this.m_hand_xSpeed > -this.HAND_MAX_SPEED && this.m_hand.x > this.m_handBoundary.x?this.HAND_ACCEL:0);
               if(this.m_hand.x <= this.m_handBoundary.x || this.m_hand_xSpeed > 0)
               {
                  this.m_hand_xSpeed = 0;
               }
            }
            else if(this.m_keys.IsDown(this.m_keys._RIGHT) && !this.m_keys.IsDown(this.m_keys._LEFT))
            {
               this.m_hand.visible = true;
               this.m_hand_xSpeed = this.m_hand_xSpeed + (this.m_hand_xSpeed < this.HAND_MAX_SPEED && this.m_hand.x < this.m_handBoundary.x + this.m_handBoundary.width?this.HAND_ACCEL:0);
               if(this.m_hand.x >= this.m_handBoundary.x + this.m_handBoundary.width || this.m_hand_xSpeed < 0)
               {
                  this.m_hand_xSpeed = 0;
               }
            }
            else
            {
               this.m_hand_xSpeed = 0;
            }
            if(!this.m_keys.IsDown(this.m_keys._BUTTON2))
            {
               this.m_keyLetGo = true;
            }
            if(!this.m_keys.IsDown(this.m_keys._BUTTON1))
            {
               this.m_key2LetGo = true;
            }
         }
         if(!this.m_keys.IsDown(this.m_keys._GRAB))
         {
            this.m_prevCostumeKeyLetGo = true;
         }
         if(!this.m_keys.IsDown(this.m_keys._SHIELD))
         {
            this.m_nextCostumeKeyLetGo = true;
         }
         this.m_prevCostumeKey = this.m_keys.IsDown(this.m_keys._GRAB);
         this.m_nextCostumeKey = this.m_keys.IsDown(this.m_keys._SHIELD);
         if(this.m_prevCostumeKey && this.m_prevCostumeKeyLetGo)
         {
            this.m_game.prevCostume(this.m_playerID);
            this.m_prevCostumeKeyLetGo = false;
         }
         if(this.m_nextCostumeKey && this.m_nextCostumeKeyLetGo)
         {
            this.m_game.nextCostume(this.m_playerID);
            this.m_nextCostumeKeyLetGo = false;
         }
      }
      
      private function checkOutOfChipBounds() : void
      {
         if(this.m_hand_ySpeed < 0 && this.m_grabbedChip && this.m_grabbedChip.Y < this.m_chipBoundary.y)
         {
            this.m_grabbedChip.Y = this.m_chipBoundary.y;
            this.m_grabbedChip.Held = false;
            this.m_grabbedChip.checkCollision();
            this.m_grabbedChip = null;
            this.m_held = false;
         }
      }
      
      private function move() : void
      {
         this.m_hand.x = this.m_hand.x + this.m_hand_xSpeed;
         this.m_hand.y = this.m_hand.y + this.m_hand_ySpeed;
         if(this.m_hand_ySpeed < 0)
         {
            this.checkOutOfChipBounds();
         }
         if(this.m_held && this.m_grabbedChip != null)
         {
            this.m_grabbedChip.MC.x = this.m_hand.x;
            this.m_grabbedChip.MC.y = this.m_hand.y;
         }
      }
      
      private function checkGrab(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:TextField = null;
         var _loc2_:int = 0;
         if(!(MenuController.rulesMenu && MenuController.rulesMenu.Container.parent))
         {
            if(!this.m_keys.IsDown(this.m_keys._BUTTON1))
            {
               this.m_backTimer.reset();
            }
            else
            {
               this.m_backTimer.tick();
               if(this.m_backTimer.IsComplete)
               {
                  MenuController.CurrentCharacterSelectMenu.backMain_CLICK(null);
                  return;
               }
            }
            if(this.m_playerID == 1)
            {
               this.m_game.ReadyDelay.tick();
            }
            if(this.m_grabbedChip != null && !this.m_grabbedChip.Visible)
            {
               this.m_grabbedChip.Held = false;
               this.m_grabbedChip = null;
            }
            this.checkControls();
            this.move();
            if(this.m_key2LetGo && this.m_chip.visible && this.m_grabbedChip == null && !this.m_held && !this.m_pressed && this.m_hand.visible && this.m_keys.IsDown(this.m_keys._BUTTON1) && this.m_hand.y >= this.m_chipBoundary.y && !this.m_chip.parent.parent["display" + this.m_playerID]["nameDisplay"]["nameKeyPad"].visible)
            {
               this.m_keyLetGo = false;
               this.m_key2LetGo = false;
               this.m_game.setPlayer(this.m_playerID,null);
               this.m_lastHit = null;
               this.m_grabbedChip = this;
               this.m_grabbedChip.Held = true;
               this.m_grabbedChip.MC.x = this.m_hand.x;
               this.m_grabbedChip.MC.y = this.m_hand.y;
            }
            if(this.m_grabbedChip == null && !this.m_held && this.m_keyLetGo && !this.m_pressed && this.m_hand.visible && this.m_hand.hitTestObject(this.m_chip) && this.m_keys.IsDown(this.m_keys._BUTTON2) && this.m_hand.y >= this.m_chipBoundary.y)
            {
               this.m_game.setPlayer(this.m_playerID,null);
               this.m_lastHit = null;
               this.m_grabbedChip = this;
               this.m_key2LetGo = false;
               this.m_keyLetGo = false;
               this.m_grabbedChip.Held = true;
            }
            if(this.m_grabbedChip == null && !this.m_held && this.m_keyLetGo && !this.m_pressed && this.m_hand.visible && this.m_keys.IsDown(this.m_keys._BUTTON2) && this.m_hand.y >= this.m_chipBoundary.y)
            {
               _loc3_ = 1;
               while(_loc3_ <= Main.MAXPLAYERS && !this.m_held)
               {
                  if(_loc3_ != this.m_playerID && !Chip(this.m_chip.parent["p" + _loc3_ + "Chip"]).Held && !Chip(this.m_chip.parent["p" + _loc3_ + "Chip"]).Pressed && this.m_chip.parent["p" + _loc3_ + "Chip"] != null && Chip(this.m_chip.parent["p" + _loc3_ + "Chip"]).MC.visible && Chip(this.m_chip.parent["p" + _loc3_ + "Chip"]).MC.currentLabel == "cpu" && this.m_hand.hitTestObject(Chip(this.m_chip.parent["p" + _loc3_ + "Chip"]).MC))
                  {
                     this.m_game.setPlayer(_loc3_,null);
                     Chip(this.m_chip.parent["p" + _loc3_ + "Chip"]).LastHit = null;
                     this.m_grabbedChip = Chip(this.m_chip.parent["p" + _loc3_ + "Chip"]);
                     this.m_key2LetGo = false;
                     this.m_keyLetGo = false;
                     this.m_held = true;
                     this.m_grabbedChip.Held = true;
                  }
                  _loc3_++;
               }
            }
            if(this.m_grabbedChip != null && this.m_keyLetGo && this.m_held && this.m_keys.IsDown(this.m_keys._BUTTON2))
            {
               this.m_game.updatePositon(this.m_grabbedChip.PlayerID,this.m_grabbedChip.MC.x,this.m_grabbedChip.MC.y);
               this.m_grabbedChip.checkCollision();
               this.m_key2LetGo = false;
               this.m_keyLetGo = false;
               this.m_grabbedChip.Held = false;
               this.m_held = false;
               this.m_grabbedChip = null;
            }
            if(this.m_grabbedChip == null && this.m_hand.visible && this.m_keyLetGo && this.m_keys.IsDown(this.m_keys._BUTTON1))
            {
               if(this.m_chip.parent.parent["display" + this.m_playerID]["nameDisplay"]["nameKeyPad"].visible)
               {
                  if(this.m_key2LetGo)
                  {
                     _loc4_ = this.m_chip.parent.parent["display" + this.m_playerID]["nameDisplay"]["nameTxt"];
                     if(_loc4_.length > 0)
                     {
                        _loc4_.text = _loc4_.text.substr(0,_loc4_.length - 1);
                     }
                     else
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + this.m_playerID]["nameDisplay"]["nameKeyPad"]["btn_done"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                     }
                     this.m_key2LetGo = false;
                  }
               }
            }
            if(this.m_grabbedChip == null && this.m_hand.visible && this.m_keyLetGo && this.m_keys.IsDown(this.m_keys._BUTTON2))
            {
               _loc2_ = 1;
               while(_loc2_ <= Main.MAXPLAYERS && this.m_keyLetGo)
               {
                  if(this.m_keyLetGo && this.m_hand.hitTestObject(this.m_chip.parent.parent.parent["bg_top"]["back_btn"]))
                  {
                     DisplayObject(this.m_chip.parent.parent.parent["bg_top"]["back_btn"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                     this.m_keyLetGo = false;
                  }
                  if(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"].visible)
                  {
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_abc"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_abc"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_abc"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_abc"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_def"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_def"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_ghi"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_ghi"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_jkl"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_jkl"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_mno"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_mno"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_pqrs"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_pqrs"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_tuv"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_tuv"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_wxyz"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_wxyz"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_misc"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_misc"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.checkBoundsKeypad(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_done"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["nameKeyPad"]["btn_done"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                  }
                  else if(this.m_keyLetGo && this.m_hand.hitTestObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["btn_keypad"]))
                  {
                     DisplayObject(this.m_chip.parent.parent["display" + _loc2_]["nameDisplay"]["btn_keypad"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                     this.m_keyLetGo = false;
                  }
                  if(this.m_keyLetGo && MenuController.CurrentCharacterSelectMenu && MenuController.CurrentCharacterSelectMenu is VSMenu)
                  {
                     if(this.m_keyLetGo && this.m_hand.hitTestObject(this.m_chip.parent.parent["incShortcut"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["incShortcut"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.m_hand.hitTestObject(this.m_chip.parent.parent["decShortcut"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["decShortcut"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(MenuController.CurrentCharacterSelectMenu && MenuController.CurrentCharacterSelectMenu is VSMenu && this.m_keyLetGo && this.m_hand.hitTestObject(this.m_chip.parent.parent["bnGameMode"]))
                     {
                        DisplayObject(this.m_chip.parent.parent["bnGameMode"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.m_hand.hitTestObject(this.m_chip.parent.parent.parent["menu_open"]))
                     {
                        DisplayObject(this.m_chip.parent.parent.parent["menu_open"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                  }
                  if(this.m_keyLetGo && MenuController.CurrentCharacterSelectMenu && MenuController.CurrentCharacterSelectMenu is TargetTestMenu)
                  {
                     if(this.m_keyLetGo && this.m_hand.hitTestObject(this.m_chip.parent.parent.parent["decLevel"]))
                     {
                        DisplayObject(this.m_chip.parent.parent.parent["decLevel"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                     if(this.m_keyLetGo && this.m_hand.hitTestObject(this.m_chip.parent.parent.parent["incLevel"]))
                     {
                        DisplayObject(this.m_chip.parent.parent.parent["incLevel"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                  }
                  if(this.m_keyLetGo && GameController.currentGame && ModeFeatures.hasFeature(ModeFeatures.HAS_HOME_BUTTON,GameController.currentGame.GameMode))
                  {
                     if(this.m_keyLetGo && this.m_hand.hitTestObject(this.m_chip.parent.parent.parent["bg_top"]["home_btn"]))
                     {
                        DisplayObject(this.m_chip.parent.parent.parent["bg_top"]["home_btn"]).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        this.m_keyLetGo = false;
                     }
                  }
                  if(this.m_keyLetGo && this.m_chip.parent.parent["display" + _loc2_]["nextExp"].visible && this.m_hand.hitTestObject(this.m_chip.parent.parent["display" + _loc2_].nextExp))
                  {
                     this.m_chip.parent.parent["display" + _loc2_].nextExp.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                     this.m_keyLetGo = false;
                  }
                  if(this.m_keyLetGo && GameController.currentGame && ModeFeatures.hasFeature(ModeFeatures.ALLOW_TEAM_TOGGLE,GameController.currentGame.GameMode) && this.m_chip.parent.parent["display" + _loc2_]["flag"].visible && this.m_hand.hitTestObject(this.m_chip.parent.parent["display" + _loc2_]))
                  {
                     this.m_chip.parent.parent["display" + _loc2_].flag.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                     this.m_keyLetGo = false;
                  }
                  if(this.m_keyLetGo && GameController.currentGame && !ModeFeatures.hasFeature(ModeFeatures.FORCE_SINGLE_PLAYER,GameController.currentGame.GameMode) && MovieClip(this.m_chip.parent.parent["display" + _loc2_].controlType).hitTestObject(this.m_hand))
                  {
                     MovieClip(this.m_chip.parent.parent["display" + _loc2_].controlType).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                     this.m_keyLetGo = false;
                  }
                  if(this.m_keyLetGo && MenuController.CurrentCharacterSelectMenu && this.m_chip.parent.parent["display" + _loc2_]["levelDisplay"].visible && this.m_hand.hitTestObject(this.m_chip.parent.parent["display" + _loc2_]["levelDisplay"]))
                  {
                     MenuController.CurrentCharacterSelectMenu.incLevel(_loc2_);
                     this.m_keyLetGo = false;
                  }
                  if(this.m_keyLetGo && (_loc2_ == this.m_playerID || !this.m_game.PlayerSettings[_loc2_ - 1].human) && !this.m_game.LevelData.teams && this.m_game.PlayerSettings[_loc2_ - 1].character && this.m_chip.parent.parent["display" + _loc2_].pic && MovieClip(MovieClip(this.m_chip.parent.parent["display" + _loc2_].pic).getChildAt(0)).alternateStatsName && this.m_hand.hitTestObject(MovieClip(MovieClip(this.m_chip.parent.parent["display" + _loc2_].pic).getChildAt(0)).hitBox))
                  {
                     this.m_game.setPlayer(_loc2_,MovieClip(MovieClip(this.m_chip.parent.parent["display" + _loc2_].pic).getChildAt(0)).alternateStatsName,this.m_game.PlayerSettings[_loc2_ - 1].expansion);
                     this.m_keyLetGo = false;
                  }
                  if(this.m_keyLetGo && !this.m_chip.parent.parent["display" + _loc2_].charPortrait.alt && (_loc2_ == this.m_playerID || !this.m_game.PlayerSettings[_loc2_ - 1].human) && !this.m_game.LevelData.teams && this.m_game.PlayerSettings[_loc2_ - 1].character && this.m_hand.hitTestObject(this.m_chip.parent.parent["display" + _loc2_].charPortrait) && !MovieClip(MovieClip(this.m_chip.parent.parent["display" + _loc2_].pic).getChildAt(0)).alternateStatsName)
                  {
                     this.m_game.nextCostume(_loc2_);
                     this.m_keyLetGo = false;
                  }
                  _loc2_++;
               }
            }
         }
      }
      
      private function press(param1:MouseEvent) : void
      {
         if(!this.m_held)
         {
            this.m_game.setPlayer(this.m_playerID,null);
            this.m_lastHit = null;
            this.m_pressed = true;
            this.m_chip.startDrag(true,this.m_chipBoundary);
         }
      }
      
      public function checkCollision() : void
      {
         var _loc4_:Point = null;
         var _loc1_:Boolean = false;
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         while(_loc3_ <= 43 && !_loc1_)
         {
            _loc4_ = new Point(0,0);
            _loc4_ = this.m_chip.localToGlobal(_loc4_);
            if(this.m_chip.parent["c" + _loc3_] != undefined && this.checkBounds(MovieClip(this.m_chip.parent["c" + _loc3_])))
            {
               if(this.m_lastHit != this.m_chip.parent["c" + _loc3_].characterID)
               {
                  this.m_lastHit = this.m_chip.parent["c" + _loc3_].characterID;
                  this.m_game.setPlayer(this.m_playerID,this.m_lastHit);
                  this.sayCharacter(this.m_lastHit);
                  _loc2_ = MovieClip(this.m_chip.parent.addChild(Main.getLibraryMC("mgsymbol_charselect")));
                  _loc2_.x = this.m_chip.x;
                  _loc2_.y = this.m_chip.y;
               }
               _loc1_ = true;
            }
            _loc3_++;
         }
         if(!_loc1_)
         {
            if(this.m_chip.parent["cxp"] != undefined && this.checkBounds(MovieClip(this.m_chip.parent["cxp"])) && Main.TotalExpansions > 0)
            {
               if(this.m_lastHit != this.m_chip.parent["cxp"].characterID)
               {
                  this.m_lastHit = this.m_chip.parent["cxp"].characterID;
                  this.m_game.setPlayer(this.m_playerID,this.m_lastHit,this.m_expansionNum);
                  this.sayCharacter(this.m_lastHit);
                  _loc2_ = MovieClip(this.m_chip.parent.addChild(Main.getLibraryMC("mgsymbol_charselect")));
                  _loc2_.x = this.m_chip.x;
                  _loc2_.y = this.m_chip.y;
               }
            }
            else
            {
               this.m_game.setPlayer(this.m_playerID,null);
               this.m_lastHit = null;
            }
         }
      }
      
      private function release(param1:MouseEvent) : void
      {
         if(this.m_pressed)
         {
            this.m_chip.stopDrag();
            this.m_game.updatePositon(this.m_playerID,this.m_chip.x,this.m_chip.y);
            this.checkCollision();
            this.m_pressed = false;
         }
      }
      
      private function checkBounds(param1:MovieClip) : Boolean
      {
         var _loc2_:Rectangle = param1.getRect(param1.parent);
         return _loc2_.containsPoint(new Point(this.m_chip.x,this.m_chip.y)) && param1.visible;
      }
      
      private function checkBoundsKeypad(param1:MovieClip) : Boolean
      {
         var _loc2_:Rectangle = param1.getRect(this.m_hand.parent);
         return _loc2_.containsPoint(new Point(this.m_hand.x,this.m_hand.y)) && param1.visible;
      }
      
      public function get Held() : Boolean
      {
         return this.m_held;
      }
      
      public function set Held(param1:Boolean) : void
      {
         this.m_held = param1;
      }
      
      public function get Pressed() : Boolean
      {
         return this.m_pressed;
      }
      
      public function get PlayerID() : int
      {
         return this.m_playerID;
      }
      
      public function get MC() : MovieClip
      {
         return this.m_chip;
      }
      
      public function get LastHit() : String
      {
         return this.m_lastHit;
      }
      
      public function set LastHit(param1:String) : void
      {
         this.m_lastHit = param1;
      }
      
      public function set ExpansionNum(param1:Number) : void
      {
         this.m_expansionNum = param1;
         if(this.m_expansionNum < 0)
         {
            this.m_expansionNum = 0;
         }
      }
      
      public function get ExpansionNum() : Number
      {
         return this.m_expansionNum;
      }
      
      public function set X(param1:Number) : void
      {
         this.m_chip.x = param1;
      }
      
      public function get X() : Number
      {
         return this.m_chip.x;
      }
      
      public function set Y(param1:Number) : void
      {
         this.m_chip.y = param1;
      }
      
      public function get Y() : Number
      {
         return this.m_chip.y;
      }
      
      public function set Visible(param1:Boolean) : void
      {
         if(!(ModeFeatures.hasFeature(ModeFeatures.FORCE_SINGLE_PLAYER,this.m_game.GameMode) && this.m_playerID != 1))
         {
            this.m_chip.visible = param1;
         }
      }
      
      public function get Visible() : Boolean
      {
         return this.m_chip.visible;
      }
      
      private function sayCharacter(param1:String) : void
      {
         SoundQueue.instance.playSoundEffect("menu_charselect");
         SoundQueue.instance.playVoiceEffect("narrator_" + param1);
      }
   }
}
