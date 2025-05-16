package com.mcleodgaming.ssf2.net
{
   import com.mcleodgaming.mgn.events.MGNEvent;
   import com.mcleodgaming.mgn.events.MGNEventManager;
   import com.mcleodgaming.mgn.net.IOnlineMatch;
   import com.mcleodgaming.mgn.net.MGN_Socket;
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.Game;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.engine.StageSetting;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.util.Controller;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class MultiplayerManager
   {
      
      private static const MAX_FPS:int = 30;
      
      private static const MIN_FPS:int = 30;
      
      private static const NORMAL_FPS:int = 30;
      
      private static const FPS_THRESHOLD:int = 5;
      
      public static const INPUT_BUFFER_START:int = 3;
      
      public static var INPUT_BUFFER:int = 3;
      
      private static var m_controllers:Vector.<Controller>;
      
      private static var m_notifier:MovieClip;
      
      private static var m_notifierText:TextField;
      
      private static var m_permanentBox:Boolean;
      
      private static var m_frameRateTimer:FrameTimer;
      
      private static var m_lastUpdate:Date;
      
      private static var m_pingCount:Number;
      
      private static var m_pingTotal:Number;
      
      private static var m_averagePing:Number;
      
      private static var m_frameRateIncremented:Boolean;
      
      private static var m_randomSeed:Number;
      
      private static var m_matchReady:Boolean;
      
      private static var m_matchEnded:Boolean;
      
      private static var m_roomData:Object;
      
      private static var m_promotionTimer:FrameTimer;
      
      private static var m_onlineInterface:IOnlineMatch;
       
      
      public function MultiplayerManager()
      {
         super();
      }
      
      public static function initializeMultiplayerManager() : void
      {
         trace("MultiplayerManager initialized");
         m_matchReady = false;
         m_matchEnded = false;
         m_roomData = null;
         m_permanentBox = false;
         m_controllers = new Vector.<Controller>();
         var _loc1_:int = 0;
         while(_loc1_ < Main.MAXPLAYERS)
         {
            m_controllers.push(new Controller(_loc1_ + 1,Controller(SaveData["Controller" + (_loc1_ + 1)]).getControls()));
            _loc1_++;
         }
         m_notifier = null;
         m_notifierText = null;
         m_onlineInterface = new MGN_Socket(Main.MAXPLAYERS);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.NOTIFY,handlemgn_NOTIFY);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.PLAYER_JOINED,handlemgn_PLAYER_JOINED);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.PLAYER_LEFT,handlemgn_PLAYER_LEFT);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.DATA,handlemgn_DATA);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.MATCH_START,handlemgn_MATCH_START);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.MATCH_FINISHED,handlemgn_MATCH_FINISHED);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.MATCH_END,handlemgn_MATCH_END);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.DISCONNECT,handlemgn_DISCONNECT);
         m_frameRateTimer = new FrameTimer(30);
         m_promotionTimer = new FrameTimer(30 * 5);
         m_lastUpdate = null;
         m_pingCount = 0;
         m_pingTotal = 0;
         m_averagePing = 0;
         m_frameRateIncremented = true;
         m_randomSeed = 0;
         resetMasterFrame();
      }
      
      public static function get RoomList() : Array
      {
         return m_onlineInterface.RoomList;
      }
      
      public static function get MatchReady() : Boolean
      {
         return m_matchReady;
      }
      
      public static function get MatchEnded() : Boolean
      {
         return m_matchEnded;
      }
      
      public static function get RoomData() : Object
      {
         return m_roomData;
      }
      
      public static function get Controllers() : Vector.<Controller>
      {
         return m_controllers;
      }
      
      public static function get Ping() : Number
      {
         return Math.round(m_averagePing);
      }
      
      public static function get Connected() : Boolean
      {
         return m_onlineInterface.Connected;
      }
      
      public static function get Active() : Boolean
      {
         return m_onlineInterface.Active;
      }
      
      public static function set Active(param1:Boolean) : void
      {
         m_onlineInterface.Active = param1;
      }
      
      public static function get NumPlayers() : int
      {
         return m_onlineInterface.NumPlayers;
      }
      
      public static function get MasterFrame() : int
      {
         return m_onlineInterface.MasterFrame;
      }
      
      public static function set MasterFrame(param1:int) : void
      {
         m_onlineInterface.MasterFrame = param1;
      }
      
      public static function get PlayerID() : int
      {
         return m_onlineInterface.PlayerID;
      }
      
      public static function get RoomLocked() : Boolean
      {
         return m_onlineInterface.RoomLocked;
      }
      
      public static function get IsHost() : Boolean
      {
         return m_onlineInterface.IsHost;
      }
      
      public static function get P2PMode() : Boolean
      {
         return m_onlineInterface.P2PMode;
      }
      
      public static function set P2PMode(param1:Boolean) : void
      {
         m_onlineInterface.P2PMode = param1;
      }
      
      public static function get PromotionTimer() : FrameTimer
      {
         return m_promotionTimer;
      }
      
      public static function reset() : void
      {
         m_roomData = null;
         m_matchReady = false;
         m_matchEnded = false;
         m_onlineInterface.disconnect();
         initializeMultiplayerManager();
      }
      
      public static function resetMasterFrame() : void
      {
         m_onlineInterface.resetMasterFrame();
         var _loc1_:int = 0;
         while(_loc1_ < m_onlineInterface.NumPlayers)
         {
            m_controllers[_loc1_].flushControlBits();
            _loc1_++;
         }
      }
      
      public static function resetSeed() : void
      {
         m_randomSeed = Utils.random();
      }
      
      public static function setSeed(param1:Number) : void
      {
         m_randomSeed = param1;
      }
      
      public static function notify(param1:String, param2:Boolean = false) : void
      {
         if(m_notifier != null)
         {
            if(m_notifierText.text.length > 500)
            {
               m_notifierText.text = m_notifierText.text.substr(0,250);
            }
            m_notifierText.appendText(" > " + param1 + "\n");
            m_notifierText.scrollV = m_notifierText.numLines;
            m_notifier.gotoAndPlay("showmsg");
            if(m_permanentBox || param2)
            {
               m_permanentBox = true;
               m_notifier.stop();
            }
         }
         trace(param1);
      }
      
      public static function makeNotifier() : void
      {
         if(m_notifier == null)
         {
            m_notifier = Main.getLibraryMC("onlineplay_notify");
            m_notifierText = m_notifier.txt_mc.txtbox;
            Main.Root.stage.addChild(m_notifier);
            m_notifier.x = Main.Width / 2;
            m_notifier.y = Main.Height;
         }
      }
      
      public static function connect(param1:String, param2:String, param3:String) : void
      {
         m_onlineInterface.connect(param1,param2,param3);
         MultiplayerManager.makeNotifier();
      }
      
      public static function disconnect() : void
      {
         m_onlineInterface.disconnect();
      }
      
      public static function createRoom(param1:String, param2:String, param3:Object) : void
      {
         m_onlineInterface.createRoom(param1,param2,param3);
      }
      
      public static function joinRoom(param1:String, param2:String) : void
      {
         m_onlineInterface.joinRoom(param1,param2);
      }
      
      public static function createJoinRoom(param1:String, param2:String, param3:Object) : void
      {
         m_onlineInterface.createJoinRoom(param1,param2,param3);
      }
      
      public static function lockRoom() : void
      {
         m_onlineInterface.lockRoom();
      }
      
      public static function unlockRoom() : void
      {
         m_onlineInterface.unlockRoom();
      }
      
      public static function refreshRoomList(param1:Boolean = false) : void
      {
         m_onlineInterface.refreshRoomList(param1);
      }
      
      public static function sendMyDataFrame(param1:int, param2:Object) : void
      {
         m_onlineInterface.sendMyDataFrame(param1,param2);
      }
      
      public static function sendMatchReadySignal(param1:Object) : void
      {
         m_onlineInterface.sendMatchReadySignal(param1);
      }
      
      public static function sendMatchFinishedSignal(param1:Object) : void
      {
         m_onlineInterface.sendMatchFinishedSignal(param1);
      }
      
      public static function sendMatchEndSignal() : void
      {
         m_onlineInterface.sendMatchEndSignal();
      }
      
      public static function sendMatchSettings(param1:Object) : void
      {
         m_onlineInterface.sendMatchSettings(param1);
      }
      
      private static function updateControls() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:Date = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(m_onlineInterface.Active && m_onlineInterface.Connected)
         {
            _loc1_ = false;
            while(m_onlineInterface.ControlBits[0].length > 0)
            {
               _loc1_ = true;
               _loc2_ = 0;
               while(_loc2_ < m_onlineInterface.NumPlayers)
               {
                  m_controllers[_loc2_].queueControlBits(m_onlineInterface.ControlBits[_loc2_][0]);
                  m_onlineInterface.ControlBits[_loc2_].splice(0,1);
                  _loc2_++;
               }
            }
            m_frameRateTimer.tick();
            m_promotionTimer.tick();
            if(_loc1_)
            {
               if(m_lastUpdate)
               {
                  _loc3_ = new Date();
                  _loc4_ = _loc3_.time - m_lastUpdate.time;
                  m_lastUpdate.setTime(_loc3_.getTime());
                  m_pingCount++;
                  m_pingTotal = m_pingTotal + _loc4_;
                  if(m_frameRateTimer.IsComplete)
                  {
                     m_frameRateTimer.reset();
                     _loc5_ = m_pingTotal / m_pingCount;
                     if(_loc5_ > 1000 / MultiplayerManager.NORMAL_FPS)
                     {
                        if(_loc5_ < 1000 / (MultiplayerManager.NORMAL_FPS + MultiplayerManager.FPS_THRESHOLD))
                        {
                           m_frameRateIncremented = false;
                           Main.Root.stage.frameRate--;
                        }
                        else if(_loc5_ < m_averagePing + 2)
                        {
                           if(m_frameRateIncremented && Main.Root.stage.frameRate < MultiplayerManager.MAX_FPS)
                           {
                              Main.Root.stage.frameRate++;
                           }
                           else if(!m_frameRateIncremented && Main.Root.stage.frameRate > MultiplayerManager.MIN_FPS)
                           {
                              Main.Root.stage.frameRate--;
                           }
                        }
                        else
                        {
                           m_frameRateIncremented = !m_frameRateIncremented;
                           if(m_frameRateIncremented && Main.Root.stage.frameRate < MultiplayerManager.MAX_FPS)
                           {
                              Main.Root.stage.frameRate++;
                           }
                           else if(!m_frameRateIncremented && Main.Root.stage.frameRate > MultiplayerManager.MIN_FPS)
                           {
                              Main.Root.stage.frameRate--;
                           }
                        }
                     }
                     if(Main.DEBUG && MenuController.debugConsole && MenuController.debugConsole.PingCapture)
                     {
                        MultiplayerManager.notify(Ping + " ms");
                     }
                     m_averagePing = _loc5_;
                     m_pingCount = 0;
                     m_pingTotal = 0;
                     if(m_promotionTimer.IsComplete)
                     {
                        m_promotionTimer.reset();
                        if(m_averagePing < 35)
                        {
                           INPUT_BUFFER = 1;
                        }
                        else if(m_averagePing < 70)
                        {
                           INPUT_BUFFER = 2;
                        }
                        else if(m_averagePing < 200)
                        {
                           INPUT_BUFFER = 3;
                        }
                        else
                        {
                           INPUT_BUFFER = 4;
                        }
                     }
                  }
               }
               else
               {
                  m_lastUpdate = new Date();
                  m_averagePing = 1000;
                  m_pingTotal = m_averagePing;
                  m_pingCount = 1;
               }
            }
         }
      }
      
      private static function handlemgn_PLAYER_JOINED(param1:MGNEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_unlock");
         MultiplayerManager.notify(param1.data.user + " has joined the match.");
      }
      
      private static function handlemgn_PLAYER_LEFT(param1:MGNEvent) : void
      {
         MultiplayerManager.notify(param1.data.user + " was disconnected.");
         reset();
         if(GameController.stageData && !GameController.stageData.GameEnded)
         {
            GameController.stageData.endGame(true);
         }
         else
         {
            MenuController.removeAllMenus();
            MenuController.showMainMenu();
         }
      }
      
      private static function handlemgn_NOTIFY(param1:MGNEvent) : void
      {
         MultiplayerManager.notify(param1.data.message);
      }
      
      private static function handlemgn_DATA(param1:MGNEvent) : void
      {
      }
      
      private static function handlemgn_MATCH_START(param1:MGNEvent) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         m_matchEnded = false;
         if(GameController.currentGame && GameController.currentGame.SuddenDeath)
         {
            m_matchReady = true;
            return;
         }
         var _loc2_:int = 0;
         m_roomData = {};
         m_roomData.matchSettings = JSON.decode(param1.data.room_data.matchSettings);
         var _loc3_:Array = param1.data.player_data;
         var _loc4_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            _loc4_.push(JSON.decode(_loc3_[_loc2_].data.playerSettings));
            _loc2_++;
         }
         Utils.setRandSeed(m_roomData.matchSettings.levelData.randSeed);
         Utils.shuffleRandom();
         Main.prepRandomCharacters();
         Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(m_roomData.matchSettings.stageID).CurrentFileName));
         var _loc5_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < Main.MAXPLAYERS)
         {
            m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].exist = false;
            m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].character = null;
            _loc2_++;
         }
         if(m_roomData.matchSettings.levelData.teams)
         {
            _loc6_ = -1;
            _loc7_ = new Array();
            _loc8_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc4_.length)
            {
               if(_loc4_[_loc2_].team < 0)
               {
                  if(_loc6_ < 0)
                  {
                     _loc4_[_loc2_].team = 1;
                     _loc6_ = 1;
                     _loc7_[_loc6_] = true;
                     _loc8_++;
                  }
                  else
                  {
                     _loc4_[_loc2_].team = _loc6_;
                     if(!_loc7_[_loc6_])
                     {
                        _loc8_++;
                     }
                     _loc7_[_loc6_] = true;
                  }
               }
               else
               {
                  if(!_loc7_[_loc4_[_loc2_].team])
                  {
                     _loc8_++;
                  }
                  _loc6_ = _loc4_[_loc2_].team;
                  _loc7_[_loc6_] = true;
               }
               _loc2_++;
            }
            if(_loc8_ <= 1)
            {
               _loc9_ = [1,2,3];
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  if(_loc9_.indexOf(_loc4_[_loc2_].team) >= 0)
                  {
                     _loc9_.splice(_loc9_.indexOf(_loc4_[_loc2_].team),1);
                  }
                  if(_loc2_ == _loc4_.length - 1)
                  {
                     _loc4_[_loc2_].team = _loc9_[0];
                  }
                  _loc2_++;
               }
            }
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].exist = true;
            m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].human = true;
            m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].name = _loc4_[_loc2_].name;
            m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].costume = _loc4_[_loc2_].costume;
            m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].character = _loc4_[_loc2_].character;
            m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].team = _loc4_[_loc2_].team;
            if(m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].character != null && m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].character != "xp")
            {
               Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].character == "rand_mc"?Main.RandCharList[_loc2_].StatsName:m_roomData.matchSettings.playerData["player" + (_loc2_ + 1)].character).CurrentFileName));
            }
            _loc2_++;
         }
         StageSetting.CurrentID = m_roomData.matchSettings.stageID;
         Main.dynamicLoad(onMatchReady);
      }
      
      private static function onMatchReady(param1:*) : void
      {
         m_matchReady = true;
      }
      
      private static function handlemgn_MATCH_END(param1:MGNEvent) : void
      {
         m_matchEnded = true;
      }
      
      private static function handlemgn_DISCONNECT(param1:MGNEvent) : void
      {
      }
      
      private static function handlemgn_MATCH_FINISHED(param1:MGNEvent) : void
      {
         m_matchReady = false;
         trace("Match end signal received from other player.");
      }
      
      public static function toWaitingRoom(param1:Game, param2:Function) : void
      {
         param1.LevelData.randSeed = Math.round(Math.random() * 1000000 + 1);
         GameController.onlineModeMatchSettings = param1.MatchSettings;
         param1.GameMode = Mode.ONLINE_WAITING_ROOM;
         param1.setStageSettings(StageSetting.WaitingRoom);
         param1.LevelData.usingLives = false;
         param1.LevelData.usingTime = false;
         param1.LevelData.teams = false;
         param1.PlayerSettings[1].exist = true;
         param1.PlayerSettings[1].character = "sandbag";
         param1.PlayerSettings[1].character = "sandbag";
         param1.PlayerSettings[0].team = -1;
         param1.PlayerSettings[1].team = -1;
         StageSetting.CurrentID = StageSetting.WaitingRoom.ID;
         Utils.setRandSeed(param1.LevelData.randSeed);
         Utils.shuffleRandom();
         Main.prepRandomCharacters();
         if(param1.PlayerSettings[0].character == "rand_mc")
         {
            GameController.onlineModeMatchSettings.playerData.player1.character = Main.RandCharList[0].StatsName;
            param1.PlayerSettings[0].character = GameController.onlineModeMatchSettings.playerData.player1.character;
            param1.PlayerSettings[0].isRandom = true;
            GameController.onlineModeMatchSettings.playerData.player1.isRandom = true;
         }
         Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(StageSetting.CurrentID).CurrentFileName));
         Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID("sandbag").CurrentFileName));
         var _loc3_:int = 1;
         while(_loc3_ <= Main.MAXPLAYERS)
         {
            if(param1.PlayerSettings[_loc3_ - 1] && param1.PlayerSettings[_loc3_ - 1].exist && param1.PlayerSettings[_loc3_ - 1].character != null && param1.PlayerSettings[_loc3_ - 1].character != "xp")
            {
               Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(param1.PlayerSettings[_loc3_ - 1].character == "rand_mc"?Main.RandCharList[_loc3_ - 1].StatsName:param1.PlayerSettings[_loc3_ - 1].character).CurrentFileName));
            }
            _loc3_++;
         }
         Main.dynamicLoad(param2);
      }
      
      public static function PERFORMALL() : void
      {
         if(Active)
         {
            m_onlineInterface.PERFORMALL();
            updateControls();
         }
      }
   }
}
