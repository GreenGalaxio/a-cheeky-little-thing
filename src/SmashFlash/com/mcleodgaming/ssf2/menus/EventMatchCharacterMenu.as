package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.EventMatchController;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import flash.events.MouseEvent;
   
   public class EventMatchCharacterMenu extends CharacterSelectMenu
   {
       
      
      public function EventMatchCharacterMenu(param1:String)
      {
         super(param1);
      }
      
      override public function reset() : void
      {
         GameController.currentGame = EventMatchController.currentEvent.matchSetup(m_subMenu);
         if(!GameController.currentGame)
         {
            removeSelf();
            MenuController.showEventMenu();
            return;
         }
         if(GameController.currentGame.PlayerSettings[0].character)
         {
            GameController.currentGame.initEventMatch();
            SoundQueue.instance.playSoundEffect("menu_select");
         }
         else
         {
            SoundQueue.instance.playSoundEffect("narrator_choose");
         }
         MenuController.CurrentCharacterSelectMenu = this;
         m_subMenu.readyToFight.visible = false;
         super.updateIcons();
         initChips();
         GameController.currentGame.updateDisplay();
      }
      
      override public function show() : void
      {
         if(GameController.currentGame && !GameController.currentGame.PlayerSettings[0].character)
         {
            super.show();
         }
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
         }
         super.makeEvents();
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
      }
      
      override public function backMain_CLICK(param1:MouseEvent) : void
      {
         super.backMain_CLICK(param1);
         MenuController.showEventMenu();
      }
      
      private function home_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_back");
         SoundQueue.instance.stopMusic();
         if(GameController.currentGame)
         {
            GameController.currentGame.killEvents();
         }
         resetScreen();
         GameController.currentGame = null;
         MenuController.removeAllMenus();
         MenuController.showTitleMenu();
      }
   }
}
