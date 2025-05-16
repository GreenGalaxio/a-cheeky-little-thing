package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.Version;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TitleMenu extends Menu
   {
       
      
      private var m_playNode:MenuMapperNode;
      
      private var m_started:Boolean;
      
      public function TitleMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_title");
         this.m_started = false;
         this.initMenuMappings();
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         m_subMenu.build_txt.text = Version.getVersion();
      }
      
      override public function initMenuMappings() : void
      {
         this.m_playNode = new MenuMapperNode(m_subMenu.play_btn2);
         this.m_playNode.updateNodes(null,null,null,null,null,null,this.play_btn_CLICK,null);
         m_menuMapper = new MenuMapper(this.m_playNode);
         m_menuMapper.init();
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
         }
         super.makeEvents();
         resetAllButtons();
         m_subMenu.play_btn2.addEventListener(MouseEvent.CLICK,this.play_btn_CLICK);
         m_subMenu.mglink.addEventListener(MouseEvent.CLICK,this.callLink);
         m_subMenu.fbk.addEventListener(MouseEvent.CLICK,this.fbkLink);
         m_subMenu.gplus.addEventListener(MouseEvent.CLICK,this.gplusLink);
         m_subMenu.yt.addEventListener(MouseEvent.CLICK,this.ytLink);
         m_subMenu.twit.addEventListener(MouseEvent.CLICK,this.twitLink);
         m_subMenu.debugOff.addEventListener(MouseEvent.CLICK,this.turnOff);
         m_subMenu.cred.addEventListener(MouseEvent.CLICK,this.cred_CLICK);
         Main.Root.stage.addEventListener(Event.ENTER_FRAME,manageMenuMappings);
         setMenuMappingFocus();
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.play_btn2.removeEventListener(MouseEvent.CLICK,this.play_btn_CLICK);
         m_subMenu.mglink.removeEventListener(MouseEvent.CLICK,this.callLink);
         m_subMenu.fbk.removeEventListener(MouseEvent.CLICK,this.fbkLink);
         m_subMenu.gplus.removeEventListener(MouseEvent.CLICK,this.gplusLink);
         m_subMenu.yt.removeEventListener(MouseEvent.CLICK,this.ytLink);
         m_subMenu.twit.removeEventListener(MouseEvent.CLICK,this.twitLink);
         m_subMenu.debugOff.removeEventListener(MouseEvent.CLICK,this.turnOff);
         m_subMenu.cred.removeEventListener(MouseEvent.CLICK,this.cred_CLICK);
         Main.Root.stage.removeEventListener(Event.ENTER_FRAME,manageMenuMappings);
      }
      
      private function cred_CLICK(param1:MouseEvent) : void
      {
         MenuController.showCreditsMenu();
      }
      
      private function callLink(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var url:String = "http://www.mcleodgaming.com/redirect.php?url=mg_main";
         try
         {
            Main.getURL(url,"_blank");
            return;
         }
         catch(err:Error)
         {
            trace("Error occurred!");
            return;
         }
      }
      
      private function fbkLink(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var url:String = "http://www.mcleodgaming.com/redirect.php?url=mg_facebook";
         try
         {
            Main.getURL(url,"_blank");
            return;
         }
         catch(err:Error)
         {
            trace("Error occurred!");
            return;
         }
      }
      
      private function gplusLink(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var url:String = "http://www.mcleodgaming.com/redirect.php?url=mg_gplus";
         try
         {
            Main.getURL(url,"_blank");
            return;
         }
         catch(err:Error)
         {
            trace("Error occurred!");
            return;
         }
      }
      
      private function ytLink(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var url:String = "http://www.mcleodgaming.com/redirect.php?url=mg_youtube";
         try
         {
            Main.getURL(url,"_blank");
            return;
         }
         catch(err:Error)
         {
            trace("Error occurred!");
            return;
         }
      }
      
      private function twitLink(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var url:String = "http://www.mcleodgaming.com/redirect.php?url=mg_twitter";
         try
         {
            Main.getURL(url,"_blank");
            return;
         }
         catch(err:Error)
         {
            trace("Error occurred!");
            return;
         }
      }
      
      private function play_btn_CLICK(param1:MouseEvent) : void
      {
         if(!this.m_started)
         {
            this.m_started = true;
            SoundQueue.instance.playSoundEffect("menu_selectstage");
            Main.Root.stage.addEventListener(Event.ENTER_FRAME,this.play_btn_ENTER_FRAME);
            m_subMenu.starter.play();
         }
      }
      
      private function play_btn_ENTER_FRAME(param1:Event) : void
      {
         if(this.m_started && m_subMenu.starter.currentFrame >= m_subMenu.starter.totalFrames)
         {
            removeSelf();
            this.m_started = false;
            Main.Root.stage.removeEventListener(Event.ENTER_FRAME,this.play_btn_ENTER_FRAME);
            m_subMenu.starter.gotoAndStop(1);
            if(Main.AUTHORIZED)
            {
               MenuController.showMainMenu();
            }
            else
            {
               MenuController.showBlockedMenu();
            }
         }
      }
      
      private function turnOff(param1:MouseEvent) : void
      {
      }
   }
}
