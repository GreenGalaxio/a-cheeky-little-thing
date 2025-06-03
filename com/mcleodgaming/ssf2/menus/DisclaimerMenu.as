package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class DisclaimerMenu extends Menu
   {
       
      
      private var waitASec:Boolean;
      
      private var m_skipNode:MenuMapperNode;
      
      public function DisclaimerMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("disclaimer");
         if(m_subMenu)
         {
            m_subMenu.stop();
            m_container.addChild(m_subMenu);
            this.initMenuMappings();
            m_subMenu.x = Main.Width / 2;
            m_subMenu.y = Main.Height / 2;
         }
         this.waitASec = true;
      }
      
      override public function initMenuMappings() : void
      {
         this.m_skipNode = new MenuMapperNode(m_subMenu);
         this.m_skipNode.updateNodes(null,null,null,null,null,null,this.skipDisclaimer,this.skipDisclaimer);
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
            MenuController.showIntro2Menu(false);
         }
         else
         {
            Main.Root.stage.addEventListener(MouseEvent.CLICK,this.skipDisclaimer);
            Main.Root.stage.addEventListener(Event.ENTER_FRAME,this.checkDisclaimer);
            Main.Root.stage.addEventListener(Event.ENTER_FRAME,manageMenuMappings);
         }
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         if(m_subMenu)
         {
            Main.Root.stage.removeEventListener(MouseEvent.CLICK,this.skipDisclaimer);
            Main.Root.stage.removeEventListener(Event.ENTER_FRAME,this.checkDisclaimer);
            Main.Root.stage.removeEventListener(Event.ENTER_FRAME,manageMenuMappings);
         }
      }
      
      private function skipDisclaimer(param1:MouseEvent) : void
      {
         if(!this.waitASec && (m_subMenu.currentFrame > 90 || Main.DEBUG))
         {
            SoundQueue.instance.playSoundEffect("menu_selectstage");
            if(m_subMenu)
            {
               m_subMenu.stop();
            }
            removeSelf();
            MenuController.showIntro2Menu(false);
         }
      }
      
      private function checkDisclaimer(param1:Event) : void
      {
         if(m_subMenu)
         {
            if(m_subMenu.currentFrame >= m_subMenu.totalFrames - 1)
            {
               m_subMenu.stop();
               removeSelf();
               MenuController.showIntro2Menu(false);
            }
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
            removeSelf();
            MenuController.showIntro2Menu(false);
         }
      }
   }
}
