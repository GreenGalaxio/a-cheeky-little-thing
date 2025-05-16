package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.display.MovieClip;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   
   public class ControlsButton extends HandButton
   {
       
      
      private var m_currentMC:MovieClip;
      
      private var m_keyVar:String;
      
      private var m_keyName:String;
      
      private var m_playerNum:Number;
      
      private var keyArr:Array;
      
      private var currKey:String = "";
      
      private var currKeyNum:Number = 0;
      
      public function ControlsButton(param1:MovieClip, param2:MovieClip, param3:String, param4:String, param5:Number)
      {
         super(param2);
         this.m_currentMC = param1;
         this.m_keyName = param3;
         this.m_keyVar = param4;
         this.m_playerNum = param5;
         this.keyArr = new Array();
         this.keyArr[0] = "None";
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
         this.keyArr[96] = "Numpad 0";
         this.keyArr[97] = "Numpad 1";
         this.keyArr[98] = "Numpad 2";
         this.keyArr[99] = "Numpad 3";
         this.keyArr[100] = "Numpad 4";
         this.keyArr[101] = "Numpad 5";
         this.keyArr[102] = "Numpad 6";
         this.keyArr[103] = "Numpad 7";
         this.keyArr[104] = "Numpad 8";
         this.keyArr[105] = "Numpad 9";
         this.keyArr[106] = "*";
         this.keyArr[107] = "+";
         this.keyArr[13] = "Enter";
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
         this.keyArr[8] = "Backspace";
         this.keyArr[9] = "Tab";
         this.keyArr[12] = "Clear";
         this.keyArr[16] = "Shift";
         this.keyArr[17] = "Ctrl";
         this.keyArr[20] = "Caps Lock";
         this.keyArr[27] = "Esc";
         this.keyArr[32] = "Space";
         this.keyArr[33] = "Page Up";
         this.keyArr[34] = "Page Down";
         this.keyArr[35] = "End";
         this.keyArr[36] = "Home";
         this.keyArr[37] = "Left Arrow";
         this.keyArr[38] = "Up Arrow";
         this.keyArr[39] = "Right Arrow";
         this.keyArr[40] = "Down Arrow";
         this.keyArr[45] = "Insert";
         this.keyArr[46] = "Delete";
         this.keyArr[47] = "Help";
         this.keyArr[144] = "Num Lock";
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
      
      public function setPlayer(param1:Number) : void
      {
         this.m_playerNum = param1;
      }
      
      override protected function button_ROLLOVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_button.gotoAndStop("_over");
      }
      
      override protected function button_ROLLOUT(param1:MouseEvent) : void
      {
         m_button.gotoAndStop("_up");
      }
      
      override protected function button_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         this.m_currentMC.keySetter.currKey = this.m_keyName;
         this.m_currentMC.keySetter.currKeyNum = SaveData["Controller" + this.m_playerNum][this.m_keyVar];
         this.m_currentMC.keySetter.visible = true;
         this.m_currentMC.keySetter.blocker.useHandCursor = false;
         this.m_currentMC.keySetter.keyVal.text = this.keyArr[this.currKeyNum];
         this.m_currentMC.keySetter.currKey_txt.text = this.currKey;
         this.m_currentMC.keySetter.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyListener);
         MenuController.controlsMenu.selectHand.enabled = false;
      }
      
      private function exitScreen() : void
      {
         MenuController.controlsMenu.updateControls();
         this.m_currentMC.keySetter.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.keyListener);
         this.m_currentMC.keySetter.visible = false;
         MenuController.controlsMenu.resetControlsLetGo();
         MenuController.controlsMenu.selectHand.resetControlsLetGo();
         MenuController.controlsMenu.selectHand.enabled = true;
      }
      
      private function keyListener(param1:KeyboardEvent) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Number = param1.keyCode;
         if(this.keyArr[_loc2_] != undefined && this.keyArr[_loc2_] != null)
         {
            _loc3_ = new Array("_UP","_DOWN","_LEFT","_RIGHT","_JUMP","_BUTTON1","_BUTTON2","_SHIELD","_SHIELD2","_TAUNT","_START","_GRAB","_JUMP2","_C_UP","_C_DOWN","_C_LEFT","_C_RIGHT","_DASH");
            if(_loc2_ != 27)
            {
               if(_loc2_ == 46)
               {
                  SaveData["Controller" + MenuController.controlsMenu.playNum][this.m_keyVar] = 0;
               }
               else
               {
                  SaveData["Controller" + MenuController.controlsMenu.playNum][this.m_keyVar] = _loc2_;
                  _loc4_ = 1;
                  while(_loc4_ <= Main.MAXPLAYERS)
                  {
                     _loc5_ = 0;
                     while(_loc5_ < _loc3_.length)
                     {
                        if(_loc4_ != MenuController.controlsMenu.playNum || _loc4_ == MenuController.controlsMenu.playNum && this.m_keyVar != _loc3_[_loc5_])
                        {
                           if(SaveData["Controller" + _loc4_][_loc3_[_loc5_]] == _loc2_)
                           {
                              SaveData["Controller" + _loc4_][_loc3_[_loc5_]] = 0;
                           }
                        }
                        _loc5_++;
                     }
                     _loc4_++;
                  }
               }
            }
            this.exitScreen();
         }
      }
   }
}
