package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class Intro2Menu extends Menu
   {
       
      
      private var waitASec:Boolean;
      
      private var m_skipNode:MenuMapperNode;
      
      private var m_vault:Boolean;
      
      public function Intro2Menu()
      {
         super();
         m_subMenu = Main.getLibraryMC("ssf2intro_v9");
         this.m_vault = false;
         if(m_subMenu)
         {
            m_subMenu.stop();
            m_container.addChild(m_subMenu);
            this.initMenuMappings();
         }
         this.waitASec = true;
      }
      
      public function setVault(param1:Boolean) : void
      {
         this.m_vault = param1;
      }
      
      override public function initMenuMappings() : void
      {
         this.m_skipNode = new MenuMapperNode(m_subMenu);
         this.m_skipNode.updateNodes(null,null,null,null,null,null,this.endIntro,this.endIntro);
         m_menuMapper = new MenuMapper(this.m_skipNode);
         m_menuMapper.init();
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
         }
         super.makeEvents();
         if(m_subMenu == null)
         {
            removeSelf();
            MenuController.showTitleMenu();
         }
         else
         {
            Main.Root.stage.addEventListener(MouseEvent.CLICK,this.endIntro);
            Main.Root.stage.addEventListener(Event.ENTER_FRAME,this.checkIntro);
            Main.Root.stage.addEventListener(Event.ENTER_FRAME,manageMenuMappings);
         }
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         if(m_subMenu)
         {
            Main.Root.stage.removeEventListener(MouseEvent.CLICK,this.endIntro);
            Main.Root.stage.removeEventListener(Event.ENTER_FRAME,this.checkIntro);
            Main.Root.stage.removeEventListener(Event.ENTER_FRAME,manageMenuMappings);
         }
      }
      
      private function endIntro(param1:MouseEvent) : void
      {
         if(!this.waitASec)
         {
            m_subMenu.stop();
            SoundQueue.instance.playSoundEffect("menu_selectstage");
            this.toTitle();
         }
      }
      
      private function toTitle() : void
      {
         removeSelf();
         if(m_subMenu)
         {
            m_subMenu.stop();
         }
         if(this.m_vault)
         {
            MenuController.showVaultMenu();
         }
         else
         {
            MenuController.showTitleMenu();
         }
      }
      
      private function checkIntro(param1:Event) : void
      {
         if(m_subMenu.currentFrame >= m_subMenu.totalFrames - 1)
         {
            m_subMenu.stop();
            if(this.m_vault)
            {
               MenuController.showVaultMenu();
            }
            else
            {
               MenuController.showTitleMenu();
            }
            removeSelf();
         }
         this.waitASec = false;
      }
      
      override public function show() : void
      {
         this.waitASec = true;
         if(m_subMenu)
         {
            m_subMenu.gotoAndPlay(1);
            super.show();
         }
         else
         {
            this.toTitle();
         }
      }
   }
}
