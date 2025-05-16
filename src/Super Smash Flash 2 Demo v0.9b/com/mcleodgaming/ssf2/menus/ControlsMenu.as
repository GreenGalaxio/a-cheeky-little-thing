package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.ControlsButton;
   import com.mcleodgaming.ssf2.controllers.ControlsSelectHand;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import com.mcleodgaming.ssf2.util.SaveData;
   import fl.controls.CheckBox;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ControlsMenu extends Menu
   {
       
      
      public var playNum:int;
      
      private var keyArr:Array;
      
      public var selectHand:ControlsSelectHand;
      
      private var controlsButtons:Vector.<ControlsButton>;
      
      private var m_tapJumpCheckBox:CheckBox;
      
      private var m_autoDashCheckBox:CheckBox;
      
      private var m_dtDashCheckBox:CheckBox;
      
      private var m_autoDashTxt:TextField;
      
      private var m_dtDashTxt:TextField;
      
      public function ControlsMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_controls");
         this.m_tapJumpCheckBox = m_subMenu.tapJump;
         this.m_autoDashCheckBox = m_subMenu.autoDash;
         this.m_autoDashTxt = m_subMenu.autoDashTxt;
         this.m_dtDashCheckBox = m_subMenu.dtapDash;
         this.m_dtDashTxt = m_subMenu.dtapDashTxt;
         m_subMenu.keySetter.visible = false;
         this.playNum = 1;
         this.keyArr = new Array();
         this.initKeys();
         this.controlsButtons = new Vector.<ControlsButton>();
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k1,"Up","_UP",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k2,"Jump","_JUMP",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k3,"Pause","_START",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k4,"Grab","_GRAB",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k5,"Shield","_SHIELD",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k6,"Left","_LEFT",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k7,"Right","_RIGHT",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k8,"Taunt","_TAUNT",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k9,"Standard Attack","_BUTTON2",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k10,"Down","_DOWN",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k11,"Special Attack","_BUTTON1",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k12,"Jump","_JUMP2",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k13,"C-Stick Up","_C_UP",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k14,"C-Stick Down","_C_DOWN",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k15,"C-Stick Left","_C_LEFT",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k16,"C-Stick Right","_C_RIGHT",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k17,"Dash Button","_DASH",this.playNum));
         this.controlsButtons.push(new ControlsButton(m_subMenu,m_subMenu.k18,"Shield Button","_SHIELD2",this.playNum));
         m_subMenu.key_up.mouseEnabled = false;
         m_subMenu.key_down.mouseEnabled = false;
         m_subMenu.key_left.mouseEnabled = false;
         m_subMenu.key_right.mouseEnabled = false;
         m_subMenu.key_jump.mouseEnabled = false;
         m_subMenu.key_a.mouseEnabled = false;
         m_subMenu.key_b.mouseEnabled = false;
         m_subMenu.key_grab.mouseEnabled = false;
         m_subMenu.key_shield.mouseEnabled = false;
         m_subMenu.key_taunt.mouseEnabled = false;
         m_subMenu.key_pause.mouseEnabled = false;
         m_subMenu.key_jump2.mouseEnabled = false;
         m_subMenu.key_cup.mouseEnabled = false;
         m_subMenu.key_cdown.mouseEnabled = false;
         m_subMenu.key_cleft.mouseEnabled = false;
         m_subMenu.key_cright.mouseEnabled = false;
         m_subMenu.key_dash.mouseEnabled = false;
         m_subMenu.key_shield2.mouseEnabled = false;
         this.updateControls();
         this.updateCurrPlayer();
         m_container.addChild(m_subMenu);
         this.selectHand = new ControlsSelectHand(m_subMenu,this.controlsButtons,this.back_CLICK);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.p1Controls_btn);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.p2Controls_btn);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.p3Controls_btn);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.p4Controls_btn);
         this.selectHand.addClickEventClipHitTest(m_subMenu.bg_top.back_btn);
         this.selectHand.addClickEventClipHitTest(m_subMenu.bg_top.home_btn);
         initMenuMappings();
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
      }
      
      public function get AutoDashCheckBox() : CheckBox
      {
         return this.m_autoDashCheckBox;
      }
      
      public function get DTDashCheckBox() : CheckBox
      {
         return this.m_dtDashCheckBox;
      }
      
      public function get TapJumpCheckBox() : CheckBox
      {
         return this.m_tapJumpCheckBox;
      }
      
      private function initKeys() : void
      {
         this.keyArr[0] = "n/a";
         this.keyArr[65] = "A";
         this.keyArr[66] = "B";
         this.keyArr[67] = "C";
         this.keyArr[68] = "D";
         this.keyArr[69] = "E";
         this.keyArr[70] = "F";
         this.keyArr[71] = "G";
         this.keyArr[72] = "H";
         this.keyArr[73] = "I";
         this.keyArr[74] = "J";
         this.keyArr[75] = "K";
         this.keyArr[76] = "L";
         this.keyArr[77] = "M";
         this.keyArr[78] = "N";
         this.keyArr[79] = "O";
         this.keyArr[80] = "P";
         this.keyArr[81] = "Q";
         this.keyArr[82] = "R";
         this.keyArr[83] = "S";
         this.keyArr[84] = "T";
         this.keyArr[85] = "U";
         this.keyArr[86] = "V";
         this.keyArr[87] = "W";
         this.keyArr[88] = "X";
         this.keyArr[89] = "Y";
         this.keyArr[90] = "Z";
         this.keyArr[48] = "0";
         this.keyArr[49] = "1";
         this.keyArr[50] = "2";
         this.keyArr[51] = "3";
         this.keyArr[52] = "4";
         this.keyArr[53] = "5";
         this.keyArr[54] = "6";
         this.keyArr[55] = "7";
         this.keyArr[56] = "8";
         this.keyArr[57] = "9";
         this.keyArr[96] = "Nm0";
         this.keyArr[97] = "Nm1";
         this.keyArr[98] = "Nm2";
         this.keyArr[99] = "Nm3";
         this.keyArr[100] = "Nm4";
         this.keyArr[101] = "Nm5";
         this.keyArr[102] = "Nm6";
         this.keyArr[103] = "Nm7";
         this.keyArr[104] = "Nm8";
         this.keyArr[105] = "Nm9";
         this.keyArr[106] = "*";
         this.keyArr[107] = "+";
         this.keyArr[13] = "Ent";
         this.keyArr[109] = "-";
         this.keyArr[110] = ".";
         this.keyArr[111] = "/";
         this.keyArr[112] = "F1";
         this.keyArr[113] = "F2";
         this.keyArr[114] = "F3";
         this.keyArr[115] = "F4";
         this.keyArr[116] = "F5";
         this.keyArr[117] = "F6";
         this.keyArr[118] = "F7";
         this.keyArr[119] = "F8";
         this.keyArr[120] = "F9";
         this.keyArr[122] = "F11";
         this.keyArr[123] = "F12";
         this.keyArr[124] = "F13";
         this.keyArr[125] = "F14";
         this.keyArr[126] = "F15";
         this.keyArr[8] = "Back";
         this.keyArr[9] = "Tab";
         this.keyArr[12] = "Clr";
         this.keyArr[16] = "Shft";
         this.keyArr[20] = "Caps";
         this.keyArr[27] = "Esc";
         this.keyArr[32] = "Spc";
         this.keyArr[33] = "PUp";
         this.keyArr[34] = "PDw";
         this.keyArr[35] = "End";
         this.keyArr[36] = "Hme";
         this.keyArr[37] = "Larr";
         this.keyArr[38] = "Uarr";
         this.keyArr[39] = "RArr";
         this.keyArr[40] = "DArr";
         this.keyArr[45] = "Ins";
         this.keyArr[46] = "Del";
         this.keyArr[47] = "Help";
         this.keyArr[144] = "NLck";
         this.keyArr[186] = ";:";
         this.keyArr[187] = "=+";
         this.keyArr[188] = ",";
         this.keyArr[189] = "-_";
         this.keyArr[190] = ".";
         this.keyArr[191] = "/?";
         this.keyArr[192] = "`~";
         this.keyArr[219] = "[{";
         this.keyArr[220] = "|";
         this.keyArr[221] = "]}";
         this.keyArr[222] = "\"\'";
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
         }
         super.makeEvents();
         m_subMenu.p1Controls_btn.addEventListener(MouseEvent.CLICK,this.p1Controls_CLICK);
         m_subMenu.p2Controls_btn.addEventListener(MouseEvent.CLICK,this.p2Controls_CLICK);
         m_subMenu.p3Controls_btn.addEventListener(MouseEvent.CLICK,this.p3Controls_CLICK);
         m_subMenu.p4Controls_btn.addEventListener(MouseEvent.CLICK,this.p4Controls_CLICK);
         m_subMenu.p1Controls_btn.addEventListener(MouseEvent.ROLL_OVER,this.pControls_ROLL_OVER);
         m_subMenu.p2Controls_btn.addEventListener(MouseEvent.ROLL_OVER,this.pControls_ROLL_OVER);
         m_subMenu.p3Controls_btn.addEventListener(MouseEvent.ROLL_OVER,this.pControls_ROLL_OVER);
         m_subMenu.p4Controls_btn.addEventListener(MouseEvent.ROLL_OVER,this.pControls_ROLL_OVER);
         var _loc1_:int = 0;
         while(_loc1_ < this.controlsButtons.length)
         {
            this.controlsButtons[_loc1_].makeEvents();
            _loc1_++;
         }
         this.m_tapJumpCheckBox.addEventListener(Event.CHANGE,this.tapJump_CHANGE);
         this.m_autoDashCheckBox.addEventListener(Event.CHANGE,this.autoDash_CHANGE);
         this.m_dtDashCheckBox.addEventListener(Event.CHANGE,this.dtDash_CHANGE);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         this.selectHand.makeEvents();
         this.playNum = 1;
         this.setPlayer(this.playNum);
         this.updateCurrPlayer();
         this.updateControls();
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.p1Controls_btn.removeEventListener(MouseEvent.CLICK,this.p1Controls_CLICK);
         m_subMenu.p2Controls_btn.removeEventListener(MouseEvent.CLICK,this.p2Controls_CLICK);
         m_subMenu.p3Controls_btn.removeEventListener(MouseEvent.CLICK,this.p3Controls_CLICK);
         m_subMenu.p4Controls_btn.removeEventListener(MouseEvent.CLICK,this.p4Controls_CLICK);
         m_subMenu.p1Controls_btn.removeEventListener(MouseEvent.ROLL_OVER,this.pControls_ROLL_OVER);
         m_subMenu.p2Controls_btn.removeEventListener(MouseEvent.ROLL_OVER,this.pControls_ROLL_OVER);
         m_subMenu.p3Controls_btn.removeEventListener(MouseEvent.ROLL_OVER,this.pControls_ROLL_OVER);
         m_subMenu.p4Controls_btn.removeEventListener(MouseEvent.ROLL_OVER,this.pControls_ROLL_OVER);
         var _loc1_:int = 0;
         while(_loc1_ < this.controlsButtons.length)
         {
            this.controlsButtons[_loc1_].makeEvents();
            _loc1_++;
         }
         this.m_tapJumpCheckBox.removeEventListener(Event.CHANGE,this.tapJump_CHANGE);
         this.m_autoDashCheckBox.removeEventListener(Event.CHANGE,this.autoDash_CHANGE);
         this.m_dtDashCheckBox.removeEventListener(Event.CHANGE,this.dtDash_CHANGE);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         this.selectHand.killEvents();
      }
      
      public function updateControls() : void
      {
         m_subMenu.key_up.text = this.keyArr[SaveData["Controller" + this.playNum]._UP];
         m_subMenu.key_down.text = this.keyArr[SaveData["Controller" + this.playNum]._DOWN];
         m_subMenu.key_left.text = this.keyArr[SaveData["Controller" + this.playNum]._LEFT];
         m_subMenu.key_right.text = this.keyArr[SaveData["Controller" + this.playNum]._RIGHT];
         m_subMenu.key_jump.text = this.keyArr[SaveData["Controller" + this.playNum]._JUMP];
         m_subMenu.key_a.text = this.keyArr[SaveData["Controller" + this.playNum]._BUTTON2];
         m_subMenu.key_b.text = this.keyArr[SaveData["Controller" + this.playNum]._BUTTON1];
         m_subMenu.key_grab.text = this.keyArr[SaveData["Controller" + this.playNum]._GRAB];
         m_subMenu.key_shield.text = this.keyArr[SaveData["Controller" + this.playNum]._SHIELD];
         m_subMenu.key_taunt.text = this.keyArr[SaveData["Controller" + this.playNum]._TAUNT];
         m_subMenu.key_pause.text = this.keyArr[SaveData["Controller" + this.playNum]._START];
         m_subMenu.key_jump2.text = this.keyArr[SaveData["Controller" + this.playNum]._JUMP2];
         m_subMenu.key_cup.text = this.keyArr[SaveData["Controller" + this.playNum]._C_UP];
         m_subMenu.key_cdown.text = this.keyArr[SaveData["Controller" + this.playNum]._C_DOWN];
         m_subMenu.key_cleft.text = this.keyArr[SaveData["Controller" + this.playNum]._C_LEFT];
         m_subMenu.key_cright.text = this.keyArr[SaveData["Controller" + this.playNum]._C_RIGHT];
         m_subMenu.key_dash.text = this.keyArr[SaveData["Controller" + this.playNum]._DASH];
         m_subMenu.key_shield2.text = this.keyArr[SaveData["Controller" + this.playNum]._SHIELD2];
         this.m_tapJumpCheckBox.selected = SaveData["Controller" + this.playNum]._TAP_JUMP == 1;
         this.m_autoDashCheckBox.selected = SaveData["Controller" + this.playNum]._AUTO_DASH == 1;
         this.m_dtDashCheckBox.selected = SaveData["Controller" + this.playNum]._DT_DASH == 1;
         if(this.m_autoDashCheckBox.selected)
         {
            this.m_dtDashCheckBox.selected = false;
            this.m_dtDashCheckBox.enabled = false;
            this.m_dtDashTxt.alpha = 0.5;
            SaveData["Controller" + this.playNum]._DT_DASH = false;
         }
         else
         {
            this.m_dtDashTxt.alpha = 1;
            this.m_dtDashCheckBox.enabled = true;
         }
         m_subMenu.t17.text = !!this.m_autoDashCheckBox.selected?"WALK":"DASH";
         this.updateDefaultData();
         this.updateNameData();
      }
      
      private function back_CLICK(param1:MouseEvent) : void
      {
         this.updateControls();
         SaveData.saveGame();
         SoundQueue.instance.playSoundEffect("menu_back");
         if(MenuController.CurrentCharacterSelectMenu && MenuController.CurrentCharacterSelectMenu.Container.parent)
         {
            removeSelf();
         }
         else if(MenuController.groupMenu && MenuController.groupMenu.Container.parent)
         {
            removeSelf();
         }
         else if(MenuController.rulesMenu && MenuController.rulesMenu.Container.parent)
         {
            removeSelf();
         }
         else
         {
            removeSelf();
            MenuController.showOptionsMenu();
         }
      }
      
      private function back_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function pControls_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function p1Controls_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         this.playNum = 1;
         this.setPlayer(this.playNum);
         this.updateCurrPlayer();
         this.updateControls();
      }
      
      private function p2Controls_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         this.playNum = 2;
         this.setPlayer(this.playNum);
         this.updateCurrPlayer();
         this.updateControls();
      }
      
      private function p3Controls_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         this.playNum = 3;
         this.setPlayer(this.playNum);
         this.updateCurrPlayer();
         this.updateControls();
      }
      
      private function p4Controls_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         this.playNum = 4;
         this.setPlayer(this.playNum);
         this.updateCurrPlayer();
         this.updateControls();
      }
      
      private function setPlayer(param1:Number) : void
      {
         var _loc3_:ControlsButton = null;
         var _loc2_:Number = 0;
         while(_loc2_ < this.controlsButtons.length)
         {
            _loc3_ = this.controlsButtons[_loc2_];
            _loc3_.setPlayer(param1);
            _loc2_++;
         }
         if(GameController.currentGame && GameController.currentGame.PlayerSettings[param1 - 1].name != null)
         {
            m_subMenu.pNameDisplay.pName.text = GameController.currentGame.PlayerSettings[param1 - 1].name;
         }
         else
         {
            m_subMenu.pNameDisplay.pName.text = "P" + param1;
         }
      }
      
      private function updateCurrPlayer() : void
      {
         m_subMenu.p1Controls_btn.bnshadow.visible = this.playNum != 1;
         m_subMenu.p2Controls_btn.bnshadow.visible = this.playNum != 2;
         m_subMenu.p3Controls_btn.bnshadow.visible = this.playNum != 3;
         m_subMenu.p4Controls_btn.bnshadow.visible = this.playNum != 4;
      }
      
      private function updateDefaultData() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ <= Main.MAXPLAYERS)
         {
            SaveData.ControlSettings["player" + _loc1_] = SaveData["Controller" + _loc1_].getControls();
            _loc1_++;
         }
      }
      
      private function updateNameData() : void
      {
         var _loc2_:Object = null;
      }
      
      private function tapJump_CHANGE(param1:Event) : void
      {
         SaveData["Controller" + this.playNum]._TAP_JUMP = !!this.m_tapJumpCheckBox.selected?1:0;
         Main.fixFocus();
      }
      
      private function autoDash_CHANGE(param1:Event) : void
      {
         SaveData["Controller" + this.playNum]._AUTO_DASH = !!this.m_autoDashCheckBox.selected?1:0;
         if(this.m_autoDashCheckBox.selected)
         {
            this.m_dtDashCheckBox.selected = false;
            this.m_dtDashCheckBox.enabled = false;
            this.m_dtDashTxt.alpha = 0.5;
            SaveData["Controller" + this.playNum]._DT_DASH = 0;
         }
         else
         {
            this.m_dtDashTxt.alpha = 1;
            this.m_dtDashCheckBox.enabled = true;
         }
         m_subMenu.t17.text = !!this.m_autoDashCheckBox.selected?"WALK":"DASH";
         Main.fixFocus();
      }
      
      private function dtDash_CHANGE(param1:Event) : void
      {
         SaveData["Controller" + this.playNum]._DT_DASH = !!this.m_dtDashCheckBox.selected?1:0;
         Main.fixFocus();
      }
      
      private function home_CLICK(param1:MouseEvent) : void
      {
         if(MultiplayerManager.Connected)
         {
            MultiplayerManager.disconnect();
         }
         SaveData.saveGame();
         SoundQueue.instance.playSoundEffect("menu_back");
         SoundQueue.instance.stopMusic();
         if(MenuController.CurrentCharacterSelectMenu)
         {
            MenuController.CurrentCharacterSelectMenu.resetScreen();
         }
         if(GameController.currentGame)
         {
            GameController.currentGame.killEvents();
         }
         GameController.currentGame = null;
         MenuController.removeAllMenus();
         MenuController.showTitleMenu();
      }
   }
}
