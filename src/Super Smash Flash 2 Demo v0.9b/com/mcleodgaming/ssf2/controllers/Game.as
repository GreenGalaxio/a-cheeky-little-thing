package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.ReplayData;
   import com.mcleodgaming.ssf2.engine.StageSetting;
   import com.mcleodgaming.ssf2.engine.Stats;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.enums.ModeFeatures;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import com.mcleodgaming.ssf2.util.Controller;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Key;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   public class Game
   {
       
      
      private var ROOT:MovieClip;
      
      private var m_selectionInstance:MovieClip;
      
      private var m_optionsInstance:MovieClip;
      
      private var m_playerSettings:Vector.<PlayerSetting>;
      
      private var m_chips:Vector.<Chip>;
      
      private var m_levelData:GameSettings;
      
      private var m_items:ItemSettings;
      
      private var m_gameMode:uint;
      
      private var m_readyDelay:FrameTimer;
      
      private var m_currentStage:StageSetting;
      
      private var m_loadingMask:MovieClip;
      
      private var m_nextScreenDelay:Timer;
      
      private var m_nextScreenEnabled:Boolean;
      
      private var m_replayData:ReplayData;
      
      private var m_suddenDeath:Boolean;
      
      private var m_wasInit:Boolean;
      
      public function Game(param1:MovieClip = null, param2:uint = 0)
      {
         super();
         if(param1 != null)
         {
            this.ROOT = param1;
            this.m_selectionInstance = MovieClip(this.ROOT.charSelection);
            this.m_optionsInstance = MovieClip(this.ROOT.options);
         }
         else
         {
            this.ROOT = null;
            this.m_selectionInstance = null;
            this.m_optionsInstance = null;
         }
         this.m_gameMode = param2;
         this.m_suddenDeath = false;
         this.m_currentStage = null;
         this.m_chips = new Vector.<Chip>();
         this.m_playerSettings = new Vector.<PlayerSetting>();
         this.m_levelData = new GameSettings();
         this.m_items = new ItemSettings();
         this.m_replayData = null;
         var _loc3_:int = 1;
         while(_loc3_ <= Main.MAXPLAYERS)
         {
            this.m_chips.push(null);
            this.m_playerSettings.push(new PlayerSetting());
            this.m_playerSettings[_loc3_ - 1].importSettings({
               "orig_chipX":(this.m_selectionInstance != null?this.m_selectionInstance.charSelect["chip" + _loc3_].x:0),
               "orig_chipY":(this.m_selectionInstance != null?this.m_selectionInstance.charSelect["chip" + _loc3_].y:0),
               "chipX":(this.m_selectionInstance != null?this.m_selectionInstance.charSelect["chip" + _loc3_].x:0),
               "chipY":(this.m_selectionInstance != null?this.m_selectionInstance.charSelect["chip" + _loc3_].y:0),
               "human":_loc3_ == 1,
               "team_prev":(_loc3_ == 1?1:2)
            });
            if(this.m_selectionInstance)
            {
               this.m_selectionInstance["display" + _loc3_].nameDisplay.nameKeyPad.visible = false;
            }
            _loc3_++;
         }
         this.m_levelData.hazards = SaveData.Hazards;
         this.m_readyDelay = new FrameTimer(10);
         this.m_loadingMask = Main.getLibraryMC("loadingMask");
         this.m_loadingMask.x = Main.Width / 2;
         this.m_loadingMask.y = Main.Height / 2;
         this.m_wasInit = false;
         this.m_nextScreenDelay = new Timer(30,1);
         this.m_nextScreenEnabled = false;
      }
      
      private function enableNextScreen(param1:TimerEvent) : void
      {
         if(!Key.isDown(32))
         {
            this.m_nextScreenEnabled = true;
         }
         else
         {
            this.m_nextScreenDelay.reset();
            this.m_nextScreenDelay.start();
         }
      }
      
      public function get Root() : MovieClip
      {
         return this.ROOT;
      }
      
      public function get Time() : Number
      {
         return this.m_levelData.time as Number;
      }
      
      public function set Time(param1:Number) : void
      {
         this.m_levelData.time = param1;
         if(this.m_levelData.time <= 0)
         {
            this.m_levelData.time = 99;
         }
         else if(this.m_levelData.time > 99)
         {
            this.m_levelData.time = 1;
         }
      }
      
      public function get CountDown() : Boolean
      {
         return this.m_levelData.countdown as Boolean;
      }
      
      public function set CountDown(param1:Boolean) : void
      {
         this.m_levelData.countdown = param1;
      }
      
      public function get SizeRatio() : Number
      {
         return this.m_levelData.sizeRatio as Number;
      }
      
      public function get ShowPlayerID() : Boolean
      {
         return this.m_levelData.showPlayerID as Boolean;
      }
      
      public function set ShowPlayerID(param1:Boolean) : void
      {
         this.m_levelData.showPlayerID = param1;
      }
      
      public function set SizeRatio(param1:Number) : void
      {
         this.m_levelData.sizeRatio = param1;
      }
      
      public function get LevelData() : GameSettings
      {
         return this.m_levelData;
      }
      
      public function set LevelData(param1:GameSettings) : void
      {
         this.m_levelData = param1;
      }
      
      public function get Lives() : Number
      {
         return this.m_levelData.lives as Number;
      }
      
      public function set Lives(param1:Number) : void
      {
         this.m_levelData.lives = param1;
         if(this.m_levelData.lives <= 0)
         {
            this.m_levelData.lives = 99;
         }
         else if(this.m_levelData.lives > 99)
         {
            this.m_levelData.lives = 1;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerSettings.length)
         {
            this.m_playerSettings[_loc2_].lives = this.m_levelData.lives;
            _loc2_++;
         }
      }
      
      public function get Stamina() : int
      {
         return this.m_levelData.stamina as int;
      }
      
      public function set Stamina(param1:int) : void
      {
         this.m_levelData.stamina = param1;
      }
      
      public function get UsingTime() : Boolean
      {
         return this.m_levelData.usingTime as Boolean;
      }
      
      public function set UsingTime(param1:Boolean) : void
      {
         this.m_levelData.usingTime = param1;
      }
      
      public function get UsingLives() : Boolean
      {
         return this.m_levelData.usingLives as Boolean;
      }
      
      public function set UsingLives(param1:Boolean) : void
      {
         this.m_levelData.usingLives = param1;
      }
      
      public function get TotalPlayers() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerSettings.length)
         {
            if(this.m_playerSettings[_loc2_].character != null && this.m_playerSettings[_loc2_].character != null)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get DamageRatio() : Number
      {
         return this.m_levelData.damageRatio as Number;
      }
      
      public function set DamageRatio(param1:Number) : void
      {
         this.m_levelData.damageRatio = param1;
         if(this.m_levelData.damageRatio > 2)
         {
            this.m_levelData.damageRatio = 2;
         }
         else if(this.m_levelData.damageRatio < 0.5)
         {
            this.m_levelData.damageRatio = 0.5;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerSettings.length)
         {
            this.m_playerSettings[_loc2_].damageRatio = this.m_levelData.damageRatio;
            _loc2_++;
         }
      }
      
      public function set ItemFrequency(param1:Number) : void
      {
         this.m_items.frequency = param1;
         if(this.m_items.frequency > 5)
         {
            this.m_items.frequency = 5;
         }
         else if(this.m_items.frequency < 0)
         {
            this.m_items.frequency = 0;
         }
      }
      
      public function get Items() : ItemSettings
      {
         return this.m_items;
      }
      
      public function set Items(param1:ItemSettings) : void
      {
         this.m_items = param1;
      }
      
      public function get StartDamage() : Number
      {
         return this.m_levelData.startDamage as Number;
      }
      
      public function set StartDamage(param1:Number) : void
      {
         this.m_levelData.startDamage = param1;
         if(this.m_levelData.startDamage > 999)
         {
            this.m_levelData.startDamage = 999;
         }
         else if(this.m_levelData.startDamage < 0)
         {
            this.m_levelData.startDamage = 0;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerSettings.length)
         {
            this.m_playerSettings[_loc2_].startDamage = this.m_levelData.startDamage;
            _loc2_++;
         }
      }
      
      public function get ReadyDelay() : FrameTimer
      {
         return this.m_readyDelay;
      }
      
      public function get CurrentStageSettings() : StageSetting
      {
         return this.m_currentStage;
      }
      
      public function get MatchSettings() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.stageID = StageSetting.CurrentID;
         _loc1_.levelData = this.m_levelData.exportSettings();
         _loc1_.items = this.m_items.exportSettings();
         _loc1_.playerData = new Object();
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerSettings.length)
         {
            _loc1_.playerData["player" + (_loc2_ + 1)] = this.m_playerSettings[_loc2_].exportSettings();
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get SuddenDeath() : Boolean
      {
         return this.m_suddenDeath;
      }
      
      public function set SuddenDeath(param1:Boolean) : void
      {
         this.m_suddenDeath = param1;
      }
      
      public function get GameMode() : uint
      {
         return this.m_gameMode;
      }
      
      public function set GameMode(param1:uint) : void
      {
         this.m_gameMode = param1;
      }
      
      public function get PlayerSettings() : Vector.<PlayerSetting>
      {
         return this.m_playerSettings;
      }
      
      public function get ReplayDataObj() : ReplayData
      {
         return this.m_replayData;
      }
      
      public function set ReplayDataObj(param1:ReplayData) : void
      {
         this.m_replayData = param1;
      }
      
      public function set PlayerSettings(param1:Vector.<PlayerSetting>) : void
      {
         this.m_playerSettings = param1;
      }
      
      public function incrementExpansion(param1:Number) : void
      {
         this.m_chips[param1 - 1].incrementExpansionNum();
      }
      
      private function controllerStart(param1:uint) : Boolean
      {
         var _loc2_:int = 1;
         while(_loc2_ <= Main.MAXPLAYERS)
         {
            if(SaveData["Controller" + _loc2_] != null && Controller(SaveData["Controller" + _loc2_])._START == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function nextScreen(param1:KeyboardEvent) : void
      {
         if(this.m_nextScreenEnabled && !MenuController.rulesMenu.isOnscreen() && (param1.keyCode == 32 || this.controllerStart(param1.keyCode)))
         {
            if(!(Main.Root["options_mc"] != null && Main.Root["options_mc"].currentFrame > 1))
            {
               if(this.gameIsReady())
               {
                  if(this.m_gameMode == Mode.VS)
                  {
                     this.StartDamage = this.StartDamage;
                  }
                  GameController.currentGame.saveVSOptions();
                  SaveData.saveGame();
                  SoundQueue.instance.playSoundEffect("menu_selectstage");
                  if(this.m_gameMode == Mode.TARGET_TEST)
                  {
                     this.initTargetTest();
                  }
                  else if(this.m_gameMode == Mode.EVENT)
                  {
                     this.initEventMatch();
                  }
                  else if(this.m_gameMode == Mode.ONLINE)
                  {
                     MenuController.CurrentCharacterSelectMenu.removeSelf();
                     if(MultiplayerManager.IsHost)
                     {
                        MenuController.showSpecialModeMenu();
                     }
                     else
                     {
                        MenuController.showPleaseWaitMenu();
                        MultiplayerManager.toWaitingRoom(this,this.waitingRoomReady);
                     }
                  }
                  else
                  {
                     MenuController.CurrentCharacterSelectMenu.removeSelf();
                     MenuController.stageSelectMenu.setCurrentGame(this);
                     MenuController.showStageSelectMenu();
                  }
                  this.killEvents();
               }
               else
               {
                  SoundQueue.instance.playSoundEffect("menu_error");
               }
            }
         }
      }
      
      private function waitingRoomReady(param1:* = null) : void
      {
         MenuController.removeAllMenus();
         GameController.startMatch();
      }
      
      private function initTargetTest() : void
      {
         SoundQueue.instance.playSoundEffect("menu_crowd");
         GameController.isStarted = true;
         this.m_levelData.randSeed = Utils.randomInteger(1,1000);
         Utils.setRandSeed(this.m_levelData.randSeed);
         Utils.shuffleRandom();
         Main.prepRandomCharacters();
         Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(StageSetting.CurrentID).CurrentFileName));
         var _loc1_:int = 0;
         while(_loc1_ < this.m_playerSettings.length)
         {
            if(this.m_playerSettings[_loc1_] && this.m_playerSettings[_loc1_].exist && this.m_playerSettings[_loc1_].character != null && this.m_playerSettings[_loc1_].character != "xp")
            {
               Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(this.m_playerSettings[_loc1_].character == "rand_mc"?Main.RandCharList[_loc1_].StatsName:this.m_playerSettings[_loc1_].character).CurrentFileName));
            }
            _loc1_++;
         }
         Main.Root.addChild(this.m_loadingMask);
         Main.dynamicLoad(this.startTargetTest);
      }
      
      public function startReplay(param1:*) : void
      {
         if(this.m_loadingMask.parent != null)
         {
            Main.Root.removeChild(this.m_loadingMask);
         }
         MenuController.removeAllMenus();
         GameController.startMatch();
      }
      
      public function initReplay() : void
      {
         var _loc1_:StageSetting = StageSetting.getStageByID(this.m_replayData.StageID);
         this.setStageSettings(_loc1_);
         StageSetting.CurrentID = _loc1_.ID;
         this.m_levelData.importSettings(this.m_replayData.MatchSettings);
         this.m_items.importSettings(this.m_replayData.ItemSettingsObj);
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerSettings.length)
         {
            this.m_playerSettings[_loc2_].importSettings(this.m_replayData.PlayerData[_loc2_]);
            _loc2_++;
         }
         SoundQueue.instance.playSoundEffect("menu_crowd");
         GameController.isStarted = true;
         this.m_levelData.randSeed = this.m_replayData.MatchSettings.randSeed;
         Utils.setRandSeed(this.m_levelData.randSeed);
         Utils.shuffleRandom();
         Main.prepRandomCharacters();
         Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(StageSetting.CurrentID).CurrentFileName));
         var _loc3_:int = 0;
         while(_loc3_ < this.m_playerSettings.length)
         {
            if(this.m_playerSettings[_loc3_] && this.m_playerSettings[_loc3_].exist && this.m_playerSettings[_loc3_].character != null && this.m_playerSettings[_loc3_].character != "xp")
            {
               Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(this.m_playerSettings[_loc3_].character == "rand_mc"?Main.RandCharList[_loc3_].StatsName:this.m_playerSettings[_loc3_].character).CurrentFileName));
            }
            _loc3_++;
         }
         Main.Root.addChild(this.m_loadingMask);
         Main.dynamicLoad(this.startReplay);
      }
      
      public function updateTargetTestID() : void
      {
         var _loc1_:int = MenuController.targetTestMenu.stage_id;
         var _loc2_:String = "";
         if(_loc1_ > 1)
         {
            _loc2_ = _loc2_ + ("" + _loc1_);
         }
         this.setStageSettings(StageSetting["TargetTest" + _loc2_]);
         StageSetting.CurrentID = "targettest" + _loc2_;
      }
      
      public function startTargetTest(param1:*) : void
      {
         if(this.m_loadingMask.parent != null)
         {
            Main.Root.removeChild(this.m_loadingMask);
         }
         MenuController.removeAllMenus();
         GameController.startMatch();
      }
      
      public function initEventMatch() : void
      {
         EventMatchController.success = false;
         SoundQueue.instance.playSoundEffect("menu_crowd");
         GameController.isStarted = true;
         this.m_levelData.randSeed = Utils.randomInteger(1,1000);
         Utils.setRandSeed(this.m_levelData.randSeed);
         Utils.shuffleRandom();
         Main.prepRandomCharacters();
         Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(StageSetting.CurrentID).CurrentFileName));
         var _loc1_:int = 0;
         while(_loc1_ < this.m_playerSettings.length)
         {
            if(this.m_playerSettings[_loc1_] && this.m_playerSettings[_loc1_].exist && this.m_playerSettings[_loc1_].character != null && this.m_playerSettings[_loc1_].character != "xp")
            {
               Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(this.m_playerSettings[_loc1_].character == "rand_mc"?Main.RandCharList[_loc1_].StatsName:this.m_playerSettings[_loc1_].character).CurrentFileName));
            }
            _loc1_++;
         }
         Main.Root.addChild(this.m_loadingMask);
         Main.dynamicLoad(this.startTargetTest);
      }
      
      public function startEventMatch(param1:*) : void
      {
         if(this.m_loadingMask.parent != null)
         {
            Main.Root.removeChild(this.m_loadingMask);
         }
         MenuController.removeAllMenus();
         GameController.startMatch();
      }
      
      public function makeEvents() : void
      {
         this.m_nextScreenEnabled = false;
         this.m_nextScreenDelay.reset();
         Main.Root.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.nextScreen);
         this.m_nextScreenDelay.addEventListener(TimerEvent.TIMER_COMPLETE,this.enableNextScreen);
         this.m_nextScreenDelay.start();
      }
      
      public function killEvents() : void
      {
         this.m_nextScreenEnabled = false;
         Main.Root.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.nextScreen);
         if(this.m_nextScreenDelay.running)
         {
            this.m_nextScreenDelay.removeEventListener(TimerEvent.TIMER_COMPLETE,this.enableNextScreen);
         }
      }
      
      public function getItemStatus(param1:String) : Boolean
      {
         var _loc2_:Array = new Array();
         var _loc3_:String = "";
         var _loc4_:Number = 0;
         while(_loc4_ < param1.length)
         {
            if(param1.charAt(_loc4_) == ",")
            {
               _loc2_.push(_loc3_);
               _loc3_ = "";
            }
            else
            {
               _loc3_ = _loc3_ + param1.charAt(_loc4_);
            }
            _loc4_++;
         }
         _loc2_.push(_loc3_);
         return this.m_items.items[_loc2_[0]];
      }
      
      public function setStageSettings(param1:StageSetting) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerSettings.length)
         {
            this.m_playerSettings[_loc2_].x_start = param1["P" + ((_loc2_%4) + 1) + "_XStart"];
            this.m_playerSettings[_loc2_].y_start = param1["P" + ((_loc2_%4) + 1) + "_YStart"];
            this.m_playerSettings[_loc2_].x_respawn = param1["P" + ((_loc2_%4) + 1) + "_XSpawn"];
            this.m_playerSettings[_loc2_].y_respawn = param1["P" + ((_loc2_%4) + 1) + "_YSpawn"];
            this.m_playerSettings[_loc2_].facingRight = param1["P" + ((_loc2_%4) + 1) + "_FacingRight"];
            _loc2_++;
         }
         this.SizeRatio = param1.SizeRatio;
         this.m_currentStage = param1;
      }
      
      public function setPlayer(param1:int, param2:String, param3:Number = -1) : void
      {
         if(param2 == null && this.m_playerSettings[param1 - 1].character != null)
         {
            this.removePic(param1);
            this.m_playerSettings[param1 - 1].character = null;
            this.m_playerSettings[param1 - 1].costume = -1;
         }
         else if(param2 != null && this.m_playerSettings[param1 - 1].exist)
         {
            if(this.m_playerSettings[param1 - 1].character != param2 || param2 == "xp" && Main.TotalExpansions != 0)
            {
               this.m_playerSettings[param1 - 1].costume = -1;
               this.m_playerSettings[param1 - 1].character = param2;
               this.m_playerSettings[param1 - 1].expansion = param3;
               this.changePic(param1,param2,param3);
               if(this.costumeExistsElsewhere(this.m_playerSettings[param1 - 1].costume,param1))
               {
                  this.nextCostume(param1);
               }
            }
         }
         this.updateGameIsReady();
         this.updateTargetTestDisplay();
      }
      
      public function updateGameIsReady() : void
      {
         if(this.gameIsReady() && !MenuController.CurrentCharacterSelectMenu.SubMenu.readyToFight.visible)
         {
            MenuController.CurrentCharacterSelectMenu.SubMenu.readyToFight.gotoAndPlay(2);
            MenuController.CurrentCharacterSelectMenu.SubMenu.readyToFight.visible = true;
         }
         else if(!this.gameIsReady() && MenuController.CurrentCharacterSelectMenu.SubMenu.readyToFight.visible)
         {
            MenuController.CurrentCharacterSelectMenu.SubMenu.readyToFight.gotoAndStop(1);
            MenuController.CurrentCharacterSelectMenu.SubMenu.readyToFight.visible = false;
         }
      }
      
      public function removePic(param1:Number) : void
      {
         var _loc3_:MovieClip = null;
         var _loc2_:MovieClip = this.m_selectionInstance["display" + param1];
         if(MovieClip(_loc2_.getChildByName("pic")).numChildren > 0)
         {
            MovieClip(_loc2_.getChildByName("pic")).removeChild(MovieClip(_loc2_.getChildByName("pic")).getChildByName("mc"));
            _loc3_ = MovieClip(_loc2_.getChildByName("pic")).addChild(Main.getLibraryMC("blankmc")) as MovieClip;
            _loc3_.name = "mc";
            if(MovieClip(_loc2_.getChildByName("icon")).numChildren > 0)
            {
               MovieClip(_loc2_.getChildByName("icon")).removeChild(MovieClip(_loc2_.getChildByName("icon")).getChildByName("mc"));
               _loc3_ = MovieClip(_loc2_.getChildByName("icon")).addChild(Main.getLibraryMC("blankmc")) as MovieClip;
               _loc3_.name = "mc";
            }
            this.m_selectionInstance["display" + param1].nextExp.visible = false;
            this.m_selectionInstance["display" + param1].playerTxt.text = "";
         }
      }
      
      public function changePic(param1:Number, param2:String, param3:Number = -1) : void
      {
         Stats.setPresets({
            "level":this.m_playerSettings[param1 - 1].level,
            "x_start":this.m_playerSettings[param1 - 1].x_start,
            "y_start":this.m_playerSettings[param1 - 1].y_start,
            "facingRight":this.m_playerSettings[param1 - 1].facingRight,
            "player_id":param1,
            "sizeRatio":this.SizeRatio,
            "shieldType":"shield" + this.m_playerSettings[param1 - 1].team
         });
         if(param2 == "xp" && Main.TotalExpansions > 0)
         {
            param2 = Stats.getStats(param2,param3).StatsName;
            this.m_selectionInstance["display" + param1].nextExp.visible = true;
            this.m_selectionInstance["display" + param1].playerTxt.text = Stats.getStats(param2,param3).DisplayName != null?Stats.getStats(param2,param3).DisplayName:"";
         }
         else
         {
            param3 = -1;
            this.m_selectionInstance["display" + param1].nextExp.visible = false;
            this.m_selectionInstance["display" + param1].playerTxt.text = param2 == "rand_mc"?"Random":Stats.getStats(param2,param3).DisplayName;
         }
         Utils.fitText(this.m_selectionInstance["display" + param1].playerTxt,20,1);
         var _loc4_:MovieClip = this.m_selectionInstance["display" + param1];
         if(MovieClip(_loc4_.getChildByName("pic")).numChildren > 0)
         {
            MovieClip(_loc4_.getChildByName("pic")).removeChild(MovieClip(_loc4_.getChildByName("pic")).getChildByName("mc"));
         }
         var _loc5_:MovieClip = MovieClip(_loc4_.getChildByName("pic")).addChild(Main.getLibraryMC(param2 == "rand_mc"?"rand_mc":param3 < 0?Main.getLibraryMC(Stats.getStats(param2,param3).LinkageID + "_charselect") != null?Stats.getStats(param2,param3).LinkageID + "_charselect":"mario_charselect":Stats.getStats(param2,param3).LinkageID,param3)) as MovieClip;
         _loc5_.mouseChildren = false;
         _loc5_.mouseEnabled = false;
         _loc5_.name = "mc";
         Character.updateColorFilter(_loc5_,this.m_playerSettings[param1 - 1].team,param2,this.m_playerSettings[param1 - 1].costume);
         Utils.tryToGotoAndStop(_loc5_,"select_screen");
         if(MovieClip(_loc4_.getChildByName("icon")).numChildren > 0)
         {
            MovieClip(_loc4_.getChildByName("icon")).removeChild(MovieClip(_loc4_.getChildByName("icon")).getChildByName("mc"));
         }
         _loc5_ = param2 == "rand_mc"?null:Main.getLibraryMC(Stats.getStats(param2,param3).SeriesIcon,param3);
         if(_loc5_ != null)
         {
            _loc5_ = MovieClip(_loc4_.getChildByName("icon")).addChild(_loc5_) as MovieClip;
            _loc5_.name = "mc";
            if(this.m_playerSettings[param1 - 1].human && this.m_playerSettings[param1 - 1].team > 0)
            {
               switch(this.m_playerSettings[param1 - 1].team)
               {
                  case 1:
                     Utils.setTint(_loc5_,1,1,1,1,90,0,0,0);
                     break;
                  case 2:
                     Utils.setTint(_loc5_,1,1,1,1,0,90,0,0);
                     break;
                  case 3:
                     Utils.setTint(_loc5_,1,1,1,1,0,0,90,0);
               }
            }
            else if(this.m_playerSettings[param1 - 1].human)
            {
               switch(param1)
               {
                  case 1:
                     Utils.setTint(_loc5_,1,1,1,1,90,0,0,0);
                     break;
                  case 2:
                     Utils.setTint(_loc5_,1,1,1,1,0,0,90,0);
                     break;
                  case 3:
                     Utils.setTint(_loc5_,1,1,1,1,90,90,0,0);
                     break;
                  case 4:
                     Utils.setTint(_loc5_,1,1,1,1,0,90,0,0);
               }
            }
            else
            {
               Utils.setTint(_loc5_,1,1,1,1,0,0,0,0);
            }
         }
      }
      
      public function setLevel(param1:Number, param2:Number) : void
      {
         var _loc3_:String = "display" + param1;
         if(param2 > 9)
         {
            param2 = 1;
         }
         else if(param2 < 1)
         {
            param2 = 9;
         }
         if(this.m_playerSettings[param1 - 1].level != param2)
         {
            this.m_playerSettings[param1 - 1].level = param2;
            this.m_selectionInstance[_loc3_].levelDisplay.levelTxt.text = "" + param2;
            SaveData["VSCPULevel" + param1] = param2;
         }
         this.updateLevelDisplay();
      }
      
      public function toggleGameMode() : void
      {
         this.m_levelData.teams = !this.m_levelData.teams;
         this.updateGameMode();
      }
      
      private function updateGameMode() : void
      {
         var _loc1_:int = 0;
         if(this.m_levelData.teams)
         {
            _loc1_ = 0;
            while(_loc1_ < Main.MAXPLAYERS)
            {
               this.m_selectionInstance["display" + (_loc1_ + 1)].flag.visible = this.m_playerSettings[_loc1_].exist;
               this.m_playerSettings[_loc1_].team = this.m_playerSettings[_loc1_].team_prev;
               this.updatePlayerInfo(_loc1_ + 1);
               _loc1_++;
            }
         }
         else
         {
            _loc1_ = 0;
            while(_loc1_ < Main.MAXPLAYERS)
            {
               this.m_selectionInstance["display" + (_loc1_ + 1)].flag.visible = false;
               this.m_playerSettings[_loc1_].team_prev = this.m_playerSettings[_loc1_].team;
               this.m_playerSettings[_loc1_].team = -1;
               this.m_playerSettings[_loc1_].costume = -1;
               this.updatePlayerInfo(_loc1_ + 1);
               if(_loc1_ != 0 && this.costumeExistsElsewhere(this.m_playerSettings[_loc1_].costume,_loc1_ + 1))
               {
                  this.nextCostume(_loc1_ + 1);
               }
               _loc1_++;
            }
         }
         if(ModeFeatures.hasFeature(ModeFeatures.ALLOW_TEAM_TOGGLE,this.m_gameMode))
         {
            this.m_selectionInstance.bnGameMode.gameModeTxt.gotoAndStop(!!this.m_levelData.teams?"team":"ffa");
         }
         this.updateGameIsReady();
         this.updateSeriesIconColors();
      }
      
      private function updateSeriesIconColors() : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         var _loc1_:int = 1;
         while(_loc1_ <= Main.MAXPLAYERS)
         {
            _loc2_ = this.m_selectionInstance["display" + _loc1_];
            if(_loc2_.getChildByName("pic") && MovieClip(_loc2_.getChildByName("pic")).getChildByName("mc") != null)
            {
               Character.updateColorFilter(MovieClip(MovieClip(_loc2_.getChildByName("pic")).getChildByName("mc")),this.m_playerSettings[_loc1_ - 1].team,this.m_playerSettings[_loc1_ - 1].character,this.m_playerSettings[_loc1_ - 1].costume);
            }
            if(_loc2_.getChildByName("icon") != null && MovieClip(_loc2_.getChildByName("icon")).getChildByName("mc") != null)
            {
               _loc3_ = MovieClip(MovieClip(_loc2_.getChildByName("icon")).getChildByName("mc"));
               if(this.m_playerSettings[_loc1_ - 1].team > 0 && this.m_playerSettings[_loc1_ - 1].human)
               {
                  switch(this.m_playerSettings[_loc1_ - 1].team)
                  {
                     case 1:
                        Utils.setTint(_loc3_,1,1,1,1,90,0,0,0);
                        break;
                     case 2:
                        Utils.setTint(_loc3_,1,1,1,1,0,90,0,0);
                        break;
                     case 3:
                        Utils.setTint(_loc3_,1,1,1,1,0,0,90,0);
                  }
               }
               else if(this.m_playerSettings[_loc1_ - 1].human)
               {
                  switch(_loc1_)
                  {
                     case 1:
                        Utils.setTint(_loc3_,1,1,1,1,90,0,0,0);
                        break;
                     case 2:
                        Utils.setTint(_loc3_,1,1,1,1,0,90,0,0);
                        break;
                     case 3:
                        Utils.setTint(_loc3_,1,1,1,1,90,90,0,0);
                        break;
                     case 4:
                        Utils.setTint(_loc3_,1,1,1,1,0,0,90,0);
                  }
               }
               else
               {
                  Utils.setTint(_loc3_,1,1,1,1,0,0,0,0);
               }
            }
            _loc1_++;
         }
      }
      
      public function prevCostume(param1:int) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = this.m_playerSettings[param1 - 1].costume;
         if(!this.m_levelData.teams && this.m_playerSettings[param1 - 1].character != null)
         {
            while(true)
            {
               this.m_playerSettings[param1 - 1].costume--;
               _loc3_ = Main.getCostume(this.m_playerSettings[param1 - 1].character,null,this.m_playerSettings[param1 - 1].costume);
               if(_loc3_ == null)
               {
                  if(this.m_playerSettings[param1 - 1].costume < -1)
                  {
                     this.m_playerSettings[param1 - 1].costume = -1;
                     if(Main.getCostume(this.m_playerSettings[param1 - 1].character,null,this.m_playerSettings[param1 - 1].costume + 1) != null)
                     {
                        while(Main.getCostume(this.m_playerSettings[param1 - 1].character,null,this.m_playerSettings[param1 - 1].costume + 1) != null)
                        {
                           this.m_playerSettings[param1 - 1].costume++;
                        }
                     }
                     else
                     {
                        this.m_playerSettings[param1 - 1].costume = -1;
                     }
                  }
                  else
                  {
                     this.m_playerSettings[param1 - 1].costume = -1;
                  }
               }
               if(!this.costumeExistsElsewhere(this.m_playerSettings[param1 - 1].costume,param1) || _loc2_ == this.m_playerSettings[param1 - 1].costume)
               {
                  break;
               }
            }
            this.updateSeriesIconColors();
         }
      }
      
      public function nextCostume(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc2_:MovieClip = this.m_selectionInstance["display" + param1];
         if(_loc2_ && _loc2_.pic && MovieClip(_loc2_.pic).numChildren > 0 && MovieClip(MovieClip(_loc2_.pic).getChildAt(0)).alternateStatsName)
         {
            this.setPlayer(param1,MovieClip(MovieClip(_loc2_.pic).getChildAt(0)).alternateStatsName,this.m_playerSettings[param1 - 1].expansion);
         }
         else
         {
            _loc3_ = this.m_playerSettings[param1 - 1].costume;
            if(!this.m_levelData.teams)
            {
               while(true)
               {
                  this.m_playerSettings[param1 - 1].costume++;
                  _loc4_ = Main.getCostume(this.m_playerSettings[param1 - 1].character,null,this.m_playerSettings[param1 - 1].costume);
                  if(_loc4_ == null)
                  {
                     this.m_playerSettings[param1 - 1].costume = -1;
                  }
                  if(!this.costumeExistsElsewhere(this.m_playerSettings[param1 - 1].costume,param1) || _loc3_ == this.m_playerSettings[param1 - 1].costume)
                  {
                     break;
                  }
               }
               this.updateSeriesIconColors();
            }
         }
      }
      
      public function costumeExistsElsewhere(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.m_playerSettings.length)
         {
            if(this.m_playerSettings[_loc3_] != this.m_playerSettings[param2 - 1])
            {
               if(this.m_playerSettings[_loc3_].costume == param1 && this.m_playerSettings[param2 - 1].character == this.m_playerSettings[_loc3_].character)
               {
                  return true;
               }
            }
            _loc3_++;
         }
         return false;
      }
      
      public function toggleTeam(param1:int) : void
      {
         var _loc2_:String = "display" + param1;
         this.m_playerSettings[param1 - 1].team++;
         if(this.m_playerSettings[param1 - 1].team > 3)
         {
            this.m_playerSettings[param1 - 1].team = 1;
         }
         this.m_playerSettings[param1 - 1].team_prev = this.m_playerSettings[param1 - 1].team;
         this.m_selectionInstance[_loc2_].flag.gotoAndStop("team" + this.m_playerSettings[param1 - 1].team);
         this.m_selectionInstance[_loc2_].charPortrait.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"team" + this.m_playerSettings[param1 - 1].team:"cpu");
         this.m_selectionInstance[_loc2_].playerTitle.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"player" + this.m_playerSettings[param1 - 1].team:"cpu");
         this.updateGameIsReady();
         this.updateSeriesIconColors();
      }
      
      public function toggleControl(param1:int) : void
      {
         var _loc2_:String = "display" + param1;
         var _loc3_:Chip = this.m_chips[param1 - 1];
         if(this.m_playerSettings[param1 - 1].exist)
         {
            if(this.m_playerSettings[param1 - 1].human)
            {
               this.m_playerSettings[param1 - 1].human = false;
               this.m_playerSettings[param1 - 1].name = null;
            }
            else
            {
               this.m_playerSettings[param1 - 1].exist = false;
               this.m_playerSettings[param1 - 1].name = null;
               this.setPlayer(param1,null);
            }
         }
         else
         {
            this.resetChipPosition(param1);
            this.m_playerSettings[param1 - 1].exist = true;
            this.m_playerSettings[param1 - 1].human = true;
            this.m_playerSettings[param1 - 1].name = null;
         }
         this.updateControl(param1);
         this.updatePlayerInfo(param1);
         this.updateNamesDisplay();
         this.updateGameIsReady();
      }
      
      private function updateControl(param1:int) : void
      {
         var _loc2_:String = "display" + param1;
         var _loc3_:Chip = this.m_chips[param1 - 1];
         if(this.m_playerSettings[param1 - 1].exist)
         {
            this.m_selectionInstance[_loc2_].gotoAndStop("on");
            if(this.m_playerSettings[param1 - 1].human)
            {
               this.m_selectionInstance[_loc2_].playerTxt.visible = true;
               this.m_selectionInstance[_loc2_].playerTitle.visible = true;
               this.m_selectionInstance[_loc2_].levelDisplay.visible = false;
               this.m_selectionInstance[_loc2_].nameDisplay.visible = true;
               _loc3_.Visible = true;
               _loc3_.MC.gotoAndStop("human");
               this.m_selectionInstance[_loc2_].playerTitle.nameTxt.text = "PLAYER" + param1;
               this.m_selectionInstance[_loc2_].controlType.gotoAndStop("human");
            }
            else
            {
               this.m_selectionInstance[_loc2_].playerTxt.visible = true;
               this.m_selectionInstance[_loc2_].playerTitle.visible = true;
               this.m_selectionInstance[_loc2_].levelDisplay.visible = true;
               this.m_selectionInstance[_loc2_].nameDisplay.visible = false;
               this.m_selectionInstance[_loc2_].controlType.gotoAndStop("cpu");
               this.m_selectionInstance[_loc2_].flag.visible = this.m_levelData.teams;
               this.m_selectionInstance[_loc2_].playerTitle.nameTxt.text = "PLAYER" + param1;
               if(MovieClip(this.m_selectionInstance[_loc2_].icon).getChildByName("mc") != null)
               {
                  Utils.setTint(MovieClip(this.m_selectionInstance[_loc2_].icon).getChildByName("mc") as MovieClip,1,1,1,1,0,0,0,0);
               }
               _loc3_.MC.gotoAndStop("cpu");
            }
         }
         else
         {
            this.m_selectionInstance[_loc2_].playerTxt.visible = false;
            this.m_selectionInstance[_loc2_].playerTitle.visible = false;
            this.m_selectionInstance[_loc2_].controlType.gotoAndStop("na");
            this.m_selectionInstance[_loc2_].levelDisplay.visible = false;
            this.m_selectionInstance[_loc2_].nameDisplay.visible = false;
            this.m_selectionInstance[_loc2_].flag.visible = false;
            this.m_selectionInstance[_loc2_].playerTitle.nameTxt.text = "PLAYER" + param1;
            _loc3_.Visible = false;
            _loc3_.LastHit = null;
            _loc3_.MC.gotoAndStop("human");
            this.m_selectionInstance[_loc2_].gotoAndStop("off");
         }
      }
      
      public function showNamesKeypad(param1:int) : void
      {
         var _loc2_:String = "display" + param1;
         var _loc3_:String = this.m_selectionInstance[_loc2_].nameDisplay.nameTxt.text;
         if(!this.m_selectionInstance[_loc2_].nameDisplay.nameKeyPad.visible)
         {
            this.m_selectionInstance[_loc2_].nameDisplay.nameKeyPad.visible = true;
            this.m_selectionInstance[_loc2_].nameDisplay.nameTxt.text = "";
         }
         this.updateGameIsReady();
      }
      
      public function hideNamesKeypad(param1:int) : void
      {
         var _loc4_:Object = null;
         var _loc2_:String = "display" + param1;
         var _loc3_:String = this.m_selectionInstance[_loc2_].nameDisplay.nameTxt.text;
         if(this.m_selectionInstance[_loc2_].nameDisplay.nameKeyPad.visible)
         {
            this.m_playerSettings[param1 - 1].name = _loc3_ == ""?null:this.m_selectionInstance[_loc2_].nameDisplay.nameTxt.text;
            this.m_selectionInstance[_loc2_].nameDisplay.nameKeyPad.visible = false;
            if(!this.m_playerSettings[param1 - 1].name)
            {
               this.m_selectionInstance[_loc2_].nameDisplay.nameTxt.text = "P" + param1;
            }
            TextField(this.m_selectionInstance[_loc2_].nameDisplay.nameTxt).textColor = 15658734;
            if(false && this.m_playerSettings[param1 - 1].name)
            {
               _loc4_ = SaveData.getNameSettings(this.m_playerSettings[param1 - 1].name);
               if(_loc4_)
               {
                  return;
               }
               SaveData.createNameSettings(this.m_playerSettings[param1 - 1].name);
               _loc4_ = SaveData.getNameSettings(this.m_playerSettings[param1 - 1].name);
               _loc4_.controls = SaveData["Controller" + param1].getControls();
            }
            else
            {
               SaveData["Controller" + param1].setControls(SaveData.ControlSettings["player" + param1]);
            }
         }
         this.updateGameIsReady();
      }
      
      private function updatePlayerInfo(param1:int) : void
      {
         var _loc2_:String = "display" + param1;
         if(this.m_levelData.teams && this.m_playerSettings[param1 - 1].exist)
         {
            this.m_selectionInstance[_loc2_].charPortrait.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"team" + this.m_playerSettings[param1 - 1].team:"cpu");
            this.m_selectionInstance[_loc2_].playerTitle.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"player" + this.m_playerSettings[param1 - 1].team:"cpu");
            this.m_selectionInstance[_loc2_].flag.visible = this.m_levelData.teams;
            this.m_selectionInstance[_loc2_].flag.gotoAndStop(this.m_playerSettings[param1 - 1].team);
            this.m_selectionInstance[_loc2_].playerTitle.nameTxt.text = "PLAYER" + param1;
         }
         else if(this.m_playerSettings[param1 - 1].exist)
         {
            switch(param1)
            {
               case 1:
                  this.m_selectionInstance[_loc2_].charPortrait.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"team1":"cpu");
                  this.m_selectionInstance[_loc2_].playerTitle.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"player1":"cpu");
                  break;
               case 2:
                  this.m_selectionInstance[_loc2_].charPortrait.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"team3":"cpu");
                  this.m_selectionInstance[_loc2_].playerTitle.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"player3":"cpu");
                  break;
               case 3:
                  this.m_selectionInstance[_loc2_].charPortrait.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"team4":"cpu");
                  this.m_selectionInstance[_loc2_].playerTitle.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"player4":"cpu");
                  break;
               case 4:
                  this.m_selectionInstance[_loc2_].charPortrait.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"team2":"cpu");
                  this.m_selectionInstance[_loc2_].playerTitle.gotoAndStop(!!this.m_playerSettings[param1 - 1].human?"player2":"cpu");
            }
            this.m_selectionInstance[_loc2_].flag.visible = this.m_levelData.teams;
            this.m_selectionInstance[_loc2_].playerTitle.nameTxt.text = "PLAYER" + param1;
         }
         else
         {
            this.m_selectionInstance[_loc2_].playerTitle.visible = false;
            this.m_selectionInstance[_loc2_].flag.visible = false;
         }
      }
      
      public function resetChipPosition(param1:int) : void
      {
         var _loc2_:Chip = this.m_chips[param1 - 1];
         this.updatePositon(param1,this.m_playerSettings[param1 - 1].orig_chipX,this.m_playerSettings[param1 - 1].orig_chipY);
         _loc2_.X = this.m_playerSettings[param1 - 1].chipX;
         _loc2_.Y = this.m_playerSettings[param1 - 1].chipY;
      }
      
      public function updatePositon(param1:int, param2:Number, param3:Number) : void
      {
         this.m_playerSettings[param1 - 1].chipX = param2;
         this.m_playerSettings[param1 - 1].chipY = param3;
      }
      
      public function updateTargetTestDisplay() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Boolean = false;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.m_gameMode == Mode.TARGET_TEST)
         {
            this.updateTargetTestID();
            _loc1_ = "-:--";
            _loc2_ = "";
            _loc3_ = "";
            if(this.m_playerSettings[0].character != null)
            {
               if(SaveData.getTargetTestData(StageSetting.CurrentID,this.m_playerSettings[0].character) != null)
               {
                  if(SaveData.getTargetTestData(StageSetting.CurrentID,this.m_playerSettings[0].character).score > 0)
                  {
                     _loc1_ = Utils.framesToTimeString(SaveData.getTargetTestData(StageSetting.CurrentID,this.m_playerSettings[0].character).score);
                     _loc2_ = Utils.framesToTimeString(SaveData.getTargetTestData(StageSetting.CurrentID,this.m_playerSettings[0].character).score,true);
                     _loc3_ = SaveData.getTargetTestData(StageSetting.CurrentID,this.m_playerSettings[0].character).fps;
                  }
               }
               MenuController.targetTestMenu.SubMenu.minutes_txt.text = _loc1_;
               MenuController.targetTestMenu.SubMenu.millis_txt.text = _loc2_;
               MenuController.targetTestMenu.SubMenu.fps_txt.text = _loc3_;
            }
            else
            {
               MenuController.targetTestMenu.SubMenu.minutes_txt.text = _loc1_;
               MenuController.targetTestMenu.SubMenu.millis_txt.text = _loc2_;
               MenuController.targetTestMenu.SubMenu.fps_txt.text = _loc3_;
            }
            _loc1_ = "-:--";
            _loc2_ = "";
            _loc4_ = true;
            _loc5_ = Stats.getCharacterList(false);
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < _loc5_.length)
            {
               if(SaveData.getTargetTestData(StageSetting.CurrentID,_loc5_[_loc7_]) != null)
               {
                  if(SaveData.getTargetTestData(StageSetting.CurrentID,_loc5_[_loc7_]).score <= 0)
                  {
                     _loc4_ = false;
                     break;
                  }
                  _loc6_ = _loc6_ + SaveData.getTargetTestData(StageSetting.CurrentID,_loc5_[_loc7_]).score;
               }
               else
               {
                  _loc4_ = false;
               }
               _loc7_++;
            }
            if(_loc4_)
            {
               _loc1_ = Utils.framesToTimeString(_loc6_);
               _loc2_ = Utils.framesToTimeString(_loc6_,true);
            }
            MenuController.targetTestMenu.SubMenu.total_minutes_txt.text = _loc1_;
            MenuController.targetTestMenu.SubMenu.total_millis_txt.text = _loc2_;
         }
      }
      
      public function updateLevelDisplay() : void
      {
         var _loc2_:String = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.m_playerSettings.length)
         {
            _loc2_ = "display" + (_loc1_ + 1);
            this.m_selectionInstance[_loc2_].levelDisplay.visible = !this.m_playerSettings[_loc1_].human && this.m_playerSettings[_loc1_].exist?true:false;
            this.m_selectionInstance[_loc2_].levelDisplay.levelHandle.y = -4 - 50 * ((this.m_playerSettings[_loc1_].level - 1) / 10);
            this.m_selectionInstance[_loc2_].levelDisplay.levelTxt.text = this.m_playerSettings[_loc1_].level;
            _loc1_++;
         }
      }
      
      public function updateNamesDisplay() : void
      {
         var _loc2_:String = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.m_playerSettings.length)
         {
            _loc2_ = "display" + (_loc1_ + 1);
            this.m_selectionInstance[_loc2_].nameDisplay.visible = this.m_playerSettings[_loc1_].human && this.m_playerSettings[_loc1_].exist?true:false;
            this.m_selectionInstance[_loc2_].nameDisplay.nameTxt.text = Boolean(this.m_playerSettings[_loc1_].name)?this.m_playerSettings[_loc1_].name:"P" + (_loc1_ + 1);
            _loc1_++;
         }
      }
      
      public function setPlayerRandom(param1:int) : void
      {
         this.setPlayer(param1,null,-1);
         this.m_playerSettings[param1 - 1].character = Stats.getCharacterList()[Utils.randomInteger(0,Stats.getCharacterList().length - 1)];
         this.m_playerSettings[param1 - 1].exist = true;
         this.m_playerSettings[param1 - 1].expansion = -1;
         var _loc2_:MovieClip = this.m_selectionInstance.charSelect.c0;
         var _loc3_:int = 0;
         while(true)
         {
            if(this.m_selectionInstance.charSelect["c" + _loc3_] == null)
            {
               this.m_playerSettings[param1 - 1].character = "rand_mc";
               break;
            }
            if(this.m_selectionInstance.charSelect["c" + _loc3_].characterID == this.m_playerSettings[param1 - 1].character)
            {
               _loc2_ = this.m_selectionInstance.charSelect["c" + _loc3_];
               break;
            }
            _loc3_++;
         }
         this.m_playerSettings[param1 - 1].chipX = _loc2_.x;
         this.m_playerSettings[param1 - 1].chipY = _loc2_.y;
      }
      
      public function updateDisplay() : void
      {
         var _loc2_:String = null;
         var _loc3_:MovieClip = null;
         var _loc1_:int = 0;
         this.m_selectionInstance = MovieClip(this.ROOT.charSelection);
         this.m_optionsInstance = MovieClip(this.ROOT.options);
         if(this.m_selectionInstance != null)
         {
            if(this.m_gameMode == Mode.TRAINING && !this.m_wasInit)
            {
               this.setPlayerRandom(2);
               this.m_wasInit = true;
            }
            this.updateTargetTestDisplay();
            this.updateLevelDisplay();
            this.updateNamesDisplay();
            _loc1_ = 0;
            while(_loc1_ < this.m_playerSettings.length)
            {
               this.m_chips[_loc1_] = this.m_selectionInstance.charSelect["p" + (_loc1_ + 1) + "Chip"];
               this.m_chips[_loc1_].X = this.m_playerSettings[_loc1_].chipX;
               this.m_chips[_loc1_].Y = this.m_playerSettings[_loc1_].chipY;
               this.m_chips[_loc1_].ExpansionNum = this.m_playerSettings[_loc1_].expansion;
               this.m_chips[_loc1_].Visible = !!this.m_playerSettings[_loc1_].exist?Boolean(true):Boolean(false);
               this.m_chips[_loc1_].MC.gotoAndStop(!!this.m_playerSettings[_loc1_].human?"human":"cpu");
               _loc2_ = this.m_playerSettings[_loc1_].character;
               _loc3_ = this.m_selectionInstance["display" + (_loc1_ + 1)];
               if(_loc2_ != null)
               {
                  this.changePic(_loc1_ + 1,_loc2_,this.m_playerSettings[_loc1_].expansion);
                  this.m_chips[_loc1_].LastHit = _loc2_;
               }
               else
               {
                  _loc3_.playerTxt.text = "";
                  this.removePic(_loc1_ + 1);
                  this.resetChipPosition(_loc1_ + 1);
               }
               Utils.fitText(_loc3_.playerTxt,20,1);
               _loc3_.gotoAndStop(!!this.m_playerSettings[_loc1_].exist?"on":"off");
               _loc3_.nextExp.visible = this.m_playerSettings[_loc1_].character == "xp";
               this.updatePlayerInfo(_loc1_ + 1);
               if(!this.m_playerSettings[_loc1_].exist)
               {
                  _loc3_.controlType.gotoAndStop("na");
                  _loc3_.gotoAndStop("off");
               }
               else if(!this.m_playerSettings[_loc1_].human)
               {
                  _loc3_.controlType.gotoAndStop("cpu");
               }
               else
               {
                  _loc3_.controlType.gotoAndStop("human");
               }
               this.updateControl(_loc1_ + 1);
               _loc1_++;
            }
            if(ModeFeatures.hasFeature(ModeFeatures.ALLOW_TEAM_TOGGLE,this.m_gameMode))
            {
               this.m_selectionInstance.bnGameMode.gameModeTxt.gotoAndStop(!!this.m_levelData.teams?"team":"ffa");
            }
            if(ModeFeatures.hasFeature(ModeFeatures.ALLOW_TEAM_TOGGLE,this.m_gameMode))
            {
               if(this.UsingLives)
               {
                  this.m_selectionInstance.match_desc.text = "-man KO test!";
                  this.m_selectionInstance.opCount.text = this.Lives;
               }
               else
               {
                  this.m_selectionInstance.match_desc.text = "-minute survival fest!";
                  this.m_selectionInstance.opCount.text = this.Time;
               }
            }
            this.updateGameIsReady();
            this.updateSeriesIconColors();
         }
      }
      
      public function hasVisibleKeypad() : Boolean
      {
         var _loc1_:int = 1;
         while(_loc1_ <= Main.MAXPLAYERS)
         {
            if(this.m_selectionInstance["display" + _loc1_].nameDisplay.nameKeyPad.visible)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function gameIsReady() : Boolean
      {
         if(ModeFeatures.hasFeature(ModeFeatures.ALLOW_SINGLE_PLAYER,this.m_gameMode))
         {
            return this.singlePlayerReady();
         }
         var _loc1_:Number = 0;
         var _loc2_:int = 2;
         var _loc3_:Number = 999;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < this.m_playerSettings.length)
         {
            if(_loc1_ < _loc2_)
            {
               if(this.m_playerSettings[_loc5_].character != null && this.m_playerSettings[_loc5_].team != _loc3_ || this.m_playerSettings[_loc5_].character != null && this.m_playerSettings[_loc5_].team == -1)
               {
                  _loc3_ = this.m_playerSettings[_loc5_].team;
                  _loc1_++;
               }
            }
            _loc5_++;
         }
         if(this.hasVisibleKeypad())
         {
            _loc4_ = true;
         }
         if(_loc1_ >= _loc2_ && this.m_readyDelay.IsComplete && !(this.m_gameMode == Mode.TRAINING && this.m_playerSettings[0].character == null) && !_loc4_)
         {
            return true;
         }
         return false;
      }
      
      private function singlePlayerReady() : Boolean
      {
         if(this.m_playerSettings[0].character != null)
         {
            return true;
         }
         return false;
      }
      
      public function incrementShortcut() : void
      {
         if(this.UsingLives)
         {
            SaveData.toggleStock(true);
         }
         else
         {
            SaveData.toggleTime(true);
         }
         this.loadSavedVSOptions();
         this.updateDisplay();
      }
      
      public function decrementShortcut() : void
      {
         if(this.UsingLives)
         {
            SaveData.toggleStock(false);
         }
         else
         {
            SaveData.toggleTime(false);
         }
         this.loadSavedVSOptions();
         this.updateDisplay();
      }
      
      public function loadSavedVSOptions() : void
      {
         var _loc3_:* = undefined;
         var _loc1_:Object = SaveData.getSavedVSOptions();
         this.LevelData.time = _loc1_.VS_Time;
         this.LevelData.showPlayerID = _loc1_.VS_DisplayPlayer;
         this.LevelData.lives = _loc1_.VS_Lives;
         this.LevelData.startDamage = _loc1_.VS_StartDamage;
         this.LevelData.usingLives = _loc1_.VS_UsingLives;
         this.LevelData.usingTime = _loc1_.VS_UsingTime;
         this.LevelData.teamDamage = _loc1_.teamDamage;
         this.LevelData.damageRatio = _loc1_.VS_DamageRatio;
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerSettings.length)
         {
            this.m_playerSettings[_loc2_].damageRatio = _loc1_.VS_DamageRatio;
            this.m_playerSettings[_loc2_].lives = _loc1_.VS_Lives;
            this.m_playerSettings[_loc2_].level = _loc1_["VS_CPULevel" + (_loc2_ + 1)];
            _loc2_++;
         }
         this.m_items.frequency = _loc1_.VS_ItemFreq;
         for(_loc3_ in _loc1_.VS_Items)
         {
            this.m_items.items[_loc3_] = _loc1_.VS_Items[_loc3_];
         }
      }
      
      public function saveVSOptions() : void
      {
         var _loc3_:* = undefined;
         if(!ModeFeatures.hasFeature(ModeFeatures.ALLOW_SAVE_VS_OPTIONS,this.m_gameMode))
         {
            return;
         }
         var _loc1_:Object = {
            "teamDamage":this.LevelData.teamDamage,
            "VS_Time":this.LevelData.time,
            "VS_Lives":this.LevelData.lives,
            "VS_DamageRatio":this.LevelData.damageRatio,
            "VS_ItemFreq":this.Items.frequency,
            "VS_StartDamage":this.LevelData.startDamage,
            "VS_DisplayPlayer":this.LevelData.showPlayerID,
            "VS_UsingLives":this.LevelData.usingLives,
            "VS_UsingTime":this.LevelData.usingTime,
            "VS_Items":{}
         };
         var _loc2_:int = 0;
         while(_loc2_ < this.m_playerSettings.length)
         {
            _loc1_["VS_CPULevel" + (_loc2_ + 1)] = this.m_playerSettings[_loc2_].level;
            _loc2_++;
         }
         for(_loc3_ in this.m_items.items)
         {
            _loc1_.VS_Items[_loc3_] = this.m_items.items[_loc3_];
         }
         SaveData.setSavedVSOptions(_loc1_);
         SaveData.saveGame();
      }
   }
}
