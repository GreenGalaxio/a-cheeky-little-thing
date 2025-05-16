package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.util.Base64;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.LocalConnection;
   import flash.utils.Timer;
   
   public class MainMenu extends Menu
   {
       
      
      private var m_groupNode:MenuMapperNode;
      
      private var m_soloNode:MenuMapperNode;
      
      private var m_optionsNode:MenuMapperNode;
      
      private var m_onlineNode:MenuMapperNode;
      
      private var m_dataNode:MenuMapperNode;
      
      private var m_vaultNode:MenuMapperNode;
      
      private var m_eNode:String;
      
      public function MainMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_main");
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         this.initMenuMappings();
      }
      
      override public function initMenuMappings() : void
      {
         this.m_groupNode = new MenuMapperNode(m_subMenu.group_btn);
         this.m_soloNode = new MenuMapperNode(m_subMenu.solo_btn);
         this.m_optionsNode = new MenuMapperNode(m_subMenu.options_btn);
         this.m_dataNode = new MenuMapperNode(m_subMenu.data_btn);
         this.m_vaultNode = new MenuMapperNode(m_subMenu.vault_btn);
         this.m_onlineNode = new MenuMapperNode(m_subMenu.online_btn);
         this.m_groupNode.updateNodes([this.m_optionsNode,this.m_vaultNode],[this.m_optionsNode,this.m_vaultNode],[this.m_dataNode],[this.m_onlineNode],this.group_MOUSE_OVER,this.group_MOUSE_OUT,this.group_CLICK,this.back_CLICK);
         this.m_soloNode.updateNodes([this.m_onlineNode,this.m_dataNode],[this.m_onlineNode,this.m_dataNode],[this.m_vaultNode],[this.m_optionsNode],this.solo_MOUSE_OVER,this.solo_MOUSE_OUT,this.solo_CLICK,this.back_CLICK);
         this.m_optionsNode.updateNodes([this.m_groupNode],[this.m_groupNode],[this.m_soloNode],[this.m_vaultNode],this.options_MOUSE_OVER,this.options_MOUSE_OUT,this.options_CLICK,this.back_CLICK);
         this.m_dataNode.updateNodes([this.m_soloNode],[this.m_soloNode],[this.m_onlineNode],[this.m_groupNode],this.data_MOUSE_OVER,this.data_MOUSE_OUT,this.data_CLICK,this.back_CLICK);
         this.m_vaultNode.updateNodes([this.m_groupNode],[this.m_groupNode],[this.m_optionsNode],[this.m_soloNode],this.vault_MOUSE_OVER,this.vault_MOUSE_OUT,this.vault_CLICK,this.back_CLICK);
         this.m_onlineNode.updateNodes([this.m_soloNode],[this.m_soloNode],[this.m_groupNode],[this.m_dataNode],this.online_MOUSE_OVER,this.online_MOUSE_OUT,this.online_CLICK,this.back_CLICK);
         m_subMenu.online_btn.buttonMode = true;
         m_subMenu.online_btn.useHandCursor = true;
         Utils.setTint(m_subMenu.online_btn,1,1,1,1,0,0,0,0);
         m_menuMapper = new MenuMapper(this.m_groupNode);
         m_menuMapper.init();
      }
      
      override public function makeEvents() : void
      {
         var _loc3_:Timer = null;
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
         }
         super.makeEvents();
         resetAllButtons();
         m_subMenu.vault_btn.addEventListener(MouseEvent.MOUSE_OVER,this.vault_MOUSE_OVER);
         m_subMenu.vault_btn.addEventListener(MouseEvent.MOUSE_OUT,this.vault_MOUSE_OUT);
         m_subMenu.vault_btn.addEventListener(MouseEvent.CLICK,this.vault_CLICK);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER);
         m_subMenu.group_btn.addEventListener(MouseEvent.MOUSE_OVER,this.group_MOUSE_OVER);
         m_subMenu.group_btn.addEventListener(MouseEvent.MOUSE_OUT,this.group_MOUSE_OUT);
         m_subMenu.group_btn.addEventListener(MouseEvent.CLICK,this.group_CLICK);
         m_subMenu.options_btn.addEventListener(MouseEvent.MOUSE_OVER,this.options_MOUSE_OVER);
         m_subMenu.options_btn.addEventListener(MouseEvent.MOUSE_OUT,this.options_MOUSE_OUT);
         m_subMenu.options_btn.addEventListener(MouseEvent.CLICK,this.options_CLICK);
         m_subMenu.online_btn.addEventListener(MouseEvent.MOUSE_OVER,this.online_MOUSE_OVER);
         m_subMenu.online_btn.addEventListener(MouseEvent.MOUSE_OUT,this.online_MOUSE_OUT);
         m_subMenu.online_btn.addEventListener(MouseEvent.CLICK,this.online_CLICK);
         m_subMenu.solo_btn.addEventListener(MouseEvent.MOUSE_OVER,this.solo_MOUSE_OVER);
         m_subMenu.solo_btn.addEventListener(MouseEvent.MOUSE_OUT,this.solo_MOUSE_OUT);
         m_subMenu.solo_btn.addEventListener(MouseEvent.CLICK,this.solo_CLICK);
         m_subMenu.data_btn.addEventListener(MouseEvent.MOUSE_OVER,this.data_MOUSE_OVER);
         m_subMenu.data_btn.addEventListener(MouseEvent.MOUSE_OUT,this.data_MOUSE_OUT);
         m_subMenu.data_btn.addEventListener(MouseEvent.CLICK,this.data_CLICK);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         Main.Root.stage.addEventListener(Event.ENTER_FRAME,manageMenuMappings);
         setMenuMappingFocus();
         var _loc1_:LocalConnection = new LocalConnection();
         var _loc2_:String = _loc1_.domain;
         if(_loc2_ == Base64.decode("bG9jYWxob3N0") || _loc2_ == Base64.decode("MTI3LjAuMC4x"))
         {
            Main[Base64.decode("QVVUSE9SSVpFRA==")] = true;
         }
         else if(_loc2_.indexOf(Base64.decode("bWNsZW9kZ2FtaW5nLmNvbQ=="),0) < 0)
         {
            Main[Base64.decode("QVVUSE9SSVpFRA==")] = false;
         }
         if(!Main[Base64.decode("QVVUSE9SSVpFRA==")] || !Main.Root.loaderInfo.applicationDomain.hasDefinition("ff5089d9"))
         {
            _loc3_ = new Timer(200,1);
            SoundQueue.instance.stopMusic();
            MenuController.removeAllMenus();
            _loc3_.addEventListener(TimerEvent.TIMER_COMPLETE,MenuController.showFinal);
            _loc3_.start();
         }
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.vault_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.vault_MOUSE_OVER);
         m_subMenu.vault_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.vault_MOUSE_OUT);
         m_subMenu.vault_btn.removeEventListener(MouseEvent.CLICK,this.vault_CLICK);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER);
         m_subMenu.group_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.group_MOUSE_OVER);
         m_subMenu.group_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.group_MOUSE_OUT);
         m_subMenu.group_btn.removeEventListener(MouseEvent.CLICK,this.group_CLICK);
         m_subMenu.options_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.options_MOUSE_OVER);
         m_subMenu.options_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.options_MOUSE_OUT);
         m_subMenu.options_btn.removeEventListener(MouseEvent.CLICK,this.options_CLICK);
         m_subMenu.online_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.online_MOUSE_OVER);
         m_subMenu.online_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.online_MOUSE_OUT);
         m_subMenu.online_btn.removeEventListener(MouseEvent.CLICK,this.online_CLICK);
         m_subMenu.solo_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.solo_MOUSE_OVER);
         m_subMenu.solo_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.solo_MOUSE_OUT);
         m_subMenu.solo_btn.removeEventListener(MouseEvent.CLICK,this.solo_CLICK);
         m_subMenu.data_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.data_MOUSE_OVER);
         m_subMenu.data_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.data_MOUSE_OUT);
         m_subMenu.data_btn.removeEventListener(MouseEvent.CLICK,this.data_CLICK);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         Main.Root.stage.removeEventListener(Event.ENTER_FRAME,manageMenuMappings);
      }
      
      private function group_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Play a variety of Smash modes with multiple players.";
      }
      
      private function group_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function group_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_select");
         m_subMenu.desc_txt.text = "";
         MenuController.showGroupMenu();
      }
      
      private function options_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Choose and save your own personal Smash settings.";
      }
      
      private function options_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function options_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_select");
         m_subMenu.desc_txt.text = "";
         MenuController.showOptionsMenu();
      }
      
      private function vault_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Check out SSF2 Media Content";
      }
      
      private function vault_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function vault_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_select");
         m_subMenu.desc_txt.text = "";
         MenuController.showVaultMenu();
      }
      
      private function online_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Go online and play against your friends!";
      }
      
      private function online_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function online_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_select");
         m_subMenu.desc_txt.text = "";
         MenuController.showOnlineMenu();
      }
      
      private function solo_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Play this mode solo or challenge it cooperatively.";
      }
      
      private function solo_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function solo_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_select");
         m_subMenu.desc_txt.text = "";
         MenuController.showSoloMenu();
      }
      
      private function data_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Manage saved game data and records.";
      }
      
      private function data_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function data_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_select");
         m_subMenu.desc_txt.text = "";
         MenuController.showDataMenu();
      }
      
      private function back_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_back");
         SoundQueue.instance.stopMusic();
         m_subMenu.desc_txt.text = "";
         MenuController.showTitleMenu();
      }
      
      private function back_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function home_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_back");
         SoundQueue.instance.stopMusic();
         removeSelf();
         MenuController.showTitleMenu();
      }
   }
}
