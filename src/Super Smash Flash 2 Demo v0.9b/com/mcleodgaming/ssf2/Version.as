package com.mcleodgaming.ssf2
{
   public final class Version
   {
      
      public static const Major:int = 0;
      
      public static const Minor:int = 9;
      
      public static const Build:int = 1;
      
      public static const Revision:int = 1982;
       
      
      public function Version()
      {
         super();
      }
      
      public static function getVersion() : String
      {
         return Version.Major + "." + Version.Minor + "." + Version.Build + "." + Version.Revision;
      }
   }
}
