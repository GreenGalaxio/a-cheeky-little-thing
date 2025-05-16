package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.menus.BlockedMenu;
   import com.mcleodgaming.ssf2.menus.CharacterSelectMenu;
   import com.mcleodgaming.ssf2.menus.ClassicMenu;
   import com.mcleodgaming.ssf2.menus.ControlsMenu;
   import com.mcleodgaming.ssf2.menus.CreditsMenu;
   import com.mcleodgaming.ssf2.menus.DataMenu;
   import com.mcleodgaming.ssf2.menus.DisclaimerMenu;
   import com.mcleodgaming.ssf2.menus.EventMatchCharacterMenu;
   import com.mcleodgaming.ssf2.menus.EventMenu;
   import com.mcleodgaming.ssf2.menus.FakeDebugConsole;
   import com.mcleodgaming.ssf2.menus.GroupMenu;
   import com.mcleodgaming.ssf2.menus.Intro2Menu;
   import com.mcleodgaming.ssf2.menus.IntroMenu;
   import com.mcleodgaming.ssf2.menus.ItemSwitchMenu;
   import com.mcleodgaming.ssf2.menus.MainMenu;
   import com.mcleodgaming.ssf2.menus.MatchResultsMenu;
   import com.mcleodgaming.ssf2.menus.Menu;
   import com.mcleodgaming.ssf2.menus.OnlineCharacterMenu;
   import com.mcleodgaming.ssf2.menus.OnlineMenu;
   import com.mcleodgaming.ssf2.menus.OptionsMenu;
   import com.mcleodgaming.ssf2.menus.PleaseWaitMenu;
   import com.mcleodgaming.ssf2.menus.PostUnlockMenu;
   import com.mcleodgaming.ssf2.menus.PreUnlockMenu;
   import com.mcleodgaming.ssf2.menus.QualityMenu;
   import com.mcleodgaming.ssf2.menus.RulesMenu;
   import com.mcleodgaming.ssf2.menus.SoloMenu;
   import com.mcleodgaming.ssf2.menus.SoundMenu;
   import com.mcleodgaming.ssf2.menus.SpecialModeMenu;
   import com.mcleodgaming.ssf2.menus.StadiumMenu;
   import com.mcleodgaming.ssf2.menus.StageSelectMenu;
   import com.mcleodgaming.ssf2.menus.StageSwitchMenu;
   import com.mcleodgaming.ssf2.menus.TargetTestMenu;
   import com.mcleodgaming.ssf2.menus.TitleMenu;
   import com.mcleodgaming.ssf2.menus.TrainingMenu;
   import com.mcleodgaming.ssf2.menus.VSMenu;
   import com.mcleodgaming.ssf2.menus.VaultMenu;
   
   public class MenuController
   {
      
      private static var m_debugConsole:FakeDebugConsole = null;
      
      private static var m_blockedMenu:BlockedMenu = null;
      
      private static var m_introMenu:IntroMenu = null;
      
      private static var m_intro2Menu:Intro2Menu = null;
      
      private static var m_titleMenu:TitleMenu = null;
      
      private static var m_disclaimerMenu:DisclaimerMenu = null;
      
      private static var m_creditsMenu:CreditsMenu = null;
      
      private static var m_mainMenu:MainMenu = null;
      
      private static var m_dataMenu:DataMenu = null;
      
      private static var m_groupMenu:GroupMenu = null;
      
      private static var m_onlineMenu:OnlineMenu = null;
      
      private static var m_optionsMenu:OptionsMenu = null;
      
      private static var m_qualityMenu:QualityMenu = null;
      
      private static var m_soloMenu:SoloMenu = null;
      
      private static var m_soundMenu:SoundMenu = null;
      
      private static var m_stadiumMenu:StadiumMenu = null;
      
      private static var m_stageSelectMenu:StageSelectMenu = null;
      
      private static var m_vaultMenu:VaultMenu = null;
      
      private static var m_vsMenu:VSMenu = null;
      
      private static var m_classicMenu:ClassicMenu = null;
      
      private static var m_eventMenu:EventMenu = null;
      
      private static var m_eventMatchCharacterMenu:EventMatchCharacterMenu = null;
      
      private static var m_onlineCharacterMenu:OnlineCharacterMenu = null;
      
      private static var m_trainingMenu:TrainingMenu = null;
      
      private static var m_targetTestMenu:TargetTestMenu = null;
      
      private static var m_rulesMenu:RulesMenu = null;
      
      private static var m_specialModeMenu:SpecialModeMenu = null;
      
      private static var m_controlsMenu:ControlsMenu = null;
      
      private static var m_itemSwitchMenu:ItemSwitchMenu = null;
      
      private static var m_stageSwitchMenu:StageSwitchMenu = null;
      
      private static var m_matchResultsMenu:MatchResultsMenu = null;
      
      private static var m_preUnlockMenu:PreUnlockMenu = null;
      
      private static var m_postUnlockMenu:PostUnlockMenu = null;
      
      private static var m_pleaseWaitMenu:PleaseWaitMenu = null;
      
      private static var m_finalMenu:Menu = null;
      
      private static var m_currentCharacterSelectMenu:CharacterSelectMenu = null;
       
      
      public function MenuController()
      {
         super();
      }
      
      public static function init() : void
      {
         m_blockedMenu = new BlockedMenu();
         m_introMenu = null;
         m_intro2Menu = new Intro2Menu();
         m_titleMenu = new TitleMenu();
         m_disclaimerMenu = new DisclaimerMenu();
         m_creditsMenu = new CreditsMenu();
         m_mainMenu = new MainMenu();
         m_dataMenu = new DataMenu();
         m_groupMenu = new GroupMenu();
         m_onlineMenu = new OnlineMenu();
         m_optionsMenu = new OptionsMenu();
         m_qualityMenu = new QualityMenu();
         m_soloMenu = new SoloMenu();
         m_soundMenu = new SoundMenu();
         m_stadiumMenu = new StadiumMenu();
         m_finalMenu = m_blockedMenu;
         m_stageSelectMenu = new StageSelectMenu();
         m_vaultMenu = new VaultMenu();
         m_eventMenu = new EventMenu();
         m_eventMatchCharacterMenu = new EventMatchCharacterMenu("menu_charselect_event");
         m_onlineCharacterMenu = new OnlineCharacterMenu("menu_charselect_online");
         m_vsMenu = new VSMenu("menu_charselect_vs");
         m_classicMenu = new ClassicMenu("menu_charselect_classic");
         m_trainingMenu = new TrainingMenu("menu_charselect_training");
         m_targetTestMenu = new TargetTestMenu("menu_charselect_targettest");
         m_rulesMenu = new RulesMenu();
         m_specialModeMenu = new SpecialModeMenu();
         m_controlsMenu = new ControlsMenu();
         m_itemSwitchMenu = new ItemSwitchMenu();
         m_stageSwitchMenu = new StageSwitchMenu();
         m_matchResultsMenu = null;
         m_preUnlockMenu = new PreUnlockMenu();
         m_postUnlockMenu = new PostUnlockMenu();
         m_pleaseWaitMenu = new PleaseWaitMenu();
         if(Main.DEBUG)
         {
            m_debugConsole = new FakeDebugConsole();
         }
         m_currentCharacterSelectMenu = null;
         trace("MenuController class initialized");
      }
      
      public static function removeAllMenus() : void
      {
         m_blockedMenu.removeSelf();
         if(m_introMenu)
         {
            m_introMenu.removeSelf();
         }
         m_intro2Menu.removeSelf();
         m_titleMenu.removeSelf();
         m_disclaimerMenu.removeSelf();
         m_creditsMenu.removeSelf();
         m_mainMenu.removeSelf();
         m_dataMenu.removeSelf();
         m_groupMenu.removeSelf();
         m_onlineMenu.removeSelf();
         m_optionsMenu.removeSelf();
         m_qualityMenu.removeSelf();
         m_soloMenu.removeSelf();
         m_soundMenu.removeSelf();
         m_stadiumMenu.removeSelf();
         m_stageSelectMenu.removeSelf();
         m_vaultMenu.removeSelf();
         m_rulesMenu.removeSelf();
         m_specialModeMenu.removeSelf();
         m_controlsMenu.removeSelf();
         m_itemSwitchMenu.removeSelf();
         m_stageSwitchMenu.removeSelf();
         m_preUnlockMenu.removeSelf();
         m_postUnlockMenu.removeSelf();
         m_pleaseWaitMenu.removeSelf();
         if(m_currentCharacterSelectMenu)
         {
            m_currentCharacterSelectMenu.removeSelf();
         }
         m_currentCharacterSelectMenu = null;
      }
      
      public static function get debugConsole() : FakeDebugConsole
      {
         return m_debugConsole;
      }
      
      public static function get blockedMenu() : BlockedMenu
      {
         return m_blockedMenu;
      }
      
      public static function get introMenu() : IntroMenu
      {
         return m_introMenu;
      }
      
      public static function get intro2Menu() : Intro2Menu
      {
         return m_intro2Menu;
      }
      
      public static function get titleMenu() : TitleMenu
      {
         return m_titleMenu;
      }
      
      public static function get disclaimerMenu() : DisclaimerMenu
      {
         return m_disclaimerMenu;
      }
      
      public static function get creditsMenu() : CreditsMenu
      {
         return m_creditsMenu;
      }
      
      public static function get mainMenu() : MainMenu
      {
         return m_mainMenu;
      }
      
      public static function get dataMenu() : DataMenu
      {
         return m_dataMenu;
      }
      
      public static function get groupMenu() : GroupMenu
      {
         return m_groupMenu;
      }
      
      public static function get onlineMenu() : OnlineMenu
      {
         return m_onlineMenu;
      }
      
      public static function get optionsMenu() : OptionsMenu
      {
         return m_optionsMenu;
      }
      
      public static function get qualityMenu() : QualityMenu
      {
         return m_qualityMenu;
      }
      
      public static function get soloMenu() : SoloMenu
      {
         return m_soloMenu;
      }
      
      public static function get soundMenu() : SoundMenu
      {
         return m_soundMenu;
      }
      
      public static function get stadiumMenu() : StadiumMenu
      {
         return m_stadiumMenu;
      }
      
      public static function get stageSelectMenu() : StageSelectMenu
      {
         return m_stageSelectMenu;
      }
      
      public static function get vaultMenu() : VaultMenu
      {
         return m_vaultMenu;
      }
      
      public static function get vsMenu() : VSMenu
      {
         return m_vsMenu;
      }
      
      public static function get classicMenu() : ClassicMenu
      {
         return m_classicMenu;
      }
      
      public static function get eventMenu() : EventMenu
      {
         return m_eventMenu;
      }
      
      public static function get eventMatchCharacterMenu() : EventMatchCharacterMenu
      {
         return m_eventMatchCharacterMenu;
      }
      
      public static function get onlineCharacterMenu() : OnlineCharacterMenu
      {
         return m_onlineCharacterMenu;
      }
      
      public static function get trainingMenu() : TrainingMenu
      {
         return m_trainingMenu;
      }
      
      public static function get targetTestMenu() : TargetTestMenu
      {
         return m_targetTestMenu;
      }
      
      public static function get rulesMenu() : RulesMenu
      {
         return m_rulesMenu;
      }
      
      public static function get specialModeMenu() : SpecialModeMenu
      {
         return m_specialModeMenu;
      }
      
      public static function get controlsMenu() : ControlsMenu
      {
         return m_controlsMenu;
      }
      
      public static function get itemSwitchMenu() : ItemSwitchMenu
      {
         return m_itemSwitchMenu;
      }
      
      public static function get stageSwitchMenu() : StageSwitchMenu
      {
         return m_stageSwitchMenu;
      }
      
      public static function get matchResultsMenu() : MatchResultsMenu
      {
         return m_matchResultsMenu;
      }
      
      public static function get preUnlockMenu() : PreUnlockMenu
      {
         return m_preUnlockMenu;
      }
      
      public static function get postUnlockMenu() : PostUnlockMenu
      {
         return m_postUnlockMenu;
      }
      
      public static function get pleaseWaitMenu() : PleaseWaitMenu
      {
         return m_pleaseWaitMenu;
      }
      
      public static function get CurrentCharacterSelectMenu() : CharacterSelectMenu
      {
         return m_currentCharacterSelectMenu;
      }
      
      public static function set CurrentCharacterSelectMenu(param1:CharacterSelectMenu) : void
      {
         m_currentCharacterSelectMenu = param1;
      }
      
      public static function showBlockedMenu() : void
      {
         m_blockedMenu.show();
      }
      
      public static function showIntroMenu() : void
      {
         if(!m_introMenu)
         {
            m_introMenu = null;
            m_introMenu = new IntroMenu();
         }
         m_introMenu.show();
      }
      
      public static function showIntro2Menu(param1:Boolean) : void
      {
         m_intro2Menu.setVault(param1);
         m_intro2Menu.show();
      }
      
      public static function showTitleMenu() : void
      {
         m_titleMenu.show();
      }
      
      public static function showDisclaimerMenu() : void
      {
         m_disclaimerMenu.show();
      }
      
      public static function showCreditsMenu() : void
      {
         m_creditsMenu.show();
         m_creditsMenu.makeEvents();
      }
      
      public static function showMainMenu() : void
      {
         SoundQueue.instance.playMusic("menumusic",0);
         m_mainMenu.show();
      }
      
      public static function showGroupMenu() : void
      {
         m_groupMenu.show();
      }
      
      public static function showSoloMenu() : void
      {
         m_soloMenu.show();
      }
      
      public static function showVaultMenu() : void
      {
         SoundQueue.instance.playMusic("menumusic",0);
         m_vaultMenu.show();
      }
      
      public static function showDataMenu() : void
      {
         m_dataMenu.show();
      }
      
      public static function showOptionsMenu() : void
      {
         m_optionsMenu.show();
      }
      
      public static function showOnlineMenu() : void
      {
         m_onlineMenu.show();
      }
      
      public static function showTrainingMenu() : void
      {
         SoundQueue.instance.playMusic("menumusic",0);
         m_trainingMenu.show();
      }
      
      public static function showStadiumMenu() : void
      {
         m_stadiumMenu.show();
      }
      
      public static function showAdventureMenu() : void
      {
      }
      
      public static function showRulesMenu() : void
      {
         m_rulesMenu.show();
      }
      
      public static function showSpecialModeMenu() : void
      {
         m_specialModeMenu.show();
      }
      
      public static function showControlsMenu() : void
      {
         m_controlsMenu.updateControls();
         m_controlsMenu.show();
      }
      
      public static function showItemSwitchMenu() : void
      {
         m_itemSwitchMenu.show();
      }
      
      public static function showStageSwitchMenu() : void
      {
         m_stageSwitchMenu.show();
      }
      
      public static function showVSMenu() : void
      {
         SoundQueue.instance.playMusic("menumusic",0);
         m_vsMenu.show();
      }
      
      public static function showClassicMenu() : void
      {
         SoundQueue.instance.playMusic("menumusic",0);
         m_classicMenu.show();
      }
      
      public static function showEventMenu() : void
      {
         SoundQueue.instance.playMusic("menumusic",0);
         m_eventMenu.show();
      }
      
      public static function showEventMatchCharacterMenu() : void
      {
         if(!m_eventMatchCharacterMenu.Container.parent)
         {
            m_eventMatchCharacterMenu.show();
         }
      }
      
      public static function showOnlineCharacterMenu() : void
      {
         SoundQueue.instance.playMusic("menumusic",0);
         if(!m_onlineCharacterMenu.Container.parent)
         {
            m_onlineCharacterMenu.show();
         }
      }
      
      public static function showQualityMenu() : void
      {
         m_qualityMenu.show();
      }
      
      public static function showSoundMenu() : void
      {
         m_soundMenu.show();
      }
      
      public static function showTargetTestMenu() : void
      {
         SoundQueue.instance.playMusic("menumusic",0);
         m_targetTestMenu.show();
      }
      
      public static function showStageSelectMenu() : void
      {
         m_stageSelectMenu.show();
      }
      
      public static function showMatchResultsMenu() : void
      {
         m_matchResultsMenu = null;
         m_matchResultsMenu = new MatchResultsMenu();
         m_matchResultsMenu.reset();
         m_matchResultsMenu.show();
      }
      
      public static function showFinal(param1:* = null) : void
      {
         SoundQueue.instance.stopMusic();
         MenuController.removeAllMenus();
         m_finalMenu.show();
      }
      
      public static function showPreUnlockMenu() : void
      {
         m_preUnlockMenu.show();
      }
      
      public static function showPostUnlockMenu() : void
      {
         m_postUnlockMenu.show();
      }
      
      public static function showPleaseWaitMenu() : void
      {
         m_pleaseWaitMenu.show();
      }
   }
}
