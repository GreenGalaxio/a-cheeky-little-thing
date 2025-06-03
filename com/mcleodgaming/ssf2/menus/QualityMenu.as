package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.HandButton;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.controllers.QualitySelectHand;
   import com.mcleodgaming.ssf2.controllers.SelectHand;
   import com.mcleodgaming.ssf2.util.SaveData;
   import fl.controls.ComboBox;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class QualityMenu extends Menu
   {
       
      
      private var selectHand:SelectHand;
      
      private var m_fullscreen_quality:ComboBox;
      
      public function QualityMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_quality");
         m_container.addChild(m_subMenu);
         this.m_fullscreen_quality = m_subMenu.fullscreen_quality;
         this.m_fullscreen_quality.addItem({"label":"Hardware (Speed)"});
         this.m_fullscreen_quality.addItem({"label":"Software (Quality)"});
         this.m_fullscreen_quality.selectedIndex = SaveData.FullScreenQuality;
         this.selectHand = new QualitySelectHand(m_subMenu,new Vector.<HandButton>(),this.back_CLICK_quality);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.high_btn);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.med_btn);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.low_btn);
         this.selectHand.addClickEventClipHitTest(m_subMenu.bg_top.back_btn);
         this.selectHand.addClickEventClipHitTest(m_subMenu.bg_top.home_btn);
         initMenuMappings();
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
      }
      
      public function get FullScreenQualityComboBox() : ComboBox
      {
         return this.m_fullscreen_quality;
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
         }
         super.makeEvents();
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK_quality);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_quality);
         m_subMenu.high_btn.addEventListener(MouseEvent.CLICK,this.high_CLICK);
         m_subMenu.med_btn.addEventListener(MouseEvent.CLICK,this.med_CLICK);
         m_subMenu.low_btn.addEventListener(MouseEvent.CLICK,this.low_CLICK);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         this.m_fullscreen_quality.addEventListener(Event.CHANGE,this.fullscreen_quality_CLICK);
         this.selectHand.makeEvents();
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_quality);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_quality);
         m_subMenu.high_btn.removeEventListener(MouseEvent.CLICK,this.high_CLICK);
         m_subMenu.med_btn.removeEventListener(MouseEvent.CLICK,this.med_CLICK);
         m_subMenu.low_btn.removeEventListener(MouseEvent.CLICK,this.low_CLICK);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         this.m_fullscreen_quality.removeEventListener(Event.CHANGE,this.fullscreen_quality_CLICK);
         this.selectHand.killEvents();
      }
      
      override public function show() : void
      {
         switch(SaveData.Quality)
         {
            case StageQuality.BEST:
               m_subMenu.high_btn.alpha = 1;
               m_subMenu.med_btn.alpha = 0.7;
               m_subMenu.low_btn.alpha = 0.7;
               break;
            case StageQuality.MEDIUM:
               m_subMenu.high_btn.alpha = 0.7;
               m_subMenu.med_btn.alpha = 1;
               m_subMenu.low_btn.alpha = 0.7;
               break;
            case StageQuality.LOW:
               m_subMenu.high_btn.alpha = 0.7;
               m_subMenu.med_btn.alpha = 0.7;
               m_subMenu.low_btn.alpha = 1;
               break;
            default:
               m_subMenu.high_btn.alpha = 0.7;
               m_subMenu.med_btn.alpha = 0.7;
               m_subMenu.low_btn.alpha = 1;
         }
         super.show();
      }
      
      private function back_CLICK_quality(param1:MouseEvent) : void
      {
         SaveData.saveGame();
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_back");
         MenuController.showOptionsMenu();
      }
      
      private function back_ROLL_OVER_quality(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function high_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         m_subMenu.desc_txt.text = "";
         m_subMenu.high_btn.alpha = 1;
         m_subMenu.med_btn.alpha = 0.7;
         m_subMenu.low_btn.alpha = 0.7;
         SaveData.Quality = StageQuality.BEST;
      }
      
      private function med_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         m_subMenu.desc_txt.text = "";
         m_subMenu.high_btn.alpha = 0.7;
         m_subMenu.med_btn.alpha = 1;
         m_subMenu.low_btn.alpha = 0.7;
         SaveData.Quality = StageQuality.MEDIUM;
      }
      
      private function low_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         m_subMenu.desc_txt.text = "";
         m_subMenu.high_btn.alpha = 0.7;
         m_subMenu.med_btn.alpha = 0.7;
         m_subMenu.low_btn.alpha = 1;
         SaveData.Quality = StageQuality.LOW;
      }
      
      private function home_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_back");
         SoundQueue.instance.stopMusic();
         MenuController.removeAllMenus();
         MenuController.showTitleMenu();
      }
      
      private function fullscreen_quality_CLICK(param1:Event) : void
      {
         if(this.m_fullscreen_quality.selectedIndex == 0)
         {
            SaveData.FullScreenQuality = 0;
         }
         else if(this.m_fullscreen_quality.selectedIndex == 1)
         {
            SaveData.FullScreenQuality = 1;
         }
         Main.setFullScreenMode(SaveData.FullScreenQuality);
      }
   }
}
