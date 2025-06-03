package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.Version;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.Game;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.engine.ReplayData;
   import com.mcleodgaming.ssf2.engine.SSF2File;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import com.mcleodgaming.ssf2.util.Resource;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class VaultMenu extends Menu
   {
       
      
      private var m_replayNode:MenuMapperNode;
      
      private var m_introNode:MenuMapperNode;
      
      private var m_intro2Node:MenuMapperNode;
      
      protected var m_loadingMask:MovieClip;
      
      public function VaultMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_vault");
         m_container.addChild(m_subMenu);
         this.initMenuMappings();
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         this.m_loadingMask = Main.getLibraryMC("loadingMask");
         this.m_loadingMask.x = Main.Width / 2;
         this.m_loadingMask.y = Main.Height / 2;
      }
      
      override public function initMenuMappings() : void
      {
         this.m_replayNode = new MenuMapperNode(m_subMenu.replays_btn);
         this.m_introNode = new MenuMapperNode(m_subMenu.intro_btn);
         this.m_intro2Node = new MenuMapperNode(m_subMenu.intro2_btn);
         this.m_replayNode.updateNodes(null,null,[this.m_intro2Node],[this.m_introNode],null,null,this.replay_CLICK,null,null,null);
         this.m_introNode.updateNodes(null,null,[this.m_replayNode],[this.m_intro2Node],null,null,this.play_intro,this.back_CLICK_vault,null,null);
         this.m_intro2Node.updateNodes(null,null,[this.m_introNode],[this.m_replayNode],null,null,this.play_intro2,this.back_CLICK_vault,null,null);
         m_menuMapper = new MenuMapper(this.m_introNode);
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
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK_vault);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_vault);
         m_subMenu.intro_btn.addEventListener(MouseEvent.CLICK,this.play_intro);
         m_subMenu.intro2_btn.addEventListener(MouseEvent.CLICK,this.play_intro2);
         m_subMenu.intro_btn.addEventListener(MouseEvent.MOUSE_OVER,this.intro_MOUSE_OVER);
         m_subMenu.intro2_btn.addEventListener(MouseEvent.MOUSE_OVER,this.intro2_MOUSE_OVER);
         m_subMenu.intro_btn.addEventListener(MouseEvent.MOUSE_OUT,this.intro_MOUSE_OUT);
         m_subMenu.intro2_btn.addEventListener(MouseEvent.MOUSE_OUT,this.intro_MOUSE_OUT);
         m_subMenu.replays_btn.addEventListener(MouseEvent.CLICK,this.replay_CLICK);
         m_subMenu.replays_btn.addEventListener(MouseEvent.MOUSE_OVER,this.replay_MOUSE_OVER);
         m_subMenu.replays_btn.addEventListener(MouseEvent.MOUSE_OUT,this.replay_MOUSE_OUT);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         Main.Root.stage.addEventListener(Event.ENTER_FRAME,manageMenuMappings);
         setMenuMappingFocus();
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_vault);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_vault);
         m_subMenu.intro_btn.removeEventListener(MouseEvent.CLICK,this.play_intro);
         m_subMenu.intro2_btn.removeEventListener(MouseEvent.CLICK,this.play_intro2);
         m_subMenu.intro_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.intro_MOUSE_OVER);
         m_subMenu.intro2_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.intro2_MOUSE_OVER);
         m_subMenu.intro_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.intro_MOUSE_OUT);
         m_subMenu.intro2_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.intro_MOUSE_OUT);
         m_subMenu.replays_btn.removeEventListener(MouseEvent.CLICK,this.replay_CLICK);
         m_subMenu.replays_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.replay_MOUSE_OVER);
         m_subMenu.replays_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.replay_MOUSE_OUT);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         Main.Root.stage.removeEventListener(Event.ENTER_FRAME,manageMenuMappings);
      }
      
      private function play_intro(param1:MouseEvent) : void
      {
         var _loc2_:SSF2File = null;
         var _loc3_:Resource = null;
         SoundQueue.instance.playSoundEffect("menu_select");
         if(MenuController.introMenu)
         {
            SoundQueue.instance.stopMusic();
            removeSelf();
            MenuController.showIntroMenu();
         }
         else
         {
            Main.Root.addChild(this.m_loadingMask);
            _loc2_ = Main.getSSF2FileByID("ssf2intro_v8");
            _loc3_ = new Resource(_loc2_.Location,Resource.EXTRA);
            Main.Resources.push(_loc3_);
            _loc3_.load(this.introLoaded);
         }
      }
      
      private function introLoaded(param1:Event = null) : void
      {
         SoundQueue.instance.stopMusic();
         removeSelf();
         Main.Root.removeChild(this.m_loadingMask);
         MenuController.showIntroMenu();
      }
      
      private function play_intro2(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_select");
         SoundQueue.instance.stopMusic();
         MenuController.showIntro2Menu(true);
      }
      
      private function intro_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Watch the SSF2 v0.8 Intro.";
      }
      
      private function intro2_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Watch the SSF2 v0.9 Intro.";
      }
      
      private function intro_MOUSE_OUT(param1:MouseEvent) : void
      {
         if(m_subMenu.desc_txt != null)
         {
            m_subMenu.desc_txt.text = "";
         }
      }
      
      private function replay_CLICK(param1:MouseEvent) : void
      {
         var replayTimer:Timer = null;
         var replayFunc:Function = null;
         var e:MouseEvent = param1;
         SoundQueue.instance.playSoundEffect("menu_select");
         Utils.openFile("SSF2 Replay File (*.ssfrec)","*.ssfrec");
         replayTimer = new Timer(20);
         MultiplayerManager.makeNotifier();
         replayFunc = function(param1:TimerEvent):void
         {
            var _loc2_:ByteArray = null;
            var _loc3_:ReplayData = null;
            if(Utils.finishedLoading)
            {
               replayTimer.removeEventListener(TimerEvent.TIMER,replayFunc);
               replayTimer.stop();
               if(Utils.openSuccess)
               {
                  _loc2_ = Utils.fileRef.data;
                  _loc2_.uncompress();
                  _loc3_ = new ReplayData();
                  _loc3_.importReplay(_loc2_.readUTF());
                  if(_loc3_.VersionNumber != Version.getVersion() && ReplayData.COMPATIBLE_VERSIONS.indexOf(_loc3_.VersionNumber) < 0)
                  {
                     MultiplayerManager.notify("Error, incompatible version number. Received version\t" + _loc3_.VersionNumber + " (Expecting " + Version.getVersion() + ")");
                  }
                  else
                  {
                     GameController.currentGame = new Game(null,_loc3_.GameMode === Mode.ONLINE?uint(Mode.VS):uint(_loc3_.GameMode));
                     GameController.currentGame.ReplayDataObj = _loc3_;
                     MenuController.removeAllMenus();
                     GameController.currentGame.initReplay();
                     MultiplayerManager.notify("Succesfully loaded replay.");
                  }
               }
               else
               {
                  MultiplayerManager.notify("Replay file could not be loaded.");
               }
            }
         };
         replayTimer.addEventListener(TimerEvent.TIMER,replayFunc);
         replayTimer.start();
      }
      
      private function replay_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Re-watch all the action!";
      }
      
      private function replay_MOUSE_OUT(param1:MouseEvent) : void
      {
         if(m_subMenu.desc_txt != null)
         {
            m_subMenu.desc_txt.text = "";
         }
      }
      
      private function back_CLICK_vault(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_back");
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_vault);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_vault);
         m_subMenu.intro_btn.removeEventListener(MouseEvent.CLICK,this.play_intro);
         m_subMenu.intro_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.intro_MOUSE_OVER);
         m_subMenu.intro2_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.intro2_MOUSE_OVER);
         m_subMenu.intro_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.intro_MOUSE_OUT);
         m_subMenu.intro2_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.intro_MOUSE_OUT);
         MenuController.showMainMenu();
      }
      
      private function back_ROLL_OVER_vault(param1:MouseEvent) : void
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
