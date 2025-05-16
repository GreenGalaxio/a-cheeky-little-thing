package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.StageSetting;
   import com.mcleodgaming.ssf2.enums.CPUState;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.display.MovieClip;
   
   public class EventMatch
   {
      
      public static const TYPE_NONE:int = 0;
      
      public static const TYPE_STOCK:int = 1;
      
      public static const TYPE_TIME:int = 2;
      
      public static const BOUNTY_HUNTING:uint = 0;
      
      public static const CATCH_EM_ALL:uint = 1;
      
      public static const SWORDSMEN:uint = 2;
      
      public static const AT_YOUR_SERVICE:uint = 3;
      
      public static const LORD_OF_THE_JUNGLE_2:uint = 4;
      
      public static const DARK_LINKS_ADVANCE:uint = 5;
      
      public static const METEO_CAMPAIGN:uint = 6;
      
      public static const NIGHTMARE_IN_DREAMLAND:uint = 7;
      
      public static const SPEED_DEMON:uint = 8;
      
      public static const NINTENDO_ALLSTARS:uint = 9;
       
      
      private var m_id:int;
      
      private var m_type:int;
      
      private var m_number:int;
      
      private var m_name:String;
      
      private var m_description:String;
      
      public function EventMatch(param1:int, param2:int, param3:int, param4:String, param5:String)
      {
         super();
         this.m_id = param1;
         this.m_number = param2;
         this.m_type = param3;
         this.m_name = param4;
         this.m_description = param5;
      }
      
      public function get ID() : int
      {
         return this.m_id;
      }
      
      public function get Num() : int
      {
         return this.m_number;
      }
      
      public function get Type() : int
      {
         return this.m_type;
      }
      
      public function get Name() : String
      {
         return this.m_name;
      }
      
      public function get Description() : String
      {
         return this.m_description;
      }
      
      public function get Won() : Boolean
      {
         return Boolean(SaveData.Records.events["event" + this.m_id] != null);
      }
      
      public function matchSetup(param1:MovieClip = null) : Game
      {
         var _loc2_:Game = null;
         if(this.m_id == EventMatch.LORD_OF_THE_JUNGLE_2)
         {
            _loc2_ = new Game(param1,Mode.EVENT);
            _loc2_.LevelData.showPlayerID = SaveData.ShowPlayerID;
            _loc2_.PlayerSettings[0].importSettings({
               "character":"donkeykong",
               "damageRatio":1,
               "lives":2,
               "human":true,
               "team":1
            });
            _loc2_.PlayerSettings[1].importSettings({
               "character":"donkeykong",
               "damageRatio":1,
               "lives":2,
               "human":false,
               "team":3,
               "level":4
            });
            _loc2_.PlayerSettings[2].importSettings({
               "character":"donkeykong",
               "damageRatio":1,
               "lives":2,
               "human":false,
               "team":3,
               "level":4
            });
            _loc2_.LevelData.usingLives = true;
            _loc2_.LevelData.usingTime = false;
            _loc2_.LevelData.lives = 1;
            _loc2_.LevelData.hazards = true;
            _loc2_.Items.setAllItemStatuses(true);
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_MEDIUM;
            _loc2_.setStageSettings(StageSetting.JungleHijinx);
            StageSetting.CurrentID = StageSetting.JungleHijinx.ID;
            return _loc2_;
         }
         if(this.m_id == EventMatch.CATCH_EM_ALL)
         {
            _loc2_ = new Game(param1,Mode.EVENT);
            _loc2_.LevelData.showPlayerID = SaveData.ShowPlayerID;
            _loc2_.PlayerSettings[0].importSettings({
               "damageRatio":1,
               "lives":1,
               "human":true,
               "team":-1
            });
            _loc2_.PlayerSettings[1].importSettings({
               "character":"pikachu",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":-1,
               "level":7
            });
            _loc2_.PlayerSettings[2].importSettings({
               "character":"pikachu",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":-1,
               "level":7
            });
            _loc2_.PlayerSettings[3].importSettings({
               "character":"jigglypuff",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":-1,
               "level":7
            });
            _loc2_.LevelData.usingLives = true;
            _loc2_.LevelData.usingTime = false;
            _loc2_.LevelData.lives = 1;
            _loc2_.LevelData.hazards = true;
            _loc2_.Items.setAllItemStatuses(false);
            _loc2_.Items.items.pokeball = true;
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_VERY_HIGH;
            _loc2_.setStageSettings(StageSetting.PokemonStadium3);
            StageSetting.CurrentID = StageSetting.PokemonStadium3.ID;
            return _loc2_;
         }
         if(this.m_id == EventMatch.SWORDSMEN)
         {
            _loc2_ = new Game(param1,Mode.EVENT);
            _loc2_.LevelData.showPlayerID = SaveData.ShowPlayerID;
            _loc2_.PlayerSettings[0].importSettings({
               "character":"lloyd",
               "damageRatio":1,
               "lives":2,
               "human":true,
               "team":-1
            });
            _loc2_.PlayerSettings[1].importSettings({
               "character":"ichigo",
               "damageRatio":1,
               "lives":2,
               "human":false,
               "team":-1,
               "level":9
            });
            _loc2_.PlayerSettings[2].importSettings({
               "character":"link",
               "damageRatio":1,
               "lives":2,
               "human":false,
               "team":-1,
               "level":9
            });
            _loc2_.LevelData.usingLives = true;
            _loc2_.LevelData.usingTime = false;
            _loc2_.LevelData.lives = 1;
            _loc2_.LevelData.hazards = true;
            _loc2_.Items.setAllItemStatuses(true);
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_MEDIUM;
            _loc2_.setStageSettings(StageSetting.CastleSiege);
            StageSetting.CurrentID = StageSetting.CastleSiege.ID;
            return _loc2_;
         }
         if(this.m_id == EventMatch.AT_YOUR_SERVICE)
         {
            _loc2_ = new Game(param1,Mode.EVENT);
            _loc2_.LevelData.showPlayerID = SaveData.ShowPlayerID;
            _loc2_.PlayerSettings[0].importSettings({
               "damageRatio":1,
               "lives":1,
               "human":true,
               "team":-1
            });
            _loc2_.PlayerSettings[1].importSettings({
               "character":"goku",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":-1,
               "level":9
            });
            _loc2_.LevelData.usingLives = true;
            _loc2_.LevelData.usingTime = false;
            _loc2_.LevelData.lives = 1;
            _loc2_.LevelData.hazards = true;
            _loc2_.Items.setAllItemStatuses(false);
            _loc2_.Items.items.assistTrophy = true;
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_ULTRA_HIGH;
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_MAX;
            _loc2_.setStageSettings(StageSetting.DraculaCastle);
            StageSetting.CurrentID = StageSetting.DraculaCastle.ID;
            return _loc2_;
         }
         if(this.m_id == EventMatch.BOUNTY_HUNTING)
         {
            _loc2_ = new Game(param1,Mode.EVENT);
            _loc2_.LevelData.showPlayerID = SaveData.ShowPlayerID;
            _loc2_.PlayerSettings[0].importSettings({
               "character":"samus",
               "damageRatio":1,
               "lives":1,
               "human":true,
               "team":-1
            });
            _loc2_.PlayerSettings[1].importSettings({
               "character":"yoshi",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":-1,
               "level":9
            });
            _loc2_.PlayerSettings[2].importSettings({
               "character":"yoshi",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":-1,
               "level":4,
               "costume":4
            });
            _loc2_.PlayerSettings[3].importSettings({
               "character":"yoshi",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":-1,
               "level":4,
               "costume":2
            });
            _loc2_.LevelData.usingLives = true;
            _loc2_.LevelData.usingTime = false;
            _loc2_.LevelData.lives = 1;
            _loc2_.LevelData.hazards = true;
            _loc2_.Items.setAllItemStatuses(true);
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_MEDIUM;
            _loc2_.setStageSettings(StageSetting.YoshisIsland);
            StageSetting.CurrentID = StageSetting.YoshisIsland.ID;
            return _loc2_;
         }
         if(this.m_id == EventMatch.DARK_LINKS_ADVANCE)
         {
            _loc2_ = new Game(param1,Mode.EVENT);
            _loc2_.LevelData.showPlayerID = SaveData.ShowPlayerID;
            _loc2_.PlayerSettings[0].importSettings({
               "character":"link",
               "damageRatio":1,
               "lives":1,
               "human":true,
               "team":-1
            });
            _loc2_.PlayerSettings[1].importSettings({
               "character":"link",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":-1,
               "level":9,
               "costume":4
            });
            _loc2_.LevelData.usingLives = true;
            _loc2_.LevelData.usingTime = false;
            _loc2_.LevelData.lives = 1;
            _loc2_.LevelData.hazards = true;
            _loc2_.Items.setAllItemStatuses(true);
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_MEDIUM;
            _loc2_.setStageSettings(StageSetting.HylianSkies);
            StageSetting.CurrentID = StageSetting.HylianSkies.ID;
            return _loc2_;
         }
         if(this.m_id == EventMatch.METEO_CAMPAIGN)
         {
            _loc2_ = new Game(param1,Mode.EVENT);
            _loc2_.LevelData.showPlayerID = SaveData.ShowPlayerID;
            _loc2_.PlayerSettings[0].importSettings({
               "damageRatio":1,
               "lives":2,
               "human":true,
               "team":-1
            });
            _loc2_.PlayerSettings[1].importSettings({
               "character":"fox",
               "damageRatio":1,
               "lives":3,
               "human":false,
               "team":-1,
               "level":9
            });
            _loc2_.LevelData.usingLives = true;
            _loc2_.LevelData.usingTime = false;
            _loc2_.LevelData.lives = 3;
            _loc2_.LevelData.hazards = true;
            _loc2_.Items.setAllItemStatuses(false);
            _loc2_.Items.items.smashball = true;
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_MEDIUM;
            _loc2_.setStageSettings(StageSetting.MeteoVoyage);
            StageSetting.CurrentID = StageSetting.MeteoVoyage.ID;
            return _loc2_;
         }
         if(this.m_id == EventMatch.NIGHTMARE_IN_DREAMLAND)
         {
            _loc2_ = new Game(param1,Mode.EVENT);
            _loc2_.LevelData.showPlayerID = SaveData.ShowPlayerID;
            _loc2_.PlayerSettings[0].importSettings({
               "damageRatio":1,
               "lives":1,
               "human":true,
               "team":1
            });
            _loc2_.PlayerSettings[1].importSettings({
               "character":"kirby",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":1,
               "level":9
            });
            _loc2_.PlayerSettings[2].importSettings({
               "character":"metaknight",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":3,
               "level":9
            });
            _loc2_.PlayerSettings[3].importSettings({
               "character":"blackmage",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":3,
               "level":9
            });
            _loc2_.LevelData.usingLives = true;
            _loc2_.LevelData.usingTime = false;
            _loc2_.LevelData.lives = 1;
            _loc2_.LevelData.hazards = true;
            _loc2_.Items.setAllItemStatuses(false);
            _loc2_.Items.items.starrod = true;
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_LOW;
            _loc2_.setStageSettings(StageSetting.DreamLand);
            StageSetting.CurrentID = StageSetting.DreamLand.ID;
            return _loc2_;
         }
         if(this.m_id == EventMatch.SPEED_DEMON)
         {
            _loc2_ = new Game(param1,Mode.EVENT);
            _loc2_.LevelData.showPlayerID = SaveData.ShowPlayerID;
            _loc2_.PlayerSettings[0].importSettings({
               "character":"captainfalcon",
               "damageRatio":1,
               "lives":1,
               "human":true,
               "team":-1
            });
            _loc2_.PlayerSettings[1].importSettings({
               "character":"sonic",
               "damageRatio":1,
               "lives":1,
               "human":false,
               "team":-1,
               "level":9
            });
            _loc2_.LevelData.usingLives = true;
            _loc2_.LevelData.usingTime = true;
            _loc2_.LevelData.time = 1;
            _loc2_.LevelData.lives = 1;
            _loc2_.LevelData.hazards = true;
            _loc2_.Items.setAllItemStatuses(true);
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_MEDIUM;
            _loc2_.setStageSettings(StageSetting.SandOcean);
            StageSetting.CurrentID = StageSetting.SandOcean.ID;
            return _loc2_;
         }
         if(this.m_id == EventMatch.NINTENDO_ALLSTARS)
         {
            _loc2_ = new Game(param1,Mode.EVENT);
            _loc2_.LevelData.showPlayerID = SaveData.ShowPlayerID;
            _loc2_.PlayerSettings[0].importSettings({
               "character":null,
               "damageRatio":1,
               "lives":3,
               "human":true,
               "team":1
            });
            _loc2_.PlayerSettings[1].importSettings({
               "character":"link",
               "damageRatio":1,
               "lives":2,
               "human":false,
               "team":3,
               "level":9
            });
            _loc2_.PlayerSettings[2].importSettings({
               "character":"pikachu",
               "damageRatio":1,
               "lives":2,
               "human":false,
               "team":3,
               "level":9
            });
            _loc2_.PlayerSettings[3].importSettings({
               "character":"mario",
               "damageRatio":1,
               "lives":2,
               "human":false,
               "team":3,
               "level":9
            });
            _loc2_.LevelData.usingLives = true;
            _loc2_.LevelData.usingTime = false;
            _loc2_.LevelData.lives = 3;
            _loc2_.LevelData.hazards = true;
            _loc2_.Items.setAllItemStatuses(true);
            _loc2_.Items.items.fooditem = false;
            _loc2_.Items.items.maximumtomato = false;
            _loc2_.Items.items.heartContainer = false;
            _loc2_.Items.items.energytank = false;
            _loc2_.Items.frequency = ItemSettings.FREQUENCY_MEDIUM;
            _loc2_.setStageSettings(StageSetting.FinalDestination);
            StageSetting.CurrentID = StageSetting.FinalDestination.ID;
            return _loc2_;
         }
         return null;
      }
      
      public function initMatch(param1:StageData) : void
      {
         if(this.m_id == EventMatch.LORD_OF_THE_JUNGLE_2)
         {
            param1.getPlayer(1).OriginalSizeRatio = param1.getPlayer(1).OriginalSizeRatio * 2;
            param1.getPlayer(1).SizeRatio = param1.getPlayer(1).SizeRatio * 2;
            param1.getPlayer(1).SizeStatusPermanent = true;
            param1.getPlayer(2).OriginalSizeRatio = param1.getPlayer(2).OriginalSizeRatio * (1 / 3);
            param1.getPlayer(2).SizeRatio = param1.getPlayer(2).SizeRatio * (1 / 3);
            param1.getPlayer(2).SizeStatusPermanent = true;
            param1.getPlayer(3).OriginalSizeRatio = param1.getPlayer(3).OriginalSizeRatio * (1 / 3);
            param1.getPlayer(3).SizeRatio = param1.getPlayer(3).SizeRatio * (1 / 3);
            param1.getPlayer(3).SizeStatusPermanent = true;
         }
         else if(this.m_id == EventMatch.AT_YOUR_SERVICE)
         {
            param1.getPlayer(2).setSizeStatus(1);
            param1.getPlayer(2).SizeStatusPermanent = true;
         }
         else if(this.m_id == EventMatch.SPEED_DEMON)
         {
            param1.getPlayer(2).getAI().ForcedAction = CPUState.EVADE;
            param1.TimerRef.setCurrentTime(param1.TimerRef.CurrentTime / 2);
         }
      }
      
      public function checkMatch(param1:StageData) : void
      {
         if(this.m_id == EventMatch.LORD_OF_THE_JUNGLE_2)
         {
            if(param1.GameEnded && param1.getPlayer(1).getLives() > 0)
            {
               EventMatchController.success = true;
            }
         }
         else if(this.m_id == EventMatch.CATCH_EM_ALL)
         {
            if(param1.GameEnded && param1.getPlayer(1).getLives() > 0)
            {
               EventMatchController.success = true;
            }
            else if(!param1.GameEnded && param1.getPlayer(1).getLives() <= 0)
            {
               param1.prepareEndGame();
            }
         }
         else if(this.m_id == EventMatch.SWORDSMEN)
         {
            if(param1.GameEnded && param1.getPlayer(1).getLives() > 0)
            {
               EventMatchController.success = true;
            }
            else if(!param1.GameEnded && param1.getPlayer(1).getLives() <= 0)
            {
               param1.prepareEndGame();
            }
         }
         else if(this.m_id == EventMatch.AT_YOUR_SERVICE)
         {
            if(param1.GameEnded && param1.getPlayer(1).getLives() > 0)
            {
               EventMatchController.success = true;
            }
            else if(!param1.GameEnded && param1.getPlayer(1).getLives() <= 0)
            {
               param1.prepareEndGame();
            }
         }
         else if(this.m_id == EventMatch.BOUNTY_HUNTING)
         {
            if(!param1.GameEnded && (param1.getPlayer(1).getLives() <= 0 || param1.getPlayer(3).getLives() <= 0 || param1.getPlayer(4).getLives() <= 0))
            {
               param1.prepareEndGame();
            }
            else if(!param1.GameEnded && param1.getPlayer(2).getLives() <= 0)
            {
               EventMatchController.success = true;
               param1.prepareEndGame(true);
            }
         }
         else if(this.m_id == EventMatch.DARK_LINKS_ADVANCE)
         {
            if(param1.StageFG.currentFrame >= 1501)
            {
               param1.prepareEndGame();
            }
            else if(param1.GameEnded && param1.getPlayer(1).getLives() > 0)
            {
               EventMatchController.success = true;
            }
         }
         else if(this.m_id == EventMatch.METEO_CAMPAIGN)
         {
            if(param1.GameEnded && param1.getPlayer(1).getLives() > 0)
            {
               EventMatchController.success = true;
            }
         }
         else if(this.m_id == EventMatch.NIGHTMARE_IN_DREAMLAND)
         {
            if(!param1.GameEnded && (param1.getPlayer(1).getLives() <= 0 || param1.getPlayer(2).getLives() <= 0))
            {
               param1.prepareEndGame();
            }
            else if(param1.GameEnded && param1.getPlayer(1).getLives() > 0 && param1.getPlayer(2).getLives() > 0)
            {
               EventMatchController.success = true;
               param1.prepareEndGame(true);
            }
         }
         else if(this.m_id == EventMatch.SPEED_DEMON)
         {
            if(param1.GameEnded && param1.getPlayer(2).getLives() <= 0)
            {
               EventMatchController.success = true;
            }
         }
         else if(this.m_id == EventMatch.NINTENDO_ALLSTARS)
         {
            if(param1.GameEnded && param1.getPlayer(1).getLives() > 0)
            {
               EventMatchController.success = true;
               param1.prepareEndGame(true);
            }
         }
      }
      
      public function complete(param1:int, param2:int, param3:uint) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:int = param1;
         var _loc6_:Number = Math.round(param1 / param2 * 10000) / 10;
         if(!SaveData.Records.events["event" + this.m_id])
         {
            SaveData.Records.events["event" + this.m_id] = new Object();
            SaveData.Records.events["event" + this.m_id].type = this.m_type;
            SaveData.Records.events["event" + this.m_id].score = _loc5_;
            SaveData.Records.events["event" + this.m_id].score_fps = _loc6_;
            SaveData.Records.events["event" + this.m_id].difficulty = param3;
            _loc4_ = true;
         }
         else if(SaveData.Records.events["event" + this.m_id].difficulty >= param3)
         {
            if(this.m_type == EventMatch.TYPE_STOCK)
            {
               if(EventMatchController.score > SaveData.Records.events["event" + this.m_id].score)
               {
                  SaveData.Records.events["event" + this.m_id].score = _loc5_;
                  SaveData.Records.events["event" + this.m_id].score_fps = _loc6_;
                  SaveData.Records.events["event" + this.m_id].difficulty = param3;
                  _loc4_ = true;
               }
            }
            else if(this.m_type == EventMatch.TYPE_TIME)
            {
               if(_loc5_ < SaveData.Records.events["event" + this.m_id].score)
               {
                  SaveData.Records.events["event" + this.m_id].score = _loc5_;
                  SaveData.Records.events["event" + this.m_id].score_fps = _loc6_;
                  SaveData.Records.events["event" + this.m_id].difficulty = param3;
                  _loc4_ = true;
               }
            }
            else if(SaveData.Records.events["event" + this.m_id].difficulty > param3)
            {
               SaveData.Records.events["event" + this.m_id].score = _loc5_;
               SaveData.Records.events["event" + this.m_id].score_fps = _loc6_;
               SaveData.Records.events["event" + this.m_id].difficulty = param3;
               _loc4_ = true;
            }
         }
         SaveData.saveGame();
         return _loc4_;
      }
   }
}
