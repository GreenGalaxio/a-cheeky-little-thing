package com.mcleodgaming.ssf2
{
   import com.google.analytics.AnalyticsTracker;
   import com.google.analytics.GATracker;
   import com.mcleodgaming.ssf2.audio.SoundLibrary;
   import com.mcleodgaming.ssf2.controllers.EventMatchController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.controllers.UnlockController;
   import com.mcleodgaming.ssf2.enemies.Arwing;
   import com.mcleodgaming.ssf2.enemies.DistantPlanetWater;
   import com.mcleodgaming.ssf2.enemies.JungleHijinxBarrel2;
   import com.mcleodgaming.ssf2.enemies.KonohaLantern;
   import com.mcleodgaming.ssf2.enemies.MK3Block;
   import com.mcleodgaming.ssf2.enemies.SectorZLaser;
   import com.mcleodgaming.ssf2.engine.CharacterData;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.SSF2API_Interface;
   import com.mcleodgaming.ssf2.engine.SSF2File;
   import com.mcleodgaming.ssf2.engine.Stats;
   import com.mcleodgaming.ssf2.enums.SpecialMode;
   import com.mcleodgaming.ssf2.hazards.BirdoHazard;
   import com.mcleodgaming.ssf2.hazards.CastleWilyHazard;
   import com.mcleodgaming.ssf2.hazards.ChaosShrineHazard;
   import com.mcleodgaming.ssf2.hazards.GalaxyTours;
   import com.mcleodgaming.ssf2.hazards.GangplankWater;
   import com.mcleodgaming.ssf2.hazards.MrSaturnHazard;
   import com.mcleodgaming.ssf2.hazards.NamekWater;
   import com.mcleodgaming.ssf2.hazards.SMISnow;
   import com.mcleodgaming.ssf2.hazards.Whispy;
   import com.mcleodgaming.ssf2.hazards.YggdrasilHazard;
   import com.mcleodgaming.ssf2.items.AssistTrophyItem;
   import com.mcleodgaming.ssf2.items.Bobomb;
   import com.mcleodgaming.ssf2.items.Bumper;
   import com.mcleodgaming.ssf2.items.ClockTownFairy;
   import com.mcleodgaming.ssf2.items.Cucco;
   import com.mcleodgaming.ssf2.items.EnergyTank;
   import com.mcleodgaming.ssf2.items.ExplodingTag;
   import com.mcleodgaming.ssf2.items.Food;
   import com.mcleodgaming.ssf2.items.Freezie;
   import com.mcleodgaming.ssf2.items.GreenShell;
   import com.mcleodgaming.ssf2.items.HeartContainer;
   import com.mcleodgaming.ssf2.items.ItemsListData;
   import com.mcleodgaming.ssf2.items.MaximTomato;
   import com.mcleodgaming.ssf2.items.MrSaturn;
   import com.mcleodgaming.ssf2.items.OnionPellet;
   import com.mcleodgaming.ssf2.items.PoisonMushroom;
   import com.mcleodgaming.ssf2.items.Pokeball;
   import com.mcleodgaming.ssf2.items.RayGun;
   import com.mcleodgaming.ssf2.items.RedShell;
   import com.mcleodgaming.ssf2.items.SpikeShell;
   import com.mcleodgaming.ssf2.items.SuperMushroom;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import com.mcleodgaming.ssf2.platforms.BowsersCastlePlatform;
   import com.mcleodgaming.ssf2.platforms.Bumper1_B;
   import com.mcleodgaming.ssf2.platforms.Bumper1_T;
   import com.mcleodgaming.ssf2.platforms.Bumper2_L;
   import com.mcleodgaming.ssf2.platforms.Bumper2_R;
   import com.mcleodgaming.ssf2.platforms.Bumper3;
   import com.mcleodgaming.ssf2.platforms.ButtonPlatform;
   import com.mcleodgaming.ssf2.platforms.CentralHighwayLeftPillar;
   import com.mcleodgaming.ssf2.platforms.CentralHighwayLeftPlatform;
   import com.mcleodgaming.ssf2.platforms.CentralHighwayRightPillar;
   import com.mcleodgaming.ssf2.platforms.CentralHighwayRightPlatform;
   import com.mcleodgaming.ssf2.platforms.DynamicPlatform;
   import com.mcleodgaming.ssf2.platforms.FoursideSpaceship;
   import com.mcleodgaming.ssf2.platforms.GangplankBoat;
   import com.mcleodgaming.ssf2.platforms.GooniePlatform;
   import com.mcleodgaming.ssf2.platforms.MK3Platform;
   import com.mcleodgaming.ssf2.platforms.MuddTerrain;
   import com.mcleodgaming.ssf2.platforms.NamekPlatform;
   import com.mcleodgaming.ssf2.platforms.PeachPlatform;
   import com.mcleodgaming.ssf2.platforms.Pidgit;
   import com.mcleodgaming.ssf2.platforms.PikminLeaf;
   import com.mcleodgaming.ssf2.platforms.PuzzlePlankFallPlatform;
   import com.mcleodgaming.ssf2.platforms.SandOceanCeiling;
   import com.mcleodgaming.ssf2.platforms.SkySanctuaryCloud;
   import com.mcleodgaming.ssf2.platforms.SkySanctuaryFallPlatform;
   import com.mcleodgaming.ssf2.platforms.TOSPlatform;
   import com.mcleodgaming.ssf2.platforms.YoshiStoryCloud;
   import com.mcleodgaming.ssf2.platforms.YoshisIsland_10;
   import com.mcleodgaming.ssf2.platforms.YoshisIsland_2;
   import com.mcleodgaming.ssf2.platforms.YoshisIsland_4;
   import com.mcleodgaming.ssf2.platforms.YoshisIsland_8;
   import com.mcleodgaming.ssf2.platforms.YoshisIsland_CenterWindmill;
   import com.mcleodgaming.ssf2.platforms.YoshisIsland_RotatingPlatform;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Key;
   import com.mcleodgaming.ssf2.util.MouseTracker;
   import com.mcleodgaming.ssf2.util.Resource;
   import com.mcleodgaming.ssf2.util.ResourceManager;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.InteractiveObject;
   import flash.display.MovieClip;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import flash.media.Sound;
   import flash.net.LocalConnection;
   import flash.net.URLRequest;
   import flash.net.getClassByAlias;
   import flash.net.navigateToURL;
   import flash.net.registerClassAlias;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.text.TextField;
   import flash.ui.ContextMenu;
   import flash.utils.getQualifiedClassName;
   
   public dynamic class Main extends MovieClip
   {
      
      private static var ROOT:Main;
      
      private static var m_rootIsLoaded:Boolean = false;
      
      private static var m_resources:Vector.<Resource> = new Vector.<Resource>();
      
      private static var m_resourceURLs:Vector.<String> = new Vector.<String>();
      
      private static var m_resourcesLoaded:Boolean = false;
      
      private static var m_resourcesPercent:Number = 0;
      
      private static var m_resourcesLength:Number = 0;
      
      private static var m_loadedCharacters:Vector.<Resource> = new Vector.<Resource>();
      
      private static var m_loadedStages:Vector.<Resource> = new Vector.<Resource>();
      
      private static var m_toBeLoaded:Vector.<Resource> = new Vector.<Resource>();
      
      private static var m_ssf2Files:Vector.<SSF2File> = new Vector.<SSF2File>();
      
      private static var m_dynamicLoadFunc:Function = null;
      
      private static var m_loadDelay:FrameTimer = new FrameTimer(3);
      
      private static var m_classRefs:Array = new Array(BirdoHazard,CastleWilyHazard,ChaosShrineHazard,GalaxyTours,MrSaturnHazard,NamekWater,SMISnow,Whispy,YggdrasilHazard,Bumper1_B,Bumper1_T,Bumper2_L,Bumper2_R,Bumper3,Pidgit,PuzzlePlankFallPlatform,TOSPlatform,YoshisIsland_10,YoshisIsland_2,YoshisIsland_4,YoshisIsland_8,YoshisIsland_CenterWindmill,YoshisIsland_RotatingPlatform,DynamicPlatform,NamekPlatform,YoshiStoryCloud,SkySanctuaryFallPlatform,SkySanctuaryCloud,GangplankWater,PeachPlatform,BowsersCastlePlatform,AssistTrophyItem,Bobomb,Bumper,ClockTownFairy,Cucco,EnergyTank,ExplodingTag,Food,Freezie,GreenShell,HeartContainer,MaximTomato,MrSaturn,PoisonMushroom,Pokeball,RayGun,RedShell,SpikeShell,SuperMushroom,CentralHighwayLeftPillar,CentralHighwayRightPillar,CentralHighwayLeftPlatform,CentralHighwayRightPlatform,GooniePlatform,FoursideSpaceship,SectorZLaser,Arwing,OnionPellet,DistantPlanetWater,PikminLeaf,KonohaLantern,MK3Block,MK3Platform,GangplankBoat,SandOceanCeiling,ButtonPlatform,MuddTerrain,JungleHijinxBarrel2,Projectile);
      
      private static var m_expansionData:Vector.<Vector.<Function>> = new Vector.<Vector.<Function>>();
      
      private static var m_extraFunctions:Array = new Array();
      
      private static var m_extraFunctionsQueue:Array = ["getColorCostumes","getItemData","getEnemyAttackData"];
      
      private static var m_randCharList:Vector.<CharacterData>;
      
      private static var m_currentResource:Number = -1;
      
      private static var m_guidID:Number = 0;
      
      private static var m_width:Number = 640;
      
      private static var m_height:Number = 360;
      
      public static const MAXPLAYERS:int = 8;
      
      public static const SHOWMASK:Boolean = true;
      
      public static const ENCRYPTED:Boolean = false;
      
      private static const DEBUGCONST:Boolean = true;
      
      public static var FORCEDEBUGOFF:Boolean = false;
      
      public static var MAX_ASSISTS:int = 1;
      
      public static var MAX_POKEMON:int = 8;
      
      public static var MAX_CUCCOS:int = 3;
      
      public static var LOCALHOST:Boolean = true;
      
      public static var DOMAIN:String = "localhost";
      
      public static var AUTHORIZED:Boolean = false;
      
      public static const FRAMERATE:int = 30;
      
      public static var m_debugField:TextField;
      
      public static var preloader:MovieClip;
      
      public static var tracker:AnalyticsTracker;
       
      
      public function Main()
      {
         super();
         addFrameScript(0,this.frame1);
         ROOT = this;
         preloader = MovieClip(ROOT.addChild(Main.getLibraryMC("menu_preloader")));
         preloader.x = Main.Width / 2;
         preloader.y = Main.Height / 2;
         m_debugField = new TextField();
         stage.scaleMode = StageScaleMode.SHOW_ALL;
         stage.showDefaultContextMenu = false;
         stage.stageFocusRect = false;
         var _loc1_:ContextMenu = new ContextMenu();
         _loc1_.hideBuiltInItems();
         this.contextMenu = _loc1_;
         makeClassStringArr();
         SaveData.initializeSaveData();
         SoundLibrary.initializeSoundLibrary();
         MouseTracker.initializeMouseClass();
         MouseTracker.setAutoHide(ROOT.stage,true);
         Key.initializeKeyClass();
         Key.beginCapture(ROOT.stage);
         Utils.initializeUtilsClass();
         SpecialMode.init();
         MultiplayerManager.initializeMultiplayerManager();
         trace("Main Method started");
         stage.addEventListener(Event.RESIZE,this.resizeListener);
         Main.initResources();
         m_randCharList = new Vector.<CharacterData>();
         this.stage.quality = SaveData.Quality;
         wideScreenScrollRect();
         setFullScreenMode(SaveData.FullScreenQuality);
         ROOT.stage.addEventListener(Event.FULLSCREEN,fixMenu);
         ROOT.loaderInfo.addEventListener(ProgressEvent.PROGRESS,ROOT.onRootLoadProgress);
         ROOT.loaderInfo.addEventListener(Event.COMPLETE,ROOT.onRootLoadComplete);
      }
      
      public static function setFullScreenMode(param1:int) : void
      {
         if(param1 == 0)
         {
            Main.Root.stage.fullScreenSourceRect = new Rectangle(0,0,Main.Width,Main.Height);
         }
         else if(param1 == 1)
         {
            Main.Root.stage.fullScreenSourceRect = null;
         }
      }
      
      public static function setFocus(param1:InteractiveObject) : void
      {
         Main.Root.stage.focus = param1;
      }
      
      public static function fixFocus() : void
      {
         Main.Root.stage.focus = Main.Root.stage;
      }
      
      public static function fixMenu(param1:Event) : void
      {
         ROOT.stage.showDefaultContextMenu = false;
      }
      
      public static function resetScrollRect() : void
      {
         Main.Root.scrollRect = null;
      }
      
      public static function wideScreenScrollRect() : void
      {
         Main.Root.scrollRect = new Rectangle(0,0,Main.Width,Main.Height);
      }
      
      private static function makeClassStringArr() : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc1_:int = 0;
         while(_loc1_ < m_classRefs.length)
         {
            _loc2_ = getQualifiedClassName(m_classRefs[_loc1_]);
            _loc3_ = _loc2_.substr(_loc2_.indexOf("::") + 2);
            registerClassAlias(_loc3_,m_classRefs[_loc1_]);
            _loc1_++;
         }
      }
      
      private static function randomTest() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < 1000000)
         {
            _loc1_ = _loc1_ + Utils.random();
            _loc2_++;
         }
         trace("[Random test complete: Average rand value is " + _loc1_ / 1000000 + "]");
      }
      
      private static function initResources() : void
      {
         var _loc1_:LocalConnection = new LocalConnection();
         var _loc2_:String = _loc1_.domain;
         if(_loc2_ == "localhost" || _loc2_ == "127.0.0.1")
         {
            Main.AUTHORIZED = true;
         }
         else if(_loc2_.indexOf("mcleodgaming.com",0) >= 0)
         {
            Main.DOMAIN = _loc2_;
            Main.LOCALHOST = false;
            Main.AUTHORIZED = true;
         }
         ResourceManager.init(m_ssf2Files);
         Main.addUnloadedResources(getSSF2StageFileList());
         Main.addUnloadedResources(getSSF2CharacterFileList());
      }
      
      public static function getSSF2FileByID(param1:String) : SSF2File
      {
         var _loc2_:int = 0;
         while(_loc2_ < m_ssf2Files.length)
         {
            if(m_ssf2Files[_loc2_].ID == param1)
            {
               return m_ssf2Files[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public static function getSSF2FileByName(param1:String) : SSF2File
      {
         var _loc2_:int = 0;
         while(_loc2_ < m_ssf2Files.length)
         {
            if(Main.ENCRYPTED)
            {
               if(m_ssf2Files[_loc2_].EncryptedFileName.toLowerCase() == param1.toLowerCase())
               {
                  return m_ssf2Files[_loc2_];
               }
            }
            else if(m_ssf2Files[_loc2_].FileName.toLowerCase() == param1.toLowerCase())
            {
               return m_ssf2Files[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public static function getSSF2GlobalFileList() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         var _loc2_:int = 0;
         while(_loc2_ < m_ssf2Files.length)
         {
            if(m_ssf2Files[_loc2_].Type != Resource.STAGE && m_ssf2Files[_loc2_].Type != Resource.CHARACTER && m_ssf2Files[_loc2_].Type != Resource.EXTRA)
            {
               _loc1_.push(m_ssf2Files[_loc2_].Location);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function getSSF2CharacterFileList() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         var _loc2_:int = 0;
         while(_loc2_ < m_ssf2Files.length)
         {
            if(m_ssf2Files[_loc2_].Type == Resource.CHARACTER || m_ssf2Files[_loc2_].Type == Resource.CHARACTER_EXPANSION)
            {
               _loc1_.push(m_ssf2Files[_loc2_].Location);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function getSSF2StageFileList() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         var _loc2_:int = 0;
         while(_loc2_ < m_ssf2Files.length)
         {
            if(m_ssf2Files[_loc2_].Type == Resource.STAGE || m_ssf2Files[_loc2_].Type == Resource.STAGE_EXPANSION)
            {
               _loc1_.push(m_ssf2Files[_loc2_].Location);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function prepRandomCharacters() : void
      {
         m_randCharList = new Vector.<CharacterData>();
         while(m_randCharList.length < MAXPLAYERS)
         {
            m_randCharList.push(Stats.getRandomCharacter());
         }
      }
      
      public static function getURL(param1:*, param2:String = "_self") : void
      {
         var _loc4_:String = null;
         var _loc3_:URLRequest = param1 is String?new URLRequest(param1):param1;
         if(!ExternalInterface.available)
         {
            navigateToURL(_loc3_,param2);
         }
         else
         {
            _loc4_ = String(ExternalInterface.call("function() {return navigator.userAgent;}")).toLowerCase();
            if(_loc4_.indexOf("firefox") != -1 || _loc4_.indexOf("msie") != -1 && uint(_loc4_.substr(_loc4_.indexOf("msie") + 5,3)) >= 7)
            {
               ExternalInterface.call("window.open",_loc3_.url,param2);
            }
            else
            {
               navigateToURL(_loc3_,param2);
            }
         }
      }
      
      public static function addUnloadedResources(param1:Vector.<String>) : void
      {
         var _loc3_:URLRequest = null;
         var _loc4_:LoaderContext = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new URLRequest(param1[_loc2_]);
            _loc4_ = new LoaderContext();
            _loc4_.applicationDomain = new ApplicationDomain(Root.loaderInfo.applicationDomain);
            m_resources.push(new Resource(param1[_loc2_],Resource.NULL));
            m_currentResource++;
            m_resources[m_currentResource].Type = Main.getSSF2FileByName(m_resources[m_currentResource].FileName).Type;
            _loc2_++;
         }
      }
      
      public static function loadResources(param1:Vector.<String>) : void
      {
         var _loc2_:URLRequest = null;
         var _loc3_:LoaderContext = null;
         if(param1.length > 0)
         {
            if(m_resourcesLength == 0)
            {
               m_resourcesLength = param1.length;
            }
            m_resourceURLs = param1;
            _loc2_ = new URLRequest(m_resourceURLs[0]);
            _loc3_ = new LoaderContext();
            _loc3_.applicationDomain = new ApplicationDomain(Root.loaderInfo.applicationDomain);
            m_resources.push(new Resource(m_resourceURLs[0],Resource.NULL));
            m_currentResource++;
            m_resources[m_currentResource].Type = Main.getSSF2FileByName(m_resources[m_currentResource].FileName).Type;
            m_resources[m_currentResource].getLoader().contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,Main.removeResource);
            m_resources[m_currentResource].getLoader().contentLoaderInfo.addEventListener(Event.INIT,Main.resourceLoadComplete);
            m_resources[m_currentResource].getLoader().contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,Main.resourceLoadProgress);
            m_resources[m_currentResource].getLoader().load(_loc2_,_loc3_);
         }
         else
         {
            initGame();
         }
      }
      
      private static function removeResource(param1:IOErrorEvent) : void
      {
         m_resources[m_currentResource].getLoader().unloadAndStop();
         m_resources.splice(m_currentResource,1);
         trace("Failed to load resource: " + m_resourceURLs[0]);
         m_resourcesPercent = m_resourcesPercent + 1 / m_resourcesLength * 100;
         m_resourceURLs.splice(0,1);
         m_currentResource--;
         if(m_resourceURLs.length == 0)
         {
            initGame();
         }
         else
         {
            Main.loadResources(m_resourceURLs);
         }
      }
      
      private static function resourceLoadProgress(param1:ProgressEvent) : void
      {
         var _loc2_:int = param1.bytesTotal == 0?int(1):int(param1.bytesTotal);
         Main.preloader.pCent.text = "" + Math.round(100 * (1 / 20) + 19 / 20 * (m_resourcesPercent + Math.round(param1.bytesLoaded / _loc2_ * 100) * (1 / m_resourcesLength)));
         Main.preloader.progressBar.scaleX = Math.round(100 * (1 / 20) + 19 / 20 * (m_resourcesPercent + Math.round(param1.bytesLoaded / _loc2_ * 100) * (1 / m_resourcesLength))) / 100;
      }
      
      private static function validateResource(param1:Resource) : Boolean
      {
         var _loc3_:Function = null;
         var _loc4_:Class = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Function = null;
         var _loc8_:Function = null;
         var _loc9_:Function = null;
         var _loc10_:Function = null;
         var _loc2_:int = 0;
         if(param1.MC && "initAPI" in param1.MC)
         {
            _loc3_ = param1.MC["initAPI"] as Function;
            _loc4_ = _loc3_(SSF2API_Interface);
            _loc5_ = SSF2API_Interface.versionCompareTo(_loc4_.VERSION_MAJOR,_loc4_.VERSION_MINOR,_loc4_.VERSION_REVISION);
            _loc6_ = "(unknown)";
            if(_loc5_ > 0)
            {
               _loc6_ = Boolean(_loc4_["getAPIVersion"] as Function)?(_loc4_["getAPIVersion"] as Function)():"(unknown)";
               if(Main.DEBUG && MenuController.debugConsole)
               {
                  MenuController.debugConsole.alert("[Warning] API for resource \"" + param1.FileName + "\" is older than the game engine\'s API Interface. Please recompile resource. (v" + _loc6_ + " < v" + SSF2API_Interface.getAPIVersion() + ")");
               }
            }
            else if(_loc5_ < 0)
            {
               _loc6_ = Boolean(_loc4_["getAPIVersion"] as Function)?(_loc4_["getAPIVersion"] as Function)():"(unknown)";
               if(Main.DEBUG && MenuController.debugConsole)
               {
                  MenuController.debugConsole.alert("[Warning] API for resource \"" + param1.FileName + "\" is newer than the engine\'s API Interface. Please update game engine. (v" + _loc6_ + " > v" + SSF2API_Interface.getAPIVersion() + ")");
               }
            }
         }
         if("getID" in param1.MC)
         {
            _loc7_ = param1.MC["getID"] as Function;
            if(Main.getSSF2FileByID(_loc7_()) != null)
            {
               if("getGUID" in param1.MC)
               {
                  _loc8_ = param1.MC["getGUID"] as Function;
                  if(_loc8_() == Main.getSSF2FileByID(_loc7_()).PassKey)
                  {
                     param1.Type = Main.getSSF2FileByID(_loc7_()).Type;
                     if(param1.Type == Resource.STAGE)
                     {
                        addLoadedStage(param1);
                     }
                     else if(param1.Type == Resource.CHARACTER)
                     {
                        if("getChar1" in param1.MC)
                        {
                           _loc2_ = 1;
                           while("getChar" + _loc2_ in param1.MC)
                           {
                              _loc9_ = param1.MC["getChar" + _loc2_] as Function;
                              if(!_loc9_(null))
                              {
                                 break;
                              }
                              Stats.writeStats((_loc9_(null) as Object).cData.statsName,(_loc9_(null) as Object).cData,(_loc9_(null) as Object).aData,(_loc9_(null) as Object).pData,(_loc9_(null) as Object).iData);
                              _loc2_++;
                           }
                           addLoadedCharacter(param1);
                        }
                        else
                        {
                           trace("ERROR writing stats for " + _loc7_() + " with key " + _loc8_());
                           return false;
                        }
                     }
                     else
                     {
                        _loc2_ = 0;
                        while(_loc2_ < m_extraFunctionsQueue.length)
                        {
                           if(m_extraFunctionsQueue[_loc2_] in param1.MC && param1.MC[m_extraFunctionsQueue[_loc2_]] is Function)
                           {
                              trace("Added extra function " + m_extraFunctionsQueue[_loc2_] + "() from " + param1.FileName);
                              m_extraFunctions[m_extraFunctionsQueue[_loc2_]] = param1.MC[m_extraFunctionsQueue[_loc2_]];
                              m_extraFunctionsQueue.splice(0,1);
                              _loc2_--;
                           }
                           _loc2_++;
                        }
                     }
                  }
                  else
                  {
                     trace("ERROR in validation for " + _loc7_() + " with key " + _loc8_());
                     return false;
                  }
               }
               else
               {
                  trace("ERROR, no GUID for " + _loc7_());
                  return false;
               }
            }
            else
            {
               trace("ERROR, no matching ID for global " + _loc7_());
               param1.unload();
               m_resources.splice(m_resources.length - 1,1);
               m_currentResource--;
               return false;
            }
         }
         else if("getChar1" in param1.MC && param1.FileName.indexOf("test") == 0)
         {
            m_expansionData.push(new Vector.<Function>());
            _loc2_ = 1;
            while("getChar" + _loc2_ in param1.MC)
            {
               m_expansionData[m_expansionData.length - 1].push(param1.MC["getChar" + _loc2_] as Function);
               _loc2_++;
            }
         }
         else if("getStage" in param1.MC)
         {
            _loc10_ = param1.MC["getStage"] as Function;
            if(_loc10_() == "xpstage")
            {
               addLoadedStage(param1);
            }
         }
         else
         {
            trace("ERROR, no association for " + param1.URL);
            param1.unload();
            m_resources.splice(m_resources.length - 1,1);
            m_currentResource--;
            return false;
         }
         return true;
      }
      
      private static function resourceLoadComplete(param1:Event) : void
      {
         m_resourceURLs.splice(0,1);
         m_resources[m_currentResource].Loaded = true;
         m_resources[m_currentResource].getLoader().contentLoaderInfo.removeEventListener(Event.INIT,Main.resourceLoadComplete);
         m_resources[m_currentResource].getLoader().contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,Main.resourceLoadProgress);
         m_resources[m_resources.length - 1].MC.visible = false;
         m_resourcesPercent = m_resourcesPercent + 1 / m_resourcesLength * 100;
         if(!validateResource(m_resources[m_resources.length - 1]))
         {
            m_resources[m_resources.length - 1].unload();
            m_resources.splice(m_resources.length - 1,1);
            m_currentResource--;
         }
         if(m_resourceURLs.length == 0)
         {
            initGame();
         }
         else
         {
            Main.loadResources(m_resourceURLs);
         }
      }
      
      private static function initGame() : void
      {
         if(!m_resourcesLoaded)
         {
            m_resourcesLoaded = true;
            tracker = new GATracker(Root,"UA-35183034-2","AS3",false);
            if(LOCALHOST)
            {
               tracker.trackPageview("SSF2 Local v" + Version.getVersion());
            }
            else
            {
               tracker.trackPageview("SSF2 Web v" + Version.getVersion());
            }
            ItemsListData.init();
            EventMatchController.init();
            MenuController.init();
            UnlockController.init();
            ROOT.loaderInfo.removeEventListener(Event.COMPLETE,ROOT.onRootLoadComplete);
            if(Main.preloader.parent)
            {
               Main.preloader.parent.removeChild(Main.preloader);
               Main.preloader = null;
            }
            if(Main.AUTHORIZED)
            {
               MenuController.showDisclaimerMenu();
            }
            else
            {
               MenuController.showBlockedMenu();
            }
            if(SaveData.corrupted)
            {
               MultiplayerManager.makeNotifier();
               MultiplayerManager.notify("Warning, save data has been corrupted and could not be recovered. Initializing with clean save file.");
               SaveData.corrupted = false;
            }
         }
      }
      
      public static function getResourceByName(param1:String) : Resource
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < m_resources.length)
         {
            if(m_resources[_loc2_].FileName == param1.toLowerCase())
            {
               return m_resources[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public static function get Root() : Main
      {
         return ROOT;
      }
      
      public static function get Resources() : Vector.<Resource>
      {
         return m_resources;
      }
      
      public static function getClassByName(param1:String) : Class
      {
         var _loc2_:Class = null;
         try
         {
            _loc2_ = getClassByAlias(param1);
            return _loc2_;
         }
         catch(e:*)
         {
         }
         return _loc2_;
      }
      
      public static function getClassName(param1:*) : String
      {
         return getQualifiedClassName(param1);
      }
      
      public static function getFunction(param1:String) : Function
      {
         if(m_extraFunctions[param1])
         {
            return m_extraFunctions[param1];
         }
         return null;
      }
      
      public static function getEnemyAttackData(param1:String) : Object
      {
         var _loc2_:Function = getFunction("getEnemyAttackData");
         var _loc3_:Object = _loc2_();
         return _loc3_ && _loc3_[param1]?_loc3_[param1]:null;
      }
      
      public static function getCostume(param1:String, param2:String, param3:int = -1) : Object
      {
         var _loc6_:Array = null;
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         var _loc4_:Function = getFunction("getColorCostumes");
         var _loc5_:int = 0;
         if(_loc4_ != null)
         {
            _loc6_ = _loc4_();
            if(_loc6_ && _loc6_[param1] != null)
            {
               _loc7_ = null;
               _loc8_ = 0;
               while(_loc8_ < _loc6_[param1].length)
               {
                  if(param2 != null)
                  {
                     if(_loc6_[param1][_loc8_] && _loc6_[param1][_loc8_]["team"] && _loc6_[param1][_loc8_]["team"] == param2)
                     {
                        return _loc6_[param1][_loc8_];
                     }
                  }
                  else if(!_loc6_[param1][_loc8_]["team"])
                  {
                     if(param3 == _loc5_)
                     {
                        return _loc6_[param1][_loc8_];
                     }
                     _loc5_++;
                  }
                  _loc8_++;
               }
            }
         }
         return null;
      }
      
      public static function getLibraryMC(param1:String, param2:Number = -1) : MovieClip
      {
         var _loc9_:Class = null;
         var _loc10_:MovieClip = null;
         var _loc3_:MovieClip = null;
         var _loc4_:Class = null;
         var _loc5_:Function = null;
         var _loc6_:Object = null;
         var _loc7_:Boolean = false;
         var _loc8_:Number = 0;
         if(ROOT.loaderInfo.applicationDomain.hasDefinition(param1))
         {
            _loc9_ = ROOT.loaderInfo.applicationDomain.getDefinition(param1) as Class;
            _loc10_ = new _loc9_() as MovieClip;
            _loc3_ = _loc10_;
         }
         else if(param2 >= 0)
         {
            _loc8_ = m_resources.length - 1;
            while(_loc8_ >= 0 && !_loc7_)
            {
               if(m_resources[_loc8_].Loaded && m_resources[_loc8_].MC.loaderInfo.applicationDomain.hasDefinition(param1))
               {
                  _loc4_ = m_resources[_loc8_].MC.loaderInfo.applicationDomain.getDefinition(param1) as Class;
                  _loc3_ = new _loc4_() as MovieClip;
                  _loc7_ = true;
               }
               _loc8_--;
            }
         }
         else
         {
            _loc8_ = 0;
            while(_loc8_ < m_resources.length && !_loc7_)
            {
               if(m_resources[_loc8_].Loaded && m_resources[_loc8_].MC.loaderInfo.applicationDomain.hasDefinition(param1))
               {
                  _loc4_ = m_resources[_loc8_].MC.loaderInfo.applicationDomain.getDefinition(param1) as Class;
                  _loc3_ = new _loc4_() as MovieClip;
                  _loc7_ = true;
               }
               _loc8_++;
            }
         }
         return _loc3_;
      }
      
      public static function getLibraryClass(param1:String) : *
      {
         var _loc8_:Class = null;
         var _loc2_:* = null;
         var _loc3_:Class = null;
         var _loc4_:Function = null;
         var _loc5_:Object = null;
         var _loc6_:Boolean = false;
         var _loc7_:Number = 0;
         if(ROOT.loaderInfo.applicationDomain.hasDefinition(param1))
         {
            _loc8_ = ROOT.loaderInfo.applicationDomain.getDefinition(param1) as Class;
            _loc2_ = new _loc8_();
         }
         else
         {
            _loc7_ = 0;
            while(_loc7_ < m_resources.length && !_loc6_)
            {
               if(m_resources[_loc7_].Loaded && m_resources[_loc7_] && m_resources[_loc7_].MC && (m_resources[_loc7_].MC.loaderInfo.applicationDomain.hasDefinition(param1) || m_resources[_loc7_].MC[param1]))
               {
                  if(m_resources[_loc7_].MC.loaderInfo.applicationDomain.hasDefinition(param1))
                  {
                     _loc3_ = m_resources[_loc7_].MC.loaderInfo.applicationDomain.getDefinition(param1) as Class;
                  }
                  else
                  {
                     _loc3_ = m_resources[_loc7_].MC[param1] as Class;
                  }
                  _loc2_ = new _loc3_();
                  _loc6_ = true;
               }
               _loc7_++;
            }
         }
         return _loc2_;
      }
      
      public static function getLibrarySound(param1:String) : Sound
      {
         var _loc6_:Class = null;
         var _loc7_:Sound = null;
         var _loc2_:Sound = null;
         var _loc3_:Class = null;
         var _loc4_:Boolean = false;
         var _loc5_:Number = 0;
         while(_loc5_ < m_resources.length && !_loc4_)
         {
            if(m_resources[_loc5_].Loaded && m_resources[_loc5_] && m_resources[_loc5_].MC && (m_resources[_loc5_].MC.loaderInfo.applicationDomain.hasDefinition(param1) || m_resources[_loc5_].MC[param1]))
            {
               if(m_resources[_loc5_].MC.loaderInfo.applicationDomain.hasDefinition(param1))
               {
                  _loc3_ = m_resources[_loc5_].MC.loaderInfo.applicationDomain.getDefinition(param1) as Class;
               }
               else
               {
                  _loc3_ = m_resources[_loc5_].MC[param1] as Class;
               }
               _loc2_ = new _loc3_() as Sound;
               _loc4_ = true;
            }
            _loc5_++;
         }
         if(_loc2_ == null && ROOT.loaderInfo.applicationDomain.hasDefinition(param1))
         {
            _loc6_ = ROOT.loaderInfo.applicationDomain.getDefinition(param1) as Class;
            _loc7_ = new _loc6_() as Sound;
            return _loc7_;
         }
         return _loc2_;
      }
      
      public static function queueItemToBeLoaded(param1:Resource) : void
      {
         m_toBeLoaded.push(param1);
      }
      
      public static function dynamicLoad(param1:Function = null) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < m_toBeLoaded.length)
         {
            if(!m_toBeLoaded[_loc2_].Loaded)
            {
               if(m_loadedCharacters.indexOf(m_toBeLoaded[_loc2_]) >= 0)
               {
                  pushBackLoadedCharacter(m_toBeLoaded[_loc2_]);
               }
               else if(m_loadedStages.indexOf(m_toBeLoaded[_loc2_]) >= 0)
               {
                  pushBackLoadedStage(m_toBeLoaded[_loc2_]);
               }
               m_toBeLoaded[_loc2_].load();
            }
            else
            {
               pushBackLoadedCharacter(m_toBeLoaded[_loc2_]);
            }
            _loc2_++;
         }
         m_dynamicLoadFunc = param1;
         Main.Root.addEventListener(Event.ENTER_FRAME,dynamicLoadCheck);
      }
      
      private static function dynamicLoadCheck(param1:Event) : void
      {
         var _loc4_:Resource = null;
         var _loc2_:Boolean = true;
         var _loc3_:int = 0;
         while(_loc3_ < m_toBeLoaded.length)
         {
            if(!m_toBeLoaded[_loc3_].Loaded)
            {
               _loc2_ = false;
            }
            _loc3_++;
         }
         if(_loc2_)
         {
            m_loadDelay.tick();
            if(m_loadDelay.IsComplete)
            {
               m_loadDelay.reset();
               Main.Root.removeEventListener(Event.ENTER_FRAME,dynamicLoadCheck);
               while(m_toBeLoaded.length > 0)
               {
                  _loc4_ = m_toBeLoaded[m_toBeLoaded.length - 1];
                  if(!validateResource(_loc4_))
                  {
                     _loc4_.unload();
                  }
                  m_toBeLoaded.pop();
               }
               if(m_dynamicLoadFunc != null)
               {
                  m_dynamicLoadFunc(null);
                  m_dynamicLoadFunc = null;
               }
            }
         }
      }
      
      public static function pushBackLoadedCharacter(param1:Resource) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Resource = null;
         var _loc2_:int = m_loadedCharacters.indexOf(param1);
         if(_loc2_ > 0)
         {
            _loc3_ = _loc2_;
            _loc4_ = _loc2_ - 1;
            _loc5_ = m_loadedCharacters[_loc2_];
            while(_loc3_ > 0)
            {
               m_loadedCharacters[_loc3_] = m_loadedCharacters[_loc4_];
               _loc4_--;
               _loc3_--;
            }
            m_loadedCharacters[_loc3_] = _loc5_;
         }
      }
      
      public static function addLoadedCharacter(param1:Resource) : Resource
      {
         var _loc2_:int = m_loadedCharacters.indexOf(param1);
         if(_loc2_ >= 0)
         {
            pushBackLoadedCharacter(param1);
            return param1;
         }
         m_loadedCharacters.unshift(param1);
         if(!Main.LOCALHOST && m_loadedCharacters.length > 8 || Main.LOCALHOST && m_loadedCharacters.length > 4)
         {
            return m_loadedCharacters.pop().unload();
         }
         return null;
      }
	  
	  public static function unloadResources() : void
	  {
		  trace("# Loaded Chars before unload: " + m_loadedCharacters.length);
		  while(m_loadedCharacters.length > 0)
		  {
			  m_loadedCharacters.pop().unload();
		  }
		  trace("# Loaded Chars after unload: " + m_loadedCharacters.length);
		  trace("# Loaded Stages before unload: " + m_loadedStages.length);
		  while(m_loadedStages.length > 0)
		  {
			  m_loadedStages.pop().unload();
		  }
		  trace("# Loaded Stages after unload: " + m_loadedStages.length);
		  
	  }
      
      public static function pushBackLoadedStage(param1:Resource) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Resource = null;
         var _loc2_:int = m_loadedStages.indexOf(param1);
         if(_loc2_ > 0)
         {
            _loc3_ = _loc2_;
            _loc4_ = _loc2_ - 1;
            _loc5_ = m_loadedStages[_loc2_];
            while(_loc3_ > 0)
            {
               m_loadedStages[_loc3_] = m_loadedStages[_loc4_];
               _loc4_--;
               _loc3_--;
            }
            m_loadedStages[_loc3_] = _loc5_;
         }
      }
      
      public static function getLoadedStage(param1:String) : Resource
      {
         var _loc2_:int = 0;
         while(_loc2_ < m_loadedStages.length)
         {
            if(m_loadedStages[_loc2_].Loaded && ("getStage" in m_loadedStages[_loc2_].MC && param1 == m_loadedStages[_loc2_].MC.getStage() || "getID" in m_loadedStages[_loc2_].MC && param1 == m_loadedStages[_loc2_].MC.getID()))
            {
               return m_loadedStages[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public static function addLoadedStage(param1:Resource) : Resource
      {
         var _loc2_:int = m_loadedStages.indexOf(param1);
         if(_loc2_ >= 0)
         {
            pushBackLoadedStage(param1);
            return param1;
         }
         m_loadedStages.unshift(param1);
         if(!Main.LOCALHOST && m_loadedStages.length > 5 || Main.LOCALHOST && m_loadedStages.length > 2)
         {
            return m_loadedStages.pop().unload();
         }
         return null;
      }
      
      public static function get DebugField() : TextField
      {
         return m_debugField;
      }
      
      public static function get RootIsLoaded() : Boolean
      {
         return m_rootIsLoaded;
      }
      
      public static function set RootIsLoaded(param1:Boolean) : void
      {
         m_rootIsLoaded = param1;
      }
      
      public static function get Width() : Number
      {
         return m_width;
      }
      
      public static function get Height() : Number
      {
         return m_height;
      }
      
      public static function get DEBUG() : Boolean
      {
         return DEBUGCONST && !FORCEDEBUGOFF;
      }
      
      public static function get RandCharList() : Vector.<CharacterData>
      {
         return m_randCharList;
      }
      
      public static function turnOffDebug() : void
      {
         FORCEDEBUGOFF = false;
      }
      
      public static function getExpansionCharacter(param1:int) : Vector.<Function>
      {
         return param1 >= 0 && param1 < m_expansionData.length && m_expansionData.length > 0?m_expansionData[param1]:null;
      }
      
      public static function getExpansionCharacterFunc(param1:int, param2:Number) : Function
      {
         return param1 >= 0 && param1 < m_expansionData.length && m_expansionData.length > 0 && param2 >= 0 && param2 < m_expansionData[param1].length?m_expansionData[param1][param2]:null;
      }
      
      public static function getNextExpansionCharacter(param1:Number) : Number
      {
         param1 = param1 + 1;
         if(param1 >= m_expansionData.length)
         {
            param1 = 0;
         }
         return param1;
      }
      
      public static function getPrevExpansionCharacter(param1:Number) : Number
      {
         param1 = param1 - 1;
         if(param1 < 0)
         {
            param1 = m_expansionData.length - 1;
         }
         return param1;
      }
      
      public static function translateExpansionNumber(param1:Number) : Number
      {
         var _loc5_:Number = NaN;
         trace("UNWANTED CALL ON translateExpansionNumber()");
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         while(_loc4_ < m_expansionData.length && _loc3_ != param1)
         {
            _loc5_ = 0;
            while(_loc5_ < m_expansionData[_loc4_].length && _loc3_ != param1)
            {
               _loc3_++;
               _loc5_++;
            }
            _loc2_++;
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function translateExpansionID(param1:Number) : Number
      {
         var _loc4_:Number = NaN;
         trace("UNWANTED CALL ON translateExpansionID()");
         var _loc2_:Number = -1;
         var _loc3_:Number = 0;
         while(_loc3_ <= param1)
         {
            if(_loc3_ == param1)
            {
               _loc2_++;
            }
            else
            {
               _loc4_ = 0;
               while(_loc4_ < m_expansionData[_loc3_].length)
               {
                  _loc2_++;
                  _loc4_++;
               }
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function get TotalExpansions() : Number
      {
         return m_expansionData.length;
      }
      
      public static function get GuidString() : String
      {
         m_guidID = m_guidID + 1;
         return "guid" + m_guidID;
      }
      
      private function onRootLoadProgress(param1:ProgressEvent) : void
      {
         var _loc2_:int = param1.bytesTotal == 0?int(706780):int(param1.bytesTotal);
         var _loc3_:Number = param1.bytesLoaded / _loc2_ * 100;
         Main.preloader.percentage = _loc3_;
         Main.preloader.pCent.text = Math.round(_loc3_ * (1 / 20));
         Main.preloader.progressBar.scaleX = _loc3_ / 100 * (1 / 20);
      }
      
      protected function onRootLoadComplete(param1:Event) : void
      {
         Main.RootIsLoaded = true;
         ROOT.loaderInfo.removeEventListener(ProgressEvent.PROGRESS,ROOT.onRootLoadProgress);
         ROOT.loaderInfo.removeEventListener(Event.COMPLETE,ROOT.onRootLoadComplete);
         Main.loadResources(Main.getSSF2GlobalFileList());
      }
      
      private function resizeListener(param1:Event) : void
      {
         trace("resized");
      }
      
      function frame1() : *
      {
      }
   }
}
