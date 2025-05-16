package com.mcleodgaming.ssf2.engine
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2.util.Vcam;
    import com.mcleodgaming.ssf2.controllers.Game;
    import com.mcleodgaming.ssf2.audio.SoundQueue;
    import __AS3__.vec.Vector;
    import com.mcleodgaming.ssf2.util.Controller;
    import com.mcleodgaming.ssf2.platforms.Platform;
    import com.mcleodgaming.ssf2.platforms.MovingPlatform;
    import com.mcleodgaming.ssf2.platforms.CollisionBoundary;
    import com.mcleodgaming.ssf2.events.EventManager;
    import com.mcleodgaming.ssf2.util.FrameTimer;
    import flash.utils.Timer;
    import com.mcleodgaming.ssf2.util.Debug_fps;
    import com.mcleodgaming.ssf2.enemies.Enemy;
    import com.mcleodgaming.ssf2.hazards.StageHazard;
    import com.mcleodgaming.ssf2.audio.SoundObject;
    import com.mcleodgaming.ssf2.util.Dictionary;
    import com.mcleodgaming.ssf2.util.Utils;
    import com.mcleodgaming.ssf2.enums.ModeFeatures;
    import com.mcleodgaming.ssf2.net.MultiplayerManager;
    import flash.events.TimerEvent;
    import com.mcleodgaming.ssf2.controllers.GameController;
    import com.mcleodgaming.ssf2.Main;
    import com.mcleodgaming.ssf2.util.SaveData;
    import flash.utils.getTimer;
    import com.mcleodgaming.ssf2.enums.Mode;
    import com.mcleodgaming.ssf2.pokemon.Gligar;
    import com.mcleodgaming.ssf2.pokemon.Hitmonlee;
    import com.mcleodgaming.ssf2.pokemon.Chikorita;
    import com.mcleodgaming.ssf2.pokemon.Koffing;
    import com.mcleodgaming.ssf2.pokemon.Charizard;
    import com.mcleodgaming.ssf2.pokemon.Delibird;
    import com.mcleodgaming.ssf2.pokemon.Magikarp;
    import com.mcleodgaming.ssf2.pokemon.Electrode;
    import com.mcleodgaming.ssf2.pokemon.Shroomish;
    import com.mcleodgaming.ssf2.pokemon.Snorlax;
    import com.mcleodgaming.ssf2.pokemon.Chatot;
    import com.mcleodgaming.ssf2.pokemon.Missingno;
    import com.mcleodgaming.ssf2.pokemon.Victini;
    import com.mcleodgaming.ssf2.assists.BandanaDee;
    import com.mcleodgaming.ssf2.assists.Amigo;
    import com.mcleodgaming.ssf2.assists.Starfy;
    import com.mcleodgaming.ssf2.assists.Protoman;
    import com.mcleodgaming.ssf2.assists.Metroid;
    import com.mcleodgaming.ssf2.assists.PacMan;
    import com.mcleodgaming.ssf2.assists.RenjiAssist;
    import com.mcleodgaming.ssf2.assists.Krillin;
    import com.mcleodgaming.ssf2.assists.Lakitu;
    import com.mcleodgaming.ssf2.assists.Silver;
    import com.mcleodgaming.ssf2.assists.YagamiLight;
    import flash.events.Event;
    import com.adobe.serialization.json.JSON;
    import flash.geom.Point;
    import com.mcleodgaming.ssf2.enums.SpecialMode;
    import com.mcleodgaming.ssf2.controllers.EventMatchController;
    import flash.media.Sound;
    import com.mcleodgaming.ssf2.controllers.UnlockController;
    import com.mcleodgaming.ssf2.controllers.MenuController;
    import com.mcleodgaming.ssf2.enums.CState;
    import com.mcleodgaming.ssf2.events.SSF2Event;
    import com.mcleodgaming.ssf2.items.Item;
    import com.mcleodgaming.ssf2.pokemon.Pokemon;
    import com.mcleodgaming.ssf2.assists.AssistTrophy;
    import com.mcleodgaming.ssf2.controllers.MatchResults;
    import com.mcleodgaming.ssf2.util.*;
    import com.mcleodgaming.ssf2.enums.*;
    import com.adobe.images.*;
    import com.mcleodgaming.ssf2.assists.*;
    import com.mcleodgaming.ssf2.audio.*;
    import com.mcleodgaming.ssf2.enemies.*;
    import com.mcleodgaming.ssf2.controllers.*;
    import com.mcleodgaming.ssf2.hazards.*;
    import com.mcleodgaming.ssf2.items.*;
    import com.mcleodgaming.ssf2.menus.*;
    import com.mcleodgaming.ssf2.net.*;
    import com.mcleodgaming.ssf2.platforms.*;
    import com.mcleodgaming.ssf2.pokemon.*;
	import com.mcleodgaming.ssf2.util.Disposable;
    import __AS3__.vec.*;

    public class StageData 
    {

        private var EFFECT_LIMIT:int = 60;
        private var EFFECT_LIMIT_SECONDARY:int = 10;
        private var ROOT:MovieClip;
        private var STAGE:MovieClip;
        private var STAGEPARENT:MovieClip;
        private var STAGEEFFECTS:MovieClip;
        private var WEATHER:MovieClip;
        private var WEATHERMASK:MovieClip;
        private var TAGS:MovieClip;
        private var SHADOWS:MovieClip;
        private var SHADOWMASK:MovieClip;
        private var LIGHTSOURCE:MovieClip;
        private var HUD:MovieClip;
        private var HUDFOREGROUND:MovieClip;
        private var HUDOVERLAY:MovieClip;
        private var CAM:Vcam;
        private var ITEMS:ItemGenerator;
        private var GAME:Game;
        private var SOUNDQUEUE:SoundQueue;
        private var TIMER:GameTimer;
        private var CONTROLLERS:Vector.<Controller>;
        private var CAMBOUNDS:MovieClip;
        private var SMASHBALLBOUNDS:MovieClip;
        private var DEATHBOUNDS:MovieClip;
        private var TERRAINS:Vector.<Platform>;
        private var PLATFORMS:Vector.<Platform>;
        private var MOVINGPLATFORMS:Vector.<MovingPlatform>;
        private var TARGETS:Vector.<TargetTestTarget>;
        private var ITEMGENS:Vector.<MovieClip>;
        private var WARNINGBOUNDS_UL:Vector.<CollisionBoundary>;
        private var WARNINGBOUNDS_UR:Vector.<CollisionBoundary>;
        private var WARNINGBOUNDS_LL:Vector.<CollisionBoundary>;
        private var WARNINGBOUNDS_LR:Vector.<CollisionBoundary>;
        private var LEDGES_L:Vector.<MovieClip>;
        private var LEDGES_R:Vector.<MovieClip>;
        private var WALLS:Vector.<CollisionBoundary>;
        private var BEACONS:Vector.<Beacon>;
        private var ADJMATRIX:Array;
        private var m_eventManager:EventManager;
        private var m_timerEvents:Vector.<Object>;
        private var READY:Boolean;
        private var ONLINEMODE:Boolean;
        private var REPLAYMODE:Boolean;
        private var m_countdownTimer:MovieClip;
        private var m_onlineFrameBuffer:FrameTimer;
        private var m_onlineReadyResendTimer:FrameTimer;
        private var m_onlineReadyErrorTimer:FrameTimer;
        private var m_onlineTimeout:Timer;
        private var m_activeScripts:Boolean;
        private var m_fpsTimer:Debug_fps;
        private var m_noContest:Boolean;
        private var m_playerIDs:Vector.<int>;
        private var m_pokemonCount:int;
        private var m_assistCount:int;
        private var m_cuccoCount:int;
        private var m_entranceZoomTimer:FrameTimer;
        private var m_entranceZoomMode:int;
        private var m_currentEntrance:int;
        private var m_meleeAirDodge:Boolean;
        private var m_paused:Boolean;
        private var m_pausedLetGo:Boolean;
        private var m_paused_id:int;
        private var m_fsCutscene:Boolean;
        private var m_hazardsOn:Boolean;
        private var m_justPaused:Boolean;
        private var m_event:Boolean;
        private var m_music:String;
        private var m_loopLoc:Number;
        private var PLAYERS:Vector.<Character>;
        private var ENEMY:Vector.<Enemy>;
        private var PROJECTILES:Vector.<Projectile>;
        private var HAZARDS:Vector.<StageHazard>;
        private var m_effectList:Vector.<MovieClip>;
        private var m_effectIndex:int;
        private var m_effectOverlayList:Vector.<MovieClip>;
        private var m_effectOverlayIndex:int;
        private var m_effectHUDList:Vector.<MovieClip>;
        private var m_effectHUDIndex:int;
        private var m_effectHUDOverlayList:Vector.<MovieClip>;
        private var m_effectHUDOverlayIndex:int;
        private var m_effectBGList:Vector.<MovieClip>;
        private var m_effectBGIndex:int;
        private var m_effectWeatherList:Vector.<MovieClip>;
        private var m_effectWeatherIndex:int;
        private var m_wasReset:Boolean;
        private var m_remainingTargets:int;
        private var m_gravityMultiplier:Number;
        private var m_disableCeilingDeath:Boolean;
        private var m_disableFallDeath:Boolean;
        private var m_freezeKeys:Boolean;
        private var m_endGameTimer:FrameTimer;
        private var m_canSuddenDeath:Boolean;
        private var m_suddenDeath:Boolean;
        private var m_suddenDeathIDs:Array;
        private var m_gameEnded:Boolean;
        private var m_slowFrameRate:Boolean;
        private var m_endTrigger:Boolean;
        private var m_nullPlayers:Array;
        private var m_crowdChantDelay:FrameTimer;
        private var m_crowdChantTimer:FrameTimer;
        private var m_crowdChantID:int;
        private var m_crowdChantSound:SoundObject;
        protected var m_pokemon:Vector.<Class>;
        protected var m_assists:Vector.<Class>;
        protected var m_pokemonRare:Vector.<Class>;
        protected var m_assistsRare:Vector.<Class>;
        protected var m_narratorSpeech:SoundObject;
        private var m_startDelayTimer:FrameTimer;
        private var m_startTime:int;
        private var m_endTime:int;
        private var m_elapsedFrames:int;
        private var m_soundMemory:Dictionary;
        private var m_replayData:ReplayData;
        private var m_logging:Boolean;
        private var m_logText:String;

        public function StageData(_arg_1:Controller, _arg_2:Controller, _arg_3:Controller, _arg_4:Controller, _arg_5:MovieClip, _arg_6:MovieClip, _arg_7:MovieClip, _arg_8:Object, _arg_9:Game, _arg_10:SoundQueue, _arg_11:String, _arg_12:Number)
        {
            var _local_16:int;
            var _local_17:String;
            var _local_18:int;
            var _local_19:int;
            super();
            SSF2API_Interface.init(this);
            Utils.resetUID();
            var _local_13:int;
            this.m_wasReset = false;
            this.m_startDelayTimer = new FrameTimer(2);
            this.GAME = _arg_9;
            this.m_canSuddenDeath = (!(this.GAME.SuddenDeath));
            this.m_suddenDeath = false;
            this.m_suddenDeathIDs = null;
            this.m_playerIDs = new Vector.<int>();
            this.ONLINEMODE = Boolean(ModeFeatures.hasFeature(ModeFeatures.MULTIPLAYER_MANAGER, this.GAME.GameMode));
            MultiplayerManager.INPUT_BUFFER = MultiplayerManager.INPUT_BUFFER_START;
            this.m_onlineFrameBuffer = new FrameTimer(MultiplayerManager.INPUT_BUFFER);
            this.m_onlineReadyResendTimer = new FrameTimer((30 * 10));
            this.m_onlineReadyErrorTimer = new FrameTimer((30 * 60));
            this.m_onlineTimeout = new Timer(10000, 1);
            this.m_onlineTimeout.addEventListener(TimerEvent.TIMER_COMPLETE, this.onlineModeTimeout);
            this.m_effectList = new Vector.<MovieClip>();
            this.m_effectOverlayList = new Vector.<MovieClip>();
            this.m_effectHUDList = new Vector.<MovieClip>();
            this.m_effectHUDOverlayList = new Vector.<MovieClip>();
            this.m_effectBGList = new Vector.<MovieClip>();
            this.m_effectWeatherList = new Vector.<MovieClip>();
            _local_13 = 0;
            while (_local_13 < this.EFFECT_LIMIT)
            {
                this.m_effectList.push(null);
                this.m_effectOverlayList.push(null);
                this.m_effectHUDList.push(null);
                this.m_effectHUDOverlayList.push(null);
                this.m_effectBGList.push(null);
                this.m_effectWeatherList.push(null);
                _local_13++;
            };
            this.m_effectIndex = 0;
            this.m_effectOverlayIndex = 0;
            this.m_effectHUDIndex = 0;
            this.m_effectHUDIndex = 0;
            this.m_effectBGIndex = 0;
            this.m_effectWeatherIndex = 0;
            this.m_soundMemory = new Dictionary(String);
            this.m_replayData = new ReplayData();
            if (((!(this.GAME.ReplayDataObj)) && (ModeFeatures.hasFeature(ModeFeatures.ALLOW_REPLAY_RECORD, this.GAME.GameMode))))
            {
                this.REPLAYMODE = false;
                if (this.GAME.SuddenDeath)
                {
                    this.m_replayData = GameController.tmpStageData.ReplayDataObj;
                }
                else
                {
                    this.m_replayData.StageID = this.GAME.CurrentStageSettings.ID;
                    this.m_replayData.MatchSettings = this.GAME.LevelData.exportSettings();
                    this.m_replayData.ItemSettingsObj = this.GAME.Items.exportSettings();
                    this.m_replayData.GameMode = this.GAME.GameMode;
                    _local_16 = 0;
                    while (_local_16 < this.GAME.PlayerSettings.length)
                    {
                        this.m_replayData.PlayerData[_local_16] = this.GAME.PlayerSettings[_local_16].exportSettings();
                        if (this.GAME.PlayerSettings[_local_16].character == "rand_mc")
                        {
                        };
                        _local_16++;
                    };
                };
            }
            else
            {
                if (((this.GAME.ReplayDataObj) && (ModeFeatures.hasFeature(ModeFeatures.ALLOW_REPLAY_RECORD, this.GAME.GameMode))))
                {
                    this.REPLAYMODE = true;
                    if (this.GAME.SuddenDeath)
                    {
                        this.m_replayData = GameController.tmpStageData.ReplayDataObj;
                    }
                    else
                    {
                        this.m_replayData.importReplay(this.GAME.ReplayDataObj.exportReplay());
                        this.m_replayData.resetPointers();
                    };
                };
            };
            if (this.GAME.SuddenDeath)
            {
                Utils.shuffleRandom();
            };
            if (ModeFeatures.hasFeature(ModeFeatures.FORCE_NO_TEAM_DAMAGE, this.GAME.GameMode))
            {
                this.GAME.LevelData.teamDamage = false;
            };
            if (ModeFeatures.hasFeature(ModeFeatures.FILL_PLAYER_SLOTS, this.GAME.GameMode))
            {
                _local_13 = 0;
                while (_local_13 < Main.MAXPLAYERS)
                {
                    this.m_playerIDs.push((_local_13 + 1));
                    _local_13++;
                };
            }
            else
            {
                _local_13 = 0;
                while (_local_13 < Main.MAXPLAYERS)
                {
                    if (((this.GAME.PlayerSettings[_local_13].exist) && (!(this.GAME.PlayerSettings[_local_13].character == null))))
                    {
                        this.m_playerIDs.push((_local_13 + 1));
                    };
                    _local_13++;
                };
            };
            this.m_hazardsOn = this.GAME.LevelData.hazards;
            this.READY = false;
            this.ROOT = _arg_5;
            this.STAGEPARENT = _arg_6;
            this.STAGE = _arg_6.terrain;
            this.HUD = _arg_7;
            this.HUDFOREGROUND = _arg_7.foreground;
            this.HUDOVERLAY = new MovieClip();
            _arg_7.addChild(this.HUDOVERLAY);
            this.WEATHER = GameController.weather;
            this.WEATHERMASK = ((this.STAGEPARENT.weatherMask) ? this.STAGEPARENT.weatherMask : null);
            if (this.WEATHERMASK)
            {
                this.WEATHER.mask = this.WEATHERMASK;
            };
            this.TAGS = GameController.tags;
            this.SHADOWS = new MovieClip();
            this.SHADOWS.x = this.STAGE.x;
            this.SHADOWS.y = this.STAGE.y;
            this.STAGEPARENT.addChildAt(this.SHADOWS, this.STAGEPARENT.getChildIndex(this.STAGE));
            this.SHADOWMASK = this.STAGEPARENT["shadowMask"];
            if (this.SHADOWMASK)
            {
                this.SHADOWS.mask = this.SHADOWMASK;
                this.SHADOWMASK.visible = false;
            };
            this.STAGEEFFECTS = MovieClip(this.STAGEPARENT.addChild(new MovieClip()));
            this.LIGHTSOURCE = null;
            this.SOUNDQUEUE = _arg_10;
            this.CONTROLLERS = new Vector.<Controller>();
            this.CONTROLLERS.push(_arg_1);
            this.CONTROLLERS.push(_arg_2);
            this.CONTROLLERS.push(_arg_3);
            this.CONTROLLERS.push(_arg_4);
            this.CONTROLLERS.push(_arg_4);
            this.CONTROLLERS.push(_arg_4);
            this.CONTROLLERS.push(_arg_4);
            this.CONTROLLERS.push(_arg_4);
            this.CAMBOUNDS = this.STAGE["camBoundary"];
            this.SMASHBALLBOUNDS = this.STAGE["smashBallBoundary"];
            this.DEATHBOUNDS = this.STAGE["deathBoundary"];
            _arg_8.linkage_id = ((this.ONLINEMODE) ? "vcam_mc" : "vcam_mc");
            _arg_8.terrain = "camBoundary";
            _arg_8.width_ = Main.Width;
            _arg_8.height_ = Main.Height;
            _arg_8.camEaseFactor = 5.6;
            _arg_8.camZoomFactor = 8;
            _arg_8.minZoomHeight = 0;
            if (ModeFeatures.hasFeature(ModeFeatures.FORCE_MINIMUM_ZOOM, this.GAME.GameMode))
            {
                _arg_8.minZoomHeight = 250;
            };
            this.CAM = new Vcam(_arg_8, this);
            this.TIMER = new GameTimer({
                "instanceName":"clock",
                "countdown":this.GAME.CountDown,
                "startAt":this.GAME.Time
            }, this);
            if (ModeFeatures.hasFeature(ModeFeatures.INVERTED_TIMER, this.GAME.GameMode))
            {
                this.TIMER.CountDown = false;
                this.TIMER.setCurrentTime(0);
            };
            if ((!(this.GAME.UsingTime)))
            {
                this.TIMER.TimeMC.visible = false;
            };
            this.TERRAINS = new Vector.<Platform>();
            this.PLATFORMS = new Vector.<Platform>();
            this.MOVINGPLATFORMS = new Vector.<MovingPlatform>();
            this.TARGETS = new Vector.<TargetTestTarget>();
            this.WARNINGBOUNDS_UL = new Vector.<CollisionBoundary>();
            this.WARNINGBOUNDS_UR = new Vector.<CollisionBoundary>();
            this.WARNINGBOUNDS_LL = new Vector.<CollisionBoundary>();
            this.WARNINGBOUNDS_LR = new Vector.<CollisionBoundary>();
            this.LEDGES_L = new Vector.<MovieClip>();
            this.LEDGES_R = new Vector.<MovieClip>();
            this.WALLS = new Vector.<CollisionBoundary>();
            this.BEACONS = new Vector.<Beacon>();
            this.PLAYERS = new Vector.<Character>();
            this.ENEMY = new Vector.<Enemy>();
            this.PROJECTILES = new Vector.<Projectile>();
            this.m_activeScripts = false;
            this.m_eventManager = new EventManager();
            this.m_timerEvents = new Vector.<Object>();
            this.m_entranceZoomTimer = new FrameTimer((15 * Main.MAXPLAYERS));
            this.m_entranceZoomMode = ((Utils.random() > 0.5) ? 1 : 2);
            this.m_currentEntrance = 1;
            this.m_meleeAirDodge = SaveData.MeleeAirDodge;
            this.m_narratorSpeech = null;
            this.HAZARDS = new Vector.<StageHazard>();
            this.m_endGameTimer = new FrameTimer(((ModeFeatures.hasFeature(ModeFeatures.EXTENDED_ENDTIMER, this.GAME.GameMode)) ? (32 * 4) : 32));
            this.m_gameEnded = false;
            this.m_slowFrameRate = false;
            this.m_endTrigger = false;
            this.m_music = _arg_11;
            this.m_loopLoc = _arg_12;
            this.m_noContest = false;
            this.m_freezeKeys = false;
            this.m_pokemonCount = 0;
            this.m_assistCount = 0;
            this.m_cuccoCount = 0;
            this.m_startTime = getTimer();
            this.m_endTime = this.m_startTime;
            this.m_elapsedFrames = 0;
            this.ITEMGENS = new Vector.<MovieClip>();
            this.findObjects(this.STAGE);
            if (this.STAGEPARENT.foreground)
            {
                this.findObjects(this.STAGEPARENT.foreground);
            };
            if (this.STAGEPARENT.background)
            {
                this.findObjects(this.STAGEPARENT.background);
            };
            this.createBeaconData();
            _local_13 = 0;
            while (_local_13 < this.MOVINGPLATFORMS.length)
            {
                this.MOVINGPLATFORMS[_local_13].findForegroundPieces();
                this.MOVINGPLATFORMS[_local_13].findLedges();
                _local_13++;
            };
            this.ITEMS = new ItemGenerator({
                "sizeRatio":this.GAME.SizeRatio,
                "frequency":((this.GAME.SuddenDeath) ? 0 : this.GAME.Items.frequency),
                "itemData":this.GAME.Items.items
            }, this);
            _local_13 = 0;
            while (_local_13 < Main.MAXPLAYERS)
            {
                this.PLAYERS.push(null);
                _local_13++;
            };
            this.HUD.gotoAndStop((this.GAME.TotalPlayers + "p"));
            this.m_pausedLetGo = true;
            this.m_paused = false;
            this.m_paused_id = 0;
            this.m_fsCutscene = false;
            this.m_justPaused = false;
            this.m_event = true;
            this.m_nullPlayers = new Array();
            if (ModeFeatures.hasFeature(ModeFeatures.FILL_PLAYER_SLOTS, this.GAME.GameMode))
            {
                _local_17 = null;
                _local_18 = -1;
                _local_19 = -1;
                _local_13 = 2;
                while (_local_13 <= Main.MAXPLAYERS)
                {
                    if (this.GAME.PlayerSettings[(_local_13 - 1)].character != null)
                    {
                        _local_17 = this.GAME.PlayerSettings[(_local_13 - 1)].character;
                        _local_18 = _local_13;
                        _local_19 = this.GAME.PlayerSettings[(_local_13 - 1)].expansion;
                        break;
                    };
                    _local_13++;
                };
                _local_13 = 2;
                while (_local_13 <= Main.MAXPLAYERS)
                {
                    if (this.GAME.PlayerSettings[(_local_13 - 1)].character == null)
                    {
                        this.GAME.PlayerSettings[(_local_13 - 1)].character = _local_17;
                        this.GAME.PlayerSettings[(_local_13 - 1)].expansion = _local_19;
                        Main.RandCharList[(_local_13 - 1)] = Main.RandCharList[(_local_18 - 1)];
                        this.m_nullPlayers.push((_local_13 - 1));
                    };
                    _local_13++;
                };
            };
            _local_13 = 1;
            while (_local_13 <= Main.MAXPLAYERS)
            {
                if (this.GAME.PlayerSettings[(_local_13 - 1)].character != null)
                {
                    this.makePlayer(_local_13);
                };
                _local_13++;
            };
            if (ModeFeatures.hasFeature(ModeFeatures.FORCE_NO_ITEM_AUTO_SPAWN, this.GAME.GameMode))
            {
                this.ItemsRef.setFrequency(0);
            };
            if (this.GAME.GameMode == Mode.TRAINING)
            {
                _local_13 = 1;
                while (_local_13 <= Main.MAXPLAYERS)
                {
                    if (this.getPlayer(_local_13))
                    {
                        if (_local_13 == 1)
                        {
                            this.getPlayer(_local_13).Team = 1;
                        }
                        else
                        {
                            if (_local_13 == 2)
                            {
                                this.getPlayer(_local_13).StandBy = false;
                                this.getPlayer(_local_13).Team = 2;
                            }
                            else
                            {
                                this.getPlayer(_local_13).StandBy = true;
                                this.getPlayer(_local_13).Team = 2;
                            };
                        };
                    };
                    _local_13++;
                };
            };
            this.m_remainingTargets = this.TARGETS.length;
            var _local_14:Vector.<MovieClip> = new Vector.<MovieClip>();
            var _local_15:Number = 0;
            while (_local_15 < this.PLAYERS.length)
            {
                if ((((!(this.PLAYERS[_local_15] == null)) && (!(this.PLAYERS[_local_15].MC == null))) && (!(this.PLAYERS[_local_15].StandBy))))
                {
                    _local_14.push(MovieClip(this.PLAYERS[_local_15].MC));
                };
                _local_15++;
            };
            this.CAM.addTargets(_local_14);
            this.CAM.forceTarget();
            this.m_pokemon = new Vector.<Class>();
            this.m_pokemon.push(Gligar);
            this.m_pokemon.push(Hitmonlee);
            this.m_pokemon.push(Chikorita);
            this.m_pokemon.push(Koffing);
            this.m_pokemon.push(Charizard);
            this.m_pokemon.push(Delibird);
            this.m_pokemon.push(Magikarp);
            this.m_pokemon.push(Electrode);
            this.m_pokemon.push(Shroomish);
            this.m_pokemon.push(Snorlax);
            this.m_pokemon.push(Chatot);
            this.m_pokemonRare = new Vector.<Class>();
            this.m_pokemonRare.push(Missingno);
            this.m_pokemonRare.push(Victini);
            this.m_assists = new Vector.<Class>();
            this.m_assists.push(BandanaDee);
            this.m_assists.push(Amigo);
            this.m_assists.push(Starfy);
            this.m_assists.push(Protoman);
            this.m_assists.push(Metroid);
            this.m_assists.push(PacMan);
            this.m_assists.push(RenjiAssist);
            this.m_assists.push(Krillin);
            this.m_assists.push(Lakitu);
            this.m_assists.push(Silver);
            this.m_assistsRare = new Vector.<Class>();
            this.m_assistsRare.push(YagamiLight);
            this.m_disableCeilingDeath = false;
            this.m_disableFallDeath = false;
            this.m_gravityMultiplier = 1;
            this.m_crowdChantDelay = new FrameTimer((30 * 20));
            this.m_crowdChantTimer = new FrameTimer((30 * 20));
            this.m_crowdChantID = -1;
            this.m_crowdChantSound = null;
            this.m_crowdChantTimer.finish();
            this.m_logging = this.ONLINEMODE;
            this.m_logText = "";
            if (this.GAME.GameMode === Mode.ONLINE_WAITING_ROOM)
            {
                Main.Root.stage.addEventListener(Event.ENTER_FRAME, this.waitForPlayers);
                MultiplayerManager.sendMatchReadySignal({"playerSettings":com.adobe.serialization.json.JSON.encode(GameController.onlineModeMatchSettings.playerData.player1)});
            };
        }

        private function findObjects(mc:MovieClip):void
        {
            var curObject:MovieClip;
            var tmpX:Number;
            var tmpY:Number;
            var tmpClass:Class;
            var e:int;
            var list:Vector.<*> = new Vector.<*>();
            e = 0;
            while (e < mc.numChildren)
            {
                list.push(mc.getChildAt(e));
                e = (e + 1);
            };
            e = 0;
            for (;e < list.length;(e = (e + 1)))
            {
                if ((list[e] is MovieClip))
                {
                    curObject = MovieClip(list[e]);
                    try
                    {
                        if ((!(curObject.type))) continue;
                    }
                    catch(error)
                    {
                        continue;
                    };
                    if (((curObject.type == "enemy") && (curObject.className)))
                    {
                        tmpX = curObject.x;
                        tmpY = curObject.y;
                        tmpClass = ((curObject.className is Class) ? curObject.className : Main.getClassByName(curObject.className));
                        curObject.parent.removeChild(curObject);
                        this.spawnEnemy(tmpClass, tmpX, tmpY);
                    }
                    else
                    {
                        if (curObject.type == "terrain")
                        {
                            if (((curObject.className) && (Main.getClassByName(curObject.className))))
                            {
                                if ((curObject.className is Class))
                                {
                                    this.MOVINGPLATFORMS.push(new curObject.className(curObject, this));
                                }
                                else
                                {
                                    this.MOVINGPLATFORMS.push(new (Main.getClassByName(curObject.className))(curObject, this));
                                };
                                this.TERRAINS.push(this.MOVINGPLATFORMS[(this.MOVINGPLATFORMS.length - 1)]);
                            }
                            else
                            {
                                this.TERRAINS.push(new Platform(curObject, this));
                            };
                            this.TERRAINS[(this.TERRAINS.length - 1)].BMPData.rotation = 80;
                        }
                        else
                        {
                            if (curObject.type == "platform")
                            {
                                if (((curObject.ground) && (curObject.noDropThrough)))
                                {
                                    curObject.ground.noDropThrough = true;
                                };
                                if (((curObject.className) && (Main.getClassByName(curObject.className))))
                                {
                                    if ((curObject.className is Class))
                                    {
                                        this.MOVINGPLATFORMS.push(new curObject.className(curObject, this));
                                    }
                                    else
                                    {
                                        this.MOVINGPLATFORMS.push(new (Main.getClassByName(curObject.className))(curObject, this));
                                    };
                                    this.PLATFORMS.push(this.MOVINGPLATFORMS[(this.MOVINGPLATFORMS.length - 1)]);
                                }
                                else
                                {
                                    this.PLATFORMS.push(new Platform(curObject, this));
                                };
                            }
                            else
                            {
                                if (curObject.type == "itemGen")
                                {
                                    this.ITEMGENS.push(curObject);
                                }
                                else
                                {
                                    if (curObject.type == "l_bound_upper")
                                    {
                                        this.WARNINGBOUNDS_UL.push(new CollisionBoundary(curObject, this, "ground", true));
                                    }
                                    else
                                    {
                                        if (curObject.type == "r_bound_upper")
                                        {
                                            this.WARNINGBOUNDS_UR.push(new CollisionBoundary(curObject, this, "ground", true));
                                        }
                                        else
                                        {
                                            if (curObject.type == "l_bound_lower")
                                            {
                                                this.WARNINGBOUNDS_LL.push(new CollisionBoundary(curObject, this, "ground", true));
                                            }
                                            else
                                            {
                                                if (curObject.type == "r_bound_lower")
                                                {
                                                    this.WARNINGBOUNDS_LR.push(new CollisionBoundary(curObject, this, "ground", true));
                                                }
                                                else
                                                {
                                                    if (curObject.type == "l_ledge")
                                                    {
                                                        this.LEDGES_L.push(curObject);
                                                        if (HitBoxAnimation.AnimationsList["_ledge_"])
                                                        {
                                                            curObject.hitBoxAnim = HitBoxAnimation.AnimationsList["_ledge_"];
                                                        }
                                                        else
                                                        {
                                                            curObject.hitBoxAnim = new HitBoxAnimation("_ledge_");
                                                            HitBoxAnimation(curObject.hitBoxAnim).addHitBox(1, new HitBoxSprite(HitBoxSprite.LEDGE, curObject.getBounds(curObject)));
                                                        };
                                                    }
                                                    else
                                                    {
                                                        if (curObject.type == "r_ledge")
                                                        {
                                                            this.LEDGES_R.push(curObject);
                                                            if (HitBoxAnimation.AnimationsList["_ledge_"])
                                                            {
                                                                curObject.hitBoxAnim = HitBoxAnimation.AnimationsList["_ledge_"];
                                                            }
                                                            else
                                                            {
                                                                curObject.hitBoxAnim = new HitBoxAnimation("_ledge_");
                                                                HitBoxAnimation(curObject.hitBoxAnim).addHitBox(1, new HitBoxSprite(HitBoxSprite.LEDGE, curObject.getBounds(curObject)));
                                                            };
                                                        }
                                                        else
                                                        {
                                                            if (curObject.type == "beacon")
                                                            {
                                                                this.BEACONS.push(new Beacon(curObject, this, this.BEACONS.length));
                                                            }
                                                            else
                                                            {
                                                                if (curObject.type == "wallstick")
                                                                {
                                                                    this.WALLS.push(new CollisionBoundary(curObject, this));
                                                                }
                                                                else
                                                                {
                                                                    if (curObject.type == "target")
                                                                    {
                                                                        this.TARGETS.push(new TargetTestTarget(curObject, this));
                                                                    }
                                                                    else
                                                                    {
                                                                        if (curObject.type == "p1_start")
                                                                        {
                                                                            this.GAME.CurrentStageSettings.P1_XStart = curObject.x;
                                                                            this.GAME.CurrentStageSettings.P1_YStart = curObject.y;
                                                                            this.GAME.CurrentStageSettings.P1_FacingRight = (curObject.transform.matrix.a >= 0);
                                                                            this.GAME.setStageSettings(this.GAME.CurrentStageSettings);
                                                                        }
                                                                        else
                                                                        {
                                                                            if (curObject.type == "p2_start")
                                                                            {
                                                                                this.GAME.CurrentStageSettings.P2_XStart = curObject.x;
                                                                                this.GAME.CurrentStageSettings.P2_YStart = curObject.y;
                                                                                this.GAME.CurrentStageSettings.P2_FacingRight = (curObject.transform.matrix.a >= 0);
                                                                                this.GAME.setStageSettings(this.GAME.CurrentStageSettings);
                                                                            }
                                                                            else
                                                                            {
                                                                                if (curObject.type == "p3_start")
                                                                                {
                                                                                    this.GAME.CurrentStageSettings.P3_XStart = curObject.x;
                                                                                    this.GAME.CurrentStageSettings.P3_YStart = curObject.y;
                                                                                    this.GAME.CurrentStageSettings.P3_FacingRight = (curObject.transform.matrix.a >= 0);
                                                                                    this.GAME.setStageSettings(this.GAME.CurrentStageSettings);
                                                                                }
                                                                                else
                                                                                {
                                                                                    if (curObject.type == "p4_start")
                                                                                    {
                                                                                        this.GAME.CurrentStageSettings.P4_XStart = curObject.x;
                                                                                        this.GAME.CurrentStageSettings.P4_YStart = curObject.y;
                                                                                        this.GAME.CurrentStageSettings.P4_FacingRight = (curObject.transform.matrix.a >= 0);
                                                                                        this.GAME.setStageSettings(this.GAME.CurrentStageSettings);
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        if (curObject.type == "p1_spawn")
                                                                                        {
                                                                                            this.GAME.CurrentStageSettings.P1_XSpawn = curObject.x;
                                                                                            this.GAME.CurrentStageSettings.P1_YSpawn = curObject.y;
                                                                                            this.GAME.setStageSettings(this.GAME.CurrentStageSettings);
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            if (curObject.type == "p2_spawn")
                                                                                            {
                                                                                                this.GAME.CurrentStageSettings.P2_XSpawn = curObject.x;
                                                                                                this.GAME.CurrentStageSettings.P2_YSpawn = curObject.y;
                                                                                                this.GAME.setStageSettings(this.GAME.CurrentStageSettings);
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                if (curObject.type == "p3_spawn")
                                                                                                {
                                                                                                    this.GAME.CurrentStageSettings.P3_XSpawn = curObject.x;
                                                                                                    this.GAME.CurrentStageSettings.P3_YSpawn = curObject.y;
                                                                                                    this.GAME.setStageSettings(this.GAME.CurrentStageSettings);
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    if (curObject.type == "p4_spawn")
                                                                                                    {
                                                                                                        this.GAME.CurrentStageSettings.P4_XSpawn = curObject.x;
                                                                                                        this.GAME.CurrentStageSettings.P4_YSpawn = curObject.y;
                                                                                                        this.GAME.setStageSettings(this.GAME.CurrentStageSettings);
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        if (curObject.type == "light_source")
                                                                                                        {
                                                                                                            this.LIGHTSOURCE = curObject;
                                                                                                        };
                                                                                                    };
                                                                                                };
                                                                                            };
                                                                                        };
                                                                                    };
                                                                                };
                                                                            };
                                                                        };
                                                                    };
                                                                };
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function createBeaconData():void
        {
            if (this.BEACONS.length <= 0)
            {
                return;
            };
            var _local_1:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            this.ADJMATRIX = this.newAdjacencyMatrix(this.BEACONS.length);
            this.populateAdjMatrix(this.BEACONS);
            _local_1 = 0;
            while (_local_1 < this.BEACONS.length)
            {
                _local_2 = 0;
                while (_local_2 < this.BEACONS[_local_1].Neighbors.length)
                {
                    _local_3 = 0;
                    while (_local_3 < this.BEACONS[_local_1].Neighbors[_local_2].Neighbors.length)
                    {
                        if (this.BEACONS[_local_1] != this.BEACONS[_local_1].Neighbors[_local_2].Neighbors[_local_3])
                        {
                            _local_4 = 0;
                            while (_local_4 < this.BEACONS[_local_1].Neighbors.length)
                            {
                                if (this.BEACONS[_local_1].Neighbors[_local_2] != this.BEACONS[_local_1].Neighbors[_local_4])
                                {
                                    if (this.BEACONS[_local_1].Neighbors[_local_4] == this.BEACONS[_local_1].Neighbors[_local_2].Neighbors[_local_3])
                                    {
                                        if (this.ADJMATRIX[_local_1][this.BEACONS[_local_1].Neighbors[_local_4].BID] > this.ADJMATRIX[this.BEACONS[_local_1].Neighbors[_local_2].BID][this.BEACONS[_local_1].Neighbors[_local_4].BID])
                                        {
                                            this.ADJMATRIX[_local_1][this.BEACONS[_local_1].Neighbors[_local_4].BID] = int.MAX_VALUE;
                                        };
                                    };
                                };
                                _local_4++;
                            };
                        };
                        _local_3++;
                    };
                    _local_2++;
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.ADJMATRIX.length)
            {
                _local_2 = 0;
                while (_local_2 < this.ADJMATRIX[_local_1].length)
                {
                    if (this.ADJMATRIX[_local_1][_local_2] != int.MAX_VALUE)
                    {
                        this.ADJMATRIX[_local_2][_local_1] = this.ADJMATRIX[_local_1][_local_2];
                    };
                    _local_2++;
                };
                _local_1++;
            };
        }

        private function newAdjacencyMatrix(_arg_1:Number):Array
        {
            var _local_4:int;
            var _local_2:Array = new Array(_arg_1);
            var _local_3:int;
            while (_local_3 < _arg_1)
            {
                _local_2[_local_3] = new Array(_arg_1);
                _local_4 = 0;
                while (_local_4 < _arg_1)
                {
                    _local_2[_local_3][_local_4] = int.MAX_VALUE;
                    _local_4++;
                };
                _local_3++;
            };
            return (_local_2);
        }

        private function populateAdjMatrix(_arg_1:Vector.<Beacon>):void
        {
            var _local_3:int;
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < _arg_1.length)
            {
                _local_3 = 0;
                while (_local_3 < _arg_1.length)
                {
                    if (((!(_local_2 == _local_3)) && (_arg_1[_local_2].addPotentialNeighbor(_arg_1[_local_3]))))
                    {
                        this.ADJMATRIX[_local_2][_local_3] = Utils.getDistanceFrom(_arg_1[_local_2], _arg_1[_local_3]);
                    };
                    _local_3++;
                };
                _local_2++;
            };
        }

        public function beaconNeighborCount(_arg_1:int):int
        {
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < this.ADJMATRIX[_arg_1].length)
            {
                if (this.ADJMATRIX[_arg_1][_local_3] != int.MAX_VALUE)
                {
                    _local_2++;
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function markBeaconsUnvisited():void
        {
            var _local_1:int;
            while (_local_1 < this.BEACONS.length)
            {
                this.BEACONS[_local_1].Visited = false;
                _local_1++;
            };
        }

        public function touchingLowerWarningBounds(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < this.WARNINGBOUNDS_LL.length)
            {
                if (this.WARNINGBOUNDS_LL[_local_3].hitTestPoint(_arg_1, _arg_2, true))
                {
                    return (true);
                };
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < this.WARNINGBOUNDS_LR.length)
            {
                if (this.WARNINGBOUNDS_LR[_local_3].hitTestPoint(_arg_1, _arg_2, true))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function touchingUpperWarningBounds(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < this.WARNINGBOUNDS_UL.length)
            {
                if (this.WARNINGBOUNDS_UL[_local_3].hitTestPoint(_arg_1, _arg_2, true))
                {
                    return (true);
                };
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < this.WARNINGBOUNDS_UR.length)
            {
                if (this.WARNINGBOUNDS_UR[_local_3].hitTestPoint(_arg_1, _arg_2, true))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function triggerFSCutscene():void
        {
            this.m_fsCutscene = true;
        }

        public function killFSCutscene():void
        {
            this.m_fsCutscene = false;
        }

        public function lightFlash(_arg_1:Boolean=true):void
        {
            this.CAM.lightFlash(_arg_1);
        }

        public function checkLinearPathBetweenPoints(_arg_1:Point, _arg_2:Point, _arg_3:Boolean=true, _arg_4:Platform=null):Boolean
        {
            return (this.getPlatformBetweenPoints(_arg_1, _arg_2, _arg_3, _arg_4) == null);
        }

        public function getPlatformBetweenPoints(_arg_1:Point, _arg_2:Point, _arg_3:Boolean=true, _arg_4:Platform=null):Platform
        {
            var _local_5:Number = _arg_1.x;
            var _local_6:Number = _arg_2.y;
            var _local_7:Number = (_arg_2.x - _arg_1.x);
            var _local_8:Number = -(_arg_2.y - _arg_1.y);
            var _local_9:Number = ((Math.abs(_local_7) + Math.abs(_local_8)) / 10);
            var _local_10:Platform = _arg_4;
            var _local_11:int;
            while (_local_11 < Math.floor(_local_9))
            {
                if (((((_arg_4) && (_arg_4.hitTestPoint((_local_5 + (_local_7 / _local_9)), (_local_6 + (_local_8 / _local_9))))) || (((_arg_3) && (_arg_4 == null)) && (_local_10 = this.testTerrainWithCoord((_local_5 + (_local_7 / _local_9)), (_local_6 + (_local_8 / _local_9)))))) || (((!(_arg_3)) && (_arg_4 == null)) && (_local_10 = this.testGroundWithCoord((_local_5 + (_local_7 / _local_9)), (_local_6 + (_local_8 / _local_9)))))))
                {
                    return (_local_10);
                };
                _local_5 = (_local_5 + (_local_7 / _local_9));
                _local_6 = (_local_6 + (_local_8 / _local_9));
                _local_11++;
            };
            return (null);
        }

        public function testTerrainWithCoord(_arg_1:Number, _arg_2:Number):Platform
        {
            var _local_3:int;
            _local_3 = 0;
            while (((_local_3 < this.TERRAINS.length) && ((!(this.TERRAINS[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (this.TERRAINS[_local_3].fallthrough == true))))
            {
                _local_3++;
            };
            if (((_local_3 < this.TERRAINS.length) && (this.TERRAINS[_local_3].hitTestPoint(_arg_1, _arg_2, true))))
            {
                return (this.TERRAINS[_local_3]);
            };
            return (null);
        }

        public function testGroundWithCoord(_arg_1:Number, _arg_2:Number):Platform
        {
            var _local_3:int;
            _local_3 = 0;
            while (((_local_3 < this.TERRAINS.length) && ((!(this.TERRAINS[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (this.TERRAINS[_local_3].fallthrough == true))))
            {
                _local_3++;
            };
            if (((_local_3 < this.TERRAINS.length) && (this.TERRAINS[_local_3].hitTestPoint(_arg_1, _arg_2, true))))
            {
                return (this.TERRAINS[_local_3]);
            };
            _local_3 = 0;
            while (((_local_3 < this.PLATFORMS.length) && ((!(this.PLATFORMS[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (this.PLATFORMS[_local_3].fallthrough == true))))
            {
                _local_3++;
            };
            if (((_local_3 < this.PLATFORMS.length) && (this.PLATFORMS[_local_3].hitTestPoint(_arg_1, _arg_2, true))))
            {
                return (this.PLATFORMS[_local_3]);
            };
            return (null);
        }

        public function shakeCamera(_arg_1:int):void
        {
            this.CAM.shake(_arg_1);
        }

        private function makePlayer(_arg_1:int):void
        {
            var _local_2:String = ("shield" + Utils.convertTeamToColor(_arg_1, ((this.GAME.GameMode == Mode.TRAINING) ? -1 : this.GAME.PlayerSettings[(_arg_1 - 1)].team)));
            Stats.setPresets({
                "level":this.GAME.PlayerSettings[(_arg_1 - 1)].level,
                "x_start":this.GAME.PlayerSettings[(_arg_1 - 1)].x_start,
                "y_start":this.GAME.PlayerSettings[(_arg_1 - 1)].y_start,
                "x_respawn":this.GAME.PlayerSettings[(_arg_1 - 1)].x_respawn,
                "y_respawn":this.GAME.PlayerSettings[(_arg_1 - 1)].y_respawn,
                "player_id":_arg_1,
                "sizeRatio":this.GAME.SizeRatio,
                "shieldType":_local_2,
                "facingRight":this.GAME.PlayerSettings[(_arg_1 - 1)].facingRight
            });
            this.PLAYERS[(_arg_1 - 1)] = new Character(((this.GAME.PlayerSettings[(_arg_1 - 1)].character == "rand_mc") ? Stats.getStats(Main.RandCharList[(_arg_1 - 1)].StatsName) : Stats.getStats(this.GAME.PlayerSettings[(_arg_1 - 1)].character, ((this.GAME.PlayerSettings[(_arg_1 - 1)].character == "xp") ? this.GAME.PlayerSettings[(_arg_1 - 1)].expansion : -1))), {
                "lives":this.GAME.PlayerSettings[(_arg_1 - 1)].lives,
                "controls":this.CONTROLLERS[(_arg_1 - 1)],
                "human":this.GAME.PlayerSettings[(_arg_1 - 1)].human,
                "stamina":this.GAME.LevelData.stamina,
                "damageRatio":this.GAME.PlayerSettings[(_arg_1 - 1)].damageRatio,
                "usingLives":this.GAME.LevelData.usingLives,
                "showPlayerID":this.GAME.ShowPlayerID,
                "teamID":this.GAME.PlayerSettings[(_arg_1 - 1)].team,
                "costumeID":this.GAME.PlayerSettings[(_arg_1 - 1)].costume,
                "name":this.GAME.PlayerSettings[(_arg_1 - 1)].name,
                "teamDamage":this.GAME.LevelData.teamDamage,
                "unlimitedFinal":this.GAME.PlayerSettings[(_arg_1 - 1)].unlimitedFinal,
                "startDamage":this.GAME.PlayerSettings[(_arg_1 - 1)].startDamage,
                "expansion":((this.GAME.PlayerSettings[(_arg_1 - 1)].character == "xp") ? this.GAME.PlayerSettings[(_arg_1 - 1)].expansion : -1)
            }, this);
        }

        public function addHazard(_arg_1:StageHazard):void
        {
            if (((this.HazardsOn) || ((!(this.HazardsOn)) && (_arg_1.Safe))))
            {
                this.HAZARDS.push(_arg_1);
            };
        }

        public function addHazards(_arg_1:Vector.<StageHazard>):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                this.HAZARDS.push(_arg_1[_local_2]);
            };
        }

        public function getHazard(_arg_1:Class):StageHazard
        {
            var _local_2:int;
            while (_local_2 < this.HAZARDS.length)
            {
                if ((this.HAZARDS[_local_2] is _arg_1))
                {
                    return (this.HAZARDS[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function activateCharacters():void
        {
            this.m_activeScripts = true;
        }

        public function deactivateCharacters():void
        {
            this.m_activeScripts = false;
        }

        public function getNthPlayer(_arg_1:int):Character
        {
            var _local_2:int;
            var _local_3:int = (_arg_1 - 1);
            while (_local_3 < this.PLAYERS.length)
            {
                if (this.PLAYERS[_local_3] != null)
                {
                    if (_local_3 == (_arg_1 - 1))
                    {
                        return (this.PLAYERS[_local_3]);
                    };
                    _local_2++;
                };
                _local_3++;
            };
            return (null);
        }

        public function startGame():void
        {
            Main.Root.stage.addEventListener(Event.ENTER_FRAME, this.startGame2);
        }

        private function startGame2(_arg_1:Event):void
        {
            var _local_3:int;
            this.m_startDelayTimer.tick();
            if ((!(this.m_startDelayTimer.IsComplete)))
            {
                return;
            };
            this.ROOT.stage.removeEventListener(Event.ENTER_FRAME, this.startGame2);
            this.SOUNDQUEUE.playMusic(this.m_music, this.m_loopLoc);
            this.STAGEPARENT.stage.focus = this.STAGEPARENT;
            this.activateCharacters();
            this.m_countdownTimer = Main.getLibraryMC("countdownTimer");
            this.m_countdownTimer.stop();
            this.m_countdownTimer.name = "countdown";
            this.m_countdownTimer.x = (Main.Width / 2);
            this.m_countdownTimer.y = (Main.Height / 2);
            this.ROOT.addChild(this.m_countdownTimer);
            this.ROOT.addEventListener(Event.RENDER, this.renderComplete);
            this.ROOT.addEventListener(Event.ENTER_FRAME, this.performAllEvents);
            if (((ModeFeatures.hasFeature(ModeFeatures.ALLOW_SUDDEN_DEATH, this.GAME.GameMode)) && (this.GAME.SuddenDeath)))
            {
                if (this.GAME.SuddenDeath)
                {
                    this.m_countdownTimer.gotoAndStop("suddendeath");
                };
            }
            else
            {
                if ((!(ModeFeatures.hasFeature(ModeFeatures.ALLOW_ENTRANCES, this.GAME.GameMode))))
                {
                    this.m_countdownTimer.gotoAndStop("go");
                }
                else
                {
                    this.m_countdownTimer.gotoAndStop(2);
                };
            };
            if (Main.DEBUG)
            {
                this.m_fpsTimer = new Debug_fps(this.STAGE.stage, new Point());
            };
            if (SpecialMode.modeEnabled(this.GAME.LevelData.specialModes, SpecialMode.SLOW))
            {
                Main.Root.stage.frameRate = (Main.FRAMERATE / 2);
            }
            else
            {
                if (SpecialMode.modeEnabled(this.GAME.LevelData.specialModes, SpecialMode.LIGHTNING))
                {
                    Main.Root.stage.frameRate = (Main.FRAMERATE * 2);
                };
            };
            this.CAM.forceTarget();
            this.CAM.PERFORMALL();
            var _local_2:int = 1;
            while (_local_2 <= Main.MAXPLAYERS)
            {
                if (this.getPlayer(_local_2))
                {
                    this.getPlayer(_local_2).m_initFunctions();
                    this.getPlayer(_local_2).forceOnGround();
                };
                _local_2++;
            };
            this.m_currentEntrance = 1;
            if (((!(this.getNthPlayer(this.m_currentEntrance) == null)) && (ModeFeatures.hasFeature(ModeFeatures.ALLOW_ENTRANCES, this.GAME.GameMode))))
            {
                this.CAM.addZoomFocus(this.getNthPlayer(1).MC, 20);
                _local_3 = 2;
                while (this.getNthPlayer(_local_3) != null)
                {
                    this.getNthPlayer(_local_3).FreezePlayback = true;
                    this.getNthPlayer(_local_3).setVisibility(false);
                    _local_3++;
                };
            };
            Main.Root.visible = true;
            GameController.hud.showHealthBoxes();
            if (((this.GAME.GameMode == Mode.EVENT) && (EventMatchController.currentEvent)))
            {
                EventMatchController.currentEvent.initMatch(this);
            };
            this.stopAllStageFrames();
            this.pauseAllEffects();
            this.PERFORMALL();
        }

        public function prepareEndGameCharacter(_arg_1:Boolean=true):void
        {
            this.m_slowFrameRate = _arg_1;
            this.m_endTrigger = true;
        }

        public function prepareEndGame(_arg_1:Boolean=true):void
        {
            if ((!(this.m_gameEnded)))
            {
                this.updateEndTimer();
                this.m_gameEnded = true;
                if (this.GAME.GameMode == Mode.EVENT)
                {
                    EventMatchController.currentEvent.checkMatch(this);
                    if (EventMatchController.success)
                    {
                        _arg_1 = true;
                        this.attachUniqueMovieHUD("success_mc");
                        this.TIMER.Stop();
                        this.playSpecificVoice("narrator_success");
                        this.m_endGameTimer.MaxTime = 32;
                        EventMatchController.currentEvent.complete(this.TIMER.ElapsedTime, this.MatchMilliseconds, EventMatchController.difficulty);
                    }
                    else
                    {
                        _arg_1 = false;
                        this.playSpecificSound("narrator_failure");
                        this.prepareEndGame(false);
                        this.attachUniqueMovieHUD("failure_mc");
                    };
                };
                if (_arg_1)
                {
                    Main.Root.stage.frameRate = 8;
                };
                this.TIMER.Stop();
                if (ModeFeatures.hasFeature(ModeFeatures.REMOVE_TIMER, this.GAME.GameMode))
                {
                    if (this.TIMER.TimeMC.parent)
                    {
                        this.TIMER.TimeMC.parent.removeChild(this.TIMER.TimeMC);
                    };
                };
            };
        }

        public function updateEndTimer():void
        {
            this.m_endTime = getTimer();
        }

        public function startCrowdChant(_arg_1:int):void
        {
            var _local_2:Sound;
            var _local_3:int;
        }

        public function stopCrowdChant():void
        {
            if (this.m_crowdChantSound)
            {
                this.m_crowdChantSound.Channel.removeEventListener(Event.SOUND_COMPLETE, this.m_crowdChantSound.LoopFunction);
                this.m_crowdChantSound.stop();
                this.m_crowdChantSound.LoopFunction = null;
                this.m_crowdChantSound = null;
            };
            this.m_crowdChantID = -1;
            this.m_crowdChantTimer.reset();
            this.m_crowdChantDelay.reset();
        }

        public function endGame(_arg_1:Boolean=false):void
        {
            var _local_6:Boolean;
            var _local_2:int;
            var _local_3:int;
            if (this.m_onlineTimeout.running)
            {
                this.m_onlineTimeout.reset();
            };
            if (((this.ONLINEMODE) && (MultiplayerManager.Connected)))
            {
                MultiplayerManager.sendMatchEndSignal();
            };
            this.flushTimers();
            _local_2 = 0;
            while (_local_2 < this.PLAYERS.length)
            {
                if (this.PLAYERS[_local_2])
                {
                    this.PLAYERS[_local_2].flushTimers(true);
                    this.PLAYERS[_local_2].EventManagerObj.removeAllEvents();
                };
                _local_2++;
            };
            this.deactivateCharacters();
            SSF2API_Interface.deinit();
            this.stopCrowdChant();
            this.m_gameEnded = true;
            if (this.m_fpsTimer)
            {
                this.m_fpsTimer.kill();
            };
            _local_2 = 0;
            while (_local_2 < this.PLAYERS.length)
            {
                if (this.PLAYERS[_local_2] != null)
                {
                    this.PLAYERS[_local_2].resetDroughtTimer();
                };
                _local_2++;
            };
            var _local_4:Array = new Array();
            if (ModeFeatures.hasFeature(ModeFeatures.ALLOW_SUDDEN_DEATH, this.GAME.GameMode))
            {
                this.updateRanks();
            };
            _local_2 = 0;
            while ((((_local_2 < this.PLAYERS.length) && (!(_arg_1))) && (this.m_canSuddenDeath)))
            {
                if (((!(this.PLAYERS[_local_2] == null)) && (this.PLAYERS[_local_2].getMatchResults().Rank == 1)))
                {
                    _local_6 = false;
                    _local_3 = 0;
                    while (_local_3 < _local_4.length)
                    {
                        if ((((this.getPlayer(_local_4[_local_3]).getMatchResults().Rank == this.PLAYERS[_local_2].getMatchResults().Rank) && (this.PLAYERS[_local_2].Team == this.getPlayer(_local_4[_local_3]).Team)) && (this.getPlayer(_local_4[_local_3]).Team > 0)))
                        {
                            _local_6 = true;
                        };
                        _local_3++;
                    };
                    if ((!(_local_6)))
                    {
                        _local_4.push(this.PLAYERS[_local_2].ID);
                    };
                };
                _local_2++;
            };
            if (_local_4.length > 1)
            {
                _local_4 = new Array();
                this.m_suddenDeath = true;
                if (this.GAME.UsingLives)
                {
                    _local_2 = 0;
                    while (_local_2 < this.PLAYERS.length)
                    {
                        if ((((!(this.PLAYERS[_local_2] == null)) && (this.PLAYERS[_local_2].getMatchResults().Rank == 1)) && (this.PLAYERS[_local_2].getLives() > 0)))
                        {
                            _local_4.push(this.PLAYERS[_local_2].ID);
                        };
                        _local_2++;
                    };
                }
                else
                {
                    _local_2 = 0;
                    while (_local_2 < this.PLAYERS.length)
                    {
                        if (((!(this.PLAYERS[_local_2] == null)) && (this.PLAYERS[_local_2].getMatchResults().Rank == 1)))
                        {
                            _local_4.push(this.PLAYERS[_local_2].ID);
                        };
                        _local_2++;
                    };
                };
                this.m_suddenDeathIDs = _local_4;
            };
            this.m_noContest = _arg_1;
            if (ModeFeatures.hasFeature(ModeFeatures.REMOVE_TIMER, this.GAME.GameMode))
            {
                this.TIMER.TimeMC.visible = false;
                this.HUD.visible = false;
            };
            this.CAM.killDarkener();
            this.m_wasReset = true;
            Main.Root.stage.frameRate = Main.FRAMERATE;
            _local_2 = 2;
            while (_local_2 <= Main.MAXPLAYERS)
            {
                if (this.m_nullPlayers.indexOf((_local_2 - 1)) >= 0)
                {
                    this.GAME.PlayerSettings[(_local_2 - 1)].character = null;
                };
                _local_2++;
            };
            _local_3 = 0;
            while (_local_3 < this.m_effectHUDList.length)
            {
                if (((this.m_effectHUDList[_local_3]) && (!(this.m_effectHUDList[_local_3].parent == null))))
                {
                    this.m_effectHUDList[_local_3].parent.removeChild(this.m_effectHUDList[_local_3]);
                };
                _local_3++;
            };
            this.SOUNDQUEUE.stopAllSounds();
            GameController.hud.forceHitBoxVisiblity(false);
            if (this.ROOT.getChildByName("countdown") != null)
            {
                this.ROOT.removeChild(this.ROOT.getChildByName("countdown"));
            };
            if (MultiplayerManager.Connected)
            {
                MultiplayerManager.Active = false;
            };
            this.STAGE = null;
            this.STAGEPARENT = null;
            GameController.endMatch();
            this.ROOT.removeEventListener(Event.RENDER, this.renderComplete);
            var _local_5:Boolean;
            if (ModeFeatures.hasFeature(ModeFeatures.CHECK_UNLOCKS, this.GAME.GameMode))
            {
                UnlockController.checkUnlocks();
            };
            if (this.GAME.GameMode == Mode.TRAINING)
            {
                UnlockController.nextMenuFunc = MenuController.showTrainingMenu;
				Main.unloadResources();
				this.disposeAll();
            }
            else
            {
                if (this.GAME.GameMode == Mode.TARGET_TEST)
                {
                    UnlockController.nextMenuFunc = MenuController.showTargetTestMenu;
					Main.unloadResources();
					this.disposeAll();
                }
                else
                {
                    if (this.GAME.GameMode == Mode.CLASSIC)
                    {
                        UnlockController.nextMenuFunc = MenuController.showClassicMenu;
						Main.unloadResources();
						this.disposeAll();
                    }
                    else
                    {
                        if (this.GAME.GameMode != Mode.VS_UNLOCK)
                        {
                            if (this.GAME.GameMode == Mode.EVENT)
                            {
                                UnlockController.nextMenuFunc = MenuController.showEventMenu;
								Main.unloadResources();
								this.disposeAll();
                            }
                            else
                            {
                                if (this.GAME.GameMode == Mode.ONLINE_WAITING_ROOM)
                                {
                                    if (this.m_noContest)
                                    {
                                        if ((!(MultiplayerManager.Connected)))
                                        {
                                            UnlockController.nextMenuFunc = MenuController.showMainMenu;
											Main.unloadResources();
											this.disposeAll();
                                        }
                                        else
                                        {
                                            UnlockController.nextMenuFunc = MenuController.showOnlineCharacterMenu;
											Main.unloadResources();
											this.disposeAll();
                                        };
                                    }
                                    else
                                    {
                                        UnlockController.nextMenuFunc = null;
                                    };
                                }
                                else
                                {
                                    UnlockController.nextMenuFunc = MenuController.showMatchResultsMenu;
                                };
                            };
                        };
                    };
                };
            };
            if (this.GAME.GameMode == Mode.VS_UNLOCK)
            {
                if (((!(this.m_noContest)) && (this.getFirstWinner().ID == 1)))
                {
                    UnlockController.PendingUnlockScreens.unshift(UnlockController.PendingUnlockFights[0]);
                    UnlockController.PendingUnlockFights.shift();
                    MenuController.showPostUnlockMenu();
                    GameController.currentGame = null;
                    GameController.currentGame = GameController.tmpGame;
                }
                else
                {
                    GameController.currentGame = null;
                    GameController.currentGame = GameController.tmpGame;
                    UnlockController.PendingUnlockFights.shift();
                    if (UnlockController.PendingUnlockFights.length > 0)
                    {
                        MenuController.showPreUnlockMenu();
                    }
                    else
                    {
                        if (UnlockController.PendingUnlockScreens.length > 0)
                        {
                            MenuController.showPostUnlockMenu();
                        }
                        else
                        {
                            _local_5 = true;
                        };
                    };
                };
            }
            else
            {
                if (this.checkSuddenDeath())
                {
                    if (MultiplayerManager.Connected)
                    {
                        Main.Root.stage.addEventListener(Event.ENTER_FRAME, this.waitForPlayersSuddenDeath);
                        MenuController.showPleaseWaitMenu();
                        MultiplayerManager.sendMatchFinishedSignal({"player_data":GameController.stageData.getPlayer(MultiplayerManager.PlayerID).getMatchResults().exportData()});
                    }
                    else
                    {
                        GameController.startMatch();
                        this.playSpecificVoice("narrator_suddendeath");
                    };
                }
                else
                {
                    if (((this.GAME.GameMode == Mode.EVENT) && (UnlockController.PendingUnlockFights.length > 0)))
                    {
                        MenuController.showPreUnlockMenu();
                    }
                    else
                    {
                        if (((this.GAME.GameMode == Mode.EVENT) && (UnlockController.PendingUnlockScreens.length > 0)))
                        {
                            MenuController.showPostUnlockMenu();
                        }
                        else
                        {
                            _local_5 = true;
                        };
                    };
                };
            };
            if (_local_5)
            {
                if (((ModeFeatures.hasFeature(ModeFeatures.CHECK_UNLOCKS, this.GAME.GameMode)) && (UnlockController.PendingUnlockScreens.length > 0)))
                {
                    MenuController.showPostUnlockMenu();
                }
                else
                {
                    if (UnlockController.nextMenuFunc != null)
                    {
                        UnlockController.nextMenuFunc();
                    };
                };
            };
        }

        private function checkSuddenDeath():Boolean
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:int;
            if ((!(ModeFeatures.hasFeature(ModeFeatures.ALLOW_SUDDEN_DEATH, this.GAME.GameMode))))
            {
                return (false);
            };
            if ((!(GameController.stageData.SuddenDeath)))
            {
                if (GameController.currentGame.SuddenDeath)
                {
                    _local_1 = 1;
                    while (_local_1 <= Main.MAXPLAYERS)
                    {
                        if (GameController.stageData.getPlayer(_local_1) != null)
                        {
                            if (GameController.stageData.getPlayer(_local_1).getMatchResults().Rank != 1)
                            {
                                GameController.tmpStageData.getPlayer(_local_1).getMatchResults().Rank++;
                            };
                        }
                        else
                        {
                            if (GameController.tmpStageData.getPlayer(_local_1) != null)
                            {
                                GameController.tmpStageData.getPlayer(_local_1).getMatchResults().Rank++;
                            };
                        };
                        _local_1++;
                    };
                    GameController.currentGame = GameController.tmpGame;
                    GameController.stageData = GameController.tmpStageData;
                };
                return (false);
            };
            GameController.tmpStageData = GameController.stageData;
            GameController.tmpGame = GameController.currentGame;
            GameController.currentGame = new Game(null, GameController.tmpGame.GameMode);
            GameController.currentGame.LevelData.randSeed = GameController.tmpGame.LevelData.randSeed;
            if (this.REPLAYMODE)
            {
                GameController.currentGame.ReplayDataObj = GameController.tmpStageData.ReplayDataObj;
            };
            _local_2 = 0;
            while (_local_2 < GameController.stageData.SuddenDeathIDs.length)
            {
                _local_3 = GameController.stageData.SuddenDeathIDs[_local_2];
                GameController.currentGame.PlayerSettings[(_local_3 - 1)].character = ((GameController.tmpGame.PlayerSettings[(_local_3 - 1)].character == "xp") ? "xp" : GameController.stageData.getPlayer(_local_3).StatsName);
                GameController.currentGame.PlayerSettings[(_local_3 - 1)].damageRatio = 1;
                GameController.currentGame.PlayerSettings[(_local_3 - 1)].lives = 1;
                GameController.currentGame.PlayerSettings[(_local_3 - 1)].startDamage = 300;
                GameController.currentGame.PlayerSettings[(_local_3 - 1)].human = GameController.tmpGame.PlayerSettings[(_local_3 - 1)].human;
                GameController.currentGame.PlayerSettings[(_local_3 - 1)].team = GameController.tmpGame.PlayerSettings[(_local_3 - 1)].team;
                GameController.currentGame.PlayerSettings[(_local_3 - 1)].costume = GameController.tmpGame.PlayerSettings[(_local_3 - 1)].costume;
                GameController.currentGame.PlayerSettings[(_local_3 - 1)].level = GameController.tmpGame.PlayerSettings[(_local_3 - 1)].level;
                GameController.currentGame.PlayerSettings[(_local_3 - 1)].expansion = GameController.tmpGame.PlayerSettings[(_local_3 - 1)].expansion;
                GameController.currentGame.PlayerSettings[(_local_3 - 1)].exist = (GameController.stageData.SuddenDeathIDs.indexOf(_local_3) >= 0);
                _local_2++;
            };
            GameController.currentGame.LevelData.showPlayerID = GameController.tmpGame.LevelData.showPlayerID;
            GameController.currentGame.LevelData.startDamage = 300;
            GameController.currentGame.LevelData.usingLives = true;
            GameController.currentGame.LevelData.usingTime = false;
            GameController.currentGame.LevelData.lives = 1;
            GameController.currentGame.SuddenDeath = true;
            GameController.currentGame.setStageSettings(GameController.tmpGame.CurrentStageSettings);
            GameController.currentGame.Items.frequency = 0;
            SoundQueue.instance.stopMusic();
            SoundQueue.instance.stopAllSounds();
            SoundQueue.instance.setLoopFunction(SoundQueue.instance.loopMusic);
            return (true);
        }

        private function performAllEvents(_arg_1:Event):void
        {
            this.ROOT.stage.invalidate();
        }

        private function renderComplete(_arg_1:Event):void
        {
            this.PERFORMALL();
        }

        private function waitForPlayers(_arg_1:Event):void
        {
            if (MultiplayerManager.MatchReady)
            {
                if (this.GAME.GameMode !== Mode.ONLINE_WAITING_ROOM)
                {
                    Main.Root.stage.removeEventListener(Event.ENTER_FRAME, this.waitForPlayers);
                    this.endGame(false);
                    GameController.startMatch();
                    return;
                };
                MultiplayerManager.Active = true;
                if (MultiplayerManager.MasterFrame < MultiplayerManager.INPUT_BUFFER_START)
                {
                    MultiplayerManager.sendMyDataFrame(MultiplayerManager.MasterFrame, {"controls":SaveData.Controller1.getControlObjectBits(SaveData.Controller1.getControlStatus())});
                    MultiplayerManager.MasterFrame++;
                };
                MultiplayerManager.PromotionTimer.reset();
                MultiplayerManager.PERFORMALL();
                if (MultiplayerManager.Controllers[0].ControlsQueue.length >= (MultiplayerManager.INPUT_BUFFER_START - 1))
                {
                    Main.Root.stage.removeEventListener(Event.ENTER_FRAME, this.waitForPlayers);
                    this.endGame(false);
                    GameController.currentGame.GameMode = Mode.ONLINE;
                    GameController.startMatch();
                };
            }
            else
            {
                if (MultiplayerManager.NumPlayers > 1)
                {
                    this.m_onlineReadyErrorTimer.tick();
                }
                else
                {
                    this.m_onlineReadyErrorTimer.reset();
                };
                this.m_onlineReadyResendTimer.tick();
                if (this.m_onlineReadyResendTimer.IsComplete)
                {
                    trace("resent ready signal");
                    this.m_onlineReadyResendTimer.reset();
                    MultiplayerManager.sendMatchReadySignal({"playerSettings":com.adobe.serialization.json.JSON.encode(GameController.onlineModeMatchSettings.playerData.player1)});
                };
                if (this.m_onlineReadyErrorTimer.IsComplete)
                {
                    this.m_onlineReadyErrorTimer.reset();
                    MultiplayerManager.notify("1 minute has passed and no response has been received from the other player(s). You may need to log out and reconnect.");
                };
            };
        }

        private function waitForPlayersSuddenDeath(_arg_1:Event):void
        {
            if ((!(MultiplayerManager.MatchReady)))
            {
                MultiplayerManager.resetMasterFrame();
                Main.Root.stage.removeEventListener(Event.ENTER_FRAME, this.waitForPlayersSuddenDeath);
                Main.Root.stage.addEventListener(Event.ENTER_FRAME, this.waitForPlayers);
                MultiplayerManager.sendMatchReadySignal({"playerSettings":com.adobe.serialization.json.JSON.encode(GameController.onlineModeMatchSettings.playerData.player1)});
            };
        }

        private function onlineModeTimeout(_arg_1:TimerEvent):void
        {
            MultiplayerManager.notify("Error, match was desynced. Please reconnect");
            MultiplayerManager.disconnect();
            this.endGame(true);
        }

        private function checkOnlineSync():void
        {
            var _local_1:int;
            if (this.ONLINEMODE)
            {
                MultiplayerManager.Active = true;
                if (((MultiplayerManager.MatchEnded) && (!(this.m_onlineTimeout.running))))
                {
                    this.m_onlineTimeout.start();
                };
                if (MultiplayerManager.Controllers[0].ControlsQueue.length > 0)
                {
                    this.READY = true;
                    this.m_onlineFrameBuffer.CurrentTime--;
                    _local_1 = 0;
                    while (_local_1 < this.PLAYERS.length)
                    {
                        if (this.PLAYERS[_local_1] != null)
                        {
                            this.PLAYERS[_local_1].ControlSettings.setControlObjectBits(MultiplayerManager.Controllers[(this.PLAYERS[_local_1].ID - 1)].nextControlBits());
                        };
                        _local_1++;
                    };
                }
                else
                {
                    this.READY = false;
                };
            }
            else
            {
                if (this.m_event)
                {
                    this.READY = true;
                    MultiplayerManager.Active = false;
                }
                else
                {
                    this.READY = true;
                };
            };
        }

        private function runOnlineLog():void
        {
            if (((((this.m_logging) && (Main.DEBUG)) && (MenuController.debugConsole)) && (MenuController.debugConsole.OnlineCapture)))
            {
                this.m_logText = (this.m_logText + (("Frame#: " + this.m_elapsedFrames) + "\n"));
                this.m_logText = (this.m_logText + ((((((((("Cam State: {" + "x: ") + this.CAM.X) + ", y: ") + this.CAM.Y) + ", w: ") + this.CAM.Width) + ", h") + this.CAM.Height) + "}\n"));
                this.m_logText = (this.m_logText + (("Rand: " + Utils.LastRandom) + "\n"));
                if (this.getPlayer(1))
                {
                    this.m_logText = (this.m_logText + (("P1: " + this.getPlayer(1).getStateInfo()) + "\n"));
                };
                if (this.getPlayer(2))
                {
                    this.m_logText = (this.m_logText + (("P2: " + this.getPlayer(2).getStateInfo()) + "\n"));
                };
                if (this.getPlayer(3))
                {
                    this.m_logText = (this.m_logText + (("P3: " + this.getPlayer(3).getStateInfo()) + "\n"));
                };
                if (this.getPlayer(4))
                {
                    this.m_logText = (this.m_logText + (("P4: " + this.getPlayer(4).getStateInfo()) + "\n"));
                };
                this.m_logText = (this.m_logText + "\n\n");
            };
        }

        private function entranceCheck():void
        {
            var _local_1:int;
            if ((((!(this.Paused)) && (!(this.m_entranceZoomTimer.IsComplete))) && (ModeFeatures.hasFeature(ModeFeatures.ALLOW_ENTRANCES, this.GAME.GameMode))))
            {
                _local_1 = (this.m_currentEntrance * 15);
                if (this.m_entranceZoomTimer.CurrentTime == _local_1)
                {
                    if (this.m_entranceZoomMode == 1)
                    {
                        this.CAM.removeAllZoomFocus();
                    };
                    this.m_currentEntrance++;
                    if (this.getNthPlayer(this.m_currentEntrance) != null)
                    {
                        this.getNthPlayer(this.m_currentEntrance).FreezePlayback = false;
                        this.getNthPlayer(this.m_currentEntrance).MC.visible = true;
                        this.CAM.addZoomFocus(this.getNthPlayer(this.m_currentEntrance).MC, 999);
                        if (this.getNthPlayer((this.m_currentEntrance + 1)) == null)
                        {
                            this.CAM.removeAllZoomFocus();
                        };
                    };
                };
                this.m_entranceZoomTimer.tick();
                if (this.m_entranceZoomTimer.IsComplete)
                {
                    this.CAM.removeAllZoomFocus();
                };
            };
        }

        private function pauseCheck():void
        {
            var _local_3:Boolean;
            var _local_1:int;
            var _local_2:int;
            if ((((!(this.m_gameEnded)) && (!(this.m_event))) && (ModeFeatures.hasFeature(ModeFeatures.ALLOW_PAUSE, this.GAME.GameMode))))
            {
                _local_3 = false;
                _local_1 = 1;
                while (_local_1 <= Main.MAXPLAYERS)
                {
                    if ((((this.getPlayer(_local_1)) && (this.getPlayer(_local_1).IsHuman)) && (!(this.getPlayer(_local_1).Dead))))
                    {
                        _local_3 = true;
                    };
                    _local_1++;
                };
                if (this.Paused)
                {
                    if (((this.getPlayer(this.PausedID)) && (this.getPlayer(this.PausedID).IsHuman)))
                    {
                        if ((((((this.getPlayer(this.PausedID).IsHuman) && (this.getPlayer(this.PausedID).ControlSettings.IsDown(this.getPlayer(this.PausedID).ControlSettings._BUTTON1))) && (this.getPlayer(this.PausedID).ControlSettings.IsDown(this.getPlayer(this.PausedID).ControlSettings._BUTTON2))) && (this.getPlayer(this.PausedID).ControlSettings.IsDown(this.getPlayer(this.PausedID).ControlSettings._START))) && (this.getPlayer(this.PausedID).PauseLetGo)))
                        {
                            if (this.GAME.GameMode == Mode.ONLINE_WAITING_ROOM)
                            {
                                MultiplayerManager.notify("You have disconnected.");
                                MultiplayerManager.disconnect();
                            };
                            this.endGame(true);
                        }
                        else
                        {
                            if (((this.getPlayer(this.PausedID).PauseLetGo) && (this.getPlayer(this.PausedID).ControlSettings.IsDown(this.getPlayer(this.PausedID).ControlSettings._START))))
                            {
                                this.getPlayer(this.PausedID).PauseLetGo = false;
                                this.Paused = false;
                                if (this.GAME.GameMode != Mode.TRAINING)
                                {
                                    Main.Root.stage.frameRate = Main.FRAMERATE;
                                    if (SpecialMode.modeEnabled(this.GAME.LevelData.specialModes, SpecialMode.SLOW))
                                    {
                                        Main.Root.stage.frameRate = (Main.FRAMERATE / 2);
                                    }
                                    else
                                    {
                                        if (SpecialMode.modeEnabled(this.GAME.LevelData.specialModes, SpecialMode.LIGHTNING))
                                        {
                                            Main.Root.stage.frameRate = (Main.FRAMERATE * 2);
                                        };
                                    };
                                };
                                if (this.GAME.GameMode != Mode.TRAINING)
                                {
                                    _local_2 = 1;
                                    while (_local_2 <= Main.MAXPLAYERS)
                                    {
                                        if (this.getPlayer(_local_2) != null)
                                        {
                                            this.getPlayer(_local_2).playAllEffects();
                                        };
                                        _local_2++;
                                    };
                                };
                            };
                        };
                    }
                    else
                    {
                        if ((!(this.getControllerNum(1).IsDown(this.getControllerNum(1)._START))))
                        {
                            this.m_pausedLetGo = true;
                        };
                        if (((((this.m_pausedLetGo) && (this.getControllerNum(1).IsDown(this.getControllerNum(1)._BUTTON1))) && (this.getControllerNum(1).IsDown(this.getControllerNum(1)._BUTTON2))) && (this.getControllerNum(1).IsDown(this.getControllerNum(1)._START))))
                        {
                            if (this.GAME.GameMode == Mode.ONLINE_WAITING_ROOM)
                            {
                                MultiplayerManager.notify("You have disconnected.");
                                MultiplayerManager.disconnect();
                            };
                            this.endGame(true);
                        }
                        else
                        {
                            if (((this.m_pausedLetGo) && (this.getControllerNum(1).IsDown(this.getControllerNum(1)._START))))
                            {
                                this.m_pausedLetGo = false;
                                this.Paused = false;
                                if (this.GAME.GameMode != Mode.TRAINING)
                                {
                                    Main.Root.stage.frameRate = Main.FRAMERATE;
                                    if (SpecialMode.modeEnabled(this.GAME.LevelData.specialModes, SpecialMode.SLOW))
                                    {
                                        Main.Root.stage.frameRate = (Main.FRAMERATE / 2);
                                    }
                                    else
                                    {
                                        if (SpecialMode.modeEnabled(this.GAME.LevelData.specialModes, SpecialMode.LIGHTNING))
                                        {
                                            Main.Root.stage.frameRate = (Main.FRAMERATE * 2);
                                        };
                                    };
                                };
                                if (this.GAME.GameMode != Mode.TRAINING)
                                {
                                    _local_2 = 1;
                                    while (_local_2 <= Main.MAXPLAYERS)
                                    {
                                        if (this.getPlayer(_local_2) != null)
                                        {
                                            this.getPlayer(_local_2).playAllEffects();
                                        };
                                        _local_2++;
                                    };
                                };
                            };
                        };
                    };
                }
                else
                {
                    if ((!(this.getControllerNum(1).IsDown(this.getControllerNum(1)._START))))
                    {
                        this.m_pausedLetGo = true;
                    };
                    _local_1 = 1;
                    while ((((_local_1 <= Main.MAXPLAYERS) && (!(this.m_wasReset))) && (this.READY)))
                    {
                        if (((!(this.getPlayer(_local_1) == null)) && (!(((this.getPlayer(_local_1).inState(CState.DEAD)) && (this.getPlayer(_local_1).IsHuman)) && (_local_3)))))
                        {
                            if (((((this.getPlayer(_local_1).IsHuman) && (this.getPlayer(_local_1).PauseLetGo)) && (this.getPlayer(_local_1).ControlSettings.IsDown(this.getPlayer(_local_1).ControlSettings._START))) || (((!(this.getPlayer(_local_1).IsHuman)) && (this.m_pausedLetGo)) && (this.getControllerNum(1).IsDown(this.getControllerNum(1)._START)))))
                            {
                                this.m_pausedLetGo = false;
                                this.m_paused = false;
                                this.getPlayer(_local_1).PauseLetGo = false;
                                this.Paused = true;
                                if (this.GAME.GameMode != Mode.TRAINING)
                                {
                                    Main.Root.stage.frameRate = Main.FRAMERATE;
                                };
                                this.PausedID = this.getPlayer(_local_1).ID;
                                if (this.GAME.GameMode != Mode.TRAINING)
                                {
                                    _local_2 = 1;
                                    while (_local_2 <= Main.MAXPLAYERS)
                                    {
                                        if (this.getPlayer(_local_2) != null)
                                        {
                                            this.getPlayer(_local_2).pauseAllEffects();
                                        };
                                        _local_2++;
                                    };
                                };
                                return;
                            };
                        };
                        _local_1++;
                    };
                };
            };
        }

        private function eventCheck():void
        {
            if (((this.GAME.GameMode == Mode.EVENT) && (EventMatchController.currentEvent)))
            {
                EventMatchController.currentEvent.checkMatch(this);
            };
        }

        private function advanceAllStageFrames():void
        {
            if (this.STAGE.root != null)
            {
                Utils.advanceFrame(this.STAGE);
            };
            if (((this.StageFG) && (!(this.StageFG.root == null))))
            {
                Utils.advanceFrame(this.StageFG);
                Utils.recursiveMovieClipPlay(this.StageFG, true);
            };
            if (((this.StageBG) && (!(this.StageBG.root == null))))
            {
                Utils.advanceFrame(this.StageBG);
                Utils.recursiveMovieClipPlay(this.StageBG, true);
            };
            if (((this.ShadowMaskRef) && (!(this.ShadowMaskRef.root == null))))
            {
                Utils.advanceFrame(this.ShadowMaskRef);
            };
            this.CAM.nextFrameBG();
        }

        private function stopAllStageFrames():void
        {
            if (this.STAGE.root)
            {
                this.STAGE.stop();
            };
            if (((this.StageFG) && (!(this.StageFG.root == null))))
            {
                this.StageFG.stop();
                Utils.recursiveMovieClipPlay(this.StageFG, false);
            };
            if (((this.StageBG) && (!(this.StageBG.root == null))))
            {
                this.StageBG.stop();
                Utils.recursiveMovieClipPlay(this.StageBG, false);
            };
            if (((this.ShadowMaskRef) && (!(this.ShadowMaskRef.root == null))))
            {
                this.ShadowMaskRef.stop();
            };
            this.CAM.pauseBG();
        }

        private function PERFORMALL():void
        {
            var _local_3:int;
            this.checkOnlineSync();
            if ((((!(this.m_wasReset)) && (this.READY)) && (!(this.Paused))))
            {
                this.m_elapsedFrames++;
                if ((!(this.REPLAYMODE)))
                {
                    this.m_replayData.FrameCount++;
                };
                this.TIMER.frameElapse();
                this.eventCheck();
                this.runOnlineLog();
            };
            this.pauseCheck();
            var _local_1:int;
            var _local_2:int;
            if (((this.REPLAYMODE) && (!(this.Paused))))
            {
                _local_1 = 0;
                while (_local_1 < this.PLAYERS.length)
                {
                    if (((!(this.PLAYERS[_local_1] == null)) && (this.PLAYERS[_local_1].IsHuman)))
                    {
                        this.PLAYERS[_local_1].ControlSettings.setControlObjectBits(this.m_replayData.retrieveControls((_local_1 + 1)));
                    };
                    _local_1++;
                };
                this.m_replayData.nextControls();
            };
            if (((((this.m_countdownTimer.parent) && (!(this.m_wasReset))) && (this.READY)) && (!(this.Paused))))
            {
                this.m_countdownTimer.nextFrame();
            };
            if ((((!(this.m_wasReset)) && (this.READY)) && (!(this.Paused))))
            {
                this.m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.GAME_TICK_START, {}));
                if ((!(this.FSCutscene)))
                {
                    this.tickTimers();
                };
            };
            if ((((!(this.m_wasReset)) && (this.READY)) && (!(this.Paused))))
            {
                this.entranceCheck();
                GameController.hud.updateHealthBoxVisibility();
                GameController.hud.updateCPUDamage();
                if (this.GAME.UsingTime)
                {
                    this.TIMER.PERFORMALL();
                };
            };
            if ((((!(this.m_wasReset)) && (this.READY)) && (!(this.Paused))))
            {
                this.m_crowdChantTimer.tick();
                if (((this.m_crowdChantTimer.IsComplete) && (this.m_crowdChantID > 0)))
                {
                    this.stopCrowdChant();
                    this.playSpecificVoice("crowdcheer_end");
                };
                if (this.m_crowdChantID < 0)
                {
                    this.m_crowdChantDelay.tick();
                };
            };
            if ((((!(this.m_wasReset)) && (this.READY)) && (!(this.Paused))))
            {
                _local_2 = 0;
                while (_local_2 < this.TARGETS.length)
                {
                    if (this.TARGETS[_local_2] != null)
                    {
                        this.TARGETS[_local_2].PREPERFORM();
                        this.TARGETS[_local_2].PERFORMALL();
                        this.TARGETS[_local_2].POSTPERFORM();
                    };
                    _local_2++;
                };
            };
            if ((((!(this.m_wasReset)) && (this.READY)) && (!(this.Paused))))
            {
                _local_2 = 0;
                while (_local_2 < this.MOVINGPLATFORMS.length)
                {
                    if (this.MOVINGPLATFORMS[_local_2] != null)
                    {
                        this.MOVINGPLATFORMS[_local_2].PREPERFORM();
                        this.MOVINGPLATFORMS[_local_2].PERFORMALL();
                        this.MOVINGPLATFORMS[_local_2].POSTPERFORM();
                    };
                    _local_2++;
                };
            };
            _local_1 = 1;
            while ((((_local_1 <= Main.MAXPLAYERS) && (!(this.m_wasReset))) && (this.READY)))
            {
                if (this.getPlayer(_local_1) != null)
                {
                    if (this.STAGE != null)
                    {
                        this.getPlayer(_local_1).PREPERFORM();
                        this.getPlayer(_local_1).PERFORMALL();
                        this.getPlayer(_local_1).POSTPERFORM();
                        if (((((!(this.REPLAYMODE)) && (ModeFeatures.hasFeature(ModeFeatures.ALLOW_REPLAY_RECORD, this.GAME.GameMode))) && (!(this.Paused))) && (this.getPlayer(_local_1).IsHuman)))
                        {
                            this.m_replayData.pushControls(_local_1, this.getPlayer(_local_1).ControlSettings.getControlObjectBits(this.getPlayer(_local_1).getControls(true)));
                        };
                    };
                };
                _local_1++;
            };
            if (this.m_endTrigger)
            {
                this.m_endTrigger = false;
                this.prepareEndGame(this.m_slowFrameRate);
            };
            if (((!(this.m_wasReset)) && (this.READY)))
            {
                if ((!(this.ActuallyPaused)))
                {
                    this.advanceAllStageFrames();
                    this.nextFrameAllEffects();
                };
                _local_3 = 0;
                while (_local_3 < this.HAZARDS.length)
                {
                    if (((!(this.HAZARDS[_local_3] == null)) && (this.HAZARDS[_local_3].Active)))
                    {
                        this.HAZARDS[_local_3].PREPERFORM();
                        this.HAZARDS[_local_3].PERFORMALL();
                        this.HAZARDS[_local_3].POSTPERFORM();
                    };
                    _local_3++;
                };
                _local_1 = 0;
                while (_local_1 < this.ENEMY.length)
                {
                    if (((!(this.ENEMY[_local_1] == null)) && (!(this.ENEMY[_local_1].Dead))))
                    {
                        this.ENEMY[_local_1].PREPERFORM();
                        this.ENEMY[_local_1].PERFORMALL();
                        if (this.ENEMY[_local_1] != null)
                        {
                            this.ENEMY[_local_1].POSTPERFORM();
                        }
                        else
                        {
                            this.ENEMY.splice(_local_1--, 1);
                        };
                    }
                    else
                    {
                        if (((!(this.ENEMY[_local_1] == null)) && (this.ENEMY[_local_1].Dead)))
                        {
                            this.ENEMY[_local_1].destroy();
                            this.ENEMY.splice(_local_1--, 1);
                        };
                    };
                    _local_1++;
                };
                _local_1 = 0;
                while (_local_1 < this.PROJECTILES.length)
                {
                    if (((!(this.PROJECTILES[_local_1] == null)) && (!(this.PROJECTILES[_local_1].Dead))))
                    {
                        this.PROJECTILES[_local_1].PREPERFORM();
                        if (this.PROJECTILES[_local_1])
                        {
                            this.PROJECTILES[_local_1].PERFORMALL();
                        };
                        if (this.PROJECTILES[_local_1])
                        {
                            this.PROJECTILES[_local_1].POSTPERFORM();
                        };
                    }
                    else
                    {
                        if (((!(this.PROJECTILES[_local_1] == null)) && (this.PROJECTILES[_local_1].Dead)))
                        {
                            this.PROJECTILES[_local_1].destroy();
                            this.PROJECTILES.splice(_local_1--, 1);
                        };
                    };
                    _local_1++;
                };
                this.ITEMS.PERFORMALL();
                this.CAM.PERFORMALL();
                if (this.GAME.GameMode == Mode.TRAINING)
                {
                    GameController.hud.updateHelpMenu();
                };
            };
            if ((((!(this.m_wasReset)) && (this.READY)) && (!(this.Paused))))
            {
                this.m_soundMemory.clear();
                this.m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.GAME_TICK_END, {}));
            };
            if (((this.m_gameEnded) && (this.READY)))
            {
                this.m_endGameTimer.tick();
                if (this.m_endGameTimer.IsComplete)
                {
                    this.endGame();
                };
            };
            this.m_justPaused = false;
            if (((this.ONLINEMODE) && (!(this.Paused))))
            {
                if ((!(this.m_onlineFrameBuffer.IsComplete)))
                {
                    MultiplayerManager.sendMyDataFrame(MultiplayerManager.MasterFrame, {"controls":SaveData.Controller1.getControlObjectBits(SaveData.Controller1.getControlStatus())});
                    MultiplayerManager.MasterFrame++;
                    this.m_onlineFrameBuffer.tick();
                };
                MultiplayerManager.PERFORMALL();
            };
            if ((((((this.REPLAYMODE) && (!(this.m_wasReset))) && (this.READY)) && (!(this.Paused))) && (this.m_elapsedFrames >= this.m_replayData.FrameCount)))
            {
                this.endGame(true);
            };
        }

        public function addEventListener(_arg_1:*, _arg_2:String, _arg_3:Function, _arg_4:Object=null):void
        {
            if (_arg_1 == null)
            {
                this.m_eventManager.addEventListener(_arg_2, _arg_3);
            }
            else
            {
                if ((_arg_1 as InteractiveSprite))
                {
                    InteractiveSprite(_arg_1).addEventListener(_arg_2, _arg_3, _arg_4);
                };
            };
        }

        public function removeEventListener(_arg_1:*, _arg_2:String, _arg_3:Function):void
        {
            if (_arg_1 == null)
            {
                this.m_eventManager.removeEventListener(_arg_2, _arg_3);
            }
            else
            {
                if ((_arg_1 as InteractiveSprite))
                {
                    InteractiveSprite(_arg_1).removeEventListener(_arg_2, _arg_3);
                };
            };
        }

        public function createTimer(_arg_1:*, _arg_2:int, _arg_3:int, _arg_4:Function, _arg_5:Object=null):void
        {
            var _local_6:Object;
            var _local_7:*;
            if (_arg_1 == null)
            {
                _local_6 = {
                    "persistant":false,
                    "hitStunPause":false,
                    "condition":null,
                    "inverseCondition":null
                };
                if ((!(_arg_5)))
                {
                    _arg_5 = new Object();
                };
                for (_local_7 in _local_6)
                {
                    if (_arg_5[_local_7] === undefined)
                    {
                        _arg_5[_local_7] = _local_6[_local_7];
                    };
                };
                this.m_timerEvents.push({
                    "current_time":_arg_2,
                    "max_time":_arg_2,
                    "func":_arg_4,
                    "repeats":_arg_3,
                    "options":_arg_5
                });
            }
            else
            {
                if ((_arg_1 as InteractiveSprite))
                {
                    InteractiveSprite(_arg_1).createTimer(_arg_2, _arg_3, _arg_4, _arg_5);
                };
            };
        }

        private function tickTimers():void
        {
            var _local_1:int;
            var _local_2:Array = new Array();
            _local_1 = 0;
            while (_local_1 < this.m_timerEvents.length)
            {
                this.m_timerEvents[_local_1].current_time--;
                if (this.m_timerEvents[_local_1].current_time <= 0)
                {
                    if (((!((!(this.m_timerEvents[_local_1].options.condition == null)) && (!(this.m_timerEvents[_local_1].options.condition())))) && (!((!(this.m_timerEvents[_local_1].options.inverseCondition == null)) && (this.m_timerEvents[_local_1].options.inverseCondition())))))
                    {
                        _local_2.push(this.m_timerEvents[_local_1]);
                    };
                    this.m_timerEvents[_local_1].current_time = this.m_timerEvents[_local_1].max_time;
                    if (this.m_timerEvents[_local_1].repeats > 0)
                    {
                        if (this.m_timerEvents[_local_1].repeats == 1)
                        {
                            this.m_timerEvents[_local_1].repeats--;
                            this.m_timerEvents.splice(_local_1--, 1);
                        }
                        else
                        {
                            this.m_timerEvents[_local_1].repeats--;
                        };
                    };
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < _local_2.length)
            {
                if (this.m_timerEvents.indexOf(_local_2[_local_1]) >= 0)
                {
                    _local_2[_local_1].func();
                };
                _local_1++;
            };
        }

        protected function flushTimers():void
        {
            while (this.m_timerEvents.length > 0)
            {
                this.m_timerEvents.splice(0, 1);
            };
        }

        public function destroyTimer(_arg_1:*, _arg_2:Function):void
        {
            var _local_3:int;
            if (_arg_1 == null)
            {
                _local_3 = 0;
                while (_local_3 < this.m_timerEvents.length)
                {
                    if (this.m_timerEvents[_local_3].func == _arg_2)
                    {
                        this.m_timerEvents.splice(_local_3--, 1);
                    };
                    _local_3++;
                };
            }
            else
            {
                if ((_arg_1 as InteractiveSprite))
                {
                    InteractiveSprite(_arg_1).destroyTimer(_arg_2);
                };
            };
        }

        public function getPlayer(_arg_1:int):Character
        {
            if (((_arg_1 <= 0) || (this.PLAYERS[(_arg_1 - 1)] == null)))
            {
                return (null);
            };
            return (this.PLAYERS[(_arg_1 - 1)] as Character);
        }

        public function getPlayerByMC(_arg_1:MovieClip):Character
        {
            var _local_2:int;
            while (_local_2 < this.PLAYERS.length)
            {
                if (((this.PLAYERS[_local_2]) && ((this.PLAYERS[_local_2].MC == _arg_1) || ((!(this.PLAYERS[_local_2].Stance == null)) && (this.PLAYERS[_local_2].Stance == _arg_1)))))
                {
                    return (this.PLAYERS[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function hasEnemy(_arg_1:Class):Boolean
        {
            var _local_2:int;
            while (_local_2 < this.ENEMY.length)
            {
                if ((this.ENEMY[_local_2] is _arg_1))
                {
                    return (true);
                };
                _local_2++;
            };
            return (false);
        }

        public function getEnemy(_arg_1:int):Enemy
        {
            var _local_2:int;
            while (_local_2 < this.ENEMY.length)
            {
                if (((this.ENEMY[_local_2]) && (this.ENEMY[_local_2].UID == _arg_1)))
                {
                    return (this.ENEMY[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function getEnemyByMC(_arg_1:MovieClip):Enemy
        {
            var _local_2:int;
            while (_local_2 < this.ENEMY.length)
            {
                if (((this.ENEMY[_local_2]) && ((this.ENEMY[_local_2].MC == _arg_1) || ((!(this.ENEMY[_local_2].Stance == null)) && (this.ENEMY[_local_2].Stance == _arg_1)))))
                {
                    return (this.ENEMY[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function getPlayerByName(_arg_1:String):Character
        {
            var _local_2:int = Number(new String(_arg_1).substring(6));
            if (this.PLAYERS[(_local_2 - 1)] == null)
            {
                return (null);
            };
            return (this.PLAYERS[(_local_2 - 1)] as Character);
        }

        public function getControllerNum(_arg_1:int):Controller
        {
            if (this.CONTROLLERS[(_arg_1 - 1)] == null)
            {
                return (null);
            };
            return (this.CONTROLLERS[(_arg_1 - 1)] as Controller);
        }

        public function getPlayerArray():Array
        {
            var _local_2:*;
            var _local_1:Array = new Array();
            for (_local_2 in this.PLAYERS)
            {
                if (this.PLAYERS[_local_2] != null)
                {
                    _local_1.push(this.PLAYERS[_local_2]);
                };
            };
            return (_local_1);
        }

        public function getEnemyArray():Array
        {
            var _local_2:*;
            var _local_1:Array = new Array();
            for (_local_2 in this.ENEMY)
            {
                if (this.ENEMY[_local_2] != null)
                {
                    _local_1.push(this.ENEMY[_local_2]);
                };
            };
            return (_local_1);
        }

        public function getWalls():Vector.<CollisionBoundary>
        {
            return (this.WALLS);
        }

        public function getWarningBounds_UL():Vector.<CollisionBoundary>
        {
            return (this.WARNINGBOUNDS_UL);
        }

        public function getWarningBounds_UR():Vector.<CollisionBoundary>
        {
            return (this.WARNINGBOUNDS_UR);
        }

        public function getWarningBounds_LL():Vector.<CollisionBoundary>
        {
            return (this.WARNINGBOUNDS_LL);
        }

        public function getWarningBounds_LR():Vector.<CollisionBoundary>
        {
            return (this.WARNINGBOUNDS_LR);
        }

        public function getLedges_L():Vector.<MovieClip>
        {
            return (this.LEDGES_L);
        }

        public function getLedges_R():Vector.<MovieClip>
        {
            return (this.LEDGES_R);
        }

        public function getBeacons():Vector.<Beacon>
        {
            return (this.BEACONS);
        }

        public function getAdjMatrix():Array
        {
            return (this.ADJMATRIX);
        }

        public function getRandomPokemon():Class
        {
            return (((Utils.random() < 0.025) && (this.m_pokemonRare.length > 0)) ? this.m_pokemonRare[Math.round((Utils.random() * (this.m_pokemonRare.length - 1)))] : this.m_pokemon[Math.round((Utils.random() * (this.m_pokemon.length - 1)))]);
        }

        public function getRandomAssist():Class
        {
            return (((Utils.random() < 0.025) && (this.m_assistsRare.length > 0)) ? this.m_assistsRare[Math.round((Utils.random() * (this.m_assistsRare.length - 1)))] : this.m_assists[Math.round((Utils.random() * (this.m_assists.length - 1)))]);
        }

        public function getItem(_arg_1:int):Item
        {
            return (this.ITEMS.getItemByID(_arg_1));
        }

        public function getItemByMC(_arg_1:MovieClip):Item
        {
            return (this.ITEMS.getItemByMC(_arg_1));
        }

        public function getItemGens():Vector.<MovieClip>
        {
            return (this.ITEMGENS);
        }

        public function spawnPokemon(_arg_1:Class, _arg_2:Number, _arg_3:Number, _arg_4:int=-1):Pokemon
        {
            var _local_5:Enemy = this.spawnEnemy(_arg_1, _arg_2, _arg_3, _arg_4);
            if (_local_5 == null)
            {
                return (null);
            };
            return (_local_5 as Pokemon);
        }

        public function spawnAssist(_arg_1:Class, _arg_2:Number, _arg_3:Number, _arg_4:int=-1):AssistTrophy
        {
            var _local_5:Enemy = this.spawnEnemy(_arg_1, _arg_2, _arg_3, _arg_4);
            if (_local_5 == null)
            {
                return (null);
            };
            return (_local_5 as AssistTrophy);
        }

        public function spawnEnemy(_arg_1:Class, _arg_2:Number, _arg_3:Number, _arg_4:int=-1):Enemy
        {
            this.ENEMY.push(new _arg_1(this, _arg_2, _arg_3, _arg_4));
            return (this.ENEMY[(this.ENEMY.length - 1)]);
        }

        public function addProjectile(_arg_1:Projectile):Projectile
        {
            this.PROJECTILES.push(_arg_1);
            return (this.PROJECTILES[(this.PROJECTILES.length - 1)]);
        }

        public function getProjectile(_arg_1:int):Projectile
        {
            var _local_2:int;
            while (_local_2 < this.PROJECTILES.length)
            {
                if (this.PROJECTILES[_local_2].UID == _arg_1)
                {
                    return (this.PROJECTILES[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function getProjectileByMC(_arg_1:MovieClip):Projectile
        {
            var _local_2:int;
            while (_local_2 < this.PROJECTILES.length)
            {
                if (((this.PROJECTILES[_local_2]) && ((this.PROJECTILES[_local_2].MC == _arg_1) || ((!(this.PROJECTILES[_local_2].Stance == null)) && (this.PROJECTILES[_local_2].Stance == _arg_1)))))
                {
                    return (this.PROJECTILES[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function removeEnemy(_arg_1:Enemy):void
        {
            var _local_2:int;
            while (_local_2 < this.ENEMY.length)
            {
                if (this.ENEMY[_local_2] == _arg_1)
                {
                    this.ENEMY[_local_2] = null;
                };
                _local_2++;
            };
        }

        public function populateMatchResults(_arg_1:int, _arg_2:MovieClip):void
        {
            var _local_3:String;
            var _local_4:int;
            var _local_5:int;
            if (this.getPlayer(_arg_1) != null)
            {
                if (this.GAME.LevelData.teams)
                {
                    _arg_2.gotoAndStop(("p" + Utils.convertTeamToColor(_arg_1, this.getPlayer(_arg_1).Team)));
                }
                else
                {
                    _arg_2.gotoAndStop(("p" + _arg_1));
                };
                _arg_2.playerNum.text = ("P" + _arg_1);
                _arg_2.score.text = ((this.getPlayer(_arg_1).getMatchResults().Score >= 0) ? ("+" + this.getPlayer(_arg_1).getMatchResults().Score) : this.getPlayer(_arg_1).getMatchResults().Score);
                _arg_2.kos.text = this.getPlayer(_arg_1).getMatchResults().KOs;
                _arg_2.falls.text = this.getPlayer(_arg_1).getMatchResults().Falls;
                _arg_2.sds.text = this.getPlayer(_arg_1).getMatchResults().SelfDestructs;
                _arg_2.dmgGiven.text = (Math.floor(this.getPlayer(_arg_1).getMatchResults().DamageGiven) + "%");
                _arg_2.dmgTaken.text = (Math.floor(this.getPlayer(_arg_1).getMatchResults().DamageTaken) + "%");
                _arg_2.pitch.text = (Math.floor(this.getPlayer(_arg_1).getMatchResults().FastestPitch) + "pps");
                _arg_2.speed.text = (Math.floor(this.getPlayer(_arg_1).getMatchResults().TopSpeed) + "pps");
                _arg_2.drought.text = (Math.floor((this.getPlayer(_arg_1).getMatchResults().LongestDrought / 30)) + "s");
                _local_3 = (("KO List for player " + _arg_1) + ": ");
                _local_4 = 0;
                while (_local_4 < this.getPlayer(_arg_1).getMatchResults().KOList.length)
                {
                    _local_3 = (_local_3 + (this.getPlayer(_arg_1).getMatchResults().KOList[_local_4] + " "));
                    _local_4++;
                };
                trace(_local_3);
                _local_3 = (("Killer List for player " + _arg_1) + ": ");
                _local_5 = 0;
                while (_local_5 < this.getPlayer(_arg_1).getMatchResults().KillerList.length)
                {
                    _local_3 = (_local_3 + (this.getPlayer(_arg_1).getMatchResults().KillerList[_local_5] + " "));
                    _local_5++;
                };
                trace(_local_3);
                _arg_2.visible = true;
            };
        }

        public function getTeams():Array
        {
            var _local_1:Array = new Array();
            var _local_2:int;
            while (_local_2 < this.PLAYERS.length)
            {
                if (((!(this.PLAYERS[_local_2] == null)) && (_local_1.indexOf(this.PLAYERS[_local_2].Team) < 0)))
                {
                    _local_1.push(this.PLAYERS[_local_2].Team);
                };
                _local_2++;
            };
            return (_local_1);
        }

        public function setTeamRanks(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            while (_local_3 < this.PLAYERS.length)
            {
                if (((!(this.PLAYERS[_local_3] == null)) && (this.PLAYERS[_local_3].Team == _arg_1)))
                {
                    this.PLAYERS[_local_3].getMatchResults().Rank = _arg_2;
                };
                _local_3++;
            };
        }

        public function updateRanks():void
        {
            var _local_1:int;
            var _local_2:int = 1;
            var _local_3:Vector.<MatchResults> = new Vector.<MatchResults>();
            var _local_4:Array = this.getTeams();
            if (_local_4.length > 1)
            {
                if (this.GAME.UsingLives)
                {
                    _local_1 = 0;
                    while (_local_1 < _local_4.length)
                    {
                        _local_3.push(new MatchResults(_local_4[_local_1]));
                        _local_1++;
                    };
                    _local_1 = 0;
                    while (_local_1 < this.PLAYERS.length)
                    {
                        if (this.PLAYERS[_local_1] != null)
                        {
                            _local_3[_local_4.indexOf(this.PLAYERS[_local_1].Team)].StockRemaining = (_local_3[_local_4.indexOf(this.PLAYERS[_local_1].Team)].StockRemaining + this.PLAYERS[_local_1].getMatchResults().StockRemaining);
                            _local_3[_local_4.indexOf(this.PLAYERS[_local_1].Team)].SurvivalTime = (_local_3[_local_4.indexOf(this.PLAYERS[_local_1].Team)].SurvivalTime + this.PLAYERS[_local_1].getMatchResults().SurvivalTime);
                        };
                        _local_1++;
                    };
                    _local_3.sort(this.compareMatchResultsForStock);
                    _local_1 = 0;
                    while (_local_1 < _local_3.length)
                    {
                        this.setTeamRanks(_local_3[_local_1].Owner, _local_2);
                        while (_local_1 < _local_3.length)
                        {
                            if ((_local_1 + 1) < _local_3.length)
                            {
                                if (_local_3[(_local_1 + 1)].StockRemaining == _local_3[_local_1].StockRemaining)
                                {
                                    if (_local_3[(_local_1 + 1)].SurvivalTime == _local_3[_local_1].SurvivalTime)
                                    {
                                        this.setTeamRanks(_local_3[++_local_1].Owner, _local_2);
                                    }
                                    else
                                    {
                                        break;
                                    };
                                }
                                else
                                {
                                    break;
                                };
                            }
                            else
                            {
                                break;
                            };
                        };
                        _local_1++;
                        _local_2++;
                    };
                }
                else
                {
                    _local_1 = 0;
                    while (_local_1 < _local_4.length)
                    {
                        _local_3.push(new MatchResults(_local_4[_local_1]));
                        _local_1++;
                    };
                    _local_1 = 0;
                    while (_local_1 < this.PLAYERS.length)
                    {
                        if (this.PLAYERS[_local_1] != null)
                        {
                            _local_3[_local_4.indexOf(this.PLAYERS[_local_1].Team)].Score = (_local_3[_local_4.indexOf(this.PLAYERS[_local_1].Team)].Score + this.PLAYERS[_local_1].getMatchResults().Score);
                        };
                        _local_1++;
                    };
                    _local_3.sort(this.compareMatchResultsForTime);
                    _local_1 = 0;
                    while (_local_1 < _local_3.length)
                    {
                        this.setTeamRanks(_local_3[_local_1].Owner, _local_2);
                        while (_local_1 < _local_3.length)
                        {
                            if ((((_local_1 + 1) < _local_3.length) && (_local_3[(_local_1 + 1)].Score == _local_3[_local_1].Score)))
                            {
                                this.setTeamRanks(_local_3[++_local_1].Owner, _local_2);
                            }
                            else
                            {
                                break;
                            };
                        };
                        _local_1++;
                        _local_2++;
                    };
                };
            }
            else
            {
                if (this.GAME.UsingLives)
                {
                    _local_1 = 0;
                    while (_local_1 < this.PLAYERS.length)
                    {
                        if (this.PLAYERS[_local_1] != null)
                        {
                            _local_3.push(this.PLAYERS[_local_1].getMatchResults());
                        };
                        _local_1++;
                    };
                    _local_3.sort(this.compareMatchResultsForStock);
                    _local_1 = 0;
                    while (_local_1 < _local_3.length)
                    {
                        this.getPlayer(_local_3[_local_1].Owner).getMatchResults().Rank = _local_2;
                        while (_local_1 < _local_3.length)
                        {
                            if ((_local_1 + 1) < _local_3.length)
                            {
                                if (_local_3[(_local_1 + 1)].StockRemaining == _local_3[_local_1].StockRemaining)
                                {
                                    if (_local_3[(_local_1 + 1)].DamageRemaining == _local_3[_local_1].DamageRemaining)
                                    {
                                        if (_local_3[(_local_1 + 1)].SurvivalTime == _local_3[_local_1].SurvivalTime)
                                        {
                                            this.getPlayer(_local_3[++_local_1].Owner).getMatchResults().Rank = _local_2;
                                        }
                                        else
                                        {
                                            break;
                                        };
                                    }
                                    else
                                    {
                                        break;
                                    };
                                }
                                else
                                {
                                    break;
                                };
                            }
                            else
                            {
                                break;
                            };
                        };
                        _local_1++;
                        _local_2++;
                    };
                }
                else
                {
                    _local_1 = 0;
                    while (_local_1 < this.PLAYERS.length)
                    {
                        if (this.PLAYERS[_local_1] != null)
                        {
                            _local_3.push(this.PLAYERS[_local_1].getMatchResults());
                        };
                        _local_1++;
                    };
                    _local_3.sort(this.compareMatchResultsForTime);
                    _local_1 = 0;
                    while (_local_1 < _local_3.length)
                    {
                        this.getPlayer(_local_3[_local_1].Owner).getMatchResults().Rank = _local_2;
                        while (_local_1 < _local_3.length)
                        {
                            if ((((_local_1 + 1) < _local_3.length) && (_local_3[(_local_1 + 1)].Score == _local_3[_local_1].Score)))
                            {
                                this.getPlayer(_local_3[++_local_1].Owner).getMatchResults().Rank = _local_2;
                            }
                            else
                            {
                                break;
                            };
                        };
                        _local_1++;
                        _local_2++;
                    };
                };
            };
        }

        public function getFirstWinner():Character
        {
            var _local_1:int;
            while (_local_1 < this.PLAYERS.length)
            {
                if (((!(this.PLAYERS[_local_1] == null)) && (this.PLAYERS[_local_1].getMatchResults().Rank == 1)))
                {
                    return (this.PLAYERS[_local_1]);
                };
                _local_1++;
            };
            return (null);
        }

        private function compareMatchResultsForTime(_arg_1:MatchResults, _arg_2:MatchResults):Number
        {
            return (_arg_2.Score - _arg_1.Score);
        }

        private function compareMatchResultsForStock(_arg_1:MatchResults, _arg_2:MatchResults):Number
        {
            if (_arg_1.StockRemaining == _arg_2.StockRemaining)
            {
                return (_arg_2.SurvivalTime - _arg_1.SurvivalTime);
            };
            return (_arg_2.StockRemaining - _arg_1.StockRemaining);
        }

        public function targetDestroyed():void
        {
            var _local_1:int;
            if ((!(this.m_gameEnded)))
            {
                this.m_remainingTargets--;
                if (this.m_remainingTargets <= 0)
                {
                    this.prepareEndGame(false);
                    this.m_paused = true;
                    this.attachUniqueMovieHUD("success_mc");
                    this.TIMER.Stop();
                    this.TIMER.updateTextFields();
                    if ((!(SaveData.getTargetTestData(StageSetting.CurrentID, this.getPlayer(1).StatsName))))
                    {
                        SaveData.setTargetTestData(StageSetting.CurrentID, this.getPlayer(1).StatsName, {
                            "score":0,
                            "fps":0
                        });
                    };
                    _local_1 = SaveData.getTargetTestData(StageSetting.CurrentID, this.getPlayer(1).StatsName).score;
                    if (((_local_1 == 0) || (this.TIMER.CurrentTime < _local_1)))
                    {
                        this.playSpecificVoice("narrator_record");
                        SaveData.getTargetTestData(StageSetting.CurrentID, this.getPlayer(1).StatsName).score = this.TIMER.CurrentTime;
                        SaveData.getTargetTestData(StageSetting.CurrentID, this.getPlayer(1).StatsName).fps = (Math.round(((this.m_elapsedFrames / (this.m_endTime - this.m_startTime)) * 10000)) / 10);
                        SaveData.saveGame();
                    }
                    else
                    {
                        this.playSpecificVoice("narrator_success");
                    };
                };
            };
        }

        public function restartMusic():void
        {
            this.SOUNDQUEUE.playMusic(this.m_music, this.m_loopLoc);
        }

        public function get ElapsedFrames():int
        {
            return (this.m_elapsedFrames);
        }

        public function get ActiveScripts():Boolean
        {
            return (this.m_activeScripts);
        }

        public function get CrowdChantID():int
        {
            return (this.m_crowdChantID);
        }

        public function get ReplayDataObj():ReplayData
        {
            return (this.m_replayData);
        }

        public function get HazardsOn():Boolean
        {
            return (this.m_hazardsOn);
        }

        public function get MeleeAirDodge():Boolean
        {
            return (this.m_meleeAirDodge);
        }

        public function set MeleeAirDodge(_arg_1:Boolean):void
        {
            this.m_meleeAirDodge = _arg_1;
        }

        public function get GravityMultiplier():Number
        {
            return (this.m_gravityMultiplier);
        }

        public function get DisableCeilingDeath():Boolean
        {
            return (this.m_disableCeilingDeath);
        }

        public function set DisableCeilingDeath(_arg_1:Boolean):void
        {
            this.m_disableCeilingDeath = _arg_1;
        }

        public function get DisableFallDeath():Boolean
        {
            return (this.m_disableFallDeath);
        }

        public function set DisableFallDeath(_arg_1:Boolean):void
        {
            this.m_disableFallDeath = _arg_1;
        }

        public function get MatchMilliseconds():Number
        {
            return (this.m_endTime - this.m_startTime);
        }

        public function get Terrains():Vector.<Platform>
        {
            return (this.TERRAINS);
        }

        public function get Platforms():Vector.<Platform>
        {
            return (this.PLATFORMS);
        }

        public function get MovingPlatforms():Vector.<MovingPlatform>
        {
            return (this.MOVINGPLATFORMS);
        }

        public function get LogText():String
        {
            return (this.m_logText);
        }

        public function set LogText(_arg_1:String):void
        {
            this.m_logText = _arg_1;
        }

        public function get Ready():Boolean
        {
            return (this.READY);
        }

        public function get OnlineMode():Boolean
        {
            return (this.ONLINEMODE);
        }

        public function set OnlineMode(_arg_1:Boolean):void
        {
            this.ONLINEMODE = _arg_1;
        }

        public function get ReplayMode():Boolean
        {
            return (this.REPLAYMODE);
        }

        public function set ReplayMode(_arg_1:Boolean):void
        {
            this.REPLAYMODE = _arg_1;
        }

        public function get NoContest():Boolean
        {
            return (this.m_noContest);
        }

        public function get NoHumans():Boolean
        {
            var _local_3:*;
            var _local_1:Boolean = true;
            var _local_2:Array = this.getPlayerArray();
            for (_local_3 in _local_2)
            {
                if (((!(_local_2[_local_3] == null)) && (_local_2[_local_3].IsHuman)))
                {
                    _local_1 = false;
                };
            };
            return (_local_1);
        }

        public function get StageEvent():Boolean
        {
            return (this.m_event);
        }

        public function get EventManagerObj():EventManager
        {
            return (this.m_eventManager);
        }

        public function get RootRef():MovieClip
        {
            return (this.ROOT);
        }

        public function get LightSource():MovieClip
        {
            return (this.LIGHTSOURCE);
        }

        public function get StageRef():MovieClip
        {
            return (this.STAGE);
        }

        public function get StageParentRef():MovieClip
        {
            return (this.STAGEPARENT);
        }

        public function get StageEffectsRef():MovieClip
        {
            return (this.STAGEEFFECTS);
        }

        public function get HudRef():MovieClip
        {
            return (this.HUD);
        }

        public function get HudForegroundRef():MovieClip
        {
            return (this.HUDFOREGROUND);
        }

        public function get HudOverlayRef():MovieClip
        {
            return (this.HUDOVERLAY);
        }

        public function get CamRef():Vcam
        {
            return (this.CAM);
        }

        public function get CamBounds():MovieClip
        {
            return (this.CAMBOUNDS);
        }

        public function get SmashBallBounds():MovieClip
        {
            return (this.SMASHBALLBOUNDS);
        }

        public function get DeathBounds():MovieClip
        {
            return (this.DEATHBOUNDS);
        }

        public function get ItemsRef():ItemGenerator
        {
            return (this.ITEMS);
        }

        public function get GameRef():Game
        {
            return (this.GAME);
        }

        public function get SoundQueueRef():SoundQueue
        {
            return (this.SOUNDQUEUE);
        }

        public function get TimerRef():GameTimer
        {
            return (this.TIMER);
        }

        public function get PlayerList():Vector.<int>
        {
            return (this.m_playerIDs);
        }

        public function get FSCutscene():Boolean
        {
            return (this.m_fsCutscene);
        }

        public function set FSCutscene(_arg_1:Boolean):void
        {
            this.m_fsCutscene = _arg_1;
        }

        public function get JustPaused():Boolean
        {
            return (this.m_justPaused);
        }

        public function get Paused():Boolean
        {
            return ((this.m_paused) || (this.m_fsCutscene));
        }

        public function get ActuallyPaused():Boolean
        {
            return (this.m_paused);
        }

        public function set Paused(_arg_1:Boolean):void
        {
            var _local_2:Vector.<MovieClip>;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Vector.<MovieClip>;
            var _local_6:int;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            this.m_justPaused = true;
            if (this.GAME.GameMode == Mode.TRAINING)
            {
                this.m_freezeKeys = (!(this.m_freezeKeys));
                if (this.m_freezeKeys)
                {
                    GameController.hud.showTrainingDisplay();
                    _local_2 = new Vector.<MovieClip>();
                    _local_3 = 0;
                    while (_local_3 < this.PLAYERS.length)
                    {
                        if (((!(this.PLAYERS[_local_3] == null)) && (!(this.PLAYERS[_local_3].StandBy))))
                        {
                            _local_2.push(this.PLAYERS[_local_3].MC);
                        };
                        _local_3++;
                    };
                    if (this.ItemsRef.CurrentSmashBall != null)
                    {
                        _local_2.push(this.ItemsRef.CurrentSmashBall.ItemInstance);
                    };
                    this.CAM.deleteTargets(_local_2);
                    _local_2 = _local_2.slice(0, 1);
                    this.CAM.addTargets(_local_2);
                }
                else
                {
                    GameController.hud.hideTrainingDisplay();
                    _local_4 = 1;
                    while (_local_4 < this.PLAYERS.length)
                    {
                        if (this.PLAYERS[_local_4] != null)
                        {
                            this.PLAYERS[_local_4].setDamage(GameController.hud.CpuDamage);
                        };
                        _local_4++;
                    };
                    _local_5 = new Vector.<MovieClip>();
                    _local_6 = 0;
                    while (_local_6 < this.PLAYERS.length)
                    {
                        if (((!(this.PLAYERS[_local_6] == null)) && (!(this.PLAYERS[_local_6].StandBy))))
                        {
                            _local_5.push(this.PLAYERS[_local_6].MC);
                        };
                        _local_6++;
                    };
                    _local_5.splice(0, 1);
                    if (((!(this.ItemsRef.CurrentSmashBall == null)) && (!(this.CAM.Mode == Vcam.ZOOM_MODE))))
                    {
                        _local_5.push(this.ItemsRef.CurrentSmashBall.ItemInstance);
                    };
                    if (((_local_5.length > 0) && (!(this.CAM.Mode == Vcam.ZOOM_MODE))))
                    {
                        this.CAM.addTargets(_local_5);
                    };
                };
            }
            else
            {
                this.m_paused = _arg_1;
                if ((!(this.m_paused)))
                {
                    this.HUDFOREGROUND.visible = true;
                    this.HUD.pause_menu.visible = false;
                    this.HUD.camIcon.visible = false;
                    GameController.hud.showHealthBoxes();
                    for (_local_7 in this.ENEMY)
                    {
                        if (((!(this.ENEMY[_local_7] == null)) && (!(this.ENEMY[_local_7].Dead))))
                        {
                            this.ENEMY[_local_7].unpause();
                        };
                    };
                    if (this.GAME.UsingTime)
                    {
                        this.TIMER.TimeMC.visible = true;
                    };
                    this.SOUNDQUEUE.unpauseAllSounds();
                }
                else
                {
                    this.HUDFOREGROUND.visible = false;
                    this.HUD.camIcon.visible = true;
                    this.HUD.pause_menu.visible = true;
                    GameController.hud.hideHealthBoxes();
                    for (_local_8 in this.PLAYERS)
                    {
                        if (this.PLAYERS[_local_8] != null)
                        {
                            Utils.recursiveMovieClipPlay(this.PLAYERS[_local_8].MC.stance, false);
                        };
                    };
                    for (_local_9 in this.ENEMY)
                    {
                        if (((!(this.ENEMY[_local_9] == null)) && (!(this.ENEMY[_local_9].Dead))))
                        {
                            this.ENEMY[_local_9].pause();
                        };
                    };
                    this.TIMER.TimeMC.visible = false;
                    this.SOUNDQUEUE.pauseAllSounds();
                };
            };
        }

        public function get PausedID():int
        {
            return (this.m_paused_id);
        }

        public function set PausedID(_arg_1:int):void
        {
            this.m_paused_id = _arg_1;
            if (((this.m_paused) && (!(this.GAME.GameMode == Mode.TRAINING))))
            {
                this.HUD.pause_menu.key_up.text = this.HUD.pause_menu.keyArr[this.getControllerNum(this.m_paused_id)._UP];
                this.HUD.pause_menu.key_down.text = this.HUD.pause_menu.keyArr[this.getControllerNum(this.m_paused_id)._DOWN];
                this.HUD.pause_menu.key_left.text = this.HUD.pause_menu.keyArr[this.getControllerNum(this.m_paused_id)._LEFT];
                this.HUD.pause_menu.key_right.text = this.HUD.pause_menu.keyArr[this.getControllerNum(this.m_paused_id)._RIGHT];
                this.HUD.pause_menu.key_pause.text = this.HUD.pause_menu.keyArr[this.getControllerNum(this.m_paused_id)._START];
                this.HUD.pause_menu.key_a.text = this.HUD.pause_menu.keyArr[this.getControllerNum(this.m_paused_id)._BUTTON1];
                this.HUD.pause_menu.key_b.text = this.HUD.pause_menu.keyArr[this.getControllerNum(this.m_paused_id)._BUTTON2];
                this.HUD.pause_menu.key_pause2.text = this.HUD.pause_menu.keyArr[this.getControllerNum(this.m_paused_id)._START];
                this.HUD.pause_menu.key_a2.text = this.HUD.pause_menu.keyArr[this.getControllerNum(this.m_paused_id)._BUTTON1];
                this.HUD.pause_menu.key_b2.text = this.HUD.pause_menu.keyArr[this.getControllerNum(this.m_paused_id)._BUTTON2];
                this.HUD.pause_menu.p_pause.text = (("P" + this.m_paused_id) + " PAUSE");
                this.CAM.CamMC.width = (this.CAM.OriginalWidth / 3);
                this.CAM.CamMC.height = (this.CAM.OriginalHeight / 3);
                if (((!(this.getPlayer(this.m_paused_id) == null)) && (this.getPlayer(this.m_paused_id).Dead)))
                {
                    this.CAM.CamMC.height = this.CAM.MainTerrain.height;
                    this.CAM.CamMC.width = (this.CAM.MainTerrain.height * (Main.Width / Main.Height));
                    this.CAM.forceInBounds();
                }
                else
                {
                    if (this.getPlayer(this.m_paused_id) != null)
                    {
                        this.CAM.CamMC.x = this.getPlayer(this.m_paused_id).OverlayX;
                        this.CAM.CamMC.y = this.getPlayer(this.m_paused_id).OverlayY;
                        this.CAM.syncPositions();
                        this.CAM.camControl();
                    };
                };
                this.CAM.forceInBounds();
                this.CAM.camControl();
                if (ModeFeatures.hasFeature(ModeFeatures.PAUSE_MAX_ZOOM, this.GAME.GameMode))
                {
                    this.CAM.maxZoomOut();
                    this.CAM.targetCenterStage();
                    this.CAM.forceTarget();
                    this.CAM.forceInBounds();
                    this.CAM.camControl();
                };
            };
        }

        public function set StageEvent(_arg_1:Boolean):void
        {
            if (((this.ONLINEMODE) && (!(_arg_1))))
            {
                this.STAGE.stage.frameRate = 30;
            };
            this.m_event = _arg_1;
        }

        public function set RootRef(_arg_1:MovieClip):void
        {
            this.ROOT = _arg_1;
        }

        public function set StageRef(_arg_1:MovieClip):void
        {
            this.STAGE = _arg_1;
        }

        public function set StageParentRef(_arg_1:MovieClip):void
        {
            this.STAGEPARENT = _arg_1;
        }

        public function set HudRef(_arg_1:MovieClip):void
        {
            this.HUD = _arg_1;
        }

        public function set CamRef(_arg_1:Vcam):void
        {
            this.CAM = _arg_1;
        }

        public function set ItemsRef(_arg_1:ItemGenerator):void
        {
            this.ITEMS = _arg_1;
        }

        public function set GameRef(_arg_1:Game):void
        {
            this.GAME = _arg_1;
        }

        public function set SoundQueueRef(_arg_1:SoundQueue):void
        {
            this.SOUNDQUEUE = _arg_1;
        }

        public function set TimerRef(_arg_1:GameTimer):void
        {
            this.TIMER = _arg_1;
        }

        public function get Targets():Vector.<TargetTestTarget>
        {
            return (this.TARGETS);
        }

        public function get FreezeKeys():Boolean
        {
            return (this.m_freezeKeys);
        }

        public function set FreezeKeys(_arg_1:Boolean):void
        {
            this.m_freezeKeys = _arg_1;
        }

        public function get PokemonCount():int
        {
            return (this.m_pokemonCount);
        }

        public function set PokemonCount(_arg_1:int):void
        {
            this.m_pokemonCount = _arg_1;
        }

        public function get Pokemons():Vector.<Class>
        {
            return (this.m_pokemon);
        }

        public function get PokemonsRare():Vector.<Class>
        {
            return (this.m_pokemonRare);
        }

        public function get AssistCount():int
        {
            return (this.m_assistCount);
        }

        public function set AssistCount(_arg_1:int):void
        {
            this.m_assistCount = _arg_1;
        }

        public function get Assists():Vector.<Class>
        {
            return (this.m_assists);
        }

        public function get AssistsRare():Vector.<Class>
        {
            return (this.m_assistsRare);
        }

        public function get CuccoCount():int
        {
            return (this.m_cuccoCount);
        }

        public function set CuccoCount(_arg_1:int):void
        {
            this.m_cuccoCount = _arg_1;
        }

        public function get EndTrigger():Boolean
        {
            return (this.m_endTrigger);
        }

        public function get GameEnded():Boolean
        {
            return (this.m_gameEnded);
        }

        public function get SizeRatio():Number
        {
            return (this.GAME.SizeRatio);
        }

        public function get Projectiles():Vector.<Projectile>
        {
            return (this.PROJECTILES);
        }

        public function get Enemies():Vector.<Enemy>
        {
            return (this.ENEMY);
        }

        public function get StageBG():MovieClip
        {
            return ((this.STAGEPARENT.background != null) ? this.STAGEPARENT.background : null);
        }

        public function get StageFG():MovieClip
        {
            return ((this.STAGEPARENT.foreground != null) ? this.STAGEPARENT.foreground : null);
        }

        public function get WeatherRef():MovieClip
        {
            return (this.WEATHER);
        }

        public function get WeatherMaskRef():MovieClip
        {
            return (this.WEATHERMASK);
        }

        public function get TagsRef():MovieClip
        {
            return (this.TAGS);
        }

        public function get ShadowsRef():MovieClip
        {
            return (this.SHADOWS);
        }

        public function get ShadowMaskRef():MovieClip
        {
            return (this.SHADOWMASK);
        }

        public function get TeamDamage():Boolean
        {
            return (this.GAME.LevelData.teamDamage);
        }

        public function get CanSuddenDeath():Boolean
        {
            return (this.m_canSuddenDeath);
        }

        public function set CanSuddenDeath(_arg_1:Boolean):void
        {
            this.m_canSuddenDeath = _arg_1;
        }

        public function get SuddenDeath():Boolean
        {
            return (this.m_suddenDeath);
        }

        public function get SuddenDeathIDs():Array
        {
            return (this.m_suddenDeathIDs);
        }

        public function random():Number
        {
            return (Utils.random());
        }

        public function randomInteger(_arg_1:int, _arg_2:int):int
        {
            return (Utils.randomInteger(_arg_1, _arg_2));
        }

        public function fixBG():void
        {
            this.CAM.fixBG();
        }

        public function playNarratorSpeech(_arg_1:Array):void
        {
            var _local_2:int;
            var _local_3:int;
            if (((((!(_arg_1 == null)) && (_arg_1.length > 0)) && (!((this.GAME.UsingTime) && (this.TIMER.CurrentTime < (Main.FRAMERATE * 5))))) && ((this.m_narratorSpeech == null) || (this.m_narratorSpeech.IsFinished))))
            {
                this.m_narratorSpeech = null;
                _local_2 = this.SOUNDQUEUE.playVoiceEffect(_arg_1[_local_3]);
                if (_local_2 >= 0)
                {
                    this.m_narratorSpeech = this.SOUNDQUEUE.getSoundObject(_local_2);
                    _local_3 = 1;
                    while (_local_3 < _arg_1.length)
                    {
                        this.m_narratorSpeech.queueSound(Main.getLibrarySound(_arg_1[_local_3]), SaveData.VAVolumeLevel, _arg_1[_local_3]);
                        _local_3++;
                    };
                };
            };
        }

        public function stopNarratorSpeech():void
        {
            if (this.m_narratorSpeech != null)
            {
                this.m_narratorSpeech.stop();
            };
            this.m_narratorSpeech = null;
        }

        public function playSpecificSound(_arg_1:String, _arg_2:Number=1):int
        {
            if (this.m_soundMemory.containsKey(_arg_1))
            {
                return (-1);
            };
            this.m_soundMemory.setKey(_arg_1, true);
            return (this.SOUNDQUEUE.playSoundEffect(_arg_1, _arg_2));
        }

        public function playSpecificVoice(_arg_1:String, _arg_2:Number=1):int
        {
            if (this.m_soundMemory.containsKey(_arg_1))
            {
                return (-1);
            };
            this.m_soundMemory.setKey(_arg_1, true);
            return (this.SOUNDQUEUE.playVoiceEffect(_arg_1, _arg_2));
        }

        public function stopSound(_arg_1:int):void
        {
            this.SOUNDQUEUE.stopSound(_arg_1);
        }

        public function setCamStageFocus(_arg_1:int):void
        {
            this.CAM.setStageFocus(_arg_1);
        }

        public function removeCamStageFocus():void
        {
            this.CAM.removeStageFocus();
        }

        public function getCamBounds():Object
        {
            var _local_1:Object = new Object();
            _local_1.x = this.CAMBOUNDS.x;
            _local_1.y = this.CAMBOUNDS.y;
            _local_1.width = this.CAMBOUNDS.width;
            _local_1.height = this.CAMBOUNDS.height;
            return (_local_1);
        }

        public function getDeathBounds():Object
        {
            var _local_1:Object = new Object();
            _local_1.x = this.DEATHBOUNDS.x;
            _local_1.y = this.DEATHBOUNDS.y;
            _local_1.width = this.DEATHBOUNDS.width;
            _local_1.height = this.DEATHBOUNDS.height;
            return (_local_1);
        }

        public function calculateChargeDamage(_arg_1:Object):Number
        {
            var _local_2:AttackDamage = new AttackDamage(0);
            _local_2.importAttackDamageData(_arg_1);
            return (Utils.calculateChargeDamage(_local_2));
        }

        public function attachEffect(_arg_1:String, _arg_2:Object=null):MovieClip
        {
            var _local_3:Number = 0;
            var _local_4:Number = 0;
            var _local_5:Number = 1;
            var _local_6:Number = 1;
            if (_arg_2 != null)
            {
                _local_3 = ((_arg_2.x !== undefined) ? _arg_2.x : _local_3);
                _local_4 = ((_arg_2.y !== undefined) ? _arg_2.y : _local_4);
                _local_5 = ((_arg_2.scaleX !== undefined) ? _arg_2.scaleX : _local_5);
                _local_6 = ((_arg_2.scaleY !== undefined) ? _arg_2.scaleY : _local_6);
            };
            var _local_7:MovieClip;
            if (_arg_1 != null)
            {
                _local_7 = this.attachUniqueMovie(_arg_1);
                if (_local_7 != null)
                {
                    _local_7.stop();
                    Utils.recursiveMovieClipPlay(_local_7, false);
                    _local_7.x = _local_3;
                    _local_7.y = _local_4;
                    _local_7.scaleX = (_local_7.scaleX * _local_5);
                    _local_7.scaleY = (_local_7.scaleY * _local_6);
                };
            };
            return (_local_7);
        }

        public function attachEffectOverlay(_arg_1:String, _arg_2:Object=null):MovieClip
        {
            var _local_3:Number = 0;
            var _local_4:Number = 0;
            var _local_5:Number = 1;
            var _local_6:Number = 1;
            if (_arg_2 != null)
            {
                _local_3 = ((_arg_2.x !== undefined) ? _arg_2.x : _local_3);
                _local_4 = ((_arg_2.y !== undefined) ? _arg_2.y : _local_4);
                _local_5 = ((_arg_2.scaleX !== undefined) ? _arg_2.scaleX : _local_5);
                _local_6 = ((_arg_2.scaleY !== undefined) ? _arg_2.scaleY : _local_6);
            };
            var _local_7:MovieClip;
            if (_arg_1 != null)
            {
                _local_7 = this.attachUniqueMovieOverlay(_arg_1);
                if (_local_7 != null)
                {
                    _local_7.stop();
                    Utils.recursiveMovieClipPlay(_local_7, false);
                    _local_7.x = _local_3;
                    _local_7.y = _local_4;
                    _local_7.scaleX = (_local_7.scaleX * _local_5);
                    _local_7.scaleY = (_local_7.scaleY * _local_6);
                };
            };
            return (_local_7);
        }

        private function attachUniqueMovie(_arg_1:String):MovieClip
        {
            var _local_2:MovieClip = Main.getLibraryMC(_arg_1);
            if (_local_2 != null)
            {
                _local_2.stop();
                Utils.recursiveMovieClipPlay(_local_2, false);
                this.STAGE.addChild(_local_2);
                if (this.m_effectIndex >= this.EFFECT_LIMIT)
                {
                    this.m_effectIndex = 0;
                };
                if (((!(this.m_effectList[this.m_effectIndex] == null)) && (this.m_effectList[this.m_effectIndex].parent)))
                {
                    this.m_effectList[this.m_effectIndex].parent.removeChild(this.m_effectList[this.m_effectIndex]);
                    this.m_effectList[this.m_effectIndex] = null;
                };
                this.m_effectList[this.m_effectIndex] = _local_2;
                this.m_effectIndex++;
            };
            return (_local_2);
        }

        private function attachUniqueMovieOverlay(_arg_1:String):MovieClip
        {
            var _local_2:MovieClip = Main.getLibraryMC(_arg_1);
            if (_local_2 != null)
            {
                _local_2.stop();
                Utils.recursiveMovieClipPlay(_local_2, false);
                this.STAGEEFFECTS.addChild(_local_2);
                if (this.m_effectOverlayIndex >= this.EFFECT_LIMIT)
                {
                    this.m_effectOverlayIndex = 0;
                };
                if (((!(this.m_effectOverlayList[this.m_effectOverlayIndex] == null)) && (this.m_effectOverlayList[this.m_effectOverlayIndex].parent)))
                {
                    this.m_effectOverlayList[this.m_effectOverlayIndex].parent.removeChild(this.m_effectOverlayList[this.m_effectOverlayIndex]);
                    this.m_effectOverlayList[this.m_effectOverlayIndex] = null;
                };
                this.m_effectOverlayList[this.m_effectOverlayIndex] = _local_2;
                this.m_effectOverlayIndex++;
            };
            return (_local_2);
        }

        public function attachUniqueMovieHUD(_arg_1:String):MovieClip
        {
            var _local_2:MovieClip = Main.getLibraryMC(_arg_1);
            if (_local_2 != null)
            {
                _local_2.stop();
                Utils.recursiveMovieClipPlay(_local_2, false);
                this.HUDFOREGROUND.addChild(_local_2);
                if (this.m_effectHUDIndex >= this.EFFECT_LIMIT_SECONDARY)
                {
                    this.m_effectHUDIndex = 0;
                };
                if (((!(this.m_effectHUDList[this.m_effectHUDIndex] == null)) && (this.m_effectHUDList[this.m_effectHUDIndex].parent)))
                {
                    this.m_effectHUDList[this.m_effectHUDIndex].parent.removeChild(this.m_effectHUDList[this.m_effectHUDIndex]);
                    this.m_effectHUDList[this.m_effectHUDIndex] = null;
                };
                this.m_effectHUDList[this.m_effectHUDIndex] = _local_2;
                this.m_effectHUDIndex++;
            };
            return (_local_2);
        }

        public function attachUniqueMovieHUDOverlay(_arg_1:String):MovieClip
        {
            var _local_2:MovieClip = Main.getLibraryMC(_arg_1);
            if (_local_2 != null)
            {
                _local_2.stop();
                Utils.recursiveMovieClipPlay(_local_2, false);
                this.HUDOVERLAY.addChild(_local_2);
                if (this.m_effectHUDOverlayIndex >= this.EFFECT_LIMIT_SECONDARY)
                {
                    this.m_effectHUDOverlayIndex = 0;
                };
                if (((!(this.m_effectHUDOverlayList[this.m_effectHUDOverlayIndex] == null)) && (this.m_effectHUDOverlayList[this.m_effectHUDOverlayIndex].parent)))
                {
                    this.m_effectHUDOverlayList[this.m_effectHUDOverlayIndex].parent.removeChild(this.m_effectHUDOverlayList[this.m_effectHUDOverlayIndex]);
                    this.m_effectHUDOverlayList[this.m_effectHUDOverlayIndex] = null;
                };
                this.m_effectHUDOverlayList[this.m_effectHUDOverlayIndex] = _local_2;
                this.m_effectHUDOverlayIndex++;
            };
            return (_local_2);
        }

        public function attachUniqueMovieBG(_arg_1:String):MovieClip
        {
            var _local_2:MovieClip = Main.getLibraryMC(_arg_1);
            if (((!(_local_2 == null)) && (!(this.STAGEPARENT.background == null))))
            {
                _local_2.stop();
                Utils.recursiveMovieClipPlay(_local_2, false);
                this.STAGEPARENT.background.addChild(_local_2);
                if (this.m_effectBGIndex >= this.EFFECT_LIMIT_SECONDARY)
                {
                    this.m_effectBGIndex = 0;
                };
                if (((!(this.m_effectBGList[this.m_effectBGIndex] == null)) && (this.m_effectBGList[this.m_effectBGIndex].parent)))
                {
                    this.m_effectBGList[this.m_effectBGIndex].parent.removeChild(this.m_effectBGList[this.m_effectBGIndex]);
                    this.m_effectBGList[this.m_effectBGIndex] = null;
                };
                this.m_effectBGList[this.m_effectBGIndex] = _local_2;
                this.m_effectBGIndex++;
            };
            return (_local_2);
        }

        public function attachUniqueMovieWeather(_arg_1:String):MovieClip
        {
            var _local_2:MovieClip = Main.getLibraryMC(_arg_1);
            if (((!(_local_2 == null)) && (!(this.WEATHER == null))))
            {
                _local_2.stop();
                Utils.recursiveMovieClipPlay(_local_2, false);
                this.WEATHER.addChild(_local_2);
                if (this.m_effectWeatherIndex >= this.EFFECT_LIMIT_SECONDARY)
                {
                    this.m_effectWeatherIndex = 0;
                };
                if (((!(this.m_effectWeatherList[this.m_effectWeatherIndex] == null)) && (this.m_effectWeatherList[this.m_effectWeatherIndex].parent)))
                {
                    this.m_effectWeatherList[this.m_effectWeatherIndex].parent.removeChild(this.m_effectWeatherList[this.m_effectWeatherIndex]);
                    this.m_effectWeatherList[this.m_effectWeatherIndex] = null;
                };
                this.m_effectWeatherList[this.m_effectWeatherIndex] = _local_2;
                this.m_effectWeatherIndex++;
            };
            return (_local_2);
        }

        private function pauseAllEffects():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < this.m_effectList.length)
            {
                if (this.m_effectList[_local_1])
                {
                    this.m_effectList[_local_1].stop();
                    Utils.recursiveMovieClipPlay(this.m_effectList[_local_1], false);
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_effectOverlayList.length)
            {
                if (this.m_effectOverlayList[_local_1])
                {
                    this.m_effectOverlayList[_local_1].stop();
                    Utils.recursiveMovieClipPlay(this.m_effectOverlayList[_local_1], false);
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_effectHUDList.length)
            {
                if (this.m_effectHUDList[_local_1])
                {
                    this.m_effectHUDList[_local_1].stop();
                    Utils.recursiveMovieClipPlay(this.m_effectHUDList[_local_1], false);
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_effectHUDOverlayList.length)
            {
                if (this.m_effectHUDOverlayList[_local_1])
                {
                    this.m_effectHUDOverlayList[_local_1].stop();
                    Utils.recursiveMovieClipPlay(this.m_effectHUDOverlayList[_local_1], false);
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_effectBGList.length)
            {
                if (this.m_effectBGList[_local_1])
                {
                    this.m_effectBGList[_local_1].stop();
                    Utils.recursiveMovieClipPlay(this.m_effectBGList[_local_1], false);
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_effectWeatherList.length)
            {
                if (this.m_effectWeatherList[_local_1])
                {
                    this.m_effectWeatherList[_local_1].stop();
                    Utils.recursiveMovieClipPlay(this.m_effectWeatherList[_local_1], false);
                };
                _local_1++;
            };
        }

        private function nextFrameAllEffects():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < this.m_effectList.length)
            {
                if (this.m_effectList[_local_1])
                {
                    Utils.advanceFrame(this.m_effectList[_local_1]);
                    Utils.recursiveMovieClipPlay(this.m_effectList[_local_1], true);
                    if ((!(this.m_effectList[_local_1].parent)))
                    {
                        var _local_2:* = _local_1--;
                        this.m_effectList[_local_2] = null;
                    };
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_effectOverlayList.length)
            {
                if (this.m_effectOverlayList[_local_1])
                {
                    Utils.advanceFrame(this.m_effectOverlayList[_local_1]);
                    Utils.recursiveMovieClipPlay(this.m_effectOverlayList[_local_1], true);
                    if ((!(this.m_effectOverlayList[_local_1].parent)))
                    {
                        _local_2 = _local_1--;
                        this.m_effectOverlayList[_local_2] = null;
                    };
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_effectHUDList.length)
            {
                if (this.m_effectHUDList[_local_1])
                {
                    Utils.advanceFrame(this.m_effectHUDList[_local_1]);
                    Utils.recursiveMovieClipPlay(this.m_effectHUDList[_local_1], true);
                    if ((!(this.m_effectHUDList[_local_1].parent)))
                    {
                        _local_2 = _local_1--;
                        this.m_effectHUDList[_local_2] = null;
                    };
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_effectHUDOverlayList.length)
            {
                if (this.m_effectHUDOverlayList[_local_1])
                {
                    Utils.advanceFrame(this.m_effectHUDOverlayList[_local_1]);
                    Utils.recursiveMovieClipPlay(this.m_effectHUDOverlayList[_local_1], true);
                    if ((!(this.m_effectHUDOverlayList[_local_1].parent)))
                    {
                        _local_2 = _local_1--;
                        this.m_effectHUDOverlayList[_local_2] = null;
                    };
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_effectBGList.length)
            {
                if (this.m_effectBGList[_local_1])
                {
                    Utils.advanceFrame(this.m_effectBGList[_local_1]);
                    Utils.recursiveMovieClipPlay(this.m_effectBGList[_local_1], true);
                    if ((!(this.m_effectBGList[_local_1].parent)))
                    {
                        _local_2 = _local_1--;
                        this.m_effectBGList[_local_2] = null;
                    };
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_effectWeatherList.length)
            {
                if (this.m_effectWeatherList[_local_1])
                {
                    Utils.advanceFrame(this.m_effectWeatherList[_local_1]);
                    Utils.recursiveMovieClipPlay(this.m_effectWeatherList[_local_1], true);
                    if ((!(this.m_effectWeatherList[_local_1].parent)))
                    {
                        _local_2 = _local_1--;
                        this.m_effectWeatherList[_local_2] = null;
                    };
                };
                _local_1++;
            };
        }
		
		public function disposeAll() : void
		{
			this.dispose(this.WARNINGBOUNDS_LL);
			this.dispose(this.WARNINGBOUNDS_LR);
			this.dispose(this.WARNINGBOUNDS_UL);
			this.dispose(this.WARNINGBOUNDS_UR);
			this.dispose(this.WALLS);
			this.dispose(this.MOVINGPLATFORMS);
			this.dispose(this.TERRAINS);
			this.dispose(this.PLATFORMS);
		}
		
		private function dispose(v:Vector.<*>) : void
		{
			if(v != null)
			{
				while(v.length > 0)
				{
					v.pop().dispose();
				}
			}
		}
    }
}//package com.mcleodgaming.ssf2.engine