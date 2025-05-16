package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.enums.Mode;
   import flash.events.MouseEvent;
   
   public class ClassicMenu extends CharacterSelectMenu
   {
       
      
      public function ClassicMenu(param1:String)
      {
         super(param1);
      }
      
      override public function reset() : void
      {
         gameMode = Mode.CLASSIC;
         super.reset();
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
         }
         super.makeEvents();
         if(GameController.currentGame)
         {
            GameController.currentGame.UsingLives = false;
            GameController.currentGame.UsingTime = false;
            GameController.currentGame.DamageRatio = 1;
            GameController.currentGame.StartDamage = 0;
         }
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
         MenuController.showSoloMenu();
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
