package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.mgn.events.MGNEvent;
   import com.mcleodgaming.mgn.events.MGNEventManager;
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.Version;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.engine.StageSetting;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class StageButton extends HandButton
   {
       
      
      protected var m_currentGame:Game;
      
      protected var m_stageSetting:StageSetting;
      
      protected var m_hiddenStagesList:Vector.<StageSetting>;
      
      protected var m_loadingMask:MovieClip;
      
      public function StageButton(param1:Game, param2:MovieClip, param3:StageSetting)
      {
         super(param2);
         this.m_currentGame = param1;
         this.m_stageSetting = param3;
         this.m_hiddenStagesList = new Vector.<StageSetting>();
         this.m_hiddenStagesList.push(StageSetting.ExpansionStage);
         this.m_hiddenStagesList.push(StageSetting.MushroomKingdomII);
         this.m_hiddenStagesList.push(StageSetting.Skyworld);
         this.m_hiddenStagesList.push(StageSetting.CastleSiege);
         this.m_hiddenStagesList.push(StageSetting.ExpansionStage);
         var _loc4_:int = 0;
         while(_loc4_ < this.m_hiddenStagesList.length)
         {
            if(!Main.DEBUG && param3.DisplayName == this.m_hiddenStagesList[_loc4_].DisplayName)
            {
               m_button.visible = false;
               break;
            }
            _loc4_++;
         }
         this.m_loadingMask = Main.getLibraryMC("loadingMask");
         this.m_loadingMask.x = Main.Width / 2;
         this.m_loadingMask.y = Main.Height / 2;
      }
      
      public function get StageInfo() : StageSetting
      {
         return this.m_stageSetting;
      }
      
      public function setCurrentGame(param1:Game) : void
      {
         this.m_currentGame = param1;
      }
      
      override protected function button_ROLLOVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         if(this.m_stageSetting.ToFrame != null && MenuController.stageSelectMenu.SubMenu.stage_sample.previewer.getChildByName("mc") != null)
         {
            Utils.tryToGotoAndStop(MovieClip(MenuController.stageSelectMenu.SubMenu.stage_sample.previewer.getChildByName("mc")),this.m_stageSetting.DisplayName == "Random"?"random":this.m_stageSetting.ToFrame);
            MenuController.stageSelectMenu.SubMenu.stage_sample.stage_txt.text = this.m_stageSetting.DisplayName;
         }
      }
      
      override protected function button_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(!GameController.isStarted)
         {
            SoundQueue.instance.playSoundEffect("menu_crowd");
            SoundQueue.instance.playSoundEffect("menu_selectstage");
            if(this.m_currentGame.GameMode === Mode.ONLINE && MultiplayerManager.NumPlayers <= 1)
            {
               MultiplayerManager.notify("Host player must allow other players to join before selecting a stage.");
               return;
            }
            GameController.isStarted = true;
            if(this.m_stageSetting.DisplayName == "Random")
            {
               this.m_stageSetting = null;
               this.m_stageSetting = StageSetting.Random;
            }
            this.m_currentGame.setStageSettings(this.m_stageSetting);
            StageSetting.CurrentID = this.m_stageSetting.ID;
            m_button.removeEventListener(MouseEvent.ROLL_OVER,this.button_ROLLOVER);
            m_button.removeEventListener(MouseEvent.CLICK,this.button_CLICK);
            m_button.removeEventListener(MouseEvent.ROLL_OUT,this.button_ROLLOUT);
            if(this.m_currentGame.GameMode === Mode.ONLINE)
            {
               if(MultiplayerManager.IsHost)
               {
                  this.m_currentGame.LevelData.randSeed = Math.round(Math.random() * 1000000 + 1);
                  MGNEventManager.dispatcher.addEventListener(MGNEvent.ROOM_DATA,this.roomDataSet);
                  MGNEventManager.dispatcher.addEventListener(MGNEvent.ERROR_ROOM_DATA,this.roomDataSetError);
                  MultiplayerManager.sendMatchSettings({
                     "version":Version.getVersion(),
                     "p2p":MultiplayerManager.P2PMode,
                     "matchSettings":JSON.encode(this.m_currentGame.MatchSettings)
                  });
               }
               if(!MultiplayerManager.IsHost)
               {
                  MultiplayerManager.toWaitingRoom(this.m_currentGame,this.startGame);
               }
               Main.Root.addChild(this.m_loadingMask);
            }
            else
            {
               Main.Root.addChild(this.m_loadingMask);
               this.m_currentGame.LevelData.randSeed = Utils.randomInteger(1,1000);
               Utils.setRandSeed(this.m_currentGame.LevelData.randSeed);
               Utils.shuffleRandom();
               Main.prepRandomCharacters();
               Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(StageSetting.CurrentID).CurrentFileName));
               _loc2_ = 1;
               while(_loc2_ <= Main.MAXPLAYERS)
               {
                  if(this.m_currentGame.PlayerSettings[_loc2_ - 1] && this.m_currentGame.PlayerSettings[_loc2_ - 1].exist && this.m_currentGame.PlayerSettings[_loc2_ - 1].character != null && this.m_currentGame.PlayerSettings[_loc2_ - 1].character != "xp")
                  {
                     Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(this.m_currentGame.PlayerSettings[_loc2_ - 1].character == "rand_mc"?Main.RandCharList[_loc2_ - 1].StatsName:this.m_currentGame.PlayerSettings[_loc2_ - 1].character).CurrentFileName));
                  }
                  _loc2_++;
               }
               Main.dynamicLoad(this.startGame);
            }
         }
      }
      
      override protected function button_ROLLOUT(param1:MouseEvent) : void
      {
         if(!GameController.isStarted)
         {
            Utils.tryToGotoAndStop(MovieClip(MenuController.stageSelectMenu.SubMenu.stage_sample.previewer.getChildByName("mc")),"paused");
            MenuController.stageSelectMenu.SubMenu.stage_sample.stage_txt.text = "";
         }
      }
      
      public function startGame(param1:* = null) : void
      {
         if(this.m_loadingMask.parent != null)
         {
            Main.Root.removeChild(this.m_loadingMask);
         }
         MenuController.removeAllMenus();
         GameController.startMatch();
      }
      
      public function roomDataSet(param1:MGNEvent) : void
      {
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ROOM_DATA,this.roomDataSet);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_ROOM_DATA,this.roomDataSetError);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.LOCK_ROOM,this.lockRoom);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.ERROR_LOCK_ROOM,this.lockRoomError);
         MultiplayerManager.lockRoom();
      }
      
      public function roomDataSetError(param1:MGNEvent) : void
      {
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ROOM_DATA,this.roomDataSet);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_ROOM_DATA,this.roomDataSetError);
         MultiplayerManager.lockRoom();
         if(this.m_loadingMask.parent != null)
         {
            Main.Root.removeChild(this.m_loadingMask);
         }
         GameController.isStarted = false;
         MultiplayerManager.notify("There was a problem sending the match settings.");
      }
      
      public function lockRoom(param1:MGNEvent) : void
      {
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.LOCK_ROOM,this.lockRoom);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_LOCK_ROOM,this.lockRoomError);
         MultiplayerManager.toWaitingRoom(this.m_currentGame,this.startGame);
      }
      
      public function lockRoomError(param1:MGNEvent) : void
      {
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.LOCK_ROOM,this.lockRoom);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_LOCK_ROOM,this.lockRoomError);
         if(this.m_loadingMask.parent != null)
         {
            Main.Root.removeChild(this.m_loadingMask);
         }
         GameController.isStarted = false;
         MultiplayerManager.notify("There was a problem locking the room.");
      }
   }
}
