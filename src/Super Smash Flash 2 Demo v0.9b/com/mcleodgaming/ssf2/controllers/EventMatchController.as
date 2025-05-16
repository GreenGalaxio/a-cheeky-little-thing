package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.enums.Difficulty;
   
   public class EventMatchController
   {
      
      public static var success:Boolean = false;
      
      public static var score:int = 0;
      
      public static var score_fps:Number = 0;
      
      public static var difficulty:uint = Difficulty.VERY_EASY;
      
      public static var currentEvent:EventMatch = null;
      
      private static var m_eventMatchList:Vector.<EventMatch> = null;
      
      {
         currentEvent = null;
      }
      
      public function EventMatchController()
      {
         super();
      }
      
      public static function init() : void
      {
         m_eventMatchList = new Vector.<EventMatch>();
         m_eventMatchList.push(new EventMatch(EventMatch.CATCH_EM_ALL,m_eventMatchList.length + 1,EventMatch.TYPE_TIME,"Catch \'em all!","Be the last one standing in this Pokémon scuffle!"));
         m_eventMatchList.push(new EventMatch(EventMatch.SWORDSMEN,m_eventMatchList.length + 1,EventMatch.TYPE_TIME,"Swordsmen","Prove that two swords are better than one!"));
         m_eventMatchList.push(new EventMatch(EventMatch.AT_YOUR_SERVICE,m_eventMatchList.length + 1,EventMatch.TYPE_TIME,"At Your Service","Use assist trophies to take out your giant opponent!"));
         m_eventMatchList.push(new EventMatch(EventMatch.BOUNTY_HUNTING,m_eventMatchList.length + 1,EventMatch.TYPE_TIME,"Bounty Hunting","Kill the green Yoshi without harming any innocent bystanders."));
         m_eventMatchList.push(new EventMatch(EventMatch.LORD_OF_THE_JUNGLE_2,m_eventMatchList.length + 1,EventMatch.TYPE_TIME,"Lord of the Jungle 2","This time he\'s brought a friend! Are you still the top primate?"));
         m_eventMatchList.push(new EventMatch(EventMatch.DARK_LINKS_ADVANCE,m_eventMatchList.length + 1,EventMatch.TYPE_TIME,"Dark Link\'s Advance","Defeat your shadow before the darkness envelops you."));
         m_eventMatchList.push(new EventMatch(EventMatch.METEO_CAMPAIGN,m_eventMatchList.length + 1,EventMatch.TYPE_TIME,"Meteo Campaign","Defeat Fox on his home turf!"));
         m_eventMatchList.push(new EventMatch(EventMatch.NIGHTMARE_IN_DREAMLAND,m_eventMatchList.length + 1,EventMatch.TYPE_TIME,"Nightmare in Dreamland","Protect Kirby from the enigmatic attackers!"));
         m_eventMatchList.push(new EventMatch(EventMatch.SPEED_DEMON,m_eventMatchList.length + 1,EventMatch.TYPE_TIME,"Speed Demon","Kill your speedy opponent before time runs out."));
         m_eventMatchList.push(new EventMatch(EventMatch.NINTENDO_ALLSTARS,m_eventMatchList.length + 1,EventMatch.TYPE_TIME,"Nintendo All-Stars","Prove your worth against flagship Nintendo characters!"));
         trace("EventMatchController class initialized");
      }
      
      public static function get EventMatchList() : Vector.<EventMatch>
      {
         return m_eventMatchList;
      }
   }
}
