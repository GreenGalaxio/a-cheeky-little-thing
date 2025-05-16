package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.enums.ModeFeatures;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import flash.events.MouseEvent;
   
   public class VSMenu extends CharacterSelectMenu
   {
       
      
      public function VSMenu(param1:String)
      {
         super(param1);
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
         m_subMenu.charSelection.incShortcut.addEventListener(MouseEvent.CLICK,this.inc_CLICK);
         m_subMenu.charSelection.decShortcut.addEventListener(MouseEvent.CLICK,this.dec_CLICK);
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.menu_open.removeEventListener(MouseEvent.CLICK,this.menu_open_CLICK);
         m_subMenu.menu_open.removeEventListener(MouseEvent.ROLL_OVER,this.menu_open_ROLL_OVER);
         m_subMenu.charSelection.bnGameMode.removeEventListener(MouseEvent.CLICK,this.gameMode_CLICK);
         m_subMenu.charSelection.incShortcut.removeEventListener(MouseEvent.CLICK,this.inc_CLICK);
         m_subMenu.charSelection.decShortcut.removeEventListener(MouseEvent.CLICK,this.dec_CLICK);
      }
      
      override public function reset() : void
      {
         gameMode = Mode.VS;
         super.reset();
      }
      
      override public function backMain_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:uint = Mode.VS;
         if(GameController.currentGame.GameMode)
         {
            _loc2_ = GameController.currentGame.GameMode;
            if(ModeFeatures.hasFeature(ModeFeatures.ALLOW_SAVE_VS_OPTIONS,GameController.currentGame.GameMode))
            {
               GameController.currentGame.saveVSOptions();
            }
         }
         super.backMain_CLICK(param1);
         if(_loc2_ == Mode.VS)
         {
            if(m_backOverride != null)
            {
               m_backOverride();
               m_backOverride = null;
            }
            else
            {
               MenuController.showGroupMenu();
            }
         }
         else if(_loc2_ == Mode.ONLINE)
         {
            MultiplayerManager.reset();
            if(m_backOverride != null)
            {
               m_backOverride();
               m_backOverride = null;
            }
            else
            {
               MenuController.showOnlineMenu();
            }
         }
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
      
      protected function inc_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         GameController.currentGame.incrementShortcut();
      }
      
      protected function dec_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         GameController.currentGame.decrementShortcut();
      }
      
      public function gameMode_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         GameController.currentGame.toggleGameMode();
      }
   }
}
