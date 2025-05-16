package com.mcleodgaming.ssf2.engine
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.Version;
   import com.mcleodgaming.ssf2.enums.Mode;
   
   public class ReplayData
   {
      
      public static const COMPATIBLE_VERSIONS:Array = ["0.9.1.1981"];
       
      
      private var m_frameCount:int;
      
      private var m_name:String;
      
      private var m_version:String;
      
      private var m_stageID:String;
      
      private var m_gameMode:int;
      
      private var m_randSeed:Number;
      
      private var m_matchSettings:Object;
      
      private var m_itemSettings:Object;
      
      private var m_playerData:Array;
      
      private var m_controlsData:Array;
      
      private var m_controlsPointers:Array;
      
      public function ReplayData()
      {
         super();
         var _loc1_:int = 0;
         this.m_frameCount = 0;
         this.m_name = "Untitled Replay";
         this.m_version = Version.getVersion();
         this.m_stageID = null;
         this.m_gameMode = Mode.VS;
         this.m_randSeed = 0;
         this.m_matchSettings = new Object();
         this.m_itemSettings = new Object();
         this.m_playerData = new Array();
         this.m_controlsData = [];
         _loc1_ = 0;
         while(_loc1_ < Main.MAXPLAYERS)
         {
            this.m_controlsData.push([]);
            _loc1_++;
         }
         this.m_controlsPointers = null;
      }
      
      public function get FrameCount() : int
      {
         return this.m_frameCount;
      }
      
      public function set FrameCount(param1:int) : void
      {
         this.m_frameCount = param1;
      }
      
      public function get Name() : String
      {
         return this.m_name;
      }
      
      public function set Name(param1:String) : void
      {
         this.m_name = param1;
      }
      
      public function get VersionNumber() : String
      {
         return this.m_version;
      }
      
      public function get StageID() : String
      {
         return this.m_stageID;
      }
      
      public function set StageID(param1:String) : void
      {
         this.m_stageID = param1;
      }
      
      public function get GameMode() : int
      {
         return this.m_gameMode;
      }
      
      public function set GameMode(param1:int) : void
      {
         this.m_gameMode = param1;
      }
      
      public function get MatchSettings() : Object
      {
         return this.m_matchSettings;
      }
      
      public function set MatchSettings(param1:Object) : void
      {
         this.m_matchSettings = param1;
      }
      
      public function get ItemSettingsObj() : Object
      {
         return this.m_itemSettings;
      }
      
      public function set ItemSettingsObj(param1:Object) : void
      {
         this.m_itemSettings = param1;
      }
      
      public function get PlayerData() : Array
      {
         return this.m_playerData;
      }
      
      public function set PlayerData(param1:Array) : void
      {
         this.m_playerData = param1;
      }
      
      public function get ControlsData() : Array
      {
         return this.m_controlsData;
      }
      
      public function resetPointers() : void
      {
         this.m_controlsPointers = new Array();
         var _loc1_:int = 0;
         while(_loc1_ < this.m_controlsData.length)
         {
            this.m_controlsPointers.push({
               "index":0,
               "total":this.m_controlsData[_loc1_][1]
            });
            _loc1_++;
         }
      }
      
      public function pushControls(param1:int, param2:int) : void
      {
         if(this.m_controlsData[param1 - 1].length <= 0 || param2 != this.m_controlsData[param1 - 1][this.m_controlsData[param1 - 1].length - 2])
         {
            this.m_controlsData[param1 - 1].push(param2);
            this.m_controlsData[param1 - 1].push(1);
         }
         else
         {
            this.m_controlsData[param1 - 1][this.m_controlsData[param1 - 1].length - 1]++;
         }
      }
      
      public function retrieveControls(param1:int) : int
      {
         return this.m_controlsData[param1 - 1][this.m_controlsPointers[param1 - 1].index];
      }
      
      public function nextControls() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_controlsPointers.length)
         {
            this.m_controlsPointers[_loc1_].total--;
            if(this.m_controlsPointers[_loc1_].total <= 0)
            {
               this.m_controlsPointers[_loc1_].index = this.m_controlsPointers[_loc1_].index + 2;
               if(this.m_controlsPointers[_loc1_].index < this.m_controlsData[_loc1_].length)
               {
                  this.m_controlsPointers[_loc1_].total = this.m_controlsData[_loc1_][this.m_controlsPointers[_loc1_].index + 1];
               }
            }
            _loc1_++;
         }
      }
      
      public function exportReplay() : String
      {
         var _loc1_:Object = new Object();
         _loc1_.version = this.m_version;
         _loc1_.frameCount = this.m_frameCount;
         _loc1_.name = this.m_name;
         _loc1_.stageID = this.m_stageID;
         _loc1_.gameMode = this.m_gameMode;
         _loc1_.randSeed = this.m_randSeed;
         _loc1_.matchSettings = this.m_matchSettings;
         _loc1_.itemSettings = this.m_itemSettings;
         _loc1_.playerData = this.m_playerData;
         var _loc2_:Array = this.unoptimizeData(this.m_controlsData);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc5_ = JSON.encode(_loc2_).length;
         _loc4_ = JSON.encode(this.m_controlsData).length;
         if(_loc5_ < _loc4_)
         {
            _loc1_.optimized = false;
            _loc1_.controlsData = _loc2_;
         }
         else
         {
            _loc1_.optimized = true;
            _loc1_.controlsData = this.m_controlsData;
         }
         return JSON.encode(_loc1_);
      }
      
      private function unoptimizeData(param1:Array) : Array
      {
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < Main.MAXPLAYERS)
         {
            _loc4_.push([]);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.m_controlsData.length)
         {
            _loc3_ = 0;
            while(_loc3_ < this.m_controlsData[_loc2_].length)
            {
               _loc5_ = this.m_controlsData[_loc2_][_loc3_ + 1];
               while(_loc5_ > 0)
               {
                  _loc4_[_loc2_].push(this.m_controlsData[_loc2_][_loc3_]);
                  _loc5_--;
               }
               _loc3_ = _loc3_ + 2;
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      public function importReplay(param1:String) : void
      {
         var _loc5_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Object = JSON.decode(param1);
         this.m_version = _loc4_.version;
         this.m_frameCount = _loc4_.frameCount;
         this.m_name = _loc4_.name;
         this.m_stageID = _loc4_.stageID;
         this.m_gameMode = _loc4_.gameMode;
         this.m_randSeed = _loc4_.randSeed;
         this.m_matchSettings = _loc4_.matchSettings;
         this.m_itemSettings = _loc4_.itemSettings;
         this.m_playerData = _loc4_.playerData;
         this.m_controlsData = _loc4_.controlsData;
         if(!_loc4_.optimized)
         {
            _loc5_ = this.m_controlsData;
            this.m_controlsData = new Array();
            _loc2_ = 0;
            while(_loc2_ < Main.MAXPLAYERS)
            {
               this.m_controlsData.push([]);
               _loc2_++;
            }
            _loc3_ = 0;
            while(_loc2_ < _loc5_.length)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc5_[_loc2_].length)
               {
                  this.pushControls(_loc2_ + 1,_loc5_[_loc2_][_loc3_]);
                  _loc3_++;
               }
               _loc2_++;
            }
         }
      }
   }
}
