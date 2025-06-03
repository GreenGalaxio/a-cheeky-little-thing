package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class SoloMenu extends Menu
   {
       
      
      private var m_classicNode:MenuMapperNode;
      
      private var m_trainingNode:MenuMapperNode;
      
      private var m_stadiumNode:MenuMapperNode;
      
      private var m_eventsNode:MenuMapperNode;
      
      public function SoloMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_solo");
         m_container.addChild(m_subMenu);
         this.initMenuMappings();
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
      }
      
      override public function initMenuMappings() : void
      {
         this.m_classicNode = new MenuMapperNode(m_subMenu.classic_btn);
         this.m_trainingNode = new MenuMapperNode(m_subMenu.training_btn);
         this.m_stadiumNode = new MenuMapperNode(m_subMenu.stadium_btn);
         this.m_eventsNode = new MenuMapperNode(m_subMenu.events_btn);
         this.m_classicNode.updateNodes([this.m_trainingNode],[this.m_trainingNode],null,null,this.classic_MOUSE_OVER,this.classic_MOUSE_OUT,this.classic_CLICK,this.back_CLICK_menu);
         this.m_trainingNode.updateNodes(null,null,[this.m_stadiumNode],[this.m_eventsNode],this.training_MOUSE_OVER,this.training_MOUSE_OUT,this.training_CLICK,this.back_CLICK_menu);
         this.m_stadiumNode.updateNodes(null,null,[this.m_eventsNode],[this.m_trainingNode],this.stadium_MOUSE_OVER,this.stadium_MOUSE_OUT,this.stadium_CLICK,this.back_CLICK_menu);
         this.m_eventsNode.updateNodes(null,null,[this.m_trainingNode],[this.m_stadiumNode],this.events_MOUSE_OVER,this.events_MOUSE_OUT,this.events_CLICK,this.back_CLICK_menu);
         m_menuMapper = new MenuMapper(this.m_trainingNode);
         m_menuMapper.init();
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
         }
         super.makeEvents();
         resetAllButtons();
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK_menu);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_menu);
         m_subMenu.training_btn.addEventListener(MouseEvent.MOUSE_OVER,this.training_MOUSE_OVER);
         m_subMenu.training_btn.addEventListener(MouseEvent.MOUSE_OUT,this.training_MOUSE_OUT);
         m_subMenu.training_btn.addEventListener(MouseEvent.CLICK,this.training_CLICK);
         m_subMenu.classic_btn.addEventListener(MouseEvent.MOUSE_OVER,this.classic_MOUSE_OVER);
         m_subMenu.classic_btn.addEventListener(MouseEvent.MOUSE_OUT,this.classic_MOUSE_OUT);
         m_subMenu.classic_btn.addEventListener(MouseEvent.CLICK,this.classic_CLICK);
         m_subMenu.events_btn.addEventListener(MouseEvent.MOUSE_OVER,this.events_MOUSE_OVER);
         m_subMenu.events_btn.addEventListener(MouseEvent.MOUSE_OUT,this.events_MOUSE_OUT);
         m_subMenu.events_btn.addEventListener(MouseEvent.CLICK,this.events_CLICK);
         m_subMenu.stadium_btn.addEventListener(MouseEvent.MOUSE_OVER,this.stadium_MOUSE_OVER);
         m_subMenu.stadium_btn.addEventListener(MouseEvent.MOUSE_OUT,this.stadium_MOUSE_OUT);
         m_subMenu.stadium_btn.addEventListener(MouseEvent.CLICK,this.stadium_CLICK);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         Main.Root.stage.addEventListener(Event.ENTER_FRAME,manageMenuMappings);
         setMenuMappingFocus();
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_menu);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_menu);
         m_subMenu.training_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.training_MOUSE_OVER);
         m_subMenu.training_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.training_MOUSE_OUT);
         m_subMenu.training_btn.removeEventListener(MouseEvent.CLICK,this.training_CLICK);
         m_subMenu.classic_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.classic_MOUSE_OVER);
         m_subMenu.classic_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.classic_MOUSE_OUT);
         m_subMenu.classic_btn.removeEventListener(MouseEvent.CLICK,this.classic_CLICK);
         m_subMenu.events_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.events_MOUSE_OVER);
         m_subMenu.events_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.events_MOUSE_OUT);
         m_subMenu.events_btn.removeEventListener(MouseEvent.CLICK,this.events_CLICK);
         m_subMenu.stadium_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.stadium_MOUSE_OVER);
         m_subMenu.stadium_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.stadium_MOUSE_OUT);
         m_subMenu.stadium_btn.removeEventListener(MouseEvent.CLICK,this.stadium_CLICK);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         Main.Root.stage.removeEventListener(Event.ENTER_FRAME,manageMenuMappings);
      }
      
      private function classic_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Defeat foes to advance!";
      }
      
      private function classic_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function classic_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_selectstage");
         m_subMenu.desc_txt.text = "";
         MenuController.classicMenu.reset();
         MenuController.showClassicMenu();
         SoundQueue.instance.playVoiceEffect("narrator_classic");
      }
      
      private function events_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Complete specific objectives!";
      }
      
      private function events_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function events_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_selectstage");
         m_subMenu.desc_txt.text = "";
         MenuController.eventMenu.reset();
         MenuController.showEventMenu();
         SoundQueue.instance.playVoiceEffect("narrator_event");
      }
      
      private function training_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Head here for your daily training.";
      }
      
      private function training_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function training_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_selectstage");
         m_subMenu.desc_txt.text = "";
         MenuController.trainingMenu.reset();
         MenuController.showTrainingMenu();
         SoundQueue.instance.playVoiceEffect("narrator_training");
      }
      
      private function adventure_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Adventure Mode.";
      }
      
      private function adventure_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function adventure_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_selectstage");
         m_subMenu.desc_txt.text = "";
         MenuController.showAdventureMenu();
      }
      
      private function stadium_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Stadium Mode.";
      }
      
      private function stadium_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function stadium_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_selectstage");
         m_subMenu.desc_txt.text = "";
         MenuController.showStadiumMenu();
      }
      
      private function back_CLICK_menu(param1:Event) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_back");
         m_subMenu.desc_txt.text = "";
         MenuController.showMainMenu();
      }
      
      private function back_ROLL_OVER_menu(param1:Event) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function home_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_back");
         SoundQueue.instance.stopMusic();
         MenuController.removeAllMenus();
         MenuController.showTitleMenu();
      }
   }
}
