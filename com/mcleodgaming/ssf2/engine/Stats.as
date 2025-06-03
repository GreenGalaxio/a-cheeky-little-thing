package com.mcleodgaming.ssf2.engine
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Stats
   {
      
      private static var m_ichigo:CharacterData;
      
      private static var m_ichigo_special:CharacterData;
      
      private static var m_kirby:CharacterData;
      
      private static var m_lloyd:CharacterData;
      
      private static var m_mario:CharacterData;
      
      private static var m_mario_special:CharacterData;
      
      private static var m_sonic:CharacterData;
      
      private static var m_supersonic:CharacterData;
      
      private static var m_link:CharacterData;
      
      private static var m_naruto:CharacterData;
      
      private static var m_naruto_special:CharacterData;
      
      private static var m_megaman:CharacterData;
      
      private static var m_megaman_special:CharacterData;
      
      private static var m_sora:CharacterData;
      
      private static var m_ness:CharacterData;
      
      private static var m_tails:CharacterData;
      
      private static var m_goku:CharacterData;
      
      private static var m_goku_kk:CharacterData;
      
      private static var m_goku_ss:CharacterData;
      
      private static var m_wario:CharacterData;
      
      private static var m_warioman:CharacterData;
      
      private static var m_peach:CharacterData;
      
      private static var m_blackmage:CharacterData;
      
      private static var m_pikachu:CharacterData;
      
      private static var m_fox:CharacterData;
      
      private static var m_fox_special:CharacterData;
      
      private static var m_donkeykong:CharacterData;
      
      private static var m_yoshi:CharacterData;
      
      private static var m_yoshi_special:CharacterData;
      
      private static var m_captainfalcon:CharacterData;
      
      private static var m_zelda:CharacterData;
      
      private static var m_sheik:CharacterData;
      
      private static var m_jigglypuff:CharacterData;
      
      private static var m_metaknight:CharacterData;
      
      private static var m_marth:CharacterData;
      
      private static var m_bowser:CharacterData;
      
      private static var m_samus:CharacterData;
      
      private static var m_zamus:CharacterData;
      
      private static var m_bomberman:CharacterData;
      
      private static var m_chibirobo:CharacterData;
      
      private static var m_sandbag:CharacterData;
      
      private static var m_expansions:Vector.<Vector.<CharacterData>>;
      
      private static var m_presets:Object;
      
      private static var m_statObjects:Object = new Object();
      
      {
         init();
      }
      
      public function Stats()
      {
         super();
      }
      
      public static function init() : void
      {
      }
      
      public static function initializeStatsClass() : void
      {
         trace("Stats class initialized");
      }
      
      public static function setPresets(param1:Object) : void
      {
         Stats.m_presets = param1;
         Stats.getIchigo(param1);
         Stats.getIchigo_Bankai(param1);
         Stats.getMario(param1);
         Stats.getMario_Special(param1);
         Stats.getKirby(param1);
         Stats.getLloyd(param1);
         Stats.getSonic(param1);
         Stats.getSuperSonic(param1);
         Stats.getLink(param1);
         Stats.getNaruto(param1);
         Stats.getNaruto_Special(param1);
         Stats.getMegaMan(param1);
         Stats.getMegaManSpecial(param1);
         Stats.getSora(param1);
         Stats.getTails(param1);
         Stats.getNess(param1);
         Stats.getGoku(param1);
         Stats.getGokuKK(param1);
         Stats.getGokuSS(param1);
         Stats.getWario(param1);
         Stats.getWarioMan(param1);
         Stats.getPeach(param1);
         Stats.getBlackMage(param1);
         Stats.getPikachu(param1);
         Stats.getFox(param1);
         Stats.getFoxSpecial(param1);
         Stats.getYoshi(param1);
         Stats.getYoshiSpecial(param1);
         Stats.getDonkeyKong(param1);
         Stats.getBlackMage(param1);
         Stats.getCaptainFalcon(param1);
         Stats.getZelda(param1);
         Stats.getSheik(param1);
         Stats.getJigglypuff(param1);
         Stats.getMetaKnight(param1);
         Stats.getMarth(param1);
         Stats.getBowser(param1);
         Stats.getSamus(param1);
         Stats.getZamus(param1);
         Stats.getBomberman(param1);
         Stats.getChibiRobo(param1);
         Stats.getSandBag(param1);
         Stats.m_expansions = new Vector.<Vector.<CharacterData>>();
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(Main.getExpansionCharacter(_loc2_) != null)
         {
            _loc3_ = 0;
            m_expansions[_loc2_] = new Vector.<CharacterData>();
            while(Main.getExpansionCharacterFunc(_loc2_,_loc3_) != null)
            {
               if(!Stats.loadExpansionData(_loc2_,Main.getExpansionCharacterFunc(_loc2_,_loc3_)))
               {
                  trace("Failed loading expansion id No. " + _loc2_);
               }
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      public static function writeStats(param1:String, param2:Object, param3:Object, param4:Object, param5:Object) : void
      {
         if(Stats.m_statObjects[param1] == undefined)
         {
            Stats.m_statObjects[param1] = new Object();
         }
         Stats.m_statObjects[param1].cData = param2;
         Stats.m_statObjects[param1].aData = param3;
         Stats.m_statObjects[param1].pData = param4;
         Stats.m_statObjects[param1].iData = param5;
      }
      
      public static function removeStats() : void
      {
         Stats.m_statObjects = new Object();
      }
      
      public static function statsExists(param1:String) : Boolean
      {
         return Stats["m_" + param1] !== undefined;
      }
      
      public static function getStats(param1:String, param2:Number = -1) : CharacterData
      {
         if(param2 >= 0)
         {
            return Stats.getExpansionData(param2,param1);
         }
         return Stats["m_" + param1];
      }
      
      private static function loadExpansionData(param1:int, param2:Function) : Boolean
      {
         var parameters:Object = null;
         var exp:CharacterData = null;
         var id:int = param1;
         var expFunc:Function = param2;
         try
         {
            parameters = expFunc(Stats.m_presets);
            exp = Stats.createCharacterDataFrom(parameters.cData,parameters.aData,parameters.pData,parameters.iData,Stats.m_presets);
            Stats.m_expansions[id].push(exp);
         }
         catch(error:Error)
         {
            trace("Error loading expansion data");
            return false;
         }
         return true;
      }
      
      private static function createCharacterDataFrom(param1:Object, param2:Object, param3:Object, param4:Object, param5:Object) : CharacterData
      {
         var _loc7_:Object = null;
         var _loc6_:CharacterData = new CharacterData();
         if(Stats.m_statObjects[param1.statsName] != null)
         {
            _loc7_ = Stats.m_statObjects[param1.statsName];
            _loc7_.cData.level = param5["level"];
            _loc7_.cData.x_start = param5["x_start"];
            _loc7_.cData.y_start = param5["y_start"];
            _loc7_.cData.facingRight = param5["facingRight"];
            _loc7_.cData.x_respawn = param5["x_respawn"];
            _loc7_.cData.y_respawn = param5["y_respawn"];
            _loc7_.cData.player_id = param5["player_id"];
            _loc7_.cData.sizeRatio = param5["sizeRatio"];
            _loc7_.cData.shieldType = param5["shieldType"];
            _loc6_.importData(_loc7_.cData);
            _loc6_.importAttacks(_loc7_.aData);
            _loc6_.addProjectiles(_loc7_.pData);
            _loc6_.addItems(_loc7_.iData);
         }
         else if(param2 != null)
         {
            param1.level = param5["level"];
            param1.x_start = param5["x_start"];
            param1.y_start = param5["y_start"];
            param1.facingRight = param5["facingRight"];
            param1.x_respawn = param5["x_respawn"];
            param1.y_respawn = param5["y_respawn"];
            param1.player_id = param5["player_id"];
            param1.sizeRatio = param5["sizeRatio"];
            param1.shieldType = param5["shieldType"];
            _loc6_.importData(param1);
            _loc6_.importAttacks(param2);
            _loc6_.addProjectiles(param3);
            _loc6_.addItems(param4);
         }
         else
         {
            param1.level = param5["level"];
            param1.x_start = param5["x_start"];
            param1.y_start = param5["y_start"];
            param1.facingRight = param5["facingRight"];
            param1.x_respawn = param5["x_respawn"];
            param1.y_respawn = param5["y_respawn"];
            param1.player_id = param5["player_id"];
            param1.sizeRatio = param5["sizeRatio"];
            param1.shieldType = param5["shieldType"];
            _loc6_.importData(param1);
         }
         return _loc6_;
      }
      
      private static function getExpansionData(param1:Number, param2:String = null) : CharacterData
      {
         var _loc3_:Number = NaN;
         if(param1 < 0 || param1 >= Stats.m_expansions.length || Stats.m_expansions.length == 0)
         {
            return null;
         }
         if(param2 != null && param2 != "xp")
         {
            _loc3_ = param1;
            while(_loc3_ < Stats.m_expansions.length)
            {
               if(Stats.m_expansions[_loc3_][0].StatsName == param2)
               {
                  return Stats.m_expansions[_loc3_][0];
               }
               _loc3_++;
            }
            return null;
         }
         return Stats.m_expansions[param1][0];
      }
      
      public static function getRandomCharacter() : CharacterData
      {
         var _loc1_:Array = new Array();
         _loc1_.push("ichigo");
         _loc1_.push("mario");
         _loc1_.push("kirby");
         _loc1_.push("lloyd");
         _loc1_.push("sonic");
         _loc1_.push("link");
         _loc1_.push("naruto");
         _loc1_.push("megaman");
         _loc1_.push("sora");
         _loc1_.push("tails");
         _loc1_.push("ness");
         _loc1_.push("goku");
         _loc1_.push("wario");
         _loc1_.push("peach");
         _loc1_.push("blackmage");
         _loc1_.push("pikachu");
         _loc1_.push("fox");
         _loc1_.push("yoshi");
         _loc1_.push("donkeykong");
         _loc1_.push("zelda");
         _loc1_.push("metaknight");
         _loc1_.push("marth");
         _loc1_.push("samus");
         _loc1_.push("zamus");
         _loc1_.push("bomberman");
         _loc1_.push("chibirobo");
         if(SaveData.Unlocks.jigglypuff == true)
         {
            _loc1_.push("jigglypuff");
         }
         if(SaveData.Unlocks.captainfalcon == true)
         {
            _loc1_.push("captainfalcon");
         }
         var _loc2_:String = _loc1_[Math.round(Utils.random() * (_loc1_.length - 1))];
         return Stats["m_" + _loc2_];
      }
      
      public static function getCharacterList(param1:Boolean = true) : Array
      {
         var _loc2_:Array = new Array();
         _loc2_.push("ichigo");
         _loc2_.push("mario");
         _loc2_.push("kirby");
         _loc2_.push("lloyd");
         _loc2_.push("sonic");
         _loc2_.push("link");
         _loc2_.push("naruto");
         _loc2_.push("megaman");
         _loc2_.push("sora");
         _loc2_.push("tails");
         _loc2_.push("ness");
         _loc2_.push("goku");
         _loc2_.push("wario");
         _loc2_.push("peach");
         _loc2_.push("blackmage");
         _loc2_.push("pikachu");
         _loc2_.push("fox");
         _loc2_.push("yoshi");
         _loc2_.push("donkeykong");
         _loc2_.push("zelda");
         _loc2_.push("metaknight");
         _loc2_.push("marth");
         _loc2_.push("samus");
         _loc2_.push("zamus");
         _loc2_.push("bomberman");
         _loc2_.push("chibirobo");
         if(SaveData.Unlocks.jigglypuff == true || !param1)
         {
            _loc2_.push("jigglypuff");
         }
         if(SaveData.Unlocks.captainfalcon == true || !param1)
         {
            _loc2_.push("captainfalcon");
         }
         return _loc2_;
      }
      
      private static function getIchigo(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"ichigo",
            "linkage_id":"ichigo",
            "displayName":"Ichigo"
         };
         Stats.m_ichigo = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getIchigo_Bankai(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"ichigo_special",
            "linkage_id":"ichigo_special",
            "displayName":"Ichigo"
         };
         Stats.m_ichigo_special = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getMario(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"mario",
            "linkage_id":"mario",
            "displayName":"Mario"
         };
         Stats.m_mario = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getMario_Special(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"mario_special",
            "linkage_id":"mario_special",
            "displayName":"Fire%20Mario"
         };
         Stats.m_mario_special = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getKirby(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"kirby",
            "linkage_id":"kirby",
            "displayName":"Kirby"
         };
         Stats.m_kirby = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getLloyd(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"lloyd",
            "linkage_id":"lloyd",
            "displayName":"Lloyd"
         };
         Stats.m_lloyd = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getSonic(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"sonic",
            "linkage_id":"sonicremastered",
            "displayName":"Sonic"
         };
         Stats.m_sonic = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getSuperSonic(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"supersonic",
            "linkage_id":"newsupersonic1",
            "displayName":"Super%20Sonic"
         };
         Stats.m_supersonic = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getLink(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"link",
            "linkage_id":"link",
            "displayName":"Link"
         };
         Stats.m_link = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getNaruto(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"naruto",
            "linkage_id":"naruto",
            "displayName":"Naruto"
         };
         Stats.m_naruto = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getNaruto_Special(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"naruto_special",
            "linkage_id":"naruto_special",
            "displayName":"Naruto"
         };
         Stats.m_naruto_special = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getMegaMan(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"megaman",
            "linkage_id":"megaman",
            "displayName":"Mega%20Man"
         };
         Stats.m_megaman = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getMegaManSpecial(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"megaman_special",
            "linkage_id":"megaman_special",
            "displayName":"Mega%20Man"
         };
         Stats.m_megaman_special = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getSora(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"sora",
            "linkage_id":"sora",
            "displayName":"Sora"
         };
         Stats.m_sora = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getNess(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"ness",
            "linkage_id":"nessbase",
            "displayName":"Ness"
         };
         Stats.m_ness = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getTails(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"tails",
            "linkage_id":"tails",
            "displayName":"Tails"
         };
         Stats.m_tails = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getGoku(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"goku",
            "linkage_id":"goku",
            "displayName":"Goku"
         };
         Stats.m_goku = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getGokuKK(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"goku_kk",
            "linkage_id":"kgoku",
            "displayName":"Kaio-ken%20x2"
         };
         Stats.m_goku_kk = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getGokuSS(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"goku_ss",
            "linkage_id":"ssgoku",
            "displayName":"SSGoku"
         };
         Stats.m_goku_ss = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getWario(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"wario",
            "linkage_id":"wariobase",
            "displayName":"Wario"
         };
         Stats.m_wario = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getWarioMan(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"warioman",
            "linkage_id":"warioman",
            "displayName":"Wario-Man"
         };
         Stats.m_warioman = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getPeach(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"peach",
            "linkage_id":"peach",
            "displayName":"Peach"
         };
         Stats.m_peach = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getBlackMage(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"blackmage",
            "linkage_id":"black_mage",
            "displayName":"Black%20Mage"
         };
         Stats.m_blackmage = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getPikachu(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"pikachu",
            "linkage_id":"pikachu",
            "displayName":"Pikachu"
         };
         Stats.m_pikachu = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getFox(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"fox",
            "linkage_id":"fox",
            "displayName":"Fox"
         };
         Stats.m_fox = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getFoxSpecial(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"fox_special",
            "linkage_id":"fox_special",
            "displayName":"Fox"
         };
         Stats.m_fox_special = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getYoshi(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"yoshi",
            "linkage_id":"yoshi",
            "displayName":"Yoshi"
         };
         Stats.m_yoshi = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getYoshiSpecial(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"yoshi_special",
            "linkage_id":"yoshi_special",
            "displayName":"Dragon%20Yoshi"
         };
         Stats.m_yoshi_special = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getDonkeyKong(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"donkeykong",
            "linkage_id":"dkong",
            "displayName":"Donkey%20Kong"
         };
         Stats.m_donkeykong = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getCaptainFalcon(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"captainfalcon",
            "linkage_id":"falcon",
            "displayName":"Captain%20Falcon"
         };
         Stats.m_captainfalcon = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getZelda(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"zelda",
            "linkage_id":"zelda",
            "displayName":"Zelda"
         };
         Stats.m_zelda = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getSheik(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"sheik",
            "linkage_id":"sheik",
            "displayName":"Sheik"
         };
         Stats.m_sheik = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getJigglypuff(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"jigglypuff",
            "linkage_id":"jigglypuff",
            "displayName":"Jigglypuff"
         };
         Stats.m_jigglypuff = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getMetaKnight(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"metaknight",
            "linkage_id":"meta_knight",
            "displayName":"Meta%20Knight"
         };
         Stats.m_metaknight = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getMarth(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"marth",
            "linkage_id":"marth",
            "displayName":"Marth"
         };
         Stats.m_marth = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getBowser(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"bowser",
            "linkage_id":"bowser",
            "displayName":"Bowser"
         };
         Stats.m_bowser = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getSamus(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"samus",
            "linkage_id":"samus",
            "displayName":"Samus"
         };
         Stats.m_samus = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getZamus(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"zamus",
            "linkage_id":"zamus",
            "displayName":"Zero Suit Samus"
         };
         Stats.m_zamus = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getBomberman(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"bomberman",
            "linkage_id":"bomberman",
            "displayName":"Bomberman"
         };
         Stats.m_bomberman = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getChibiRobo(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"chibirobo",
            "linkage_id":"chibirobo",
            "displayName":"Chibi Robo"
         };
         Stats.m_chibirobo = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
      
      private static function getSandBag(param1:Object) : void
      {
         var _loc2_:Object = {
            "statsName":"sandbag",
            "linkage_id":"Sandbag",
            "displayName":"Sandbag"
         };
         Stats.m_sandbag = Stats.createCharacterDataFrom(_loc2_,null,null,null,param1);
      }
   }
}
