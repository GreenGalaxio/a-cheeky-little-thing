package com.mcleodgaming.ssf2.menus
{
   import com.adobe.utils.StringUtil;
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.Version;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.items.AssistTrophyItem;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.items.ItemsListData;
   import com.mcleodgaming.ssf2.items.Pokeball;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.util.Key;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   
   public class FakeDebugConsole extends Menu
   {
       
      
      private var MAX_HISTORY:int = 25;
      
      private var m_enabled:Boolean;
      
      private var m_input:TextField;
      
      private var m_output:TextField;
      
      private var m_history:Array;
      
      private var m_historyIndex:int;
      
      private var m_commands:Array;
      
      private var m_function:Function;
      
      private var m_enterReleased:Boolean;
      
      private var m_upReleased:Boolean;
      
      private var m_downReleased:Boolean;
      
      private var m_controlsCapture:Boolean;
      
      private var m_onlineCapture:Boolean;
      
      private var m_attackStateCapture:Boolean;
      
      private var m_disableKeyCapture:Boolean;
      
      private var m_knockbackCapture:Boolean;
      
      private var m_alerts:Boolean;
      
      public function FakeDebugConsole()
      {
         super();
         m_subMenu = Main.getLibraryMC("debug_console");
         this.m_input = m_subMenu.input;
         this.m_output = m_subMenu.output;
         this.m_output.text = "";
         this.m_historyIndex = 0;
         this.m_history = new Array("");
         this.m_commands = new Array();
         this.m_commands["clear"] = this.clear;
         this.m_commands["exit"] = this.exit;
         this.m_commands["close"] = this.exit;
         this.m_commands["alpha"] = this.alpha;
         this.m_commands["unfocus"] = this.unfocus;
         this.m_commands["capture"] = this.capture;
         this.m_commands["print"] = this.print;
         this.m_commands["generate"] = this.generate;
         this.m_commands["debug"] = this.debug;
         this.m_commands["config"] = this.config;
         this.m_commands["hack"] = this.hack;
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height;
         this.m_enabled = false;
         this.m_enterReleased = true;
         this.m_upReleased = true;
         this.m_downReleased = true;
         this.m_alerts = true;
         this.m_controlsCapture = false;
         this.m_onlineCapture = false;
         this.m_disableKeyCapture = true;
         this.m_attackStateCapture = false;
         this.m_knockbackCapture = false;
         if(Main.DEBUG)
         {
            Main.Root.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.toggleDebugConsole);
         }
      }
      
      public function get ControlsCapture() : Boolean
      {
         return this.m_controlsCapture;
      }
      
      public function get OnlineCapture() : Boolean
      {
         return this.m_onlineCapture;
      }
      
      public function get AttackStateCapture() : Boolean
      {
         return this.m_attackStateCapture;
      }
      
      public function get KnockbackCapture() : Boolean
      {
         return this.m_knockbackCapture;
      }
      
      override public function makeEvents() : void
      {
         super.makeEvents();
         Main.Root.addEventListener(Event.ADDED,this.moveToFront);
         Main.Root.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.submitCommand);
         Main.Root.stage.addEventListener(KeyboardEvent.KEY_UP,this.resetKeys);
      }
      
      override public function show() : void
      {
         Main.setFocus(this.m_input);
         super.show();
         if(this.m_disableKeyCapture)
         {
            Key.endCapture();
         }
         this.m_historyIndex = 0;
         this.clearInput();
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         Main.Root.removeEventListener(Event.ADDED,this.moveToFront);
         Main.Root.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.submitCommand);
         Main.Root.stage.removeEventListener(KeyboardEvent.KEY_UP,this.resetKeys);
      }
      
      private function moveToFront(param1:Event) : void
      {
         if(m_container.parent)
         {
            m_container.parent.setChildIndex(m_container,m_container.parent.numChildren - 1);
         }
      }
      
      override public function removeSelf() : void
      {
         super.removeSelf();
         this.m_enterReleased = true;
         this.m_upReleased = true;
         this.m_downReleased = true;
         m_subMenu.alpha = 1;
         Main.fixFocus();
         if(this.m_disableKeyCapture)
         {
            Key.beginCapture(Main.Root.stage);
         }
      }
      
      private function toggleDebugConsole(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 192)
         {
            if(this.m_enabled)
            {
               this.removeSelf();
               this.m_enabled = !this.m_enabled;
            }
            else if(Main.DEBUG)
            {
               this.show();
               this.m_enabled = !this.m_enabled;
            }
         }
      }
      
      private function resetKeys(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 13 && !this.m_enterReleased)
         {
            this.m_enterReleased = true;
         }
         if(param1.keyCode == 38 && !this.m_upReleased)
         {
            this.m_upReleased = true;
         }
         if(param1.keyCode == 40 && !this.m_downReleased)
         {
            this.m_downReleased = true;
         }
      }
      
      private function submitCommand(param1:KeyboardEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         if(param1.keyCode == 13 && this.m_enterReleased)
         {
            this.m_enterReleased = false;
            _loc2_ = this.cleanString(this.m_input.text);
            if(_loc2_ == "")
            {
               this.writeLine("-No command entered");
            }
            else
            {
               this.m_history[0] = _loc2_;
               this.m_history.unshift("");
               if(this.m_history.length > this.MAX_HISTORY)
               {
                  this.m_history.pop();
               }
               _loc3_ = _loc2_.split(" ");
               _loc4_ = _loc3_[0];
               _loc3_.splice(0,1);
               if(this.m_commands[_loc4_] != null)
               {
                  this.m_commands[_loc4_].apply(null,_loc3_);
               }
               else
               {
                  this.writeLine("Command \'" + _loc4_ + "\' not found");
               }
            }
            this.clearInput();
            this.m_historyIndex = 0;
         }
         else if(param1.keyCode == 38 && this.m_upReleased)
         {
            if(this.m_history.length > 0 && this.m_historyIndex < this.m_history.length - 1)
            {
               this.m_historyIndex++;
               this.m_input.text = this.m_history[this.m_historyIndex];
               this.cursorToEnd();
            }
         }
         else if(param1.keyCode == 40 && this.m_downReleased)
         {
            if(this.m_history.length > 0 && this.m_historyIndex > 0)
            {
               this.m_historyIndex--;
               this.m_input.text = this.m_history[this.m_historyIndex];
               this.cursorToEnd();
            }
         }
      }
      
      private function writeLine(param1:String) : void
      {
         this.m_output.appendText(param1 + "\n");
         this.m_output.scrollV = this.m_output.numLines;
      }
      
      private function cleanString(param1:String) : String
      {
         while(param1.indexOf("  ") >= 0)
         {
            param1 = param1.replace("  "," ");
         }
         while(param1.indexOf("\n") >= 0)
         {
            param1 = param1.replace("\n","");
         }
         while(param1.indexOf("\r") >= 0)
         {
            param1 = param1.replace("\r","");
         }
         param1 = StringUtil.trim(param1);
         return param1;
      }
      
      private function cursorToEnd() : void
      {
         this.m_input.setSelection(this.m_input.text.length,this.m_input.text.length);
      }
      
      private function clearInput() : void
      {
         this.m_input.text = "";
      }
      
      private function exit(... rest) : void
      {
         this.removeSelf();
         this.m_enabled = false;
      }
      
      private function clear(... rest) : void
      {
         this.m_output.text = "";
      }
      
      private function alpha(... rest) : void
      {
         var _loc4_:Number = NaN;
         var _loc2_:Array = new Array();
         while(rest.length > 0 && rest[0].charAt(0) == "-")
         {
            _loc2_.push(rest[0]);
            rest.splice(0,1);
         }
         var _loc3_:String = "Error, alpha expects args [0-1.0]";
         if(rest.length == 0)
         {
            this.writeLine(_loc3_);
         }
         else if(isNaN(parseFloat(rest[0])))
         {
            this.writeLine(_loc3_);
         }
         else
         {
            _loc4_ = parseFloat(rest[0]);
            _loc4_ = Math.min(_loc4_,1);
            _loc4_ = Math.max(_loc4_,0);
            this.writeLine("alpha set to " + _loc4_);
            m_subMenu.alpha = _loc4_;
         }
      }
      
      private function unfocus(... rest) : void
      {
         Main.fixFocus();
      }
      
      private function capture(... rest) : void
      {
         var _loc2_:Array = new Array();
         while(rest.length > 0 && rest[0].charAt(0) == "-")
         {
            _loc2_.push(rest[0]);
            rest.splice(0,1);
         }
         var _loc3_:String = "Error, capture expects args [controls | keyboard | online | attack]";
         if(rest.length == 0)
         {
            this.writeLine(_loc3_);
         }
         else if(rest[0] == "controls")
         {
            if(this.m_controlsCapture)
            {
               this.m_controlsCapture = false;
               this.writeLine("controls capture stopped");
            }
            else
            {
               if(GameController.stageData && GameController.stageData.getPlayer(1))
               {
                  GameController.stageData.getPlayer(1).clearAttackControlsArr();
               }
               this.m_controlsCapture = true;
               this.writeLine("controls capture started for player 1");
            }
         }
         else if(rest[0] == "online")
         {
            if(this.m_onlineCapture)
            {
               this.m_onlineCapture = false;
               this.writeLine("online capture stopped");
            }
            else
            {
               this.m_onlineCapture = true;
               this.writeLine("online capture started");
            }
         }
         else if(rest[0] == "keyboard")
         {
            this.m_disableKeyCapture = Key.CaptureStarted;
            if(this.m_disableKeyCapture)
            {
               this.writeLine("key capture blocked.");
               Key.endCapture();
            }
            else
            {
               this.writeLine("key capture unblocked.");
               Key.beginCapture(Main.Root.stage);
            }
         }
         else if(rest[0] == "attack")
         {
            this.m_attackStateCapture = !this.m_attackStateCapture;
            if(this.m_attackStateCapture)
            {
               this.writeLine("attack capture started");
            }
            else
            {
               this.writeLine("attack capture ended");
            }
         }
         else if(rest[0] == "knockback")
         {
            this.m_knockbackCapture = !this.m_knockbackCapture;
            if(this.m_knockbackCapture)
            {
               this.writeLine("knockback capture started");
            }
            else
            {
               this.writeLine("knockback capture ended");
            }
         }
         else
         {
            this.writeLine(_loc3_);
         }
      }
      
      private function generate(... rest) : void
      {
         var _loc6_:ItemData = null;
         var _loc2_:int = 0;
         var _loc3_:Item = null;
         var _loc4_:Array = new Array();
         while(rest.length > 0 && rest[0].charAt(0) == "-")
         {
            _loc4_.push(rest[0]);
            rest.splice(0,1);
         }
         var _loc5_:String = "Error, generate expects args [assist | pokemon]";
         if(rest.length == 0)
         {
            this.writeLine(_loc5_);
         }
         else if(!GameController.stageData || GameController.stageData.GameEnded)
         {
            this.writeLine("Error, no game detected for generate command");
         }
         else if(rest[0] == "assist")
         {
            if(rest.length <= 1 || isNaN(parseInt(rest[1])))
            {
               this.writeLine("Error parsing assist ID ##");
            }
            else
            {
               rest[1] = Math.max(0,parseInt(rest[1]));
               _loc3_ = GameController.stageData.ItemsRef.generateItemObj(GameController.stageData.ItemsRef.getItemByLinkage("assistTrophy"));
               if(_loc3_)
               {
                  if(_loc4_.indexOf("-rare") >= 0)
                  {
                     AssistTrophyItem(_loc3_).AssistClass = GameController.stageData.AssistsRare[Math.min(GameController.stageData.AssistsRare.length - 1,rest[1])];
                  }
                  else
                  {
                     AssistTrophyItem(_loc3_).AssistClass = GameController.stageData.Assists[Math.min(GameController.stageData.Assists.length - 1,rest[1])];
                  }
                  _loc3_.X = GameController.stageData.getPlayer(1).X + (!!GameController.stageData.getPlayer(1).FacingForward?8:-8);
                  _loc3_.Y = GameController.stageData.getPlayer(1).Y - GameController.stageData.getPlayer(1).Height;
                  this.writeLine("Generated assist ID#" + rest[1] + " @ (x:" + _loc3_.X + ", y:" + _loc3_.Y + ")");
               }
               else
               {
                  this.writeLine("Error, failed to assist ID#" + rest[1]);
               }
            }
         }
         else if(rest[0] == "item")
         {
            if(rest.length <= 1 || isNaN(parseInt(rest[1])))
            {
               this.writeLine("Error parsing item ID ##");
            }
            else
            {
               rest[1] = Math.max(0,parseInt(rest[1]));
               _loc6_ = new ItemData(GameController.stageData.SizeRatio);
               _loc6_.importItemData(ItemsListData.DATA[Math.min(ItemsListData.DATA.length - 1,rest[1])]);
               _loc3_ = GameController.stageData.ItemsRef.generateItemObj(_loc6_);
               if(_loc3_)
               {
                  if(GameController.stageData.getPlayer(1))
                  {
                     _loc3_.X = GameController.stageData.getPlayer(1).X + (!!GameController.stageData.getPlayer(1).FacingForward?8:-8);
                     _loc3_.Y = GameController.stageData.getPlayer(1).Y - GameController.stageData.getPlayer(1).Height;
                  }
                  this.writeLine("Generated item ID#" + rest[1] + " @ (x:" + _loc3_.X + ", y:" + _loc3_.Y + ")");
               }
               else
               {
                  this.writeLine("Error, failed to item ID#" + rest[1]);
               }
            }
         }
         else if(rest[0] == "pokemon")
         {
            if(rest.length <= 1 || isNaN(parseInt(rest[1])))
            {
               this.writeLine("Error parsing pokemon ID ##");
            }
            else
            {
               rest[1] = Math.max(0,parseInt(rest[1]));
               _loc3_ = GameController.stageData.ItemsRef.generateItemObj(GameController.stageData.ItemsRef.getItemByLinkage("pokeball"));
               if(_loc3_)
               {
                  if(_loc4_.indexOf("-rare") >= 0)
                  {
                     Pokeball(_loc3_).PokemonClass = GameController.stageData.PokemonsRare[Math.min(GameController.stageData.PokemonsRare.length - 1,rest[1])];
                  }
                  else
                  {
                     Pokeball(_loc3_).PokemonClass = GameController.stageData.Pokemons[Math.min(GameController.stageData.Pokemons.length - 1,rest[1])];
                  }
                  _loc3_.X = GameController.stageData.getPlayer(1).X + (!!GameController.stageData.getPlayer(1).FacingForward?8:-8);
                  _loc3_.Y = GameController.stageData.getPlayer(1).Y - GameController.stageData.getPlayer(1).Height;
                  this.writeLine("Generated pokemon ID#" + rest[1] + " @ (x:" + _loc3_.X + ", y:" + _loc3_.Y + ")");
               }
               else
               {
                  this.writeLine("Error, failed to pokemon ID#" + rest[1]);
               }
            }
         }
         else
         {
            this.writeLine(_loc5_);
         }
      }
      
      private function print(... rest) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:Array = new Array();
         while(rest.length > 0 && rest[0].charAt(0) == "-")
         {
            _loc2_.push(rest[0]);
            rest.splice(0,1);
         }
         var _loc3_:String = "Error, print expects flags [-assist | -item | -online | -pokemon | -version]";
         if(_loc2_.length == 0)
         {
            this.writeLine(_loc3_);
         }
         else
         {
            if(_loc2_[0] == "-assist")
            {
               this.writeLine("[Common Assists]");
               this.writeLine("0 - BandanaDee");
               this.writeLine("1 - Amigo");
               this.writeLine("2 - Starfy");
               this.writeLine("3 - Protoman");
               this.writeLine("4 - Metroid");
               this.writeLine("5 - PacMan");
               this.writeLine("6 - RenjiAssist");
               this.writeLine("7 - Krillin");
               this.writeLine("8 - Lakitu");
               this.writeLine("9 - Silver");
               this.writeLine("[Rare Assists]");
               this.writeLine("0 - YagamiLight");
            }
            if(_loc2_[0] == "-item")
            {
               this.writeLine("[Items]");
               _loc4_ = 0;
               while(_loc4_ < ItemsListData.DATA.length)
               {
                  _loc5_ = ItemsListData.DATA[_loc4_].displayName;
                  while(_loc5_.indexOf("%20") >= 0)
                  {
                     _loc5_ = _loc5_.replace("%20"," ");
                  }
                  this.writeLine(_loc4_ + " - " + _loc5_);
                  _loc4_++;
               }
            }
            if(_loc2_.indexOf("-online") >= 0)
            {
               if(GameController.stageData && GameController.stageData.OnlineMode)
               {
                  this.writeLine("[BEGIN ONLINE LOG]");
                  this.writeLine(GameController.stageData.LogText);
                  this.writeLine("[END ONLINE LOG]");
               }
               else
               {
                  this.writeLine("Error, online mode not detected");
               }
            }
            if(_loc2_.indexOf("-pokemon") >= 0)
            {
               this.writeLine("[Common Pokemon]");
               this.writeLine("0 - Gligar");
               this.writeLine("1 - Hitmonlee");
               this.writeLine("2 - Chikorita");
               this.writeLine("3 - Koffing");
               this.writeLine("4 - Charizard");
               this.writeLine("5 - Delibird");
               this.writeLine("6 - Magikarp");
               this.writeLine("7 - Electrode");
               this.writeLine("8 - Shroomish");
               this.writeLine("9 - Snorlax");
               this.writeLine("10 - Chatot");
               this.writeLine("[Rare Pokemon]");
               this.writeLine("0 - Missingno");
               this.writeLine("1 - Victini");
            }
            if(_loc2_.indexOf("-version") >= 0)
            {
               this.writeLine("SSF2 Version: " + Version.Major + "." + Version.Minor + "." + Version.Build + "." + Version.Revision);
               this.writeLine("ActionScript Version: " + Main.Root.loaderInfo.actionScriptVersion);
               this.writeLine("SWF Version: " + Main.Root.loaderInfo.swfVersion);
            }
         }
      }
      
      private function debug(... rest) : void
      {
         var _loc2_:Array = new Array();
         while(rest.length > 0 && rest[0].charAt(0) == "-")
         {
            _loc2_.push(rest[0]);
            rest.splice(0,1);
         }
         var _loc3_:String = "Error, debug expects args [off]";
         if(rest.length == 0)
         {
            this.writeLine(_loc3_);
         }
         else if(rest[0] == "off")
         {
            this.writeLine("Debug mode has been disabled.");
            Main.turnOffDebug();
         }
         else
         {
            this.writeLine(_loc3_);
         }
      }
      
      private function config(... rest) : void
      {
         var _loc2_:Array = new Array();
         while(rest.length > 0 && rest[0].charAt(0) == "-")
         {
            _loc2_.push(rest[0]);
            rest.splice(0,1);
         }
         var _loc3_:String = "Error, config expects args [meleeAirDodge | fps]";
         if(rest.length == 0)
         {
            this.writeLine(_loc3_);
         }
         else if(rest[0] == "meleeAirDodge")
         {
            if(rest.length <= 1)
            {
               this.writeLine("Error parsing config meleeAirDodge value (Expects [true | false])");
            }
            else if(!GameController.stageData)
            {
               this.writeLine("Error, match must be initialized to change config meleeAirDodge value");
            }
            else if(rest[1] == "true")
            {
               GameController.stageData.MeleeAirDodge = true;
               this.writeLine("Melee air dodging has been enabled");
            }
            else if(rest[1] == "false")
            {
               GameController.stageData.MeleeAirDodge = false;
               this.writeLine("Melee air dodging has been disabled");
            }
            else
            {
               this.writeLine("Error, invalid config meleeAirDodge value provided (Expects [true | false])");
            }
         }
         else if(rest[0] == "fps")
         {
            if(rest.length <= 1)
            {
               this.writeLine("Error parsing config fps value (Expects [1-120])");
            }
            else if(rest.length <= 1 || isNaN(parseInt(rest[1])))
            {
               this.writeLine("Error, invalid config fps value provided (Expects [1-120])");
            }
            else
            {
               rest[1] = Math.max(0,parseInt(rest[1]));
               if(rest[1] < 1 || rest[1] > 120)
               {
                  this.writeLine("Error, invalid config fps value provided (Expects [1-120])");
               }
               else
               {
                  this.writeLine("Game FPS has been set to " + rest[1]);
                  Main.Root.stage.frameRate = rest[1];
               }
            }
         }
         else if(rest[0] == "alerts")
         {
            if(rest.length <= 1)
            {
               this.writeLine("Error parsing config alerts value (Expects [true | false])");
            }
            else if(rest[1] == "true")
            {
               this.m_alerts = true;
               this.writeLine("Alerts have been enabled");
            }
            else if(rest[1] == "false")
            {
               this.m_alerts = false;
               this.writeLine("Alerts have been disabled");
            }
            else
            {
               this.writeLine("Error, invalid config alerts value provided (Expects [true | false])");
            }
         }
         else
         {
            this.writeLine(_loc3_);
         }
      }
      
      private function hack(... rest) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Character = null;
         var _loc5_:Array = new Array();
         while(rest.length > 0 && rest[0].charAt(0) == "-")
         {
            _loc5_.push(rest[0]);
            rest.splice(0,1);
         }
         var _loc6_:String = "Error, hack expects args [fsTimer]";
         if(rest.length == 0)
         {
            this.writeLine(_loc6_);
         }
         else if(rest[0] == "fsTimer")
         {
            if(rest.length <= 1)
            {
               this.writeLine("Error parsing hack fsTimer value (Expects [##])");
            }
            else if(!GameController.stageData)
            {
               this.writeLine("Error, match must be initialized to change hack fsTimer value");
            }
            else if(rest.length <= 1 || isNaN(parseInt(rest[1])))
            {
               this.writeLine("Error, invalid hack fsTimer value provided (Expects [##])");
            }
            else
            {
               _loc3_ = false;
               rest[1] = Math.max(0,parseInt(rest[1]));
               _loc2_ = 0;
               while(_loc2_ < GameController.stageData.PlayerList.length)
               {
                  _loc4_ = GameController.stageData.getPlayer(GameController.stageData.PlayerList[_loc2_]);
                  if(_loc4_ && _loc4_.TransformedSpecial)
                  {
                     _loc4_.transformTimerExtend(rest[1]);
                     _loc3_ = true;
                  }
                  _loc2_++;
               }
               this.writeLine(!!_loc3_?"Characters have been granted an additional " + rest[1] + " frame(s) of final form time":"Error, no character is currently in final form");
            }
         }
      }
      
      public function alert(param1:String) : void
      {
         if(Main.DEBUG && this.m_alerts)
         {
            if(!m_container.parent)
            {
               this.show();
            }
            this.writeLine(param1);
         }
      }
      
      public function writeEndAttackControls(param1:String) : void
      {
         if(this.m_controlsCapture)
         {
            this.writeLine(param1);
         }
      }
      
      public function writeTextData(param1:String) : void
      {
         this.writeLine(param1);
      }
   }
}
