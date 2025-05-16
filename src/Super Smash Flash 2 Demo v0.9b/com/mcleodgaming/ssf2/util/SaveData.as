package com.mcleodgaming.ssf2.util
{
    import flash.net.SharedObject;
    import __AS3__.vec.Vector;
    import com.mcleodgaming.ssf2.engine.StageSetting;
    import flash.display.StageQuality;
    import com.mcleodgaming.ssf2.Main;
    import com.mcleodgaming.ssf2.engine.Stats;
    import flash.events.NetStatusEvent;
    import flash.utils.ByteArray;
    import com.mcleodgaming.ssf2.engine.*;

    public class SaveData 
    {

        private static var m_sharedObject:SharedObject;
        private static var m_localObject:Object;
        private static var m_currentSaveFileName:String = "SSF2_V9B";
        public static var Controller1:Controller;
        public static var Controller2:Controller;
        public static var Controller3:Controller;
        public static var Controller4:Controller;
        public static var Controller5:Controller;
        public static var Controller6:Controller;
        public static var Controller7:Controller;
        public static var Controller8:Controller;
        public static var corrupted:Boolean = false;

        {
            init();
        }


        public static function init():void
        {
        }

        public static function initializeSaveData():void
        {
            var _local_1:String;
            var _local_2:String;
            var _local_3:Vector.<StageSetting>;
            var _local_4:int;
            var _local_5:Array;
            var _local_6:String;
            trace("SaveData initialized");
            loadGame();
            if (((m_sharedObject.data.savedata == undefined) || (!(m_sharedObject.data.savedata is String))))
            {
                m_localObject = new Object();
            }
            else
            {
                _local_1 = String(m_sharedObject.data.savedata);
                _local_2 = Base64.decode(_local_1);
                m_localObject = Utils.convertStringToObject(_local_2);
                if (((!(m_localObject)) || (!(m_localObject.controlSettings))))
                {
                    m_localObject = new Object();
                    corrupted = true;
                };
            };
            if ((((m_localObject.game == undefined) || (m_localObject.game.exists == undefined)) || (m_localObject.game.exists == false)))
            {
                m_localObject.game = {
                    "exists":true,
                    "version":0.91,
                    "records":{
                        "single":{"playTime":0},
                        "vs":{
                            "playTime":0,
                            "playContestants":0,
                            "timeMatchTotal":0,
                            "stockMatchTotal":0,
                            "matchResets":0,
                            "wins":{},
                            "matches":{}
                        },
                        "targets":{},
                        "events":{},
                        "misc":{
                            "powerCount":1,
                            "powerTime":0,
                            "playTime":0
                        }
                    },
                    "options":{
                        "rememberMe":null,
                        "quality":StageQuality.MEDIUM,
                        "fullscreen_quality":0,
                        "hazards":true,
                        "meleeAirDodge":false,
                        "teamDamage":false,
                        "SEvolumeLevel":0.7,
                        "VAvolumeLevel":0.7,
                        "BGvolumeLevel":0.7,
                        "WiiMode":false,
                        "finalFormMusic":false,
                        "characterQueueSize":8,
                        "stageQueueSize":8,
                        "VS_Time":2,
                        "VS_Lives":3,
                        "VS_DamageRatio":1,
                        "VS_ItemFreq":5,
                        "VS_StartDamage":0,
                        "VS_DisplayPlayer":false,
                        "VS_UsingLives":false,
                        "VS_UsingTime":true,
                        "VS_CPULevel1":1,
                        "VS_CPULevel2":1,
                        "VS_CPULevel3":1,
                        "VS_CPULevel4":1,
                        "VS_CPULevel5":1,
                        "VS_CPULevel6":1,
                        "VS_CPULevel7":1,
                        "VS_CPULevel8":1,
                        "VS_Items":{
                            "smashball":true,
                            "capsule":true,
                            "capsule_ex":true,
                            "fan":true,
                            "beamsword":true,
                            "homerunbat":true,
                            "pokeball":true,
                            "maximumtomato":true,
                            "fooditem":true,
                            "assistTrophy":true,
                            "heartContainer":true,
                            "energytank":true,
                            "greenShell":true,
                            "redShell":true,
                            "spinyShell":true,
                            "rayGun":true,
                            "bobomb":true,
                            "cucco":true,
                            "mrsaturn":true,
                            "explodingtag":true,
                            "supermushroom":true,
                            "poisonmushroom":true,
                            "freezie":true,
                            "bumper":true,
                            "starrod":true,
                            "motionsensor":true,
                            "pitfall":true,
                            "nitrocrate":true
                        },
                        "VS_Stages":{},
                        "names":{}
                    },
                    "unlocks":{
                        "blackmage":true,
                        "chaosshrine":true,
                        "clocktown":true,
                        "captainfalcon":true,
                        "sandocean":true,
                        "jigglypuff":true
                    }
                };
                _local_3 = StageSetting.getStagesArray(true);
                _local_4 = 0;
                while (_local_4 < _local_3.length)
                {
                    m_localObject.game.options.VS_Stages[_local_3[_local_4].ID] = true;
                    _local_4++;
                };
                if ((!(Main.DEBUG)))
                {
                    m_localObject.game.options.VS_Stages.skyworld = false;
                };
                _local_5 = Stats.getCharacterList(false);
                _local_6 = "";
                if (Main.DEBUG)
                {
                    for (_local_6 in _local_5)
                    {
                        m_localObject.game.records.vs.wins[_local_5[_local_6]] = 1;
                        m_localObject.game.records.vs.matches[_local_5[_local_6]] = 1;
                    };
                    m_localObject.game.records.vs.wins.yoshi = 0;
                    m_localObject.game.records.vs.matches.captainfalcon = 9;
                    m_localObject.game.records.targets.targettest = new Object();
                    for (_local_6 in _local_5)
                    {
                        m_localObject.game.records.targets.targettest[_local_5[_local_6]] = new Object();
                        m_localObject.game.records.targets.targettest[_local_5[_local_6]].score = (19 * 30);
                        m_localObject.game.records.targets.targettest[_local_5[_local_6]].fps = 30;
                    };
                    m_localObject.game.records.targets.targettest.yoshi.score = 0;
                    m_localObject.game.records.targets.targettest.yoshi.fps = 30;
                    m_localObject.game.records.vs.wins.yoshi = 0;
                    m_localObject.game.records.vs.matches.captainfalcon = 8;
                    m_localObject.game.records.targets.targettest2 = new Object();
                    for (_local_6 in _local_5)
                    {
                        m_localObject.game.records.targets.targettest2[_local_5[_local_6]] = new Object();
                        m_localObject.game.records.targets.targettest2[_local_5[_local_6]].score = (19 * 30);
                        m_localObject.game.records.targets.targettest2[_local_5[_local_6]].fps = 30;
                    };
                    m_localObject.game.records.targets.targettest2.yoshi.score = 0;
                    m_localObject.game.records.targets.targettest2.yoshi.fps = 30;
                }
                else
                {
                    for (_local_6 in _local_5)
                    {
                        m_localObject.game.records.vs.wins[_local_5[_local_6]] = 0;
                        m_localObject.game.records.vs.matches[_local_5[_local_6]] = 0;
                    };
                };
                Controller1 = new Controller(1, {
                    "UP":87,
                    "DOWN":83,
                    "LEFT":65,
                    "RIGHT":68,
                    "BUTTON1":79,
                    "BUTTON2":80,
                    "GRAB":85,
                    "START":8,
                    "TAUNT":49,
                    "SHIELD":73,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller2 = new Controller(2, {
                    "UP":38,
                    "DOWN":40,
                    "LEFT":37,
                    "RIGHT":39,
                    "BUTTON1":98,
                    "BUTTON2":99,
                    "GRAB":101,
                    "START":96,
                    "TAUNT":100,
                    "SHIELD":97,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller3 = new Controller(3, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller4 = new Controller(4, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller5 = new Controller(5, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller6 = new Controller(6, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller7 = new Controller(7, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller8 = new Controller(8, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                m_localObject.controlSettings = {
                    "player1":Controller1.getControls(),
                    "player2":Controller2.getControls(),
                    "player3":Controller3.getControls(),
                    "player4":Controller4.getControls(),
                    "player5":Controller5.getControls(),
                    "player6":Controller6.getControls(),
                    "player7":Controller7.getControls(),
                    "player8":Controller8.getControls()
                };
                saveGame();
            }
            else
            {
                m_localObject.game.records.misc.powerCount++;
                Controller1 = new Controller(3, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller2 = new Controller(3, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller3 = new Controller(3, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller4 = new Controller(3, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller5 = new Controller(3, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller6 = new Controller(3, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller7 = new Controller(3, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller8 = new Controller(3, {
                    "UP":0,
                    "DOWN":0,
                    "LEFT":0,
                    "RIGHT":0,
                    "BUTTON1":0,
                    "BUTTON2":0,
                    "GRAB":0,
                    "START":0,
                    "TAUNT":0,
                    "SHIELD":0,
                    "JUMP":0,
                    "JUMP2":0,
                    "C_UP":0,
                    "C_DOWN":0,
                    "C_LEFT":0,
                    "C_RIGHT":0,
                    "DASH":0,
                    "AUTO_DASH":0,
                    "DT_DASH":1,
                    "TAP_JUMP":1
                });
                Controller1.setControls(m_localObject.controlSettings.player1);
                Controller2.setControls(m_localObject.controlSettings.player2);
                Controller3.setControls(m_localObject.controlSettings.player3);
                Controller4.setControls(m_localObject.controlSettings.player4);
                Controller5.setControls(m_localObject.controlSettings.player5);
                Controller6.setControls(m_localObject.controlSettings.player6);
                Controller7.setControls(m_localObject.controlSettings.player7);
                Controller8.setControls(m_localObject.controlSettings.player8);
            };
            m_sharedObject.addEventListener(NetStatusEvent.NET_STATUS, SaveData.onStatus);
        }

        private static function onStatus(_arg_1:NetStatusEvent):void
        {
            if (_arg_1.info.level == "error")
            {
                trace('You need to allow the Flash Player enough memory in order to save your game. Right click the game, go to "Settings", click the Folder icon, and allow unlimited save space.');
            };
        }

        public static function eraseGame():void
        {
            m_sharedObject.data.savegame = new Object();
            m_sharedObject.clear();
            m_sharedObject.flush();
            initializeSaveData();
            m_sharedObject.flush();
        }

        public static function saveGame():void
        {
            var _local_1:String = Utils.convertObjectToString(m_localObject);
            m_sharedObject.data.savedata = Base64.encode(_local_1);
            m_sharedObject.flush();
        }

        public static function loadGame():void
        {
            m_sharedObject = SharedObject.getLocal(m_currentSaveFileName, "/");
        }

        public static function getSavedVSOptions():Object
        {
            return (m_localObject.game.options);
        }

        public static function setSavedVSOptions(_arg_1:Object):void
        {
            var _local_2:*;
            m_localObject.game.options.VS_Time = _arg_1.VS_Time;
            m_localObject.game.options.VS_DamageRatio = _arg_1.VS_DamageRatio;
            m_localObject.game.options.VS_DisplayPlayer = _arg_1.VS_DisplayPlayer;
            m_localObject.game.options.VS_Lives = _arg_1.VS_Lives;
            m_localObject.game.options.VS_StartDamage = _arg_1.VS_StartDamage;
            m_localObject.game.options.VS_ItemFreq = _arg_1.VS_ItemFreq;
            m_localObject.game.options.VS_UsingLives = _arg_1.VS_UsingLives;
            m_localObject.game.options.VS_UsingTime = _arg_1.VS_UsingTime;
            m_localObject.game.options.VS_CPULevel1 = _arg_1.VS_CPULevel1;
            m_localObject.game.options.VS_CPULevel2 = _arg_1.VS_CPULevel2;
            m_localObject.game.options.VS_CPULevel3 = _arg_1.VS_CPULevel3;
            m_localObject.game.options.VS_CPULevel4 = _arg_1.VS_CPULevel4;
            m_localObject.game.options.VS_CPULevel5 = _arg_1.VS_CPULevel5;
            m_localObject.game.options.VS_CPULevel6 = _arg_1.VS_CPULevel6;
            m_localObject.game.options.VS_CPULevel7 = _arg_1.VS_CPULevel7;
            m_localObject.game.options.VS_CPULevel8 = _arg_1.VS_CPULevel8;
            for (_local_2 in m_localObject.game.options.VS_Items)
            {
                m_localObject.game.options.VS_Items[_local_2] = _arg_1.VS_Items[_local_2];
            };
        }

        public static function get UsingTime():Boolean
        {
            return (m_localObject.game.options.VS_UsingTime);
        }

        public static function get UsingLives():Boolean
        {
            return (m_localObject.game.options.VS_UsingLives);
        }

        public static function get ShowPlayerID():Boolean
        {
            return (m_localObject.game.options.VS_DisplayPlayer);
        }

        public static function get DamageRatio():Number
        {
            return (m_localObject.game.options.VS_DamageRatio);
        }

        public static function get StartDamage():Number
        {
            return (m_localObject.game.options.VS_StartDamage);
        }

        public static function get Time():Number
        {
            return (m_localObject.game.options.VS_Time as Number);
        }

        public static function get Lives():Number
        {
            return (m_localObject.game.options.VS_Lives);
        }

        public static function get ItemDataObj():Object
        {
            return (m_localObject.game.options.VS_Items);
        }

        public static function get VSStageDataObj():Object
        {
            return (m_localObject.game.options.VS_Stages);
        }

        public static function get ItemFrequency():Number
        {
            return (m_localObject.game.options.VS_ItemFreq);
        }

        public static function toggleTime(_arg_1:Boolean):void
        {
            m_localObject.game.options.VS_Time = ((_arg_1) ? (m_localObject.game.options.VS_Time + 1) : (m_localObject.game.options.VS_Time - 1));
            if (m_localObject.game.options.VS_Time <= 0)
            {
                m_localObject.game.options.VS_Time = 99;
            }
            else
            {
                if (m_localObject.game.options.VS_Time > 99)
                {
                    m_localObject.game.options.VS_Time = 1;
                };
            };
        }

        public static function toggleStock(_arg_1:Boolean):void
        {
            m_localObject.game.options.VS_Lives = ((_arg_1) ? (m_localObject.game.options.VS_Lives + 1) : (m_localObject.game.options.VS_Lives - 1));
            if (m_localObject.game.options.VS_Lives <= 0)
            {
                m_localObject.game.options.VS_Lives = 99;
            }
            else
            {
                if (m_localObject.game.options.VS_Lives > 99)
                {
                    m_localObject.game.options.VS_Lives = 1;
                };
            };
        }

        public static function toggleDamageRatio(_arg_1:Boolean):void
        {
            m_localObject.game.options.VS_DamageRatio = ((_arg_1) ? (m_localObject.game.options.VS_DamageRatio + 0.1) : (m_localObject.game.options.VS_DamageRatio - 0.1));
            if (m_localObject.game.options.VS_DamageRatio > 2)
            {
                m_localObject.game.options.VS_DamageRatio = 2;
            }
            else
            {
                if (m_localObject.game.options.VS_DamageRatio < 0.5)
                {
                    m_localObject.game.options.VS_DamageRatio = 0.5;
                };
            };
            m_localObject.game.options.VS_DamageRatio = (Math.round((m_localObject.game.options.VS_DamageRatio * 10)) / 10);
        }

        public static function toggleItemFrequency(_arg_1:Boolean):void
        {
            m_localObject.game.options.VS_ItemFreq = ((_arg_1) ? (m_localObject.game.options.VS_ItemFreq + 1) : (m_localObject.game.options.VS_ItemFreq - 1));
            if (m_localObject.game.options.VS_ItemFreq > 5)
            {
                m_localObject.game.options.VS_ItemFreq = 5;
            }
            else
            {
                if (m_localObject.game.options.VS_ItemFreq < 0)
                {
                    m_localObject.game.options.VS_ItemFreq = 0;
                };
            };
        }

        public static function setStartDamage(_arg_1:Number):void
        {
            m_localObject.game.options.VS_StartDamage = _arg_1;
            if (m_localObject.game.options.VS_StartDamage > 999)
            {
                m_localObject.game.options.VS_StartDamage = 0;
            }
            else
            {
                if (m_localObject.game.options.VS_StartDamage < 0)
                {
                    m_localObject.game.options.VS_StartDamage = 0;
                };
            };
        }

        public static function toggleUsingTime():void
        {
            m_localObject.game.options.VS_UsingTime = (!(m_localObject.game.options.VS_UsingTime));
            if (((!(m_localObject.game.options.VS_UsingLives)) && (!(m_localObject.game.options.VS_UsingTime))))
            {
                m_localObject.game.options.VS_UsingLives = true;
            };
        }

        public static function toggleUsingLives():void
        {
            m_localObject.game.options.VS_UsingLives = (!(m_localObject.game.options.VS_UsingLives));
            if (((!(m_localObject.game.options.VS_UsingTime)) && (!(m_localObject.game.options.VS_UsingLives))))
            {
                m_localObject.game.options.VS_UsingTime = true;
            };
        }

        public static function toggleShowPlayerID():void
        {
            m_localObject.game.options.VS_DisplayPlayer = (!(m_localObject.game.options.VS_DisplayPlayer));
        }

        public static function toggleHazards():void
        {
            m_localObject.game.options.hazards = (!(m_localObject.game.options.hazards));
        }

        public static function toggleTeamDamage():void
        {
            m_localObject.game.options.teamDamage = (!(m_localObject.game.options.teamDamage));
        }

        public static function exportSaveData(_arg_1:DataSettings=null):void
        {
            var _local_6:Object;
            var _local_2:DataSettings = ((_arg_1) ? _arg_1 : new DataSettings());
            var _local_3:Object = Utils.convertStringToObject(Utils.convertObjectToString(m_localObject));
            if ((!(_local_2.records)))
            {
                _local_3.game.records = null;
                delete _local_3.game.records;
            };
            if ((!(_local_2.options)))
            {
                _local_6 = Utils.convertStringToObject(Utils.convertObjectToString(_local_3.game.options.names));
                _local_3.game.options = null;
                delete _local_3.game.options;
                _local_3.game.options = new Object();
                _local_3.game.options.names = _local_6;
            };
            if ((!(_local_2.unlocks)))
            {
                _local_3.game.unlocks = null;
                delete _local_3.game.unlocks;
            };
            if ((!(_local_2.controls)))
            {
                _local_3.controlSettings = null;
                delete _local_3.game.controlSettings;
            };
            if ((!(_local_2.names)))
            {
                _local_3.game.options.names = null;
                delete _local_3.game.options;
            };
            var _local_4:String = "";
            _local_4 = Utils.convertObjectToString(_local_3);
            var _local_5:ByteArray = new ByteArray();
            _local_5.writeUTFBytes(_local_4);
            _local_5.compress();
            Utils.saveFile(_local_5, "New SSF2 Save.ssfsav");
        }

        public static function importSaveData(_arg_1:String, _arg_2:DataSettings=null):Boolean
        {
            var _local_6:*;
            var _local_7:Object;
            var _local_8:*;
            var _local_9:Object;
            var _local_10:*;
            var _local_11:Object;
            var _local_12:*;
            var _local_13:Object;
            var _local_14:*;
            var _local_15:Object;
            var _local_16:*;
            var _local_17:Object;
            var _local_18:*;
            var _local_19:Object;
            var _local_20:*;
            var _local_21:Object;
            var _local_22:*;
            var _local_23:Object;
            var _local_24:*;
            var _local_25:Object;
            var _local_26:*;
            var _local_27:Object;
            var _local_28:*;
            var _local_29:Object;
            var _local_30:*;
            var _local_31:Object;
            var _local_32:*;
            var _local_3:DataSettings = ((_arg_2) ? _arg_2 : new DataSettings());
            var _local_4:Boolean = true;
            if (((Utils.parseForCodeBlock(_arg_1, 0) == null) || (_arg_1.indexOf("{") < 0)))
            {
                return (false);
            };
            var _local_5:Object = Utils.convertStringToObject(_arg_1);
            for (_local_6 in _local_5)
            {
                if (_local_6 == "game")
                {
                    _local_7 = _local_5[_local_6];
                    for (_local_8 in _local_7)
                    {
                        if (_local_8 == "options")
                        {
                            _local_9 = _local_7[_local_8];
                            for (_local_10 in _local_9)
                            {
                                if (((_local_10 == "VS_Items") && (_local_3.options)))
                                {
                                    _local_11 = _local_9[_local_10];
                                    for (_local_12 in _local_11)
                                    {
                                        if (m_localObject.game.options.VS_Items[_local_12] !== undefined)
                                        {
                                            m_localObject.game.options.VS_Items[_local_12] = _local_11[_local_12];
                                            trace(((("%Imported: data.game.options.VS_Item[" + _local_12) + "] = ") + _local_11[_local_12]));
                                        }
                                        else
                                        {
                                            trace((("***Notice: Import ignored game.options.VS_Items[" + _local_12) + "]"));
                                        };
                                    };
                                }
                                else
                                {
                                    if (((_local_10 == "names") && (_local_3.names)))
                                    {
                                        m_localObject.game.options[_local_10] = _local_9[_local_10];
                                        trace(((("%Imported: data.game.options[" + _local_10) + "] = ") + _local_9[_local_10]));
                                    }
                                    else
                                    {
                                        if (((!(m_localObject.game.options[_local_10] === undefined)) && (_local_3.options)))
                                        {
                                            m_localObject.game.options[_local_10] = _local_9[_local_10];
                                            trace(((("%Imported: data.game.options[" + _local_10) + "] = ") + _local_9[_local_10]));
                                        }
                                        else
                                        {
                                            if (_local_3.options)
                                            {
                                                trace((("***Notice: Import ignored game.options[" + _local_10) + "]"));
                                            };
                                        };
                                    };
                                };
                            };
                        }
                        else
                        {
                            if (_local_8 == "records")
                            {
                                _local_13 = _local_7[_local_8];
                                for (_local_14 in _local_13)
                                {
                                    if (!(!(_local_3.records)))
                                    {
                                        if (_local_14 == "single")
                                        {
                                            _local_15 = _local_13[_local_14];
                                            for (_local_16 in _local_15)
                                            {
                                                if (m_localObject.game.records.single[_local_16] !== undefined)
                                                {
                                                    m_localObject.game.records.single[_local_16] = _local_15[_local_16];
                                                    trace(((("%Imported: data.game.records.single[" + _local_16) + "] = ") + _local_15[_local_16]));
                                                }
                                                else
                                                {
                                                    trace((("***Notice: Import ignored game.records.single[" + _local_16) + "]"));
                                                };
                                            };
                                        }
                                        else
                                        {
                                            if (_local_14 == "vs")
                                            {
                                                _local_17 = _local_13[_local_14];
                                                for (_local_18 in _local_17)
                                                {
                                                    if (_local_18 == "wins")
                                                    {
                                                        _local_19 = _local_17[_local_18];
                                                        for (_local_20 in _local_19)
                                                        {
                                                            if (m_localObject.game.records.vs.wins[_local_20] !== undefined)
                                                            {
                                                                m_localObject.game.records.vs.wins[_local_20] = _local_19[_local_20];
                                                                trace(((("%Imported: data.game.records.vs.wins[" + _local_20) + "] = ") + _local_19[_local_20]));
                                                            }
                                                            else
                                                            {
                                                                trace((("***Notice: Import ignored game.records.vs.wins[" + _local_20) + "]"));
                                                            };
                                                        };
                                                    }
                                                    else
                                                    {
                                                        if (_local_18 == "matches")
                                                        {
                                                            _local_21 = _local_17[_local_18];
                                                            for (_local_22 in _local_21)
                                                            {
                                                                if (m_localObject.game.records.vs.matches[_local_22] !== undefined)
                                                                {
                                                                    m_localObject.game.records.vs.matches[_local_22] = _local_21[_local_22];
                                                                    trace(((("%Imported: data.game.records.vs.matches[" + _local_22) + "] = ") + _local_21[_local_22]));
                                                                }
                                                                else
                                                                {
                                                                    trace((("***Notice: Import ignored game.records.vs.matches[" + _local_22) + "]"));
                                                                };
                                                            };
                                                        }
                                                        else
                                                        {
                                                            if (m_localObject.game.records.vs[_local_18] !== undefined)
                                                            {
                                                                m_localObject.game.records.vs[_local_18] = _local_17[_local_18];
                                                                trace(((("%Imported: data.game.records.vs[" + _local_18) + "] = ") + _local_17[_local_18]));
                                                            }
                                                            else
                                                            {
                                                                trace((("***Notice: Import ignored game.records.vs[" + _local_18) + "]"));
                                                            };
                                                        };
                                                    };
                                                };
                                            }
                                            else
                                            {
                                                if (_local_14 == "misc")
                                                {
                                                    _local_23 = _local_13[_local_14];
                                                    for (_local_24 in _local_23)
                                                    {
                                                        if (m_localObject.game.records.misc[_local_24] !== undefined)
                                                        {
                                                            m_localObject.game.records.misc[_local_24] = _local_23[_local_24];
                                                            trace(((("%Imported: data.game.records.misc[" + _local_24) + "] = ") + _local_23[_local_24]));
                                                        }
                                                        else
                                                        {
                                                            trace((("***Notice: Import ignored game.records.misc[" + _local_24) + "]"));
                                                        };
                                                    };
                                                }
                                                else
                                                {
                                                    if (_local_14 == "targets")
                                                    {
                                                        _local_25 = _local_13[_local_14];
                                                        for (_local_26 in _local_25)
                                                        {
                                                            if (m_localObject.game.records.targets[_local_26] !== undefined)
                                                            {
                                                                if (_local_5.game.version == 0.91)
                                                                {
                                                                    m_localObject.game.records.targets[_local_26] = _local_25[_local_26];
                                                                    trace(((("%Imported: data.game.records.targets[" + _local_26) + "] = ") + _local_25[_local_26]));
                                                                };
                                                            }
                                                            else
                                                            {
                                                                trace((("***Notice: Import ignored game.records.targets[" + _local_26) + "]"));
                                                            };
                                                        };
                                                    }
                                                    else
                                                    {
                                                        if (_local_14 == "events")
                                                        {
                                                            _local_27 = _local_13[_local_14];
                                                            for (_local_28 in _local_27)
                                                            {
                                                                if (_local_5.game.version == 0.91)
                                                                {
                                                                    m_localObject.game.records.events[_local_28] = _local_27[_local_28];
                                                                    trace(((("%Imported: data.game.records.events[" + _local_28) + "] = ") + _local_27[_local_28]));
                                                                }
                                                                else
                                                                {
                                                                    trace((("***Notice: Import ignored game.records.events[" + _local_28) + "]"));
                                                                };
                                                            };
                                                        }
                                                        else
                                                        {
                                                            if (m_localObject.game.records[_local_14] !== undefined)
                                                            {
                                                                m_localObject.game.records[_local_14] = _local_13[_local_14];
                                                                trace(((("%Imported: data.game.records[" + _local_14) + "] = ") + _local_13[_local_14]));
                                                            }
                                                            else
                                                            {
                                                                trace((("***Notice: Import ignored game.records[" + _local_14) + "]"));
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            }
                            else
                            {
                                if (_local_8 == "unlocks")
                                {
                                    _local_29 = _local_7[_local_8];
                                    for (_local_30 in _local_29)
                                    {
                                        if (!(!(_local_3.unlocks)))
                                        {
                                            if (m_localObject.game.unlocks[_local_30] !== undefined)
                                            {
                                                if (_local_5.game.version == 0.91)
                                                {
                                                    m_localObject.game.unlocks[_local_30] = _local_29[_local_30];
                                                    trace(((("%Imported: data.game.unlocks[" + _local_30) + "] = ") + _local_29[_local_30]));
                                                };
                                            }
                                            else
                                            {
                                                trace((("***Notice: Import ignored game.unlocks[" + _local_30) + "]"));
                                            };
                                        };
                                    };
                                }
                                else
                                {
                                    if (m_localObject.game[_local_8] !== undefined)
                                    {
                                        if (_local_8 == "version")
                                        {
                                            trace(("Imported data from SSF2 version: " + m_localObject.game[_local_8]));
                                        }
                                        else
                                        {
                                            m_localObject.game[_local_8] = _local_7[_local_8];
                                            trace(((("%Imported: data.game[" + _local_8) + "] = ") + _local_7[_local_8]));
                                        };
                                    }
                                    else
                                    {
                                        trace((("***Notice: Import ignored game[" + _local_8) + "]"));
                                    };
                                };
                            };
                        };
                    };
                }
                else
                {
                    if (_local_6 == "controlSettings")
                    {
                        _local_31 = _local_5[_local_6];
                        for (_local_32 in _local_31)
                        {
                            if (!(!(_local_3.controls)))
                            {
                                if (_local_32 == "player1")
                                {
                                    m_localObject.controlSettings[_local_32] = _local_31[_local_32];
                                    Controller1.setControls(_local_31[_local_32]);
                                    trace(((("%Imported: data.controlSettings[" + _local_32) + "] = ") + _local_31[_local_32]));
                                }
                                else
                                {
                                    if (_local_32 == "player2")
                                    {
                                        m_localObject.controlSettings[_local_32] = _local_31[_local_32];
                                        Controller2.setControls(_local_31[_local_32]);
                                        trace(((("%Imported: data.controlSettings[" + _local_32) + "] = ") + _local_31[_local_32]));
                                    }
                                    else
                                    {
                                        if (_local_32 == "player3")
                                        {
                                            m_localObject.controlSettings[_local_32] = _local_31[_local_32];
                                            Controller3.setControls(_local_31[_local_32]);
                                            trace(((("%Imported: data.controlSettings[" + _local_32) + "] = ") + _local_31[_local_32]));
                                        }
                                        else
                                        {
                                            if (_local_32 == "player4")
                                            {
                                                m_localObject.controlSettings[_local_32] = _local_31[_local_32];
                                                Controller4.setControls(_local_31[_local_32]);
                                                trace(((("%Imported: data.controlSettings[" + _local_32) + "] = ") + _local_31[_local_32]));
                                            }
                                            else
										{
                                            if (_local_32 == "player5")
                                            {
                                                m_localObject.controlSettings[_local_32] = _local_31[_local_32];
                                                Controller5.setControls(_local_31[_local_32]);
                                                trace(((("%Imported: data.controlSettings[" + _local_32) + "] = ") + _local_31[_local_32]));
                                            }
                                            else
										{
                                            if (_local_32 == "player6")
                                            {
                                                m_localObject.controlSettings[_local_32] = _local_31[_local_32];
                                                Controller6.setControls(_local_31[_local_32]);
                                                trace(((("%Imported: data.controlSettings[" + _local_32) + "] = ") + _local_31[_local_32]));
                                            }
                                            else
										{
                                            if (_local_32 == "player7")
                                            {
                                                m_localObject.controlSettings[_local_32] = _local_31[_local_32];
                                                Controller7.setControls(_local_31[_local_32]);
                                                trace(((("%Imported: data.controlSettings[" + _local_32) + "] = ") + _local_31[_local_32]));
                                            }
                                            else
										{
                                            if (_local_32 == "player8")
                                            {
                                                m_localObject.controlSettings[_local_32] = _local_31[_local_32];
                                                Controller8.setControls(_local_31[_local_32]);
                                                trace(((("%Imported: data.controlSettings[" + _local_32) + "] = ") + _local_31[_local_32]));
                                            }
                                            else
                                            {
                                                trace((("***Notice: Import ignored controlSettings[" + _local_32) + "]"));
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
                    else
                    {
                        trace((("***Notice: Import ignored [" + _local_6) + "]"));
                    };
                };
            };
            return (_local_4);
        }

        public static function getItemStatus(_arg_1:String):Boolean
        {
            var _local_2:Array = new Array();
            var _local_3:String = "";
            var _local_4:Number = 0;
            while (_local_4 < _arg_1.length)
            {
                if (_arg_1.charAt(_local_4) == ",")
                {
                    _local_2.push(_local_3);
                    _local_3 = "";
                }
                else
                {
                    _local_3 = (_local_3 + _arg_1.charAt(_local_4));
                };
                _local_4++;
            };
            _local_2.push(_local_3);
            return (m_localObject.game.options.VS_Items[_local_2[0]]);
        }

        public static function getStageStatus(_arg_1:String):Boolean
        {
            return (m_localObject.game.options.VS_Stages[_arg_1]);
        }

        public static function getNameSettings(_arg_1:String):Object
        {
            var _local_3:*;
            var _local_2:Object = Names;
            if ((!(_local_2)))
            {
                return (null);
            };
            for (_local_3 in _local_2)
            {
                if (_local_2[_local_3].name == Base64.encode(_arg_1))
                {
                    return (_local_2[_local_3]);
                };
            };
            return (null);
        }

        public static function createNameSettings(_arg_1:String):void
        {
            if (getNameSettings(_arg_1))
            {
                return;
            };
            Names[Base64.encode(_arg_1)] = new Object();
            Names[Base64.encode(_arg_1)].name = Base64.encode(_arg_1);
            Names[Base64.encode(_arg_1)].controls = new Object();
            Names[Base64.encode(_arg_1)].randCharacters = new Object();
        }

        public static function deleteNameSettings(_arg_1:String):void
        {
            var _local_3:*;
            var _local_2:Object = Names;
            if ((!(_local_2)))
            {
                return;
            };
            for (_local_3 in _local_2)
            {
                if (_local_2[_local_3].name == Base64.decode(_arg_1))
                {
                    _local_2[_local_3] = null;
                    delete _local_2[_local_3];
                    return;
                };
            };
        }

        public static function getTargetTestData(_arg_1:String, _arg_2:String):Object
        {
            if (((_arg_1 == null) || (_arg_2 == null)))
            {
                return (null);
            };
            if (((Records.targets[_arg_1]) && (Records.targets[_arg_1][_arg_2])))
            {
                return (Records.targets[_arg_1][_arg_2]);
            };
            return (null);
        }

        public static function setTargetTestData(_arg_1:String, _arg_2:String, _arg_3:Object):void
        {
            if ((!(Records.targets[_arg_1])))
            {
                Records.targets[_arg_1] = new Object();
            };
            if ((!(Records.targets[_arg_1][_arg_2])))
            {
                Records.targets[_arg_1][_arg_2] = new Object();
            };
            Records.targets[_arg_1][_arg_2] = _arg_3;
        }

        public static function get WiiMode():Boolean
        {
            return (m_localObject.game.options.WiiMode as Boolean);
        }

        public static function set WiiMode(_arg_1:Boolean):void
        {
            m_localObject.game.options.WiiMode = _arg_1;
        }

        public static function get FinalFormMusic():Boolean
        {
            return (m_localObject.game.options.finalFormMusic as Boolean);
        }

        public static function set FinalFormMusic(_arg_1:Boolean):void
        {
            m_localObject.game.options.finalFormMusic = _arg_1;
        }

        public static function get ControlSettings():Object
        {
            return (m_localObject.controlSettings);
        }

        public static function set ControlSettings(_arg_1:Object):void
        {
            m_localObject.controlSettings = _arg_1;
        }

        public static function get Hazards():Boolean
        {
            return (m_localObject.game.options.hazards as Boolean);
        }

        public static function set Hazards(_arg_1:Boolean):void
        {
            m_localObject.game.options.hazards = _arg_1;
        }

        public static function get TeamDamage():Boolean
        {
            return (m_localObject.game.options.teamDamage as Boolean);
        }

        public static function set TeamDamage(_arg_1:Boolean):void
        {
            m_localObject.game.options.teamDamage = _arg_1;
        }

        public static function get SEVolumeLevel():Number
        {
            return (m_localObject.game.options.SEvolumeLevel as Number);
        }

        public static function set SEVolumeLevel(_arg_1:Number):void
        {
            m_localObject.game.options.SEvolumeLevel = _arg_1;
        }

        public static function get VAVolumeLevel():Number
        {
            return (m_localObject.game.options.VAvolumeLevel as Number);
        }

        public static function set VAVolumeLevel(_arg_1:Number):void
        {
            m_localObject.game.options.VAvolumeLevel = _arg_1;
        }

        public static function get BGVolumeLevel():Number
        {
            return (m_localObject.game.options.BGvolumeLevel as Number);
        }

        public static function set BGVolumeLevel(_arg_1:Number):void
        {
            m_localObject.game.options.BGvolumeLevel = _arg_1;
        }

        public static function get PowerCount():Number
        {
            return (m_localObject.game.records.misc.powerCount as Number);
        }

        public static function set PowerCount(_arg_1:Number):void
        {
            m_localObject.game.records.misc.powerCount = _arg_1;
        }

        public static function get PowerTime():Number
        {
            return (m_localObject.game.records.misc.powerTime as Number);
        }

        public static function set PowerTime(_arg_1:Number):void
        {
            m_localObject.game.records.misc.powerTime = _arg_1;
        }

        public static function get PlayTime():Number
        {
            return (m_localObject.game.records.misc.playTime as Number);
        }

        public static function set PlayTime(_arg_1:Number):void
        {
            m_localObject.game.records.misc.playTime = _arg_1;
        }

        public static function get SinglePlayerTime():Number
        {
            return (m_localObject.game.records.single.playTime as Number);
        }

        public static function set SinglePlayerTime(_arg_1:Number):void
        {
            m_localObject.game.records.single.playTime = _arg_1;
        }

        public static function get VSPlayTime():Number
        {
            return (m_localObject.game.records.vs.playTime as Number);
        }

        public static function set VSPlayTime(_arg_1:Number):void
        {
            m_localObject.game.records.vs.playTime = _arg_1;
        }

        public static function get TimeMatchTotal():Number
        {
            return (m_localObject.game.records.vs.timeMatchTotal as Number);
        }

        public static function set TimeMatchTotal(_arg_1:Number):void
        {
            m_localObject.game.records.vs.timeMatchTotal = _arg_1;
        }

        public static function get StockMatchTotal():Number
        {
            return (m_localObject.game.records.vs.stockMatchTotal as Number);
        }

        public static function set StockMatchTotal(_arg_1:Number):void
        {
            m_localObject.game.records.vs.stockMatchTotal = _arg_1;
        }

        public static function get VSPlayContestants():Number
        {
            return (m_localObject.game.records.vs.vsPlayContestants as Number);
        }

        public static function get VSCPULevel1():Number
        {
            return (m_localObject.game.options.VS_CPULevel1 as Number);
        }

        public static function get VSCPULevel2():Number
        {
            return (m_localObject.game.options.VS_CPULevel2 as Number);
        }

        public static function get VSCPULevel3():Number
        {
            return (m_localObject.game.options.VS_CPULevel3 as Number);
        }

        public static function get VSCPULevel4():Number
        {
            return (m_localObject.game.options.VS_CPULevel4 as Number);
        }

        public static function get VSCPULevel5():Number
        {
            return (m_localObject.game.options.VS_CPULevel5 as Number);
        }

        public static function get VSCPULevel6():Number
        {
            return (m_localObject.game.options.VS_CPULevel6 as Number);
        }

        public static function get VSCPULevel7():Number
        {
            return (m_localObject.game.options.VS_CPULevel7 as Number);
        }

        public static function get VSCPULevel8():Number
        {
            return (m_localObject.game.options.VS_CPULevel8 as Number);
        }

        public static function set VSPlayContestants(_arg_1:Number):void
        {
            m_localObject.game.records.misc.vsPlayContestants = _arg_1;
        }

        public static function set VSCPULevel1(_arg_1:Number):void
        {
            m_localObject.game.options.VS_CPULevel1 = _arg_1;
        }

        public static function set VSCPULevel2(_arg_1:Number):void
        {
            m_localObject.game.options.VS_CPULevel2 = _arg_1;
        }

        public static function set VSCPULevel3(_arg_1:Number):void
        {
            m_localObject.game.options.VS_CPULevel3 = _arg_1;
        }

        public static function set VSCPULevel4(_arg_1:Number):void
        {
            m_localObject.game.options.VS_CPULevel4 = _arg_1;
        }

        public static function set VSCPULevel5(_arg_1:Number):void
        {
            m_localObject.game.options.VS_CPULevel5 = _arg_1;
        }

        public static function set VSCPULevel6(_arg_1:Number):void
        {
            m_localObject.game.options.VS_CPULevel6 = _arg_1;
        }

        public static function set VSCPULevel7(_arg_1:Number):void
        {
            m_localObject.game.options.VS_CPULevel7 = _arg_1;
        }

        public static function set VSCPULevel8(_arg_1:Number):void
        {
            m_localObject.game.options.VS_CPULevel8 = _arg_1;
        }

        public static function get MatchResets():Number
        {
            return (m_localObject.game.records.misc.matchResets as Number);
        }

        public static function set MatchResets(_arg_1:Number):void
        {
            m_localObject.game.records.misc.matchResets = _arg_1;
        }

        public static function get RememberMe():String
        {
            return ((m_localObject.game.options.rememberMe) ? (m_localObject.game.options.rememberMe as String) : null);
        }

        public static function set RememberMe(_arg_1:String):void
        {
            m_localObject.game.options.rememberMe = _arg_1;
        }

        public static function get Quality():String
        {
            return (m_localObject.game.options.quality as String);
        }

        public static function set Quality(_arg_1:String):void
        {
            m_localObject.game.options.quality = _arg_1;
            Main.Root.stage.quality = _arg_1;
        }

        public static function get Names():Object
        {
            return (m_localObject.game.options.names as Object);
        }

        public static function get FullScreenQuality():int
        {
            return (m_localObject.game.options.fullscreen_quality as int);
        }

        public static function set FullScreenQuality(_arg_1:int):void
        {
            m_localObject.game.options.fullscreen_quality = _arg_1;
        }

        public static function get MeleeAirDodge():Boolean
        {
            return (m_localObject.game.options.meleeAirDodge as Boolean);
        }

        public static function set MeleeAirDodge(_arg_1:Boolean):void
        {
            m_localObject.game.options.meleeAirDodge = _arg_1;
        }

        public static function get Records():Object
        {
            return (m_localObject.game.records);
        }

        public static function get Unlocks():Object
        {
            return (m_localObject.game.unlocks as Object);
        }


    }
}//package com.mcleodgaming.ssf2.util