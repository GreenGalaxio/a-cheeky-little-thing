package com.mcleodgaming.ssf2.enums
{
   public class SpecialMode
   {
      
      public static const MINI:uint = 1;
      
      public static const MEGA:uint = 2;
      
      public static const SLOW:uint = 4;
      
      public static const LIGHTNING:uint = 8;
      
      public static const VAMPIRE:uint = 16;
      
      public static const VENGEANCE:uint = 32;
      
      public static const FREEZE:uint = 64;
      
      public static const EGG:uint = 128;
      
      public static const DRAMATIC:uint = 256;
      
      public static const LIGHT:uint = 4096;
      
      public static const HEAVY:uint = 8192;
      
      public static const TURBO:uint = 512;
      
      public static const INVISIBLE:uint = 1024;
      
      public static const METAL:uint = 2048;
      
      private static var statesArr:Array;
       
      
      public function SpecialMode()
      {
         super();
      }
      
      public static function init() : void
      {
         trace("Initialized SpecialMode class");
      }
      
      public static function modeEnabled(param1:uint, param2:uint) : Boolean
      {
         return Boolean((param1 & param2) > 0);
      }
      
      public static function setModeEnabled(param1:uint, param2:uint, param3:Boolean) : uint
      {
         return !!param3?uint(param1 | param2):uint(param1 & ~param2);
      }
   }
}
