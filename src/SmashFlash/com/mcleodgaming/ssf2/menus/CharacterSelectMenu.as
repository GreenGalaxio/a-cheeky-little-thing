package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.Chip;
   import com.mcleodgaming.ssf2.controllers.Game;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.util.DisplayObjectTable;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class CharacterSelectMenu extends Menu
   {
       
      
      protected var m_playerChips:Vector.<Chip>;
      
      protected var draggingMC:MovieClip;
      
      protected var gameMode:uint;
      
      protected var displayObjectTable:DisplayObjectTable;
      
      protected var keyPadMapping:Array;
      
      protected var m_backOverride:Function;
      
      public function CharacterSelectMenu(param1:String)
      {
         super();
         m_subMenu = Main.getLibraryMC(param1);
         m_container.addChild(m_subMenu);
         this.m_backOverride = null;
         this.draggingMC = null;
         this.gameMode = Mode.VS;
         this.m_playerChips = null;
         this.keyPadMapping = new Array();
         this.keyPadMapping["btn_abc"] = "AxXxBxXxCxXxaxXxbxXxc".split("xXx");
         this.keyPadMapping["btn_def"] = "DxXxExXxFxXxdxXxexXxf".split("xXx");
         this.keyPadMapping["btn_ghi"] = "GxXxHxXxIxXxgxXxhxXxi".split("xXx");
         this.keyPadMapping["btn_jkl"] = "JxXxKxXxLxXxjxXxkxXxl".split("xXx");
         this.keyPadMapping["btn_mno"] = "MxXxNxXxOxXxmxXxnxXxo".split("xXx");
         this.keyPadMapping["btn_pqrs"] = "PxXxQxXxRxXxSxXxpxXxqxXxrxXxs".split("xXx");
         this.keyPadMapping["btn_tuv"] = "TxXxUxXxVxXxtxXxuxXxv".split("xXx");
         this.keyPadMapping["btn_wxyz"] = "WxXxXxXxYxXxZxXxwxXxxxXxyxXxz".split("xXx");
         this.keyPadMapping["btn_misc"] = "\"xXx#xXx$xXx%xXx&xXx\'xXx(xXx)xXx*xXx+xXx,xXx-xXx.xXx/xXx0xXx1xXx2xXx3xXx4xXx5xXx6xXx7xXx8xXx9xXx:xXx;xXx<xXx=xXx>xXx?xXx@xXx[xXx\\xXx]xXx^xXx_xXx`xXx{xXx|xXx}xXx~".split("xXx");
         var _loc2_:int = 1;
         while(m_subMenu.charSelection["display" + _loc2_] != null)
         {
            m_subMenu.charSelection["display" + _loc2_].pid = _loc2_;
            m_subMenu.charSelection["display" + _loc2_].levelDisplay.dragging = false;
            m_subMenu.charSelection["display" + _loc2_].pic.mouseChildren = false;
            m_subMenu.charSelection["display" + _loc2_].pic.mouseEnabled = false;
            m_subMenu.charSelection["display" + _loc2_].flag.mouseChildren = false;
            m_subMenu.charSelection["display" + _loc2_].flag.visible = false;
            m_subMenu.charSelection["display" + _loc2_].nameDisplay.nameTxt.text = "P" + _loc2_;
            m_subMenu.charSelection["display" + _loc2_].nameDisplay.delayTimer = 0;
            _loc2_++;
         }
         m_subMenu.charSelection.charSelect.cxp.characterID = "xp";
         m_subMenu.charSelection.charSelect.c0.characterID = "rand_mc";
         m_subMenu.charSelection.charSelect.c1.characterID = "mario";
         m_subMenu.charSelection.charSelect.c2.characterID = "kirby";
         m_subMenu.charSelection.charSelect.c3.characterID = "link";
         m_subMenu.charSelection.charSelect.c4.characterID = "sonic";
         m_subMenu.charSelection.charSelect.c5.characterID = "lloyd";
         m_subMenu.charSelection.charSelect.c6.characterID = "ichigo";
         m_subMenu.charSelection.charSelect.c7.characterID = "naruto";
         m_subMenu.charSelection.charSelect.c8.characterID = "megaman";
         m_subMenu.charSelection.charSelect.c9.characterID = "sora";
         m_subMenu.charSelection.charSelect.c10.characterID = "ness";
         m_subMenu.charSelection.charSelect.c11.characterID = "tails";
         m_subMenu.charSelection.charSelect.c12.characterID = "goku";
         m_subMenu.charSelection.charSelect.c13.characterID = "wario";
         m_subMenu.charSelection.charSelect.c14.characterID = "peach";
         m_subMenu.charSelection.charSelect.c15.characterID = "blackmage";
         m_subMenu.charSelection.charSelect.c16.characterID = "pikachu";
         m_subMenu.charSelection.charSelect.c17.characterID = "fox";
         m_subMenu.charSelection.charSelect.c18.characterID = "yoshi";
         m_subMenu.charSelection.charSelect.c19.characterID = "donkeykong";
         m_subMenu.charSelection.charSelect.c20.characterID = "captainfalcon";
         m_subMenu.charSelection.charSelect.c21.characterID = "zelda";
         m_subMenu.charSelection.charSelect.c22.characterID = "jigglypuff";
         m_subMenu.charSelection.charSelect.c23.characterID = "metaknight";
         m_subMenu.charSelection.charSelect.c24.characterID = "marth";
         m_subMenu.charSelection.charSelect.c25.characterID = "bowser";
         m_subMenu.charSelection.charSelect.c25.visible = false;
         m_subMenu.charSelection.charSelect.c26.characterID = "samus";
         m_subMenu.charSelection.charSelect.c27.characterID = "bomberman";
         m_subMenu.charSelection.charSelect.c28.characterID = "zamus";
         m_subMenu.charSelection.charSelect.c29.characterID = "gameandwatch";
         m_subMenu.charSelection.charSelect.c29.visible = false;
         m_subMenu.charSelection.charSelect.c30.characterID = "chibirobo";
         this.displayObjectTable = new DisplayObjectTable(3,new Rectangle(-25,14,56,55));
         this.displayObjectTable.insertObject(0,m_subMenu.charSelection.charSelect.c1);
         this.displayObjectTable.insertObject(0,m_subMenu.charSelection.charSelect.c19);
         this.displayObjectTable.insertObject(0,m_subMenu.charSelection.charSelect.c3);
         this.displayObjectTable.insertObject(0,m_subMenu.charSelection.charSelect.c2);
         this.displayObjectTable.insertObject(0,m_subMenu.charSelection.charSelect.c26);
         this.displayObjectTable.insertObject(0,m_subMenu.charSelection.charSelect.c8);
         this.displayObjectTable.insertObject(0,m_subMenu.charSelection.charSelect.c17);
         this.displayObjectTable.insertObject(0,m_subMenu.charSelection.charSelect.c10);
         this.displayObjectTable.insertObject(0,m_subMenu.charSelection.charSelect.c16);
         this.displayObjectTable.insertObject(0,m_subMenu.charSelection.charSelect.c4);
         this.displayObjectTable.insertObject(1,m_subMenu.charSelection.charSelect.c14);
         this.displayObjectTable.insertObject(1,m_subMenu.charSelection.charSelect.c13);
         this.displayObjectTable.insertObject(1,m_subMenu.charSelection.charSelect.c21);
         this.displayObjectTable.insertObject(1,m_subMenu.charSelection.charSelect.c23);
         this.displayObjectTable.insertObject(1,m_subMenu.charSelection.charSelect.c28);
         this.displayObjectTable.insertObject(1,m_subMenu.charSelection.charSelect.c27);
         this.displayObjectTable.insertObject(1,m_subMenu.charSelection.charSelect.c20);
         this.displayObjectTable.insertObject(1,m_subMenu.charSelection.charSelect.c15);
         this.displayObjectTable.insertObject(1,m_subMenu.charSelection.charSelect.c22);
         this.displayObjectTable.insertObject(1,m_subMenu.charSelection.charSelect.c11);
         this.displayObjectTable.insertObject(2,m_subMenu.charSelection.charSelect.c18);
         this.displayObjectTable.insertObject(2,m_subMenu.charSelection.charSelect.c24);
         this.displayObjectTable.insertObject(2,m_subMenu.charSelection.charSelect.c5);
         this.displayObjectTable.insertObject(2,m_subMenu.charSelection.charSelect.c30);
         this.displayObjectTable.insertObject(2,m_subMenu.charSelection.charSelect.c29);
         this.displayObjectTable.insertObject(2,m_subMenu.charSelection.charSelect.c0);
         this.displayObjectTable.insertObject(2,m_subMenu.charSelection.charSelect.c9);
         this.displayObjectTable.insertObject(2,m_subMenu.charSelection.charSelect.c6);
         this.displayObjectTable.insertObject(2,m_subMenu.charSelection.charSelect.c7);
         this.displayObjectTable.insertObject(2,m_subMenu.charSelection.charSelect.c12);
         this.displayObjectTable.fixDepths();
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         m_subMenu.charSelection.charSelect.cxp.visible = false;
      }
      
      public function get BackOverride() : Function
      {
         return this.m_backOverride;
      }
      
      public function set BackOverride(param1:Function) : void
      {
         this.m_backOverride = param1;
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
         }
         super.makeEvents();
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.backMain_CLICK);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.MOUSE_OVER,this.backMain_OVER);
         var _loc1_:int = 1;
         while(m_subMenu.charSelection["display" + _loc1_] != null)
         {
            m_subMenu.charSelection["display" + _loc1_].levelDisplay.levelHandle.addEventListener(MouseEvent.MOUSE_DOWN,this.levelHandle_MOUSE_DOWN);
            m_subMenu.charSelection["display" + _loc1_].flag.addEventListener(MouseEvent.CLICK,this.flag_MOUSE_CLICK);
            m_subMenu.charSelection["display" + _loc1_].controlType.addEventListener(MouseEvent.CLICK,this.controlType_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nextExp.addEventListener(MouseEvent.CLICK,this.nextExp_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.btn_keypad.addEventListener(MouseEvent.CLICK,this.namesDisplay_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_abc.addEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_def.addEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_ghi.addEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_jkl.addEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_mno.addEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_pqrs.addEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_tuv.addEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_wxyz.addEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_misc.addEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_done.addEventListener(MouseEvent.CLICK,this.namesDisplayDone_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.addEventListener(Event.ENTER_FRAME,this.runKeyPadDelayTimer);
            m_subMenu.charSelection["display" + _loc1_].charPortrait.addEventListener(MouseEvent.CLICK,this.nextCostume_CLICK);
            Main.Root.stage.addEventListener(MouseEvent.MOUSE_UP,this.levelHandle_MOUSE_UP);
            Main.Root.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.levelHandle_MOUSE_MOVE);
            _loc1_++;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerChips.length)
         {
            this.m_playerChips[_loc2_].makeEvents();
            this.m_playerChips[_loc2_].setCurrentGame(GameController.currentGame);
            _loc2_++;
         }
         if(GameController.currentGame)
         {
            GameController.currentGame.makeEvents();
         }
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.backMain_CLICK);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.backMain_OVER);
         var _loc1_:int = 1;
         while(m_subMenu.charSelection["display" + _loc1_] != null)
         {
            m_subMenu.charSelection["display" + _loc1_].levelDisplay.levelHandle.removeEventListener(MouseEvent.MOUSE_DOWN,this.levelHandle_MOUSE_DOWN);
            m_subMenu.charSelection["display" + _loc1_].flag.removeEventListener(MouseEvent.CLICK,this.flag_MOUSE_CLICK);
            m_subMenu.charSelection["display" + _loc1_].controlType.removeEventListener(MouseEvent.CLICK,this.controlType_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nextExp.removeEventListener(MouseEvent.CLICK,this.nextExp_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.btn_keypad.removeEventListener(MouseEvent.CLICK,this.namesDisplay_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_abc.removeEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_def.removeEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_ghi.removeEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_jkl.removeEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_mno.removeEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_pqrs.removeEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_tuv.removeEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_wxyz.removeEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_misc.removeEventListener(MouseEvent.CLICK,this.namesKeypad_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.nameKeyPad.btn_done.removeEventListener(MouseEvent.CLICK,this.namesDisplayDone_CLICK);
            m_subMenu.charSelection["display" + _loc1_].nameDisplay.removeEventListener(Event.ENTER_FRAME,this.runKeyPadDelayTimer);
            m_subMenu.charSelection["display" + _loc1_].charPortrait.removeEventListener(MouseEvent.CLICK,this.nextCostume_CLICK);
            Main.Root.stage.removeEventListener(MouseEvent.MOUSE_UP,this.levelHandle_MOUSE_UP);
            Main.Root.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.levelHandle_MOUSE_MOVE);
            _loc1_++;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerChips.length)
         {
            this.m_playerChips[_loc2_].killEvents();
            _loc2_++;
         }
         if(GameController.currentGame)
         {
            GameController.currentGame.killEvents();
         }
      }
      
      override public function show() : void
      {
         MenuController.CurrentCharacterSelectMenu = this;
         this.updateIcons();
         super.show();
      }
      
      protected function updateIcons() : void
      {
         this.displayObjectTable.spaceObjects();
         if(!Main.DEBUG)
         {
            m_subMenu.charSelection.charSelect.c22.visible = SaveData.Unlocks.jigglypuff == true;
            m_subMenu.charSelection.charSelect.c20.visible = SaveData.Unlocks.captainfalcon == true;
            m_subMenu.charSelection.charSelect.c25.visible = false;
            m_subMenu.charSelection.charSelect.c29.visible = false;
         }
         m_subMenu.charSelection.charSelect.cxp.visible = Main.DEBUG;
      }
      
      public function reset() : void
      {
         MenuController.CurrentCharacterSelectMenu = this;
         m_subMenu.readyToFight.visible = false;
         this.updateIcons();
         if(GameController.currentGame)
         {
            trace("ROGUE GAME IN EXISTENCE IN CHARSELECTMENU");
         }
         GameController.currentGame = new Game(m_subMenu,this.gameMode);
         this.initChips();
         GameController.currentGame.loadSavedVSOptions();
         GameController.currentGame.updateDisplay();
      }
      
      protected function initChips() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Chip = null;
         if(this.m_playerChips == null)
         {
            this.m_playerChips = new Vector.<Chip>();
            _loc1_ = 0;
            _loc1_ = 0;
            while(_loc1_ < Main.MAXPLAYERS)
            {
               _loc2_ = new Chip(GameController.currentGame,m_subMenu.charSelection.charSelect["chip" + (_loc1_ + 1)],_loc1_ + 1);
               m_subMenu.charSelection.charSelect["p" + (_loc1_ + 1) + "Chip"] = _loc2_;
               this.m_playerChips.push(_loc2_);
               _loc1_++;
            }
         }
      }
      
      public function resetScreen() : void
      {
         var _loc1_:int = 0;
         if(GameController.currentGame)
         {
            _loc1_ = 1;
            while(_loc1_ <= Main.MAXPLAYERS)
            {
               GameController.currentGame.resetChipPosition(_loc1_);
               GameController.currentGame.removePic(_loc1_);
               _loc1_++;
            }
         }
      }
      
      public function backMain_CLICK(param1:MouseEvent) : void
      {
         this.resetScreen();
         GameController.currentGame.killEvents();
         GameController.currentGame = null;
         SoundQueue.instance.playSoundEffect("menu_back");
         removeSelf();
      }
      
      public function backMain_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      protected function levelHandle_MOUSE_DOWN(param1:MouseEvent) : void
      {
         if(this.draggingMC != null)
         {
            return;
         }
         var _loc2_:MovieClip = null;
         var _loc3_:int = 1;
         while(m_subMenu.charSelection["display" + _loc3_] != null)
         {
            if(param1.currentTarget == m_subMenu.charSelection["display" + _loc3_].levelDisplay.levelHandle)
            {
               _loc2_ = MovieClip(param1.currentTarget);
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            _loc2_.dragging = true;
            _loc2_.startDrag(true,new Rectangle(_loc2_.x,-54,0,50));
            this.draggingMC = _loc2_;
         }
      }
      
      protected function levelHandle_MOUSE_UP(param1:MouseEvent) : void
      {
         if(this.draggingMC != null && this.draggingMC.dragging)
         {
            this.draggingMC.dragging = false;
            this.draggingMC.stopDrag();
            GameController.currentGame.setLevel(MovieClip(this.draggingMC.parent.parent).pid,Math.round(-(this.draggingMC.y + 4) / 50 * 8) + 1);
            SaveData.saveGame();
         }
         else
         {
            this.draggingMC = null;
         }
      }
      
      protected function levelHandle_MOUSE_MOVE(param1:MouseEvent) : void
      {
         if(this.draggingMC != null && this.draggingMC.dragging && m_subMenu.root)
         {
            GameController.currentGame.setLevel(MovieClip(this.draggingMC.parent.parent).pid,Math.round(-(this.draggingMC.y + 4) / 50 * 8) + 1);
         }
         else
         {
            this.draggingMC = null;
         }
      }
      
      public function incLevel(param1:int) : void
      {
         GameController.currentGame.setLevel(param1,GameController.currentGame.PlayerSettings[param1 - 1].level + 1);
      }
      
      protected function flag_MOUSE_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 1;
         while(m_subMenu.charSelection["display" + _loc3_] != null)
         {
            if(param1.currentTarget.parent == m_subMenu.charSelection["display" + _loc3_])
            {
               _loc2_ = MovieClip(param1.currentTarget.parent);
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            SoundQueue.instance.playSoundEffect("menu_hover");
            GameController.currentGame.toggleTeam(_loc2_.pid);
         }
      }
      
      protected function controlType_CLICK(param1:MouseEvent) : void
      {
         if(!(this is VSMenu))
         {
            return;
         }
         var _loc2_:MovieClip = null;
         var _loc3_:int = 1;
         while(m_subMenu.charSelection["display" + _loc3_] != null)
         {
            if(param1.currentTarget.parent == m_subMenu.charSelection["display" + _loc3_])
            {
               _loc2_ = MovieClip(param1.currentTarget.parent);
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            SoundQueue.instance.playSoundEffect("menu_hover");
            GameController.currentGame.toggleControl(_loc2_.pid);
         }
      }
      
      protected function namesKeypad_CLICK(param1:MouseEvent) : void
      {
         var _loc4_:Array = null;
         var _loc5_:TextField = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc9_:* = undefined;
         var _loc2_:MovieClip = null;
         var _loc3_:int = 1;
         while(m_subMenu.charSelection["display" + _loc3_] != null)
         {
            if(param1.currentTarget.parent.parent.parent == m_subMenu.charSelection["display" + _loc3_])
            {
               _loc2_ = MovieClip(param1.currentTarget.parent.parent.parent);
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != null && param1.currentTarget.name && this.keyPadMapping[param1.currentTarget.name])
         {
            _loc4_ = this.keyPadMapping[param1.currentTarget.name];
            _loc5_ = _loc2_.nameDisplay.nameTxt;
            _loc6_ = _loc5_.text == ""?null:_loc5_.text.charAt(_loc5_.text.length - 1);
            _loc7_ = null;
            if(_loc6_ != null)
            {
               for(_loc9_ in this.keyPadMapping)
               {
                  if(this.keyPadMapping[_loc9_].indexOf(_loc6_) >= 0)
                  {
                     if(_loc4_ == this.keyPadMapping[_loc9_])
                     {
                        _loc7_ = this.keyPadMapping[_loc9_];
                     }
                     else
                     {
                        _loc6_ = null;
                     }
                  }
               }
            }
            if(_loc5_.textColor != 16711680)
            {
               _loc6_ = null;
               _loc7_ = null;
            }
            _loc8_ = !_loc6_?_loc4_[0]:_loc4_[(_loc4_.indexOf(_loc6_) + 1) % _loc4_.length];
            if(_loc7_ || _loc5_.length >= 5)
            {
               _loc5_.text = _loc5_.text.substr(0,_loc5_.length - 1) + _loc8_;
            }
            else
            {
               _loc5_.appendText(_loc8_);
            }
            _loc5_.textColor = 16711680;
            _loc2_.nameDisplay.delayTimer = 25;
            SoundQueue.instance.playSoundEffect("menu_hover");
         }
      }
      
      protected function namesDisplay_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 1;
         while(m_subMenu.charSelection["display" + _loc3_] != null)
         {
            if(param1.currentTarget.parent.parent == m_subMenu.charSelection["display" + _loc3_])
            {
               _loc2_ = MovieClip(param1.currentTarget.parent.parent);
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            SoundQueue.instance.playSoundEffect("menu_hover");
            GameController.currentGame.showNamesKeypad(_loc2_.pid);
         }
      }
      
      protected function namesDisplayDone_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 1;
         while(m_subMenu.charSelection["display" + _loc3_] != null)
         {
            if(param1.currentTarget.parent.parent.parent == m_subMenu.charSelection["display" + _loc3_])
            {
               _loc2_ = MovieClip(param1.currentTarget.parent.parent.parent);
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            SoundQueue.instance.playSoundEffect("menu_hover");
            GameController.currentGame.hideNamesKeypad(_loc2_.pid);
         }
      }
      
      protected function runKeyPadDelayTimer(param1:Event) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 1;
         while(m_subMenu.charSelection["display" + _loc3_] != null)
         {
            if(param1.currentTarget.parent == m_subMenu.charSelection["display" + _loc3_])
            {
               _loc2_ = MovieClip(param1.currentTarget.parent);
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            _loc2_.nameDisplay.delayTimer--;
            if(_loc2_.nameDisplay.delayTimer <= 0)
            {
               TextField(_loc2_.nameDisplay.nameTxt).textColor = 15658734;
            }
         }
      }
      
      protected function nextCostume_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 1;
         while(m_subMenu.charSelection["display" + _loc3_] != null)
         {
            if(param1.currentTarget.parent == m_subMenu.charSelection["display" + _loc3_])
            {
               _loc2_ = MovieClip(param1.currentTarget.parent);
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            SoundQueue.instance.playSoundEffect("menu_hover");
            GameController.currentGame.nextCostume(_loc2_.pid);
         }
      }
      
      protected function nextExp_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 1;
         while(m_subMenu.charSelection["display" + _loc3_] != null)
         {
            if(param1.currentTarget.parent == m_subMenu.charSelection["display" + _loc3_])
            {
               _loc2_ = MovieClip(param1.currentTarget.parent);
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            SoundQueue.instance.playSoundEffect("menu_hover");
            GameController.currentGame.incrementExpansion(_loc2_.pid);
         }
      }
   }
}
