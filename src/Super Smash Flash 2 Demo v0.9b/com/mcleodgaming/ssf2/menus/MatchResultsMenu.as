package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.mgn.events.MGNEvent;
   import com.mcleodgaming.mgn.events.MGNEventManager;
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.Version;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.controllers.UnlockController;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.SSF2API_Interface;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.enums.ModeFeatures;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import com.mcleodgaming.ssf2.util.Controller;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Key;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.media.SoundChannel;
   import flash.utils.ByteArray;
   
   public class MatchResultsMenu extends Menu
   {
       
      
      private var skipLevel:int;
      
      private var winnerIs:SoundChannel;
      
      private var winnerChar:Character;
      
      private var m_backKey:Boolean;
      
      private var m_backKeyLetGo:Boolean;
      
      private var m_onlineFinishResendTimer:FrameTimer;
      
      public function MatchResultsMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_matchresults");
         m_subMenu.stop();
         this.skipLevel = 0;
         this.winnerIs = null;
         this.winnerChar = null;
         this.m_onlineFinishResendTimer = new FrameTimer(30 * 10);
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         this.m_backKey = false;
         this.m_backKeyLetGo = false;
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
         }
         m_subMenu.replaySave_btn.buttonMode = true;
         m_subMenu.replaySave_btn.useHandCursor = true;
         m_subMenu.replaySave_btn.visible = !GameController.stageData.ReplayMode;
         super.makeEvents();
         m_subMenu.back_btn.addEventListener(MouseEvent.CLICK,this.gotoCharScreen);
         m_subMenu.addEventListener(Event.ENTER_FRAME,this.checkBackKeys);
         m_subMenu.stage.addEventListener(MouseEvent.CLICK,this.checkClick);
         m_subMenu.replaySave_btn.addEventListener(MouseEvent.CLICK,this.saveReplay);
         this.m_backKey = false;
         this.m_backKeyLetGo = false;
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.back_btn.removeEventListener(MouseEvent.CLICK,this.gotoCharScreen);
         m_subMenu.removeEventListener(Event.ENTER_FRAME,this.checkBackKeys);
         m_subMenu.stage.removeEventListener(MouseEvent.CLICK,this.checkClick);
         m_subMenu.replaySave_btn.removeEventListener(MouseEvent.CLICK,this.saveReplay);
      }
      
      public function reset() : void
      {
         var _loc2_:int = 0;
         this.skipLevel = 0;
         m_subMenu.gotoAndPlay(1);
         var _loc1_:int = 1;
         while(_loc1_ <= Main.MAXPLAYERS)
         {
            _loc2_ = 0;
            while(_loc2_ < m_subMenu["p" + _loc1_ + "Pose"].numChildren)
            {
               m_subMenu["p" + _loc1_ + "Pose"].getChildAt(_loc2_).visible = false;
               m_subMenu["p" + _loc1_ + "Pose"].removeChild(m_subMenu["p" + _loc1_ + "Pose"].getChildAt(_loc2_));
               trace("attempted to remove child in p" + _loc1_ + "Pose");
               _loc2_++;
            }
            _loc1_++;
         }
         SaveData.saveGame();
         this.displayMatchResults();
      }
      
      private function saveReplay(param1:MouseEvent) : void
      {
         var _loc2_:Date = new Date();
         var _loc3_:String = "" + _loc2_.getFullYear();
         var _loc4_:String = _loc2_.getMonth() < 9?"0" + (_loc2_.getMonth() + 1):"" + (_loc2_.getMonth() + 1);
         var _loc5_:String = _loc2_.getDate() < 9?"0" + (_loc2_.getDate() + 1):"" + (_loc2_.getDate() + 1);
         var _loc6_:ByteArray = new ByteArray();
         _loc6_.writeUTF(GameController.stageData.ReplayDataObj.exportReplay());
         _loc6_.compress();
         Utils.saveFile(_loc6_,GameController.stageData.ReplayDataObj.Name + "." + _loc3_ + "-" + _loc4_ + "-" + _loc5_ + ".v" + Version.getVersion() + ".ssfrec");
      }
      
      private function checkClick(param1:MouseEvent) : void
      {
         if(this.skipLevel == 0)
         {
            m_subMenu.gotoAndPlay("skip");
            this.skipLevel = 1;
         }
         else if(this.skipLevel == 1)
         {
            m_subMenu.gotoAndStop("skip2");
            this.skipLevel = 2;
         }
      }
      
      private function checkBackKeys(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(m_subMenu.currentFrame >= 193)
         {
            this.skipLevel = 2;
         }
         else if(m_subMenu.currentFrame >= 120)
         {
            this.skipLevel = 1;
         }
         var _loc3_:int = 0;
         while(_loc3_ < Main.MAXPLAYERS)
         {
            if(SaveData["Controller" + _loc3_] != null)
            {
               if(Key.isDown(Controller(SaveData["Controller" + _loc3_])._BUTTON2))
               {
                  this.m_backKey = true;
                  if(this.m_backKeyLetGo)
                  {
                     this.m_backKeyLetGo = false;
                     if(this.skipLevel == 0)
                     {
                        m_subMenu.gotoAndPlay("skip");
                        this.skipLevel = 1;
                     }
                     else if(this.skipLevel == 1)
                     {
                        m_subMenu.gotoAndPlay("skip2");
                        this.skipLevel = 2;
                     }
                     else
                     {
                        this.gotoCharScreen(null);
                     }
                  }
                  _loc2_ = true;
               }
            }
            _loc3_++;
         }
         if(!_loc2_)
         {
            this.m_backKeyLetGo = true;
            this.m_backKey = false;
         }
      }
      
      private function gotoCharScreen(param1:MouseEvent) : void
      {
         var _loc3_:* = undefined;
         SoundQueue.instance.stopMusic();
         SoundQueue.instance.setLoopFunction(SoundQueue.instance.loopMusic);
         this.killEvents();
         if(this.winnerIs != null && this.winnerIs.hasEventListener(Event.SOUND_COMPLETE))
         {
            this.winnerIs.removeEventListener(Event.SOUND_COMPLETE,this.sayWinner);
         }
         var _loc2_:Boolean = true;
         for(_loc3_ in SaveData.Records.vs.wins)
         {
            if(_loc3_ != "captainfalcon" && SaveData.Records.vs.wins[_loc3_] <= 0)
            {
               _loc2_ = false;
            }
         }
         removeSelf();
         m_subMenu.gotoAndStop(1);
         if(GameController.stageData.OnlineMode || GameController.currentGame.GameMode === Mode.ONLINE_WAITING_ROOM)
         {
            removeSelf();
            m_subMenu.gotoAndStop(1);
            if(MultiplayerManager.Connected)
            {
               MenuController.showPleaseWaitMenu();
               Main.Root.stage.addEventListener(Event.ENTER_FRAME,this.waitForPlayers);
            }
            else
            {
               GameController.stageData.deactivateCharacters();
               GameController.destroyStageData();
               SSF2API_Interface.deinit();
               removeSelf();
               MenuController.showMainMenu();
            }
         }
         else
         {
            GameController.stageData.deactivateCharacters();
            SSF2API_Interface.deinit();
            UnlockController.checkUnlocks();
            UnlockController.nextMenuFunc = MenuController.showVSMenu;
            if(GameController.stageData.ReplayMode)
            {
               removeSelf();
               m_subMenu.gotoAndStop(1);
               GameController.destroyStageData();
               SoundQueue.instance.playMusic("menumusic",0);
               MenuController.showVaultMenu();
            }
            else if(UnlockController.PendingUnlockFights.length > 0)
            {
               MenuController.showPreUnlockMenu();
            }
            else if(UnlockController.PendingUnlockScreens.length > 0)
            {
               MenuController.showPostUnlockMenu();
            }
            else
            {
               removeSelf();
               m_subMenu.gotoAndStop(1);
               GameController.destroyStageData();
               MenuController.showVSMenu();
            }
         }
		 Main.unloadResources();
      }
      
      private function waitForPlayers(param1:Event) : void
      {
         if(!MultiplayerManager.MatchReady)
         {
            Main.Root.stage.removeEventListener(Event.ENTER_FRAME,this.waitForPlayers);
            if(MultiplayerManager.IsHost)
            {
               MGNEventManager.dispatcher.addEventListener(MGNEvent.UNLOCK_ROOM,this.onlineModeReady);
               MGNEventManager.dispatcher.addEventListener(MGNEvent.ERROR_UNLOCK_ROOM,this.onlineModeReady);
               MultiplayerManager.unlockRoom();
            }
            else
            {
               this.onlineModeReady();
            }
         }
         else
         {
            this.m_onlineFinishResendTimer.tick();
            if(this.m_onlineFinishResendTimer.IsComplete)
            {
               trace("resent finish signal");
               this.m_onlineFinishResendTimer.reset();
               MultiplayerManager.sendMatchFinishedSignal({"player_data":GameController.stageData.getPlayer(MultiplayerManager.PlayerID).getMatchResults().exportData()});
            }
         }
      }
      
      private function onlineModeReady(param1:* = null) : void
      {
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.UNLOCK_ROOM,this.onlineModeReady);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_UNLOCK_ROOM,this.onlineModeReady);
         MenuController.pleaseWaitMenu.removeSelf();
         GameController.stageData.deactivateCharacters();
         GameController.destroyStageData();
         SSF2API_Interface.deinit();
         MultiplayerManager.resetMasterFrame();
         var _loc2_:Boolean = GameController.currentGame.PlayerSettings[0].isRandom;
         var _loc3_:int = 0;
         while(_loc3_ < GameController.currentGame.PlayerSettings.length)
         {
            GameController.currentGame.PlayerSettings[_loc3_].importSettings(GameController.onlineModeMatchSettings.playerData["player" + (_loc3_ + 1)]);
            GameController.currentGame.PlayerSettings[_loc3_].isRandom = false;
            _loc3_++;
         }
         GameController.currentGame.LevelData.importSettings(GameController.onlineModeMatchSettings.levelData);
         GameController.currentGame.Items.importSettings(GameController.onlineModeMatchSettings.items);
         if(_loc2_)
         {
            GameController.currentGame.PlayerSettings[0].character = "rand_mc";
         }
         MenuController.showOnlineCharacterMenu();
      }
      
      private function sayWinner(param1:Event) : void
      {
         this.winnerChar = GameController.stageData.getFirstWinner();
         switch(this.winnerChar.Team)
         {
            case -1:
               SoundQueue.instance.playVoiceEffect("narrator_" + this.winnerChar.StatsName);
               break;
            case 1:
               SoundQueue.instance.playVoiceEffect("narrator_redteam");
               break;
            case 2:
               SoundQueue.instance.playVoiceEffect("narrator_greenteam");
               break;
            case 3:
               SoundQueue.instance.playVoiceEffect("narrator_blueteam");
         }
      }
      
      private function displayMatchResults() : void
      {
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         GameController.stageData.activateCharacters();
         SSF2API_Interface.init(GameController.stageData);
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         SoundQueue.instance.stopMusic();
         if(!GameController.stageData.NoContest)
         {
            _loc4_ = new Array();
            _loc2_ = 1;
            while(_loc2_ <= Main.MAXPLAYERS)
            {
               if(GameController.stageData.getPlayer(_loc2_) != null && _loc4_.indexOf(GameController.stageData.getPlayer(_loc2_).StatsName) < 0)
               {
                  if(ModeFeatures.hasFeature(ModeFeatures.SAVE_RECORDS,GameController.stageData.GameRef.GameMode))
                  {
                     SaveData.Records.vs.matches[GameController.stageData.getPlayer(_loc2_).StatsName]++;
                  }
                  _loc4_.push(GameController.stageData.getPlayer(_loc2_).StatsName);
               }
               _loc2_++;
            }
            _loc4_ = new Array();
            _loc2_ = 1;
            while(_loc2_ <= Main.MAXPLAYERS)
            {
               if(GameController.stageData.getPlayer(_loc2_) != null && GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank == 1 && _loc4_.indexOf(GameController.stageData.getPlayer(_loc2_).StatsName) < 0)
               {
                  if(ModeFeatures.hasFeature(ModeFeatures.SAVE_RECORDS,GameController.stageData.GameRef.GameMode))
                  {
                     SaveData.Records.vs.wins[GameController.stageData.getPlayer(_loc2_).StatsName]++;
                  }
                  _loc4_.push(GameController.stageData.getPlayer(_loc2_).StatsName);
               }
               _loc2_++;
            }
            if(GameController.stageData.GameRef.UsingTime)
            {
               if(ModeFeatures.hasFeature(ModeFeatures.SAVE_RECORDS,GameController.stageData.GameRef.GameMode))
               {
                  SaveData.Records.vs.timeMatchTotal++;
               }
            }
            else if(ModeFeatures.hasFeature(ModeFeatures.SAVE_RECORDS,GameController.stageData.GameRef.GameMode))
            {
               SaveData.Records.vs.stockMatchTotal++;
            }
            this.winnerIs = SoundQueue.instance.getSoundObject(SoundQueue.instance.playVoiceEffect("narrator_winner")).Channel;
            this.winnerIs.addEventListener(Event.SOUND_COMPLETE,this.sayWinner);
            _loc5_ = GameController.stageData.getFirstWinner().SoundData["winTheme"];
            if(Main.getLibrarySound(_loc5_) != null)
            {
               SoundQueue.instance.setNextMusic("battle_results",2140);
               SoundQueue.instance.setLoopFunction(SoundQueue.instance.nextMusic);
               SoundQueue.instance.playMusic(_loc5_,0);
            }
            else
            {
               SoundQueue.instance.stopMusic();
               SoundQueue.instance.playMusic("battle_results",2140);
            }
            _loc1_ = 1;
            while(_loc1_ <= Main.MAXPLAYERS)
            {
               GameController.stageData.populateMatchResults(_loc1_,MovieClip(m_subMenu["p" + _loc1_ + "Results"]));
               _loc1_++;
            }
            _loc2_ = 1;
            if(GameController.stageData.getTeams().length == 1)
            {
               _loc2_ = 1;
               while(_loc2_ <= Main.MAXPLAYERS)
               {
                  if(GameController.stageData.getPlayer(_loc2_) != null)
                  {
                     trace("Place No. " + GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank + " is player #" + _loc2_);
                     _loc3_ = m_subMenu["p" + _loc2_ + "Pose"].addChild(Main.getLibraryMC(GameController.stageData.getPlayer(_loc2_).LinkageName,GameController.stageData.getPlayer(_loc2_).ExpansionID));
                     _loc3_.player_id = _loc2_;
                     _loc3_.rank = GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank;
                     _loc3_.scaleX = 4 * (1 / GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank);
                     _loc3_.scaleY = 4 * (1 / GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank);
                     _loc3_.y = _loc3_.y - 15 * GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank;
                     _loc3_.gotoAndStop(GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank == 1?"win":"lose");
                     GameController.stageData.getPlayer(_loc2_).updateColorFilter(_loc3_,GameController.stageData.getPlayer(_loc2_).Team,GameController.stageData.getPlayer(_loc2_).CostumeName,GameController.stageData.getPlayer(_loc2_).CostumeID);
                  }
                  _loc2_++;
               }
            }
            else
            {
               _loc2_ = 1;
               while(_loc2_ <= Main.MAXPLAYERS)
               {
                  if(GameController.stageData.getPlayer(_loc2_) != null)
                  {
                     trace("Player #" + _loc2_ + " who is on Team " + GameController.stageData.getPlayer(_loc2_).Team + "is in Place No. " + GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank);
                     _loc3_ = m_subMenu["p" + _loc2_ + "Pose"].addChild(Main.getLibraryMC(GameController.stageData.getPlayer(_loc2_).LinkageName,GameController.stageData.getPlayer(_loc2_).ExpansionID));
                     _loc3_.player_id = _loc2_;
                     _loc3_.rank = GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank;
                     _loc3_.scaleX = 4 * (1 / (GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank + 1));
                     _loc3_.scaleY = 4 * (1 / (GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank + 1));
                     _loc3_.y = _loc3_.y - 15 * (GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank + 1);
                     _loc3_.gotoAndStop(GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank == 1?"win":"lose");
                     GameController.stageData.getPlayer(_loc2_).updateColorFilter(_loc3_,GameController.stageData.getPlayer(_loc2_).Team,GameController.stageData.getPlayer(_loc2_).CostumeName,GameController.stageData.getPlayer(_loc2_).CostumeID);
                  }
                  _loc2_++;
               }
            }
            _loc1_ = 1;
            while(_loc1_ < Main.MAXPLAYERS)
            {
               _loc2_ = 1;
               while(_loc2_ < Main.MAXPLAYERS)
               {
                  if(_loc2_ != _loc1_ && GameController.stageData.getPlayer(_loc1_) != null && GameController.stageData.getPlayer(_loc2_) != null && GameController.stageData.getPlayer(_loc1_).getMatchResults().Rank < GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank && m_subMenu.getChildIndex(m_subMenu["p" + _loc2_ + "Pose"]) > m_subMenu.getChildIndex(m_subMenu["p" + _loc1_ + "Pose"]))
                  {
                     m_subMenu.swapChildren(m_subMenu["p" + _loc2_ + "Pose"],m_subMenu["p" + _loc1_ + "Pose"]);
                  }
                  _loc2_++;
               }
               _loc1_++;
            }
         }
         else
         {
            if(ModeFeatures.hasFeature(ModeFeatures.SAVE_RECORDS,GameController.stageData.GameRef.GameMode))
            {
               SaveData.Records.vs.matchResets++;
            }
            SoundQueue.instance.playVoiceEffect("narrator_nocontest");
            _loc2_ = 1;
            while(_loc2_ <= Main.MAXPLAYERS)
            {
               if(GameController.stageData.getPlayer(_loc2_) != null)
               {
                  trace("Player #" + _loc2_ + " who is on Team " + GameController.stageData.getPlayer(_loc2_).Team + "is in Place No. " + GameController.stageData.getPlayer(_loc2_).getMatchResults().Rank);
                  _loc3_ = m_subMenu["p" + _loc2_ + "Pose"].addChild(Main.getLibraryMC(GameController.stageData.getPlayer(_loc2_).LinkageName,GameController.stageData.getPlayer(_loc2_).ExpansionID));
                  _loc3_.player_id = _loc2_;
                  _loc3_.scaleX = 4 * (1 / 2);
                  _loc3_.scaleY = 4 * (1 / 2);
                  _loc3_.y = _loc3_.y - 15 * 1;
                  _loc3_.gotoAndStop("lose");
                  m_subMenu.gotoAndPlay("skip");
                  GameController.stageData.getPlayer(_loc2_).updateColorFilter(_loc3_,GameController.stageData.getPlayer(_loc2_).Team,GameController.stageData.getPlayer(_loc2_).CostumeName,GameController.stageData.getPlayer(_loc2_).CostumeID);
               }
               _loc2_++;
            }
            _loc6_ = 1;
            while(_loc6_ <= Main.MAXPLAYERS)
            {
               GameController.stageData.populateMatchResults(_loc6_,MovieClip(m_subMenu["p" + _loc6_ + "Results"]));
               _loc6_++;
            }
         }
         if(GameController.stageData.OnlineMode && MultiplayerManager.Connected)
         {
            MultiplayerManager.sendMatchFinishedSignal({"player_data":GameController.stageData.getPlayer(MultiplayerManager.PlayerID).getMatchResults().exportData()});
         }
      }
   }
}
