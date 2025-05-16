package com.mcleodgaming.ssf2.controllers
{
   public class UnlockController
   {
      
      public static var nextMenuFunc:Function;
      
      private static var m_pendingUnlockFights:Vector.<Unlockable>;
      
      private static var m_pendingUnlockScreens:Vector.<Unlockable>;
      
      private static var m_unlockList:Vector.<Unlockable> = null;
       
      
      public function UnlockController()
      {
         super();
      }
      
      public static function init() : void
      {
         nextMenuFunc = null;
         m_unlockList = new Vector.<Unlockable>();
         m_pendingUnlockFights = new Vector.<Unlockable>();
         m_pendingUnlockScreens = new Vector.<Unlockable>();
         m_unlockList.push(new Unlockable(Unlockable.CAPTAIN_FALCON,"Captain Falcon","Captain Falcon, the Legendary F-Zero Champion, has been unlocked!",1,1,["sandocean","captainfalcon"]));
         m_unlockList.push(new Unlockable(Unlockable.SAND_OCEAN,"Sand Ocean","Captain Falcon, the Legendary F-Zero Champion, has been unlocked!",0,2));
         m_unlockList.push(new Unlockable(Unlockable.CLOCK_TOWN,"Clock Town","Dawn of the Final Day! Clock Town has been unlocked!",0,3));
         m_unlockList.push(new Unlockable(Unlockable.JIGGLYPUFF,"Jigglypuff","Jigglypuff, the singing Balloon Pokémon, has been unlocked!",1,4,["pokemonstadium3","jigglypuff"]));
         trace("UnlockController class initialized");
      }
      
      public static function get PendingUnlockFights() : Vector.<Unlockable>
      {
         return m_pendingUnlockFights;
      }
      
      public static function get PendingUnlockScreens() : Vector.<Unlockable>
      {
         return m_pendingUnlockScreens;
      }
      
      public static function checkUnlocks() : void
      {
         while(m_pendingUnlockFights.length > 0)
         {
            m_pendingUnlockFights.splice(0,1);
         }
         while(m_pendingUnlockScreens.length > 0)
         {
            m_pendingUnlockScreens.splice(0,1);
         }
         var _loc1_:int = 0;
         while(_loc1_ < m_unlockList.length)
         {
            if(m_unlockList[_loc1_].unlocked())
            {
               if(m_unlockList[_loc1_].PreUnlockFrame > 0 && m_pendingUnlockFights.indexOf(m_unlockList[_loc1_]) < 0)
               {
                  m_pendingUnlockFights.push(m_unlockList[_loc1_]);
               }
               else if(m_unlockList[_loc1_].PostUnlockFrame > 0 && m_pendingUnlockScreens.indexOf(m_unlockList[_loc1_]) < 0)
               {
                  m_pendingUnlockScreens.push(m_unlockList[_loc1_]);
               }
            }
            _loc1_++;
         }
      }
   }
}
