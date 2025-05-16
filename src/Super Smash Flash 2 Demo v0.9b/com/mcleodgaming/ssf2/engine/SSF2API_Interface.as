package com.mcleodgaming.ssf2.engine
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.assists.AssistTrophy;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.pokemon.Pokemon;
   import flash.display.MovieClip;
   
   public class SSF2API_Interface
   {
      
      private static var m_apiObject:StageData;
      
      public static const VERSION_MAJOR:int = 0;
      
      public static const VERSION_MINOR:int = 1;
      
      public static const VERSION_REVISION:int = 20;
       
      
      public function SSF2API_Interface()
      {
         super();
      }
      
      public static function init(param1:StageData) : void
      {
         m_apiObject = param1;
         trace("SSF2 API Interface Version " + SSF2API_Interface.VERSION_MAJOR + "." + SSF2API_Interface.VERSION_MINOR + "." + SSF2API_Interface.VERSION_REVISION + " has been initialized.");
      }
      
      public static function deinit() : void
      {
         m_apiObject = null;
         trace("SSF2 API Interface deactivated.");
      }
      
      public static function versionCompareTo(param1:int, param2:int, param3:int) : int
      {
         if(VERSION_MAJOR > param1)
         {
            return 1;
         }
         if(VERSION_MAJOR < param1)
         {
            return -1;
         }
         if(VERSION_MINOR > param2)
         {
            return 1;
         }
         if(VERSION_MINOR < param2)
         {
            return -1;
         }
         if(VERSION_REVISION > param3)
         {
            return 1;
         }
         if(VERSION_REVISION < param3)
         {
            return -1;
         }
         return 0;
      }
      
      public static function getAPIVersion() : String
      {
         return VERSION_MAJOR + "." + VERSION_MINOR + "." + VERSION_REVISION;
      }
      
      public static function signal(param1:int, param2:Object = null) : void
      {
      }
      
      public static function getObjectType(param1:*) : String
      {
         if(param1 as Character)
         {
            return "Character";
         }
         if(param1 as Projectile)
         {
            return "Projectile";
         }
         if(param1 as Item)
         {
            return "Item";
         }
         if(param1 as AssistTrophy)
         {
            return "AssistTrophy";
         }
         if(param1 as Pokemon)
         {
            return "Pokemon";
         }
         if(param1 as String)
         {
            return "String";
         }
         if(param1 as int)
         {
            return "int";
         }
         if(param1 as uint)
         {
            return "uint";
         }
         if(param1 as Number)
         {
            return "Number";
         }
         if(param1 as Boolean)
         {
            return "Boolean";
         }
         if(param1 as Array)
         {
            return "Array";
         }
         if(param1 as Object)
         {
            return "Object";
         }
         return null;
      }
      
      public static function getCharacter(param1:*) : *
      {
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         if(!isReady())
         {
            return null;
         }
         var _loc2_:int = -1;
         if(param1 is MovieClip)
         {
            _loc3_ = MovieClip(param1);
            _loc4_ = null;
            if(_loc3_.parent)
            {
               _loc4_ = _loc3_.parent as MovieClip;
            }
            _loc4_ = _loc4_;
            if(_loc3_.player_id != undefined)
            {
               _loc2_ = _loc3_.player_id;
            }
            else if(_loc3_.parent && _loc3_.parent is MovieClip && MovieClip(_loc3_.parent).player_id != undefined)
            {
               _loc2_ = MovieClip(_loc3_.parent).player_id;
            }
            else
            {
               return m_apiObject.getPlayerByMC(_loc3_);
            }
         }
         else if(param1 is int || param1 is Number)
         {
            _loc2_ = param1;
         }
         else if(param1 is Character)
         {
            _loc2_ = Character(param1).ID;
         }
         if(_loc2_ > -1)
         {
            return m_apiObject.getPlayer(_loc2_);
         }
         return null;
      }
      
      public static function getProjectile(param1:*) : *
      {
         var _loc3_:MovieClip = null;
         if(!isReady())
         {
            return null;
         }
         var _loc2_:int = -1;
         if(param1 is MovieClip)
         {
            _loc3_ = MovieClip(param1);
            if(_loc3_.projectile_id != undefined)
            {
               _loc2_ = _loc3_.projectile_id;
            }
            else if(_loc3_.parent && _loc3_.parent is MovieClip && MovieClip(_loc3_.parent).projectile_id != undefined)
            {
               _loc2_ = MovieClip(_loc3_.parent).projectile_id;
            }
            else
            {
               return m_apiObject.getProjectileByMC(_loc3_);
            }
         }
         else if(param1 is int || param1 is Number)
         {
            _loc2_ = param1;
         }
         else if(param1 is Projectile)
         {
            _loc2_ = Projectile(param1).UID;
         }
         if(_loc2_ > -1)
         {
            return m_apiObject.getProjectile(_loc2_);
         }
         return null;
      }
      
      public static function getItem(param1:*) : *
      {
         var _loc3_:MovieClip = null;
         if(!isReady())
         {
            return null;
         }
         var _loc2_:int = -1;
         if(param1 is MovieClip)
         {
            _loc3_ = MovieClip(param1);
            if(_loc3_.item_id != undefined)
            {
               _loc2_ = _loc3_.item_id;
            }
            else if(_loc3_.parent && _loc3_.parent is MovieClip && MovieClip(_loc3_.parent).item_id != undefined)
            {
               _loc2_ = MovieClip(_loc3_.parent).item_id;
            }
            else
            {
               return m_apiObject.getItemByMC(_loc3_);
            }
         }
         else if(param1 is int || param1 is Number)
         {
            _loc2_ = param1;
         }
         else if(param1 is Item)
         {
            _loc2_ = Item(param1).UID;
         }
         if(_loc2_ > -1)
         {
            return m_apiObject.getItem(_loc2_);
         }
         return null;
      }
      
      public static function getEnemy(param1:*) : *
      {
         var _loc3_:MovieClip = null;
         if(!isReady())
         {
            return null;
         }
         var _loc2_:int = -1;
         if(param1 is MovieClip)
         {
            _loc3_ = MovieClip(param1);
            if(_loc3_.enemy_id != undefined)
            {
               _loc2_ = _loc3_.enemy_id;
            }
            else if(_loc3_.parent && _loc3_.parent is MovieClip && MovieClip(_loc3_.parent).enemy_id != undefined)
            {
               _loc2_ = MovieClip(_loc3_.parent).enemy_id;
            }
            else
            {
               return m_apiObject.getEnemyByMC(_loc3_);
            }
         }
         else if(param1 is int || param1 is Number)
         {
            _loc2_ = param1;
         }
         else if(param1 is Enemy)
         {
            _loc2_ = Enemy(param1).UID;
         }
         if(_loc2_ > -1)
         {
            return m_apiObject.getEnemy(_loc2_);
         }
         return null;
      }
      
      public static function getCamBounds() : Object
      {
         if(!isReady())
         {
            return null;
         }
         return m_apiObject.getCamBounds();
      }
      
      public static function getDeathBounds() : Object
      {
         if(!isReady())
         {
            return null;
         }
         return m_apiObject.getDeathBounds();
      }
      
      public static function triggerFSCutscene() : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.triggerFSCutscene();
      }
      
      public static function killFSCutscene() : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.killFSCutscene();
      }
      
      public static function lightFlash(param1:Boolean = true) : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.lightFlash(param1);
      }
      
      public static function setCamStageFocus(param1:int) : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.CamRef.setStageFocus(param1);
      }
      
      public static function removeCamStageFocus() : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.CamRef.removeStageFocus();
      }
      
      public static function print(param1:String) : void
      {
         if(Main.DEBUG && MenuController.debugConsole)
         {
            MenuController.debugConsole.writeTextData(param1);
         }
      }
      
      public static function addEventListener(param1:*, param2:String, param3:Function, param4:Object = null) : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.addEventListener(param1,param2,param3,param4);
      }
      
      public static function removeEventListener(param1:*, param2:String, param3:Function) : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.removeEventListener(param1,param2,param3);
      }
      
      public static function createTimer(param1:*, param2:int, param3:int, param4:Function, param5:Object = null) : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.createTimer(param1,param2,param3,param4,param5);
      }
      
      public static function destroyTimer(param1:*, param2:Function) : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.destroyTimer(param1,param2);
      }
      
      public static function playSound(param1:String, param2:Boolean = false) : int
      {
         if(param1 == "whip")
         {
            trace(true);
         }
         if(!isReady())
         {
            return -1;
         }
         if(param2)
         {
            return m_apiObject.playSpecificVoice(param1);
         }
         return m_apiObject.playSpecificSound(param1);
      }
      
      public static function stopSound(param1:int) : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.stopSound(param1);
      }
      
      public static function shakeCamera(param1:int) : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.shakeCamera(param1);
      }
      
      public static function matchGo() : void
      {
         if(!isReady())
         {
            return;
         }
         if(m_apiObject.StageEvent)
         {
            m_apiObject.StageEvent = false;
            if(m_apiObject.GameRef.UsingTime)
            {
               m_apiObject.TimerRef.Restart();
               m_apiObject.TimerRef.Start();
            }
         }
      }
      
      public static function matchGoComplete() : void
      {
         if(!isReady())
         {
            return;
         }
         if(m_apiObject.HudRef)
         {
            m_apiObject.HudRef.visible = true;
         }
      }
      
      public static function random() : Number
      {
         if(!isReady())
         {
            return 0;
         }
         return m_apiObject.random();
      }
      
      public static function randomInteger(param1:int, param2:int) : int
      {
         if(!isReady())
         {
            return 0;
         }
         return m_apiObject.randomInteger(param1,param2);
      }
      
      public static function fixBG() : void
      {
         if(!isReady())
         {
            return;
         }
         m_apiObject.fixBG();
      }
      
      public static function isReady() : Boolean
      {
         return m_apiObject && m_apiObject && m_apiObject.ActiveScripts;
      }
      
      public function attachEffect(param1:String, param2:Object = null) : MovieClip
      {
         return m_apiObject.attachEffect(param1,param2);
      }
      
      public function attachEffectOverlay(param1:String, param2:Object = null) : MovieClip
      {
         return m_apiObject.attachEffectOverlay(param1,param2);
      }
      
      public function calculateChargeDamage(param1:Object) : Number
      {
         return m_apiObject.calculateChargeDamage(param1);
      }
   }
}
