package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.DataButton;
   import com.mcleodgaming.ssf2.controllers.HandButton;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.controllers.SelectHand;
   import com.mcleodgaming.ssf2.util.DataSettings;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   import fl.controls.CheckBox;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   
   public class DataMenu extends Menu
   {
       
      
      private var m_optionsCheckbox:CheckBox;
      
      private var m_controlsCheckbox:CheckBox;
      
      private var m_recordsCheckbox:CheckBox;
      
      private var m_unlocksCheckbox:CheckBox;
      
      private var selectHand:SelectHand;
      
      public function DataMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_data");
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         this.m_optionsCheckbox = m_subMenu.options;
         this.m_controlsCheckbox = m_subMenu.controls;
         this.m_recordsCheckbox = m_subMenu.records;
         this.m_unlocksCheckbox = m_subMenu.unlocks;
         this.m_optionsCheckbox.selected = true;
         this.m_controlsCheckbox.selected = true;
         this.m_recordsCheckbox.selected = true;
         this.m_unlocksCheckbox.selected = true;
         var _loc1_:Vector.<HandButton> = new Vector.<HandButton>();
         _loc1_.push(new DataButton(m_subMenu.exportdata_btn));
         _loc1_.push(new DataButton(m_subMenu.importdata_btn));
         _loc1_.push(new DataButton(m_subMenu.cleardata_btn));
         _loc1_.push(new DataButton(m_subMenu.dataDialog.back_btn));
         _loc1_.push(new DataButton(m_subMenu.dataDialog.cleardata_btn));
         this.selectHand = new SelectHand(m_subMenu,_loc1_,this.back_CLICK_mainfromdata);
         this.selectHand.addClickEventClipCheckBounds(this.m_optionsCheckbox);
         this.selectHand.addClickEventClipCheckBounds(this.m_controlsCheckbox);
         this.selectHand.addClickEventClipCheckBounds(this.m_recordsCheckbox);
         this.selectHand.addClickEventClipCheckBounds(this.m_unlocksCheckbox);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.bg_top.home_btn);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.bg_top.back_btn);
         this.selectHand.setAutoKillEvents(false);
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
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK_mainfromdata);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.MOUSE_OVER,this.back_ROLL_OVER_mainfromdata);
         m_subMenu.exportdata_btn.addEventListener(MouseEvent.CLICK,this.exportdata_CLICK);
         m_subMenu.exportdata_btn.addEventListener(MouseEvent.MOUSE_OVER,this.exportdata_ROLL_OVER);
         m_subMenu.exportdata_btn.addEventListener(MouseEvent.MOUSE_OUT,this.exportdata_ROLL_OUT);
         m_subMenu.importdata_btn.addEventListener(MouseEvent.CLICK,this.importdata_CLICK);
         m_subMenu.importdata_btn.addEventListener(MouseEvent.MOUSE_OVER,this.importdata_ROLL_OVER);
         m_subMenu.importdata_btn.addEventListener(MouseEvent.MOUSE_OUT,this.importdata_ROLL_OUT);
         m_subMenu.cleardata_btn.addEventListener(MouseEvent.CLICK,this.cleardata_CLICK);
         m_subMenu.cleardata_btn.addEventListener(MouseEvent.MOUSE_OVER,this.cleardata_ROLL_OVER);
         m_subMenu.cleardata_btn.addEventListener(MouseEvent.MOUSE_OUT,this.cleardata_ROLL_OUT);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         Main.Root.stage.addEventListener(Event.ENTER_FRAME,manageMenuMappings);
         this.selectHand.makeEvents();
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         this.selectHand.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_mainfromdata);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.back_ROLL_OVER_mainfromdata);
         m_subMenu.exportdata_btn.removeEventListener(MouseEvent.CLICK,this.exportdata_CLICK);
         m_subMenu.exportdata_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.exportdata_ROLL_OVER);
         m_subMenu.exportdata_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.exportdata_ROLL_OUT);
         m_subMenu.importdata_btn.removeEventListener(MouseEvent.CLICK,this.importdata_CLICK);
         m_subMenu.importdata_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.importdata_ROLL_OVER);
         m_subMenu.importdata_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.importdata_ROLL_OUT);
         m_subMenu.cleardata_btn.removeEventListener(MouseEvent.CLICK,this.cleardata_CLICK);
         m_subMenu.cleardata_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.cleardata_ROLL_OVER);
         m_subMenu.cleardata_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.cleardata_ROLL_OUT);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         Main.Root.stage.removeEventListener(Event.ENTER_FRAME,manageMenuMappings);
      }
      
      private function back_CLICK_mainfromdata(param1:MouseEvent) : void
      {
         if(MovieClip(m_subMenu.dataDialog).currentLabel != "wait")
         {
            if(MovieClip(m_subMenu.dataDialog).currentLabel == "clear")
            {
               this.back_CLICK_data(null);
            }
            else if(MovieClip(m_subMenu.dataDialog).currentLabel == "import")
            {
               this.back_CLICK_data(null);
            }
            m_subMenu.dataDialog.gotoAndStop("wait");
         }
         else
         {
            removeSelf();
            SoundQueue.instance.playSoundEffect("menu_back");
            MenuController.showMainMenu();
         }
      }
      
      private function back_ROLL_OVER_mainfromdata(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function exportdata_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Export game data and settings to a file.";
      }
      
      private function exportdata_ROLL_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function exportdata_CLICK(param1:MouseEvent) : void
      {
         if(MovieClip(m_subMenu.dataDialog).currentLabel == "wait")
         {
            SoundQueue.instance.playSoundEffect("menu_select");
            m_subMenu.desc_txt.text = "";
            SaveData.exportSaveData(new DataSettings(this.m_controlsCheckbox.selected,this.m_optionsCheckbox.selected,this.m_recordsCheckbox.selected,this.m_unlocksCheckbox.selected,true));
         }
      }
      
      private function importdata_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Import game data and settings from a file.";
      }
      
      private function importdata_ROLL_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function importdata_CLICK(param1:MouseEvent) : void
      {
         if(MovieClip(m_subMenu.dataDialog).currentLabel == "wait")
         {
            SoundQueue.instance.playSoundEffect("menu_select");
            m_subMenu.desc_txt.text = "";
            Utils.openFile();
            m_subMenu.dataDialog.gotoAndStop("import");
            m_subMenu.dataDialog.useHandCursor = false;
            m_subMenu.dataDialog.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK_data);
            m_subMenu.dataDialog.back_btn.addEventListener(MouseEvent.MOUSE_OVER,this.back_ROLL_OVER_data);
            m_subMenu.dataDialog.addEventListener(Event.ENTER_FRAME,this.waitForImport);
            m_subMenu.dataDialog.back_btn.visible = false;
         }
      }
      
      private function back_CLICK_data(param1:MouseEvent) : void
      {
         this.selectHand.resetControlsLetGo();
         SoundQueue.instance.playSoundEffect("menu_back");
         m_subMenu.dataDialog.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_data);
         m_subMenu.dataDialog.back_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.back_ROLL_OVER_data);
         m_subMenu.dataDialog.removeEventListener(Event.ENTER_FRAME,this.waitForImport);
         m_subMenu.dataDialog.gotoAndStop("wait");
      }
      
      private function back_ROLL_OVER_data(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function waitForImport(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc3_:ByteArray = null;
         if(Utils.finishedLoading)
         {
            m_subMenu.dataDialog.removeEventListener(Event.ENTER_FRAME,this.waitForImport);
            m_subMenu.dataDialog.back_btn.visible = true;
            if(Utils.openSuccess)
            {
               SaveData.saveGame();
               _loc2_ = null;
               _loc3_ = Utils.fileRef.data;
               trace("Decompressing...");
               _loc3_.uncompress();
               trace("Decrypting...");
               _loc2_ = _loc3_.readUTFBytes(_loc3_.length);
               trace("Original String: " + _loc2_);
               if(!SaveData.importSaveData(_loc2_,new DataSettings(this.m_controlsCheckbox.selected,this.m_optionsCheckbox.selected,this.m_recordsCheckbox.selected,this.m_unlocksCheckbox.selected,true)))
               {
                  SaveData.loadGame();
                  m_subMenu.dataDialog.results.text = "There was an error importing the game data.";
               }
               else
               {
                  m_subMenu.dataDialog.results.text = "Game data loaded successfully.";
                  SoundQueue.instance.updateVolumeLevel();
               }
            }
            else if(Utils.cancelled)
            {
               m_subMenu.dataDialog.results.text = "Import Cancelled.";
            }
            else
            {
               m_subMenu.dataDialog.results.text = "There was an error loading the game data.";
            }
         }
      }
      
      private function cleardata_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Erase all game data and settings.";
      }
      
      private function cleardata_ROLL_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function cleardata_CLICK(param1:MouseEvent) : void
      {
         if(MovieClip(m_subMenu.dataDialog).currentLabel == "wait")
         {
            SoundQueue.instance.playSoundEffect("menu_select");
            m_subMenu.desc_txt.text = "";
            m_subMenu.dataDialog.gotoAndStop("clear");
            m_subMenu.dataDialog.blocker.useHandCursor = false;
            m_subMenu.dataDialog.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK_cleardata);
            m_subMenu.dataDialog.back_btn.addEventListener(MouseEvent.MOUSE_OVER,this.back_ROLL_OVER_cleardata);
            m_subMenu.dataDialog.cleardata_btn.addEventListener(MouseEvent.CLICK,this.clear_CLICK);
            m_subMenu.dataDialog.cleardata_btn.addEventListener(MouseEvent.MOUSE_OVER,this.clear_ROLL_OVER);
            m_subMenu.dataDialog.back_btn.visible = true;
         }
      }
      
      private function back_CLICK_cleardata(param1:MouseEvent) : void
      {
         this.selectHand.resetControlsLetGo();
         SoundQueue.instance.playSoundEffect("menu_back");
         m_subMenu.dataDialog.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_cleardata);
         m_subMenu.dataDialog.back_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.back_ROLL_OVER_cleardata);
         m_subMenu.dataDialog.cleardata_btn.removeEventListener(MouseEvent.CLICK,this.clear_CLICK);
         m_subMenu.dataDialog.cleardata_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.clear_ROLL_OVER);
         m_subMenu.dataDialog.gotoAndStop("wait");
      }
      
      private function back_ROLL_OVER_cleardata(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function clear_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.stopMusic();
         SoundQueue.instance.playSoundEffect("menu_back");
         m_subMenu.dataDialog.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_cleardata);
         m_subMenu.dataDialog.back_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.back_ROLL_OVER_cleardata);
         m_subMenu.dataDialog.cleardata_btn.removeEventListener(MouseEvent.CLICK,this.clear_CLICK);
         m_subMenu.dataDialog.cleardata_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.clear_ROLL_OVER);
         m_subMenu.dataDialog.gotoAndStop("wait");
         SaveData.eraseGame();
         removeSelf();
         MenuController.showTitleMenu();
      }
      
      private function clear_ROLL_OVER(param1:MouseEvent) : void
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
