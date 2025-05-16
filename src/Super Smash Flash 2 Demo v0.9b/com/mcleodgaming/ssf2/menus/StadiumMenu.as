package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class StadiumMenu extends Menu
   {
       
      
      private var m_targetTestNode:MenuMapperNode;
      
      public function StadiumMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_stadium");
         m_container.addChild(m_subMenu);
         this.initMenuMappings();
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
      }
      
      override public function initMenuMappings() : void
      {
         this.m_targetTestNode = new MenuMapperNode(m_subMenu.targettest_btn);
         this.m_targetTestNode.updateNodes(null,null,null,null,this.targettest_MOUSE_OVER,this.targettest_MOUSE_OUT,this.targettest_CLICK,this.back_CLICK_solo,null,null);
         m_menuMapper = new MenuMapper(this.m_targetTestNode);
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
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK_solo);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_solo);
         m_subMenu.targettest_btn.addEventListener(MouseEvent.MOUSE_OVER,this.targettest_MOUSE_OVER);
         m_subMenu.targettest_btn.addEventListener(MouseEvent.MOUSE_OUT,this.targettest_MOUSE_OUT);
         m_subMenu.targettest_btn.addEventListener(MouseEvent.CLICK,this.targettest_CLICK);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         Main.Root.stage.addEventListener(Event.ENTER_FRAME,manageMenuMappings);
         setMenuMappingFocus();
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_solo);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_solo);
         m_subMenu.targettest_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.targettest_MOUSE_OVER);
         m_subMenu.targettest_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.targettest_MOUSE_OUT);
         m_subMenu.targettest_btn.removeEventListener(MouseEvent.CLICK,this.targettest_CLICK);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         Main.Root.stage.removeEventListener(Event.ENTER_FRAME,manageMenuMappings);
      }
      
      private function targettest_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Target test practice.";
      }
      
      private function targettest_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function targettest_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_selectstage");
         m_subMenu.targettest_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.targettest_MOUSE_OVER);
         m_subMenu.targettest_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.targettest_MOUSE_OUT);
         m_subMenu.targettest_btn.removeEventListener(MouseEvent.CLICK,this.targettest_CLICK);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_solo);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_solo);
         m_subMenu.desc_txt.text = "";
         MenuController.targetTestMenu.reset();
         MenuController.showTargetTestMenu();
         SoundQueue.instance.playVoiceEffect("narrator_targets");
      }
      
      private function back_CLICK_solo(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_back");
         m_subMenu.targettest_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.targettest_MOUSE_OVER);
         m_subMenu.targettest_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.targettest_MOUSE_OUT);
         m_subMenu.targettest_btn.removeEventListener(MouseEvent.CLICK,this.targettest_CLICK);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_solo);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_solo);
         m_subMenu.desc_txt.text = "";
         MenuController.showSoloMenu();
      }
      
      private function back_ROLL_OVER_solo(param1:MouseEvent) : void
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
