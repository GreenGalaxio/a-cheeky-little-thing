package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.enums.Mode;
   import flash.events.MouseEvent;
   
   public class TargetTestMenu extends CharacterSelectMenu
   {
       
      
      public var stage_id:int = 1;
      
      public function TargetTestMenu(param1:String)
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
         if(GameController.currentGame)
         {
            GameController.currentGame.UsingLives = false;
            GameController.currentGame.UsingTime = true;
            GameController.currentGame.CountDown = false;
            GameController.currentGame.StartDamage = 0;
            GameController.currentGame.DamageRatio = 1;
         }
         m_subMenu.decLevel.addEventListener(MouseEvent.CLICK,this.decLevel_CLICK);
         m_subMenu.incLevel.addEventListener(MouseEvent.CLICK,this.incLevel_CLICK);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.decLevel.removeEventListener(MouseEvent.CLICK,this.decLevel_CLICK);
         m_subMenu.incLevel.removeEventListener(MouseEvent.CLICK,this.incLevel_CLICK);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
      }
      
      override public function reset() : void
      {
         gameMode = Mode.TARGET_TEST;
         super.reset();
         GameController.currentGame.updateTargetTestDisplay();
      }
      
      override public function show() : void
      {
         GameController.currentGame.updateTargetTestDisplay();
         super.show();
         this.updateText();
      }
      
      override public function backMain_CLICK(param1:MouseEvent) : void
      {
         super.backMain_CLICK(param1);
         MenuController.showStadiumMenu();
      }
      
      public function updateText() : void
      {
         m_subMenu.level_txt.text = "Level " + this.stage_id;
      }
      
      private function decLevel_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         this.stage_id--;
         if(this.stage_id < 1)
         {
            this.stage_id = 3;
         }
         this.updateText();
         if(GameController.currentGame)
         {
            GameController.currentGame.updateTargetTestID();
            GameController.currentGame.updateTargetTestDisplay();
         }
      }
      
      private function incLevel_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         this.stage_id++;
         if(this.stage_id > 3)
         {
            this.stage_id = 1;
         }
         this.updateText();
         if(GameController.currentGame)
         {
            GameController.currentGame.updateTargetTestID();
            GameController.currentGame.updateTargetTestDisplay();
         }
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
