package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.engine.StageSetting;
   import com.mcleodgaming.ssf2.engine.Stats;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.util.SaveData;
   
   public class Unlockable
   {
      
      public static const CAPTAIN_FALCON:uint = 0;
      
      public static const SAND_OCEAN:uint = 1;
      
      public static const CLOCK_TOWN:uint = 2;
      
      public static const JIGGLYPUFF:uint = 3;
       
      
      private var m_id:uint;
      
      private var m_stageID:String;
      
      private var m_preUnlockFrame:int;
      
      private var m_postUnlockFrame:int;
      
      private var m_unlockName:String;
      
      private var m_unlockDescription:String;
      
      private var m_filesArray:Array;
      
      public function Unlockable(param1:uint, param2:String, param3:String, param4:int, param5:int, param6:Array = null, param7:String = null)
      {
         super();
         this.m_id = param1;
         this.m_unlockName = param2;
         this.m_unlockDescription = param3;
         this.m_preUnlockFrame = param4;
         this.m_postUnlockFrame = param5;
         this.m_filesArray = param6;
         this.m_stageID = param7;
      }
      
      public function get ID() : uint
      {
         return this.m_id;
      }
      
      public function get StageID() : String
      {
         return this.m_stageID;
      }
      
      public function get FilesArray() : Array
      {
         return this.m_filesArray;
      }
      
      public function get UnlockName() : String
      {
         return this.m_unlockName;
      }
      
      public function get UnlockDescription() : String
      {
         return this.m_unlockDescription;
      }
      
      public function get PreUnlockFrame() : int
      {
         return this.m_preUnlockFrame;
      }
      
      public function get PostUnlockFrame() : int
      {
         return this.m_postUnlockFrame;
      }
      
      public function unlocked() : Boolean
      {
         var _loc5_:Array = null;
         var _loc6_:Boolean = false;
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:Boolean = true;
         if(this.m_id == Unlockable.CAPTAIN_FALCON)
         {
            _loc4_ = true;
            for(_loc2_ in SaveData.Records.vs.wins)
            {
               if(_loc2_ != "captainfalcon" && SaveData.Records.vs.wins[_loc2_] <= 0)
               {
                  _loc4_ = false;
               }
            }
            if(GameController.stageData && GameController.currentGame && GameController.currentGame.GameMode == Mode.VS && !GameController.stageData.NoContest && GameController.stageData.getPlayer(1) != null && GameController.stageData.getPlayer(1).IsHuman && SaveData.Unlocks.captainfalcon == false && _loc4_)
            {
               return true;
            }
         }
         else if(this.m_id == Unlockable.SAND_OCEAN)
         {
            if(!GameController.stageData.NoContest && SaveData.Unlocks.sandocean == false && SaveData.Records.vs.matches["captainfalcon"] >= 10)
            {
               return true;
            }
         }
         else if(this.m_id == Unlockable.CLOCK_TOWN)
         {
            _loc3_ = 0;
            _loc4_ = true;
            if(!SaveData.Records.targets[StageSetting.CurrentID] || StageSetting.CurrentID != "targettest")
            {
               return false;
            }
            _loc5_ = Stats.getCharacterList(false);
            for(_loc2_ in _loc5_)
            {
               if(_loc2_ != "captainfalcon")
               {
                  if(!SaveData.getTargetTestData(StageSetting.CurrentID,_loc2_))
                  {
                     _loc4_ = false;
                     break;
                  }
                  if(SaveData.getTargetTestData(StageSetting.CurrentID,_loc2_).score > 0)
                  {
                     _loc3_ = _loc3_ + SaveData.getTargetTestData(StageSetting.CurrentID,_loc2_).score;
                  }
                  else if(SaveData.getTargetTestData(StageSetting.CurrentID,_loc2_).score <= 0)
                  {
                     _loc4_ = false;
                  }
               }
            }
            if(!SaveData.Unlocks.clocktown && _loc3_ <= 30 * 60 * 6 && _loc4_)
            {
               return true;
            }
         }
         else if(this.m_id == Unlockable.JIGGLYPUFF)
         {
            _loc6_ = true;
            _loc1_ = 0;
            while(_loc1_ < EventMatchController.EventMatchList.length)
            {
               if(!EventMatchController.EventMatchList[_loc1_].Won)
               {
                  _loc6_ = false;
               }
               _loc1_++;
            }
            if(_loc6_ && SaveData.Unlocks.jigglypuff == false)
            {
               return true;
            }
         }
         return false;
      }
      
      public function matchSetup() : Game
      {
         var _loc1_:Game = null;
         if(this.m_id == Unlockable.CAPTAIN_FALCON)
         {
            _loc1_ = new Game(null,Mode.VS_UNLOCK);
            _loc1_.LevelData.showPlayerID = GameController.currentGame.LevelData.showPlayerID;
            _loc1_.PlayerSettings[0].character = GameController.stageData.getPlayer(1).StatsName;
            _loc1_.PlayerSettings[0].costume = GameController.stageData.getPlayer(1).CostumeID;
            _loc1_.PlayerSettings[0].damageRatio = 1;
            _loc1_.PlayerSettings[0].lives = 1;
            _loc1_.PlayerSettings[1].character = "captainfalcon";
            _loc1_.PlayerSettings[1].damageRatio = 1;
            _loc1_.PlayerSettings[1].lives = 1;
            _loc1_.PlayerSettings[1].human = false;
            _loc1_.PlayerSettings[1].level = 9;
            _loc1_.LevelData.usingLives = true;
            _loc1_.LevelData.usingTime = false;
            _loc1_.LevelData.lives = 1;
            _loc1_.setStageSettings(StageSetting.SandOcean);
            StageSetting.CurrentID = StageSetting.SandOcean.ID;
            return _loc1_;
         }
         if(this.m_id == Unlockable.JIGGLYPUFF)
         {
            _loc1_ = new Game(null,Mode.VS_UNLOCK);
            _loc1_.LevelData.showPlayerID = GameController.currentGame.LevelData.showPlayerID;
            _loc1_.PlayerSettings[0].character = GameController.stageData.getPlayer(1).StatsName;
            _loc1_.PlayerSettings[0].costume = GameController.stageData.getPlayer(1).CostumeID;
            _loc1_.PlayerSettings[0].damageRatio = 1;
            _loc1_.PlayerSettings[0].lives = 1;
            _loc1_.PlayerSettings[1].character = "jigglypuff";
            _loc1_.PlayerSettings[1].damageRatio = 1;
            _loc1_.PlayerSettings[1].lives = 1;
            _loc1_.PlayerSettings[1].human = false;
            _loc1_.PlayerSettings[1].level = 9;
            _loc1_.LevelData.usingLives = true;
            _loc1_.LevelData.usingTime = false;
            _loc1_.LevelData.lives = 1;
            _loc1_.setStageSettings(StageSetting.PokemonStadium3);
            StageSetting.CurrentID = StageSetting.PokemonStadium3.ID;
            return _loc1_;
         }
         return null;
      }
      
      public function unlock() : void
      {
         if(this.m_id == Unlockable.CAPTAIN_FALCON)
         {
            SaveData.Unlocks.captainfalcon = true;
         }
         else if(this.m_id == Unlockable.SAND_OCEAN)
         {
            SaveData.Unlocks.sandocean = true;
         }
         else if(this.m_id == Unlockable.CLOCK_TOWN)
         {
            SaveData.Unlocks.clocktown = true;
         }
         else if(this.m_id == Unlockable.JIGGLYPUFF)
         {
            SaveData.Unlocks.jigglypuff = true;
         }
         SaveData.saveGame();
      }
   }
}
