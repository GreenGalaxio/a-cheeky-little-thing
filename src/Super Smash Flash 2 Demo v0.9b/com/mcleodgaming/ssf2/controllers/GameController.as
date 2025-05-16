package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.engine.HitBoxAnimation;
   import com.mcleodgaming.ssf2.engine.HitBoxManager;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.StageSetting;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.enums.ModeFeatures;
   import com.mcleodgaming.ssf2.hazards.BirdoHazard;
   import com.mcleodgaming.ssf2.hazards.BombFactoryHazard;
   import com.mcleodgaming.ssf2.hazards.BowsersCastleEmbers;
   import com.mcleodgaming.ssf2.hazards.BowsersCastleLavaHazard;
   import com.mcleodgaming.ssf2.hazards.CastleSiegeHazard;
   import com.mcleodgaming.ssf2.hazards.CastleWilyHazard;
   import com.mcleodgaming.ssf2.hazards.CentralHighwayHazard;
   import com.mcleodgaming.ssf2.hazards.ChaosShrineHazard;
   import com.mcleodgaming.ssf2.hazards.ClockTownHazards;
   import com.mcleodgaming.ssf2.hazards.ClockTownRain;
   import com.mcleodgaming.ssf2.hazards.CrateriaRain;
   import com.mcleodgaming.ssf2.hazards.DistantPlanetHazard;
   import com.mcleodgaming.ssf2.hazards.EmeraldCaveHazard;
   import com.mcleodgaming.ssf2.hazards.FoursideHazard;
   import com.mcleodgaming.ssf2.hazards.GalaxyTours;
   import com.mcleodgaming.ssf2.hazards.GangplankGalleonHazard;
   import com.mcleodgaming.ssf2.hazards.GangplankWater;
   import com.mcleodgaming.ssf2.hazards.GreenHillZoneHazard;
   import com.mcleodgaming.ssf2.hazards.LunarCoreHazard;
   import com.mcleodgaming.ssf2.hazards.MK3Hazard;
   import com.mcleodgaming.ssf2.hazards.MrSaturnHazard;
   import com.mcleodgaming.ssf2.hazards.NamekWater;
   import com.mcleodgaming.ssf2.hazards.Nintendo3DSHazard;
   import com.mcleodgaming.ssf2.hazards.PeachsCastleHazard;
   import com.mcleodgaming.ssf2.hazards.Phase8Hazard;
   import com.mcleodgaming.ssf2.hazards.RainbowRouteHazard;
   import com.mcleodgaming.ssf2.hazards.SMISnow;
   import com.mcleodgaming.ssf2.hazards.SectorZHazard;
   import com.mcleodgaming.ssf2.hazards.SmashvilleHazard;
   import com.mcleodgaming.ssf2.hazards.ThwompHazard;
   import com.mcleodgaming.ssf2.hazards.TwilightTownHazard;
   import com.mcleodgaming.ssf2.hazards.WarioWareHazard;
   import com.mcleodgaming.ssf2.hazards.Whispy;
   import com.mcleodgaming.ssf2.hazards.YggdrasilHazard;
   import com.mcleodgaming.ssf2.hazards.YoshisIslandHazard;
   import com.mcleodgaming.ssf2.hazards.YoshisStoryHazard;
   import com.mcleodgaming.ssf2.items.ItemsListData;
   import com.mcleodgaming.ssf2.menus.ConstantDebuggerMenu;
   import com.mcleodgaming.ssf2.menus.HudMenu;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.display.StageQuality;
   import flash.events.Event;
   
   public class GameController
   {
      
      public static var stageData:StageData;
      
      public static var tmpStageData:StageData;
      
      public static var currentGame:Game;
      
      public static var onlineModeMatchSettings:Object;
      
      public static var tmpGame:Game;
      
      public static var weather:MovieClip;
      
      public static var tags:MovieClip;
      
      public static var hud:HudMenu;
      
      public static var constantDebugger:ConstantDebuggerMenu;
      
      public static var stage:MovieClip;
      
      public static var background:MovieClip;
      
      public static var stageMusic:String;
      
      public static var loopLoc:Number;
      
      public static var cameraParameters:Object;
      
      public static var isStarted:Boolean;
      
      private static var matchStarted:Boolean;
      
      private static var m_prepped:Boolean = false;
      
      {
         init();
      }
      
      public function GameController()
      {
         super();
      }
      
      public static function init() : void
      {
         weather = null;
         tags = null;
         hud = null;
         constantDebugger = null;
         stage = null;
         background = null;
         stageMusic = null;
         loopLoc = 0;
         cameraParameters = null;
         matchStarted = false;
      }
      
      private static function setupRandomCostumes() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < currentGame.PlayerSettings.length)
         {
            if(!currentGame.SuddenDeath && !currentGame.LevelData.teams && currentGame.PlayerSettings[_loc1_].character == "rand_mc" || currentGame.GameMode == Mode.TRAINING && (!currentGame.PlayerSettings[_loc1_].exist || !currentGame.PlayerSettings[_loc1_].character))
            {
               _loc2_ = 0;
               _loc3_ = new Array();
               _loc4_ = false;
               _loc5_ = 0;
               _loc5_ = 0;
               while(_loc5_ < currentGame.PlayerSettings.length)
               {
                  if(currentGame.PlayerSettings[_loc5_].exist && currentGame.PlayerSettings[_loc5_].character && currentGame.PlayerSettings[_loc5_].costume == -1 && _loc5_ != _loc1_)
                  {
                     _loc4_ = true;
                  }
                  _loc5_++;
               }
               if(!_loc4_)
               {
                  _loc3_.push(-1);
               }
               while(Main.getCostume(Main.RandCharList[_loc1_].StatsName,null,_loc2_) != null)
               {
                  _loc4_ = false;
                  _loc5_ = 0;
                  while(_loc5_ < currentGame.PlayerSettings.length)
                  {
                     if(currentGame.PlayerSettings[_loc5_].exist && currentGame.PlayerSettings[_loc5_].character && currentGame.PlayerSettings[_loc5_].costume == _loc2_ && _loc5_ != _loc1_)
                     {
                        _loc4_ = true;
                     }
                     _loc5_++;
                  }
                  if(!_loc4_)
                  {
                     _loc3_.push(_loc2_);
                  }
                  _loc2_++;
               }
               currentGame.PlayerSettings[_loc1_].costume = _loc3_[Utils.randomInteger(0,_loc3_.length - 1)];
            }
            else
            {
               Utils.random();
            }
            _loc1_++;
         }
      }
      
      public static function startMatch() : void
      {
         if(!matchStarted)
         {
            Main.Root.visible = false;
            matchStarted = true;
            weather = new MovieClip();
            tags = new MovieClip();
            background = new MovieClip();
            hud = new HudMenu();
            constantDebugger = new ConstantDebuggerMenu();
            if(Main.DEBUG)
            {
               hud.Container.addChild(constantDebugger.Container);
            }
            stage = Main.getLibraryMC(StageSetting.CurrentID == "xpstage"?"xpstage":"stage_" + StageSetting.CurrentID);
            stage.name = "stageMC";
            Main.Root.addChild(background);
            Main.Root.addChild(stage);
            Main.Root.addChild(tags);
            Main.Root.addChild(weather);
            Main.Root.addChild(hud.Container);
            stageMusic = Main.getLoadedStage(StageSetting.CurrentID).MC.stageMusic;
            loopLoc = Main.getLoadedStage(StageSetting.CurrentID).MC.loopLoc;
            cameraParameters = Main.getLoadedStage(StageSetting.CurrentID).MC.cameraParameters;
            prepOtherHitBoxStuff();
            Main.Root.stage.addEventListener(Event.RENDER,actuallyStartMatch);
            Main.Root.stage.invalidate();
         }
      }
      
      public static function prepOtherHitBoxStuff() : void
      {
         if(m_prepped)
         {
            return;
         }
         m_prepped = true;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:Vector.<String> = new Vector.<String>();
         _loc1_ = 0;
         while(_loc1_ < ItemsListData.DATA.length)
         {
            _loc4_.push(ItemsListData.DATA[_loc1_].linkage_id);
            _loc1_++;
         }
         _loc4_.push("angrycucco");
         _loc4_.push("angrycucco_gold");
         _loc4_.push("birdo");
         _loc4_.push("bm_bomb");
         _loc4_.push("bm_wolf");
         _loc4_.push("bm_ogre");
         _loc4_.push("gangplankkannonball");
         _loc4_.push("met");
         _loc4_.push("pipi");
         _loc4_.push("whispywind");
         _loc4_.push("yggdrasil");
         _loc4_.push("thwomp_mc");
         _loc4_.push("sniperjoe");
         _loc4_.push("batton");
         _loc4_.push("warioware_rope");
         _loc4_.push("warioware_tree");
         _loc4_.push("warioware_car");
         _loc4_.push("warioware_apple");
         _loc4_.push("warioware_foot");
         _loc4_.push("warioware_ball");
         _loc4_.push("phase8risinglava");
         _loc4_.push("phase8fallinglava");
         _loc4_.push("ecave_wood");
         _loc4_.push("bombfactory_block");
         _loc4_.push("bombFactoryExplosion");
         _loc4_.push("bitProjectile");
         _loc4_.push("tingle");
         _loc4_.push("bowserscastle_lava");
         _loc4_.push("distantPlanetWater");
         _loc4_.push("ecave_wood");
         _loc4_.push("flyGuy");
         _loc4_.push("konohalanturn");
         _loc4_.push("mk3Brick");
         _loc4_.push("pSwitch");
         _loc4_.push("buttonBrick");
         _loc4_.push("peachCastleButton");
         _loc4_.push("tetrisPiece");
         _loc4_.push("questioncloud");
         _loc4_.push("sectorz_gun");
         _loc4_.push("lunarLaser");
         _loc4_.push("rayEnemy");
         _loc4_.push("chatot");
         _loc4_.push("charizard");
         _loc4_.push("chikorita");
         _loc4_.push("delibird");
         _loc4_.push("electrode");
         _loc4_.push("gligar");
         _loc4_.push("hitmonlee");
         _loc4_.push("koffing");
         _loc4_.push("magikarp");
         _loc4_.push("missingno");
         _loc4_.push("plusleminun");
         _loc4_.push("shroomish");
         _loc4_.push("snorlax");
         _loc4_.push("victini");
         _loc4_.push("amigo");
         _loc4_.push("bandanadee");
         _loc4_.push("krillin");
         _loc4_.push("lakitu");
         _loc4_.push("metroid");
         _loc4_.push("pacman");
         _loc4_.push("protoman");
         _loc4_.push("renjiassist");
         _loc4_.push("silver");
         _loc4_.push("starfy");
         _loc4_.push("yagamilight");
         _loc4_.push("birdo_egg");
         _loc4_.push("pipi_egg");
         _loc4_.push("yggdrasil_holylance_proj");
         _loc4_.push("sniperjoe_shot");
         _loc4_.push("Chatot_Effect");
         _loc4_.push("chikorita_leaf");
         _loc4_.push("delibird_bomb");
         _loc4_.push("smokecloud");
         _loc4_.push("destructodisc");
         _loc4_.push("protoman_shot");
         _loc4_.push("protoman_chargeblast");
         _loc4_.push("protoman_shot");
         var _loc5_:Vector.<String> = new Vector.<String>();
         _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            if(!HitBoxManager.HitBoxManageList[_loc4_[_loc2_]])
            {
               _loc3_ = Main.getLibraryMC(_loc4_[_loc2_]);
               if(_loc3_)
               {
                  _loc1_ = 0;
                  while(_loc1_ < _loc3_.totalFrames)
                  {
                     _loc3_.gotoAndStop(_loc1_ + 1);
                     if(_loc3_.stance)
                     {
                        Utils.removeActionScript(_loc3_.stance);
                        HitBoxAnimation.createHitBoxAnimation(_loc4_[_loc2_] + "_" + _loc3_.currentLabel,_loc3_.stance,_loc3_);
                     }
                     _loc1_++;
                  }
                  _loc3_ = null;
               }
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            if(!HitBoxAnimation.AnimationsList[_loc5_[_loc2_]])
            {
               _loc3_ = Main.getLibraryMC(_loc5_[_loc2_]);
               if(_loc3_)
               {
                  HitBoxAnimation.createHitBoxAnimation(_loc5_[_loc2_],_loc3_,_loc3_);
                  _loc3_ = null;
               }
            }
            _loc2_++;
         }
      }
      
      private static function actuallyStartMatch(param1:Event) : void
      {
         var _loc2_:int = 0;
         Main.Root.stage.removeEventListener(Event.RENDER,actuallyStartMatch);
         var _loc3_:String = Main.Root.stage.quality;
         Main.Root.stage.quality = StageQuality.BEST;
         if(ModeFeatures.hasFeature(ModeFeatures.MULTIPLAYER_MANAGER,GameController.currentGame.GameMode) && !GameController.currentGame.SuddenDeath)
         {
            _loc2_ = 0;
            while(_loc2_ < GameController.currentGame.PlayerSettings.length)
            {
               if(MultiplayerManager.RoomData.matchSettings.playerData["player" + (_loc2_ + 1)])
               {
                  GameController.currentGame.PlayerSettings[_loc2_].init();
                  GameController.currentGame.PlayerSettings[_loc2_].importSettings(MultiplayerManager.RoomData.matchSettings.playerData["player" + (_loc2_ + 1)]);
               }
               else
               {
                  GameController.currentGame.PlayerSettings[_loc2_].init();
               }
               _loc2_++;
            }
            GameController.currentGame.LevelData.importSettings(MultiplayerManager.RoomData.matchSettings.levelData);
            GameController.currentGame.Items.importSettings(MultiplayerManager.RoomData.matchSettings.items);
            GameController.currentGame.setStageSettings(StageSetting.getStageByID(MultiplayerManager.RoomData.matchSettings.stageID));
         }
         Utils.setRandSeed(currentGame.LevelData.randSeed);
         Utils.shuffleRandom();
         Main.prepRandomCharacters();
         if(GameController.currentGame.GameMode === Mode.ONLINE_WAITING_ROOM && GameController.currentGame.PlayerSettings[0].character == "rand_mc")
         {
            Main.RandCharList[0] = Main.RandCharList[MultiplayerManager.PlayerID - 1];
         }
         GameController.setupRandomCostumes();
         GameController.stageData = new StageData(SaveData.Controller1,SaveData.Controller2,SaveData.Controller3,SaveData.Controller4,Main.Root,stage,hud.SubMenu,cameraParameters,GameController.currentGame,SoundQueue.instance,stageMusic,loopLoc);
         hud.makeEvents();
         constantDebugger.makeEvents();
         if(StageSetting.CurrentID == "dreamland")
         {
            GameController.stageData.addHazard(new Whispy(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "mushroomkingdom2")
         {
            GameController.stageData.addHazard(new BirdoHazard(30 * 15,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "galaxytours")
         {
            GameController.stageData.addHazard(new GalaxyTours(0,GameController.stageData,1));
         }
         else if(StageSetting.CurrentID == "castlewily")
         {
            GameController.stageData.addHazard(new CastleWilyHazard(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "towerofsalvation")
         {
            GameController.stageData.addHazard(new YggdrasilHazard(1,GameController.stageData,1));
         }
         else if(StageSetting.CurrentID == "saturnvalley")
         {
            GameController.stageData.addHazard(new MrSaturnHazard(30 * 20,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "planetnamek")
         {
            GameController.stageData.addHazard(new NamekWater(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "chaosshrine")
         {
            GameController.stageData.addHazard(new ChaosShrineHazard(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "shadowmosesisland")
         {
            GameController.stageData.addHazard(new SMISnow(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "crateria")
         {
            GameController.stageData.addHazard(new CrateriaRain(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "clocktown")
         {
            GameController.stageData.addHazard(new ClockTownRain(1,GameController.stageData));
            GameController.stageData.addHazard(new ClockTownHazards(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "gangplankgalleon")
         {
            GameController.stageData.addHazard(new GangplankGalleonHazard(1,GameController.stageData));
            GameController.stageData.addHazard(new GangplankWater(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "bowserscastle")
         {
            GameController.stageData.addHazard(new BowsersCastleEmbers(1,GameController.stageData));
            GameController.stageData.addHazard(new ThwompHazard(1,GameController.stageData));
            GameController.stageData.addHazard(new BowsersCastleLavaHazard(1,GameController.stageData,1));
         }
         else if(StageSetting.CurrentID == "rainbowroute")
         {
            GameController.stageData.addHazard(new RainbowRouteHazard(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "centralhighway")
         {
            GameController.stageData.addHazard(new CentralHighwayHazard(1,GameController.stageData,1));
         }
         else if(StageSetting.CurrentID == "warioware")
         {
            GameController.stageData.addHazard(new WarioWareHazard(1,GameController.stageData,1));
         }
         else if(StageSetting.CurrentID == "nintendo3ds")
         {
            GameController.stageData.addHazard(new Nintendo3DSHazard(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "emeraldcave")
         {
            GameController.stageData.addHazard(new EmeraldCaveHazard(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "phase8")
         {
            GameController.stageData.addHazard(new Phase8Hazard(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "bombfactory")
         {
            GameController.stageData.addHazard(new BombFactoryHazard(30 * 1.5,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "yoshisisland")
         {
            GameController.stageData.addHazard(new YoshisIslandHazard(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "yoshisstory")
         {
            GameController.stageData.addHazard(new YoshisStoryHazard(30 * 30,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "fourside")
         {
            GameController.stageData.addHazard(new FoursideHazard(30 * 60,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "sectorz")
         {
            GameController.stageData.addHazard(new SectorZHazard(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "castlesiege")
         {
            GameController.stageData.addHazard(new CastleSiegeHazard(0,GameController.stageData,1));
         }
         else if(StageSetting.CurrentID == "distantplanet")
         {
            GameController.stageData.addHazard(new DistantPlanetHazard(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "greenhillzone")
         {
            GameController.stageData.addHazard(new GreenHillZoneHazard(1,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "mushroomkingdom3")
         {
            GameController.stageData.addHazard(new MK3Hazard(30 * 30,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "smashville")
         {
            GameController.stageData.addHazard(new SmashvilleHazard(30 * 20,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "peachscastle")
         {
            GameController.stageData.addHazard(new PeachsCastleHazard(30 * 25,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "lunarcore")
         {
            GameController.stageData.addHazard(new LunarCoreHazard(30 * 32,GameController.stageData));
         }
         else if(StageSetting.CurrentID == "twilighttown")
         {
            GameController.stageData.addHazard(new TwilightTownHazard(1,GameController.stageData));
         }
         Main.Root.stage.quality = _loc3_;
         GameController.stageData.startGame();
      }
      
      public static function endMatch() : void
      {
         if(matchStarted)
         {
            GameController.stageData.CamRef.die();
            weather.parent.removeChild(weather);
            tags.parent.removeChild(tags);
            stage.parent.removeChild(stage);
            background.parent.removeChild(background);
            hud.removeSelf();
            constantDebugger.killEvents();
            init();
            trace("Game graphics and stage data disposed");
         }
      }
      
      public static function destroyStageData() : void
      {
         GameController.stageData = null;
         SoundQueue.instance.stopMusic();
         SoundQueue.instance.setLoopFunction(SoundQueue.instance.loopMusic);
      }
   }
}
