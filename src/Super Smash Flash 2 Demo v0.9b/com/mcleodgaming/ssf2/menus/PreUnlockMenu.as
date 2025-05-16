package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.UnlockController;
   import com.mcleodgaming.ssf2.engine.StageSetting;
   import com.mcleodgaming.ssf2.util.Controller;
   import com.mcleodgaming.ssf2.util.Key;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class PreUnlockMenu extends Menu
   {
       
      
      private var ready:Boolean;
      
      private var m_keyLetGo:Boolean;
      
      public function PreUnlockMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_preunlock");
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
         m_subMenu.addEventListener(Event.ENTER_FRAME,this.startMatch);
         this.m_keyLetGo = false;
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.removeEventListener(MouseEvent.CLICK,this.CLICKED);
         m_subMenu.removeEventListener(Event.ENTER_FRAME,this.startMatch);
      }
      
      private function CLICKED(param1:MouseEvent) : void
      {
         if(m_subMenu.currentFrame >= m_subMenu.totalFrames)
         {
            this.ready = true;
         }
      }
      
      override public function show() : void
      {
         m_subMenu.gotoAndPlay(1);
         SoundQueue.instance.stopMusic();
         SoundQueue.instance.stopAllSounds();
         SoundQueue.instance.setLoopFunction(SoundQueue.instance.loopMusic);
         if(UnlockController.PendingUnlockFights.length > 0)
         {
            m_subMenu.challenger_mc.gotoAndStop(UnlockController.PendingUnlockFights[0].PreUnlockFrame);
         }
         SoundQueue.instance.playSoundEffect("menu_challenger");
         super.show();
      }
      
      private function startMatch(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         _loc2_ = 0;
         while(_loc2_ < Main.MAXPLAYERS && !this.ready && m_subMenu.currentFrame >= m_subMenu.totalFrames)
         {
            if(SaveData["Controller" + _loc2_] != null)
            {
               if(Key.isDown(Controller(SaveData["Controller" + _loc2_])._BUTTON2))
               {
                  if(this.m_keyLetGo)
                  {
                     this.ready = true;
                  }
                  _loc3_ = true;
               }
            }
            _loc2_++;
         }
         if(!_loc3_)
         {
            this.m_keyLetGo = true;
         }
         if(this.ready)
         {
            this.killEvents();
            SoundQueue.instance.stopAllSounds();
            SoundQueue.instance.playSoundEffect("menu_select");
            StageSetting.CurrentID = UnlockController.PendingUnlockFights[0].StageID;
            _loc2_ = 0;
            while(_loc2_ < UnlockController.PendingUnlockFights[0].FilesArray.length)
            {
               Main.queueItemToBeLoaded(Main.getResourceByName(Main.getSSF2FileByID(UnlockController.PendingUnlockFights[0].FilesArray[_loc2_]).CurrentFileName));
               _loc2_++;
            }
            Main.dynamicLoad(this.begin);
            this.ready = false;
         }
      }
      
      private function begin(param1:*) : void
      {
         removeSelf();
         SoundQueue.instance.stopAllSounds();
         GameController.tmpGame = GameController.currentGame;
         GameController.currentGame = UnlockController.PendingUnlockFights[0].matchSetup();
         SoundQueue.instance.stopMusic();
         SoundQueue.instance.stopAllSounds();
         SoundQueue.instance.setLoopFunction(SoundQueue.instance.loopMusic);
         GameController.startMatch();
      }
   }
}
