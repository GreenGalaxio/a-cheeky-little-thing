package com.mcleodgaming.ssf2api.core
{
   import flash.display.MovieClip;
   
   public class SSF2API
   {
      
      private static var m_api;
      
      public static const VERSION_MAJOR:int = 0;
      
      public static const VERSION_MINOR:int = 1;
      
      public static const VERSION_REVISION:int = 20;
       
      
      public function SSF2API()
      {
         super();
      }
      
      public static function init(param1:*) : Class
      {
         if(m_api)
         {
            return SSF2API;
         }
         m_api = param1;
         return SSF2API;
      }
      
      public static function signal(param1:int, param2:Object = null) : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.signal(param1,param2);
      }
      
      public static function getObjectType(param1:*) : String
      {
         return m_api.getObjectType(param1);
      }
      
      public static function getAPIVersion() : String
      {
         return SSF2API.VERSION_MAJOR + "." + SSF2API.VERSION_MINOR + "." + SSF2API.VERSION_REVISION;
      }
      
      public static function print(param1:String) : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.print(param1);
      }
      
      public static function getCharacter(param1:*) : *
      {
         if(param1 is MovieClip)
         {
            MovieClip(param1).stop();
         }
         if(!isReady())
         {
            return null;
         }
         return m_api.getCharacter(param1);
      }
      
      public static function getProjectile(param1:*) : *
      {
         if(param1 is MovieClip)
         {
            MovieClip(param1).stop();
         }
         if(!isReady())
         {
            return null;
         }
         return m_api.getProjectile(param1);
      }
      
      public static function getItem(param1:*) : *
      {
         if(param1 is MovieClip)
         {
            MovieClip(param1).stop();
         }
         if(!isReady())
         {
            return null;
         }
         return m_api.getItem(param1);
      }
      
      public static function getEnemy(param1:*) : *
      {
         if(param1 is MovieClip)
         {
            MovieClip(param1).stop();
         }
         if(!isReady())
         {
            return null;
         }
         return m_api.getEnemy(param1);
      }
      
      public static function getCamBounds() : Object
      {
         if(!isReady())
         {
            return null;
         }
         return m_api.getCamBounds();
      }
      
      public static function getDeathBounds() : Object
      {
         if(!isReady())
         {
            return null;
         }
         return m_api.getDeathBounds();
      }
      
      public static function lightFlash(param1:Boolean = true) : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.lightFlash(param1);
      }
      
      public static function addEventListener(param1:*, param2:String, param3:Function, param4:Object = null) : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.addEventListener(param1,param2,param3,param4);
      }
      
      public static function removeEventListener(param1:*, param2:String, param3:Function) : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.removeEventListener(param1,param2,param3);
      }
      
      public static function createTimer(param1:*, param2:int, param3:int, param4:Function, param5:Object = null) : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.createTimer(param1,param2,param3,param4,param5);
      }
      
      public static function destroyTimer(param1:*, param2:Function) : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.destroyTimer(param1,param2);
      }
      
      public static function playSound(param1:String, param2:Boolean = false) : int
      {
         if(!isReady())
         {
            return -1;
         }
         return m_api.playSound(param1,param2);
      }
      
      public static function stopSound(param1:int) : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.stopSound(param1);
      }
      
      public static function shakeCamera(param1:int) : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.shakeCamera(param1);
      }
      
      public static function matchGo() : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.matchGo();
      }
      
      public static function matchGoComplete() : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.matchGoComplete();
      }
      
      public static function random() : Number
      {
         if(!isReady())
         {
            return 0;
         }
         return m_api.random();
      }
      
      public static function randomInteger(param1:int, param2:int) : int
      {
         if(!isReady())
         {
            return 0;
         }
         return m_api.randomInteger(param1,param2);
      }
      
      public static function fixBG() : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.fixBG();
      }
      
      public static function isReady() : Boolean
      {
         return m_api && m_api.isReady();
      }
      
      public function setCamStageFocus(param1:int) : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.setStageFocus(param1);
      }
      
      public function removeCamStageFocus() : void
      {
         if(!isReady())
         {
            return;
         }
         m_api.removeStageFocus();
      }
      
      public function attachEffect(param1:String, param2:Object = null) : MovieClip
      {
         if(!isReady())
         {
            return null;
         }
         return m_api.attachEffect(param1,param2);
      }
      
      public function attachEffectOverlay(param1:String, param2:Object = null) : MovieClip
      {
         if(!isReady())
         {
            return null;
         }
         return m_api.attachEffectOverlay(param1,param2);
      }
      
      public function calculateChargeDamage(param1:Object) : Number
      {
         if(!isReady())
         {
            return 0;
         }
         return m_api.calculateChargeDamage(param1);
      }
   }
}
