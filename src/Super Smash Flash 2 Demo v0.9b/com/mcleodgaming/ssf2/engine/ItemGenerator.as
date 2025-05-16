package com.mcleodgaming.ssf2.engine
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.enums.ModeFeatures;
   import com.mcleodgaming.ssf2.events.SSF2Event;
   import com.mcleodgaming.ssf2.hazards.Nintendo3DSHazard;
   import com.mcleodgaming.ssf2.hazards.StageHazard;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.items.ItemsListData;
   import com.mcleodgaming.ssf2.platforms.Platform;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class ItemGenerator
   {
       
      
      private var ROOT:MovieClip;
      
      private var STAGE:MovieClip;
      
      private var STAGEPARENT:MovieClip;
      
      private var STAGEDATA:StageData;
      
      private var m_checkEvery:Number;
      
      private var m_chance:Number;
      
      private var m_timer:Number;
      
      private var m_itemsInUse:Vector.<Item>;
      
      private var m_itemIndex:Number;
      
      private var m_item:Vector.<ItemData>;
      
      private var m_itemID:Number;
      
      private var m_sizeRatio:Number;
      
      private var m_lastItem:Item;
      
      private var m_initTimer:Number;
      
      private var m_opponents:Vector.<Number>;
      
      private var m_terrains:Vector.<Platform>;
      
      private var m_platforms:Vector.<Platform>;
      
      private var m_itemGens:Vector.<MovieClip>;
      
      private var m_itemsList:Vector.<ItemData>;
      
      private var m_fullItemsList:Vector.<ItemData>;
      
      private var m_itemCount:int;
      
      private var m_hiddenItemsList:Vector.<String>;
      
      private var m_smashBallReady:FrameTimer;
      
      private var m_suddenDeathBombTimer:FrameTimer;
      
      public function ItemGenerator(param1:Object, param2:StageData)
      {
         var _loc8_:ItemData = null;
         var _loc9_:ItemData = null;
         super();
         this.STAGEDATA = param2;
         this.ROOT = this.STAGEDATA.RootRef;
         this.STAGE = this.STAGEDATA.StageRef;
         this.STAGEPARENT = this.STAGEDATA.StageParentRef;
         this.m_sizeRatio = param1["sizeRatio"];
         this.m_itemGens = param2.getItemGens();
         this.m_itemsInUse = new Vector.<Item>();
         var _loc3_:int = 0;
         while(_loc3_ < this.MAXITEMS)
         {
            this.m_itemsInUse[_loc3_] = null;
            _loc3_++;
         }
         var _loc4_:Number = this.m_sizeRatio;
         var _loc5_:Array = ItemsListData.DATA;
         var _loc6_:MovieClip = null;
         this.m_hiddenItemsList = new Vector.<String>();
         if(!Main.DEBUG)
         {
            this.m_hiddenItemsList.push("explodingtag");
         }
         this.m_itemsList = new Vector.<ItemData>();
         this.m_fullItemsList = new Vector.<ItemData>();
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            if(this.m_hiddenItemsList.indexOf(_loc5_[_loc7_].linkage_id) < 0)
            {
               if(this.STAGEDATA.GameRef.Items.items[_loc5_[_loc7_].linkage_id] || ModeFeatures.hasFeature(ModeFeatures.FORCE_ITEM_AVAILABILITY,this.STAGEDATA.GameRef.GameMode))
               {
                  _loc9_ = new ItemData();
                  _loc9_.importItemData(_loc5_[_loc7_]);
                  this.m_itemsList.push(_loc9_);
               }
               _loc8_ = new ItemData();
               _loc8_.importItemData(_loc5_[_loc7_]);
               this.m_fullItemsList.push(_loc8_);
               if(!HitBoxAnimation.AnimationsList[_loc8_.LinkageID])
               {
                  _loc6_ = Main.getLibraryMC(_loc8_.LinkageID);
                  Utils.removeActionScript(_loc6_);
                  HitBoxAnimation.createHitBoxAnimation(_loc8_.LinkageID,_loc6_,_loc6_);
               }
            }
            _loc7_++;
         }
         this.m_item = this.getItemTypes(param1["itemData"]);
         this.m_lastItem = null;
         this.m_itemIndex = 0;
         this.m_itemID = 0;
         this.m_timer = 0;
         this.m_initTimer = 0;
         this.m_itemCount = 0;
         this.m_opponents = new Vector.<Number>();
         this.m_terrains = this.STAGEDATA.Terrains;
         this.m_platforms = this.STAGEDATA.Platforms;
         switch(param1["frequency"])
         {
            case 1:
               this.m_checkEvery = 10;
               this.m_chance = 0.1;
               break;
            case 2:
               this.m_checkEvery = 10;
               this.m_chance = 0.25;
               break;
            case 3:
               this.m_checkEvery = 10;
               this.m_chance = 0.5;
               break;
            case 4:
               this.m_checkEvery = 5;
               this.m_chance = 0.25;
               break;
            case 5:
               this.m_checkEvery = 5;
               this.m_chance = 0.5;
               break;
            case 6:
               this.m_checkEvery = 4;
               this.m_chance = 0.65;
               break;
            case 7:
               this.m_checkEvery = 4;
               this.m_chance = 0.75;
               break;
            case 8:
               this.m_checkEvery = 3;
               this.m_chance = 1;
               break;
            default:
               this.m_checkEvery = 0;
               this.m_chance = 0;
         }
         this.getTerrainData();
         this.m_smashBallReady = new FrameTimer(5);
         this.m_smashBallReady.CurrentTime = this.m_smashBallReady.MaxTime;
         this.m_suddenDeathBombTimer = new FrameTimer(15);
      }
      
      public function getTerrainData() : void
      {
         this.m_opponents = new Vector.<Number>();
         var _loc1_:Number = 0;
         _loc1_ = 0;
         while(_loc1_ < this.STAGEDATA.PlayerList.length)
         {
            this.m_opponents.push(this.STAGEDATA.PlayerList[_loc1_]);
            _loc1_++;
         }
      }
      
      public function testTerrainWithCoord(param1:Number, param2:Number) : Platform
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this.m_terrains.length && this.m_terrains[_loc3_].hitTestPoint(param1,param2,true))
         {
            _loc3_++;
         }
         if(_loc3_ < this.m_terrains.length && this.m_terrains[_loc3_].hitTestPoint(param1,param2,true))
         {
            return this.m_terrains[_loc3_];
         }
         return null;
      }
      
      private function checkItem() : void
      {
         this.m_smashBallReady.tick();
         this.checkDeadItems();
         if(this.m_chance > 0)
         {
            this.m_timer++;
            if(this.m_timer > this.m_checkEvery * 30)
            {
               this.m_timer = 0;
               if(Utils.random() < this.m_chance)
               {
                  this.generateItem();
               }
            }
         }
      }
      
      public function checkDeadItems() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_itemsInUse.length)
         {
            if(this.m_itemsInUse[_loc1_] != null && this.m_itemsInUse[_loc1_].Dead)
            {
               this.killItem(_loc1_);
            }
            else if(this.m_itemsInUse[_loc1_] != null && this.m_itemsInUse[_loc1_].LinkageID == "smashball")
            {
            }
            _loc1_++;
         }
      }
      
      private function controlItems() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_itemsInUse.length)
         {
            if(this.m_itemsInUse[_loc1_] != null)
            {
               this.m_itemsInUse[_loc1_].PREPERFORM();
               if(this.m_itemsInUse[_loc1_] != null)
               {
                  this.m_itemsInUse[_loc1_].PERFORMALL();
               }
               if(this.m_itemsInUse[_loc1_] != null)
               {
                  this.m_itemsInUse[_loc1_].POSTPERFORM();
               }
            }
            _loc1_++;
         }
      }
      
      public function totalOfItemName(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.m_itemsInUse.length)
         {
            if(this.m_itemsInUse[_loc3_] && this.m_itemsInUse[_loc3_].LinkageID == param1)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function totalOfItem(param1:Class) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.m_itemsInUse.length)
         {
            if(this.m_itemsInUse[_loc3_] && this.m_itemsInUse[_loc3_] is param1)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function makeItem(param1:Number, param2:Number) : void
      {
         var _loc5_:* = undefined;
         var _loc8_:MovieClip = null;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         for(_loc5_ in this.m_itemsInUse)
         {
            if(this.m_itemsInUse[_loc5_] != null && this.m_itemsInUse[_loc5_].Ability == "special")
            {
               _loc3_ = true;
            }
         }
         if(!_loc3_)
         {
            if(this.m_item[0].Ability == "special" && Utils.random() < 0.05)
            {
               _loc4_ = true;
            }
         }
         var _loc6_:Number = 0;
         var _loc7_:int = 0;
         while(_loc7_ < this.m_item.length)
         {
            if(this.m_item[_loc7_].Ability == "special" || this.m_item[_loc7_].Generate || this.m_item[_loc7_].LinkageID == "capsule_ex")
            {
               _loc6_++;
            }
            _loc7_++;
         }
         if(_loc4_ && this.generateItemNum(0) || _loc6_ < this.m_item.length && this.generateItemNum(Math.round(Utils.random() * (this.m_item.length - 1 - _loc6_) + _loc6_)))
         {
            this.m_lastItem.ItemInstance.x = param1;
            this.m_lastItem.ItemInstance.y = param2;
            if(!_loc4_)
            {
               this.m_lastItem.setYSpeed(-8);
            }
         }
      }
      
      private function generateItem() : Boolean
      {
         if(this.generateItemNum(Math.round(Utils.random() * (this.m_item.length - 1))))
         {
            this.playGlobalSound("item_spawn");
            return true;
         }
         return false;
      }
      
      public function getItemByLinkage(param1:String, param2:Boolean = false) : ItemData
      {
         var _loc3_:int = 0;
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < this.m_itemsList.length)
            {
               if(this.m_itemsList[_loc3_].LinkageID == param1)
               {
                  return this.m_itemsList[_loc3_];
               }
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < this.m_fullItemsList.length)
            {
               if(this.m_fullItemsList[_loc3_].LinkageID == param1)
               {
                  return this.m_fullItemsList[_loc3_];
               }
               _loc3_++;
            }
         }
         return null;
      }
      
      public function generateItemObj(param1:ItemData, param2:Number = 1337, param3:Number = -1337, param4:Boolean = false) : Item
      {
         var _loc5_:Class = null;
         var _loc6_:MovieClip = null;
         if(this.m_itemIndex < this.m_itemsInUse.length && (this.m_itemGens.length > 0 || param2 != 1337 && param3 != -1337) && (this.validateItemObj(param1) || param4))
         {
            this.killItem(this.m_itemIndex);
            this.m_itemCount++;
            _loc5_ = param1.ClassID != null?Main.getClassByName(param1.ClassID):Item;
            this.m_lastItem = new _loc5_(param1,this.m_itemIndex,this.STAGEDATA);
            this.m_itemID++;
            this.m_itemsInUse[this.m_itemIndex] = this.m_lastItem;
            this.STAGEDATA.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.GAME_ITEM_CREATED,{
               "item":this.m_lastItem,
               "auto":false
            }));
            if(param2 != 1337 && param3 != -1337)
            {
               this.m_lastItem.ItemInstance.x = param2;
               this.m_lastItem.ItemInstance.y = param3;
               while(this.testTerrainWithCoord(this.m_lastItem.ItemInstance.x,this.m_lastItem.ItemInstance.y))
               {
                  this.m_lastItem.ItemInstance.y--;
               }
            }
            else if(this.m_lastItem.IsSmashBall)
            {
               this.m_lastItem.ItemInstance.x = Utils.random() * (this.STAGEDATA.SmashBallBounds.x + this.STAGEDATA.SmashBallBounds.width - this.STAGEDATA.SmashBallBounds.x) + this.STAGEDATA.SmashBallBounds.x;
               this.m_lastItem.ItemInstance.y = Utils.random() * (this.STAGEDATA.SmashBallBounds.y + this.STAGEDATA.SmashBallBounds.height - this.STAGEDATA.SmashBallBounds.y) + this.STAGEDATA.SmashBallBounds.y;
               while(this.testTerrainWithCoord(this.m_lastItem.ItemInstance.x,this.m_lastItem.ItemInstance.y))
               {
                  this.m_lastItem.ItemInstance.y--;
               }
            }
            else
            {
               _loc6_ = this.m_itemGens[Math.round(Utils.random() * (this.m_itemGens.length - 1))];
               this.m_lastItem.ItemInstance.x = Utils.random() * (_loc6_.x + _loc6_.width - _loc6_.x) + _loc6_.x;
               this.m_lastItem.ItemInstance.y = _loc6_.y;
               while(this.testTerrainWithCoord(this.m_lastItem.ItemInstance.x,this.m_lastItem.ItemInstance.y))
               {
                  this.m_lastItem.ItemInstance.y--;
               }
            }
            this.incrementItemSlot();
            return this.m_lastItem;
         }
         return null;
      }
      
      public function generateItemNum(param1:Number, param2:Number = 1337, param3:Number = -1337, param4:Boolean = false) : Boolean
      {
         var _loc5_:ItemData = null;
         var _loc6_:Class = null;
         var _loc7_:MovieClip = null;
         if(this.m_itemIndex < this.m_itemsInUse.length && (this.m_itemGens.length > 0 || param2 != 1337 && param3 != -1337) && (this.validateItemNum(param1) || param4))
         {
            _loc5_ = this.m_item[param1];
            if(_loc5_.LinkageID == "capsule_ex" && Utils.random() > 0.25)
            {
               _loc5_ = this.getItemByLinkage("capsule");
            }
            _loc6_ = _loc5_.ClassID != null?Main.getClassByName(_loc5_.ClassID):Item;
            this.m_itemCount++;
            this.m_lastItem = new _loc6_(_loc5_,this.m_itemIndex,this.STAGEDATA);
            this.STAGEDATA.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.GAME_ITEM_CREATED,{
               "item":this.m_lastItem,
               "auto":true
            }));
            this.m_itemID++;
            if(param2 != 1337 && param3 != -1337)
            {
               this.m_lastItem.ItemInstance.x = param2;
               this.m_lastItem.ItemInstance.y = param3;
               while(this.testTerrainWithCoord(this.m_lastItem.ItemInstance.x,this.m_lastItem.ItemInstance.y))
               {
                  this.m_lastItem.ItemInstance.y--;
               }
            }
            else if(this.m_lastItem.IsSmashBall)
            {
               this.m_lastItem.ItemInstance.x = Utils.random() * (this.STAGEDATA.SmashBallBounds.x + this.STAGEDATA.SmashBallBounds.width - this.STAGEDATA.SmashBallBounds.x) + this.STAGEDATA.SmashBallBounds.x;
               this.m_lastItem.ItemInstance.y = Utils.random() * (this.STAGEDATA.SmashBallBounds.y + this.STAGEDATA.SmashBallBounds.height - this.STAGEDATA.SmashBallBounds.y) + this.STAGEDATA.SmashBallBounds.y;
               while(this.testTerrainWithCoord(this.m_lastItem.ItemInstance.x,this.m_lastItem.ItemInstance.y))
               {
                  this.m_lastItem.ItemInstance.y--;
               }
            }
            else
            {
               _loc7_ = this.m_itemGens[Math.round(Utils.random() * (this.m_itemGens.length - 1))];
               this.m_lastItem.ItemInstance.x = Utils.random() * (_loc7_.x + _loc7_.width - _loc7_.x) + _loc7_.x;
               this.m_lastItem.ItemInstance.y = _loc7_.y;
               while(this.testTerrainWithCoord(this.m_lastItem.ItemInstance.x,this.m_lastItem.ItemInstance.y))
               {
                  this.m_lastItem.ItemInstance.y--;
               }
            }
            this.m_itemsInUse[this.m_itemIndex] = this.m_lastItem;
            this.incrementItemSlot();
            return true;
         }
         return false;
      }
      
      public function getRandomLocation() : Point
      {
         return new Point(Utils.random() * (this.STAGEDATA.SmashBallBounds.x + this.STAGEDATA.SmashBallBounds.width - this.STAGEDATA.SmashBallBounds.x) + this.STAGEDATA.SmashBallBounds.x,Utils.random() * (this.STAGEDATA.SmashBallBounds.y + this.STAGEDATA.SmashBallBounds.height - this.STAGEDATA.SmashBallBounds.y) + this.STAGEDATA.SmashBallBounds.y);
      }
      
      private function incrementItemSlot() : void
      {
         this.m_itemIndex++;
         if(this.m_itemIndex >= this.MAXITEMS)
         {
            this.m_itemIndex = 0;
         }
         if(this.m_itemIndex < this.m_item.length && this.m_item[this.m_itemIndex] != null && this.m_item[this.m_itemIndex].LinkageID == "smashball")
         {
            this.m_itemIndex++;
            if(this.m_itemIndex >= this.MAXITEMS)
            {
               this.m_itemIndex = 0;
            }
         }
      }
      
      private function validateItemNum(param1:Number) : Boolean
      {
         return param1 >= 0 && param1 < this.m_item.length && this.validateItemObj(this.m_item[param1]);
      }
      
      private function validateItemObj(param1:ItemData) : Boolean
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:StageHazard = null;
         var _loc6_:Number = NaN;
         var _loc2_:Boolean = true;
         if(param1 == null || param1.LinkageID == "pokeball" && this.STAGEDATA.PokemonCount >= Main.MAX_POKEMON || param1.LinkageID == "assistTrophy" && this.STAGEDATA.AssistCount >= Main.MAX_ASSISTS || param1.LinkageID == "cucco" && this.STAGEDATA.CuccoCount >= Main.MAX_CUCCOS)
         {
            return false;
         }
         if(param1.LinkageID == "smashball")
         {
            for(_loc3_ in this.m_itemsInUse)
            {
               if(this.m_itemsInUse[_loc3_] != null && this.m_itemsInUse[_loc3_].Ability == "special")
               {
                  _loc2_ = false;
               }
            }
            for(_loc4_ in this.m_opponents)
            {
               if(this.STAGEDATA.getPlayer(this.m_opponents[_loc4_]).UsingFinalSmash || this.STAGEDATA.getPlayer(this.m_opponents[_loc4_]).HasSmashBall)
               {
                  _loc2_ = false;
               }
            }
            if(!this.m_smashBallReady.IsComplete)
            {
               _loc2_ = false;
            }
            _loc5_ = this.STAGEDATA.getHazard(Nintendo3DSHazard);
            if(_loc5_ && Nintendo3DSHazard(_loc5_).CurrentMiniGame == "v" && Nintendo3DSHazard(_loc5_).Action != 0 && Nintendo3DSHazard(_loc5_).Action != 4)
            {
               _loc2_ = false;
            }
         }
         if(_loc2_ && this.m_itemsInUse[this.m_itemIndex] != null)
         {
            _loc6_ = this.m_itemIndex + 1;
            if(_loc6_ >= this.MAXITEMS)
            {
               _loc6_ = 0;
            }
            while(this.m_itemIndex != _loc6_ && this.m_itemsInUse[_loc6_] != null)
            {
               _loc6_++;
               if(_loc6_ >= this.MAXITEMS)
               {
                  _loc6_ = 0;
               }
            }
            if(this.m_itemIndex == _loc6_)
            {
               _loc2_ = false;
            }
            else
            {
               this.m_itemIndex = _loc6_;
            }
         }
         return _loc2_;
      }
      
      public function get Frequency() : Number
      {
         return this.m_chance;
      }
      
      public function get MAXITEMS() : Number
      {
         return 30;
      }
      
      public function get ItemsList() : Vector.<ItemData>
      {
         return this.m_itemsList;
      }
      
      public function get FullItemsList() : Vector.<ItemData>
      {
         return this.m_fullItemsList;
      }
      
      public function get ItemsInUse() : Vector.<Item>
      {
         return this.m_itemsInUse;
      }
      
      public function get CanMakeItem() : Boolean
      {
         return this.m_itemCount < this.MAXITEMS;
      }
      
      public function get SmashBallReady() : FrameTimer
      {
         return this.m_smashBallReady;
      }
      
      public function get CurrentSmashBall() : Item
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         for(_loc1_ in this.m_opponents)
         {
            if(this.STAGEDATA.getPlayer(this.m_opponents[_loc1_]).UsingFinalSmash || this.STAGEDATA.getPlayer(this.m_opponents[_loc1_]).HasSmashBall)
            {
               return null;
            }
         }
         for(_loc2_ in this.m_itemsInUse)
         {
            if(this.m_itemsInUse[_loc2_] != null && this.m_itemsInUse[_loc2_].Ability == "special" && this.m_itemsInUse[_loc2_].LinkageID == "smashball")
            {
               return this.m_itemsInUse[_loc2_];
            }
         }
         return null;
      }
      
      public function get PlayerUsingSmashBall() : Character
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.m_opponents)
         {
            if(this.STAGEDATA.getPlayer(this.m_opponents[_loc1_]).UsingFinalSmash || this.STAGEDATA.getPlayer(this.m_opponents[_loc1_]).HasSmashBall)
            {
               return this.STAGEDATA.getPlayer(this.m_opponents[_loc1_]);
            }
         }
         return null;
      }
      
      public function setFrequency(param1:Number) : void
      {
         this.m_chance = param1;
      }
      
      public function getItemData(param1:int) : Item
      {
         if(param1 >= 0 && param1 < this.MAXITEMS)
         {
            return this.m_itemsInUse[param1];
         }
         return null;
      }
      
      public function getItemByID(param1:int) : Item
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.m_itemsInUse.length)
         {
            if(this.m_itemsInUse[_loc2_] && this.m_itemsInUse[_loc2_].UID == param1)
            {
               return this.m_itemsInUse[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getItemByMC(param1:MovieClip) : Item
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.m_itemsInUse.length)
         {
            if(this.m_itemsInUse[_loc2_] && (this.m_itemsInUse[_loc2_].MC == param1 || this.m_itemsInUse[_loc2_].Stance != null && this.m_itemsInUse[_loc2_].Stance == param1))
            {
               return this.m_itemsInUse[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function killItem(param1:Number) : void
      {
         if(this.m_itemsInUse[param1] != null)
         {
            this.m_itemsInUse[param1].destroy();
            this.m_itemsInUse[param1] = null;
            this.m_itemCount--;
         }
      }
      
      public function killAllItems() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_itemsInUse.length)
         {
            if(this.m_itemsInUse[_loc1_] != null)
            {
               this.m_itemsInUse[_loc1_].destroy();
               this.m_itemsInUse[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      private function getItemTypes(param1:Object) : Vector.<ItemData>
      {
         return this.m_itemsList;
      }
      
      public function playGlobalSound(param1:String) : void
      {
         this.STAGEDATA.SoundQueueRef.playSoundEffect(param1);
      }
      
      private function checkSuddenDeathBombs() : void
      {
         var _loc1_:ItemData = null;
         var _loc2_:Item = null;
         if(this.STAGEDATA.GameRef.SuddenDeath && this.STAGEDATA.ElapsedFrames >= 60 * 30)
         {
            this.m_suddenDeathBombTimer.tick();
            if(this.m_suddenDeathBombTimer.IsComplete)
            {
               this.m_suddenDeathBombTimer.reset();
               _loc1_ = new ItemData();
               _loc1_.importItemData(ItemsListData.getItemByID("bobomb"));
               _loc2_ = this.generateItemObj(_loc1_);
               _loc2_.Toss(_loc2_.X,_loc2_.Y,0,0);
            }
         }
      }
      
      public function PERFORMALL() : void
      {
         if(!this.STAGEDATA.Paused && !this.STAGEDATA.StageEvent)
         {
            this.checkSuddenDeathBombs();
            this.checkItem();
            this.controlItems();
         }
      }
   }
}
