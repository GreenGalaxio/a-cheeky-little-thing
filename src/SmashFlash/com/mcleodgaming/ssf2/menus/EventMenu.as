package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.EventButton;
   import com.mcleodgaming.ssf2.controllers.EventMatch;
   import com.mcleodgaming.ssf2.controllers.EventMatchController;
   import com.mcleodgaming.ssf2.controllers.EventMenuHand;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.enums.Difficulty;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class EventMenu extends Menu
   {
       
      
      private var m_isDragging:Boolean;
      
      private var m_currentEvent:EventMatch;
      
      private var m_eventContainer:MovieClip;
      
      private var m_eventMask:MovieClip;
      
      private var m_eventButtons:Vector.<EventButton>;
      
      private var m_listLocation:Point;
      
      private var m_scrollTop:Point;
      
      private var m_scrollHeight:Number;
      
      private var eventSelectHand:EventMenuHand;
      
      public function EventMenu()
      {
         super();
         var _loc1_:int = 0;
         m_subMenu = Main.getLibraryMC("menu_event");
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         this.m_currentEvent = null;
         this.m_listLocation = new Point(-235.1,-115.2);
         this.m_eventMask = new MovieClip();
         this.m_eventMask.x = this.m_listLocation.x;
         this.m_eventMask.y = this.m_listLocation.y;
         this.m_eventMask.graphics.beginFill(16711680,1);
         this.m_eventMask.graphics.drawRect(0,0,228,239);
         this.m_eventMask.graphics.endFill();
         this.m_eventMask.visible = false;
         this.m_eventContainer = new MovieClip();
         this.m_eventContainer.x = this.m_listLocation.x;
         this.m_eventContainer.y = this.m_listLocation.y;
         this.m_eventButtons = new Vector.<EventButton>();
         _loc1_ = 0;
         while(_loc1_ < EventMatchController.EventMatchList.length)
         {
            this.m_eventButtons.push(new EventButton(Main.getLibraryMC("eventIconMC")));
            this.m_eventContainer.addChild(this.m_eventButtons[_loc1_].ButtonInstance);
            _loc1_++;
         }
         this.reset();
         m_subMenu.addChild(this.m_eventContainer);
         m_subMenu.scroller.visible = false;
         this.m_scrollTop = new Point(-264.1,-112.45);
         this.m_scrollHeight = 182.4;
         m_subMenu.sample.visible = false;
         this.m_isDragging = false;
         this.eventSelectHand = new EventMenuHand(m_subMenu,this.m_eventButtons,this.backMain_CLICK);
         m_subMenu.setChildIndex(this.eventSelectHand.HandMC,m_subMenu.numChildren - 1);
         this.eventSelectHand.addClickEventClipHitTest(m_subMenu.bg_top.back_btn);
      }
      
      public function get EContainer() : MovieClip
      {
         return this.m_eventContainer;
      }
      
      public function reset() : void
      {
         this.m_currentEvent = null;
         this.updateDisplay();
      }
      
      public function updateDisplay() : void
      {
         if(this.m_eventButtons.length > 0 && this.m_currentEvent)
         {
            m_subMenu.eventNum.text = "#" + this.m_currentEvent.Num;
            m_subMenu.eventName.text = this.m_currentEvent.Name;
            m_subMenu.eventDesc.text = this.m_currentEvent.Description;
            m_subMenu.previewer.gotoAndStop("e" + this.m_currentEvent.Num);
            m_subMenu.desc_txt.text = !!this.m_currentEvent.Won?"Best Time: " + Utils.framesToTimeString(SaveData.Records.events["event" + this.m_currentEvent.ID].score) + " (Avg. FPS: " + SaveData.Records.events["event" + this.m_currentEvent.ID].score_fps + ")":"[ Incomplete ]";
         }
         else
         {
            m_subMenu.eventNum.text = "";
            m_subMenu.eventName.text = "";
            m_subMenu.eventDesc.text = "";
            m_subMenu.previewer.gotoAndStop(1);
            m_subMenu.desc_txt.text = "";
         }
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
         }
         super.makeEvents();
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.backMain_CLICK);
         m_subMenu.scroller.addEventListener(MouseEvent.MOUSE_DOWN,this.scroll_CLICK);
         m_subMenu.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.scroll_MOVE);
         m_subMenu.addEventListener(MouseEvent.MOUSE_UP,this.scroll_RELEASE);
         this.eventSelectHand.makeEvents();
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < EventMatchController.EventMatchList.length)
         {
            if(_loc2_ <= 4 && !EventMatchController.EventMatchList[_loc2_].Won)
            {
               _loc1_ = true;
            }
            if(!(_loc2_ > 4 && _loc1_))
            {
               this.m_eventButtons[_loc2_].ButtonInstance.complete.visible = EventMatchController.EventMatchList[_loc2_].Won;
               this.m_eventButtons[_loc2_].ButtonInstance.eventName.text = EventMatchController.EventMatchList[_loc2_].Name;
               this.m_eventButtons[_loc2_].ButtonInstance.name = "e" + _loc2_;
               this.m_eventButtons[_loc2_].ButtonInstance.y = _loc2_ * 23;
               this.m_eventButtons[_loc2_].ButtonInstance.addEventListener(MouseEvent.CLICK,this.event_CLICK);
               this.m_eventButtons[_loc2_].ButtonInstance.addEventListener(MouseEvent.MOUSE_OVER,this.event_MOUSE_OVER);
               this.m_eventButtons[_loc2_].ButtonInstance.addEventListener(MouseEvent.MOUSE_OUT,this.event_MOUSE_OUT);
               this.m_eventButtons[_loc2_].makeEvents();
               this.m_eventButtons[_loc2_].ButtonInstance.visible = true;
            }
            else
            {
               this.m_eventButtons[_loc2_].ButtonInstance.visible = false;
            }
            _loc2_++;
         }
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.backMain_CLICK);
         m_subMenu.scroller.removeEventListener(MouseEvent.MOUSE_DOWN,this.scroll_CLICK);
         m_subMenu.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.scroll_MOVE);
         m_subMenu.removeEventListener(MouseEvent.MOUSE_UP,this.scroll_RELEASE);
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < EventMatchController.EventMatchList.length)
         {
            if(_loc2_ <= 4 && !EventMatchController.EventMatchList[_loc2_].Won)
            {
               _loc1_ = true;
            }
            if(!(_loc2_ > 4 && _loc1_))
            {
               this.m_eventButtons[_loc2_].ButtonInstance.visible = true;
               this.m_eventButtons[_loc2_].killEvents();
               this.m_eventButtons[_loc2_].ButtonInstance.removeEventListener(MouseEvent.CLICK,this.event_CLICK);
               this.m_eventButtons[_loc2_].ButtonInstance.removeEventListener(MouseEvent.MOUSE_OVER,this.event_MOUSE_OVER);
               this.m_eventButtons[_loc2_].ButtonInstance.removeEventListener(MouseEvent.MOUSE_OUT,this.event_MOUSE_OUT);
            }
            else
            {
               this.m_eventButtons[_loc2_].ButtonInstance.visible = false;
            }
            _loc2_++;
         }
         this.eventSelectHand.killEvents();
         MovieClip(m_subMenu.scroller).stopDrag();
      }
      
      override public function show() : void
      {
         this.reset();
         super.show();
      }
      
      public function scroll_CLICK(param1:MouseEvent) : void
      {
         if(!this.m_isDragging)
         {
            MovieClip(m_subMenu.scroller).startDrag(false,new Rectangle(this.m_scrollTop.x,this.m_scrollTop.y,0,this.m_scrollHeight));
            this.m_isDragging = true;
         }
      }
      
      public function scroll_MOVE(param1:MouseEvent) : void
      {
         if(this.m_isDragging)
         {
            this.m_eventContainer.y = this.m_listLocation.y - (m_subMenu.scroller.y - this.m_scrollTop.y);
         }
      }
      
      private function findEvent(param1:MovieClip) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.m_eventButtons.length)
         {
            if(this.m_eventButtons[_loc2_].ButtonInstance == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function event_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:int = this.findEvent(param1.target as MovieClip);
         if(_loc2_ >= 0 && _loc2_ < EventMatchController.EventMatchList.length)
         {
            this.m_currentEvent = EventMatchController.EventMatchList[_loc2_];
            EventMatchController.currentEvent = this.m_currentEvent;
            EventMatchController.difficulty = Difficulty.VERY_EASY;
            removeSelf();
            MenuController.eventMatchCharacterMenu.reset();
            MenuController.showEventMatchCharacterMenu();
         }
      }
      
      public function event_MOUSE_OVER(param1:MouseEvent) : void
      {
         var _loc2_:int = this.findEvent(param1.target as MovieClip);
         if(_loc2_ >= 0 && _loc2_ < EventMatchController.EventMatchList.length)
         {
            SoundQueue.instance.playSoundEffect("menu_hover");
            this.m_currentEvent = EventMatchController.EventMatchList[_loc2_];
            this.updateDisplay();
         }
      }
      
      public function event_MOUSE_OUT(param1:MouseEvent) : void
      {
         var _loc2_:int = this.findEvent(param1.target as MovieClip);
         if(_loc2_ >= 0)
         {
            this.m_currentEvent = null;
            this.updateDisplay();
         }
      }
      
      public function scroll_RELEASE(param1:MouseEvent) : void
      {
         if(this.m_isDragging)
         {
            MovieClip(m_subMenu.scroller).stopDrag();
            this.m_isDragging = false;
         }
      }
      
      public function backMain_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_back");
         MenuController.showSoloMenu();
      }
   }
}
