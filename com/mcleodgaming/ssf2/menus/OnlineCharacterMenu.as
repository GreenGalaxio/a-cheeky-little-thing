package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import flash.events.MouseEvent;
   
   public class OnlineCharacterMenu extends CharacterSelectMenu
   {
       
      
      public function OnlineCharacterMenu(param1:String)
      {
         super(param1);
      }
      
      override public function reset() : void
      {
         gameMode = Mode.ONLINE;
         super.reset();
         var _loc1_:int = 1;
         while(_loc1_ < Main.MAXPLAYERS)
         {
            GameController.currentGame.PlayerSettings[_loc1_].exist = false;
            _loc1_++;
         }
         GameController.currentGame.updateDisplay();
      }
      
      override public function show() : void
      {
         super.show();
         if(GameController.currentGame)
         {
            GameController.currentGame.updateDisplay();
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
         m_subMenu.menu_open.addEventListener(MouseEvent.CLICK,this.menu_open_CLICK);
         m_subMenu.menu_open.addEventListener(MouseEvent.ROLL_OVER,this.menu_open_ROLL_OVER);
         m_subMenu.charSelection.bnGameMode.addEventListener(MouseEvent.CLICK,this.gameMode_CLICK);
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.charSelection.bnGameMode.removeEventListener(MouseEvent.CLICK,this.gameMode_CLICK);
         m_subMenu.menu_open.removeEventListener(MouseEvent.CLICK,this.menu_open_CLICK);
         m_subMenu.menu_open.removeEventListener(MouseEvent.ROLL_OVER,this.menu_open_ROLL_OVER);
      }
      
      override public function backMain_CLICK(param1:MouseEvent) : void
      {
         MultiplayerManager.disconnect();
         super.backMain_CLICK(param1);
         MenuController.showOnlineMenu();
      }
      
      public function menu_open_CLICK(param1:MouseEvent) : void
      {
         if(GameController.currentGame.hasVisibleKeypad())
         {
            SoundQueue.instance.playSoundEffect("menu_error");
            return;
         }
         SoundQueue.instance.playSoundEffect("menu_select");
         MenuController.showRulesMenu();
      }
      
      public function menu_open_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      public function gameMode_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         GameController.currentGame.toggleGameMode();
      }
   }
}
