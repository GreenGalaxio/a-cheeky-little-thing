package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.controllers.UnlockController;
   import com.mcleodgaming.ssf2.util.Controller;
   import com.mcleodgaming.ssf2.util.Key;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class PostUnlockMenu extends Menu
   {
       
      
      private var ready:Boolean;
      
      private var m_keyLetGo:Boolean;
      
      public function PostUnlockMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_postunlock");
         m_subMenu.stop();
         this.ready = false;
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         this.m_keyLetGo = false;
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
         }
         super.makeEvents();
         m_subMenu.addEventListener(MouseEvent.CLICK,this.CLICKED);
         m_subMenu.addEventListener(Event.ENTER_FRAME,this.nextUnlock);
         this.m_keyLetGo = false;
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.removeEventListener(MouseEvent.CLICK,this.CLICKED);
         m_subMenu.removeEventListener(Event.ENTER_FRAME,this.nextUnlock);
      }
      
      override public function show() : void
      {
         m_subMenu.gotoAndPlay(1);
         if(UnlockController.PendingUnlockScreens.length > 0)
         {
            m_subMenu.unlock_title.text = UnlockController.PendingUnlockScreens[0].UnlockName;
            m_subMenu.unlock_desc.text = UnlockController.PendingUnlockScreens[0].UnlockDescription;
            m_subMenu.unlock_mc.gotoAndStop(UnlockController.PendingUnlockScreens[0].PostUnlockFrame);
            UnlockController.PendingUnlockScreens[0].unlock();
            SoundQueue.instance.playSoundEffect("menu_unlock");
            UnlockController.PendingUnlockScreens.shift();
         }
         SoundQueue.instance.stopMusic();
         super.show();
      }
      
      private function CLICKED(param1:MouseEvent) : void
      {
         if(m_subMenu.currentFrame >= m_subMenu.totalFrames)
         {
            this.ready = true;
         }
      }
      
      private function nextUnlock(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < Main.MAXPLAYERS && !this.ready)
         {
            if(SaveData["Controller" + _loc3_] != null)
            {
               if(Key.isDown(Controller(SaveData["Controller" + _loc3_])._BUTTON2))
               {
                  if(this.m_keyLetGo)
                  {
                     this.ready = true;
                  }
                  _loc2_ = true;
               }
            }
            _loc3_++;
         }
         if(!_loc2_)
         {
            this.m_keyLetGo = true;
         }
         if(this.ready)
         {
            this.ready = false;
            SoundQueue.instance.playSoundEffect("menu_select");
            if(UnlockController.PendingUnlockScreens.length > 0)
            {
               removeSelf();
               MenuController.showPostUnlockMenu();
            }
            else if(UnlockController.PendingUnlockFights.length > 0)
            {
               removeSelf();
               MenuController.showPreUnlockMenu();
            }
            else
            {
               removeSelf();
               GameController.destroyStageData();
               UnlockController.nextMenuFunc();
            }
         }
      }
   }
}
