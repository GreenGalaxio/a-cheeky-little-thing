package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.mgn.events.MGNEvent;
   import com.mcleodgaming.mgn.events.MGNEventManager;
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.Version;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class RulesMenu extends Menu
   {
       
      
      private var startDamageTimer:FrameTimer;
      
      private var startDamageMouseDown:Boolean;
      
      private var startDamageDiff:Number;
      
      private var startDamageInc:Boolean;
      
      private var m_timeNode:MenuMapperNode;
      
      private var m_stockNode:MenuMapperNode;
      
      private var m_ratioNode:MenuMapperNode;
      
      private var m_itemNode:MenuMapperNode;
      
      private var m_damageNode:MenuMapperNode;
      
      private var m_displayNode:MenuMapperNode;
      
      private var m_hazardNode:MenuMapperNode;
      
      private var m_teamDamageNode:MenuMapperNode;
      
      private var m_itemSwitchNode:MenuMapperNode;
      
      private var m_stageSwitchNode:MenuMapperNode;
      
      private var m_controlsNode:MenuMapperNode;
      
      public function RulesMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_rules");
         this.startDamageTimer = new FrameTimer(5);
         this.startDamageMouseDown = false;
         this.startDamageDiff = 0;
         this.startDamageInc = true;
         this.initMenuMappings();
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         this.updateFields();
      }
      
      override public function manageMenuMappings(param1:Event) : void
      {
         if(!(MenuController.controlsMenu && MenuController.controlsMenu.Container.parent) && !(MenuController.itemSwitchMenu && MenuController.itemSwitchMenu.Container.parent) && !(MenuController.stageSwitchMenu && MenuController.stageSwitchMenu.Container.parent))
         {
            super.manageMenuMappings(param1);
            return;
         }
         resetControlsLetGo();
      }
      
      override public function initMenuMappings() : void
      {
         this.m_timeNode = new MenuMapperNode(m_subMenu.time_hover);
         this.m_stockNode = new MenuMapperNode(m_subMenu.stock_hover);
         this.m_ratioNode = new MenuMapperNode(m_subMenu.ratio_hover);
         this.m_itemNode = new MenuMapperNode(m_subMenu.item_hover);
         this.m_damageNode = new MenuMapperNode(m_subMenu.damage_hover);
         this.m_displayNode = new MenuMapperNode(m_subMenu.display_hover);
         this.m_hazardNode = new MenuMapperNode(m_subMenu.hazard_hover);
         this.m_teamDamageNode = new MenuMapperNode(m_subMenu.teamdamage_hover);
         this.m_itemSwitchNode = new MenuMapperNode(m_subMenu.iSwitch_btn);
         this.m_stageSwitchNode = new MenuMapperNode(m_subMenu.sSwitch_btn);
         this.m_controlsNode = new MenuMapperNode(m_subMenu.controls_btn);
         this.m_timeNode.updateNodes([this.m_controlsNode],[this.m_stockNode],null,null,this.generic_ROLL_OVER,null,this.timebut_CLICK,this.back_CLICK,null,null,this.tarrow_l_CLICK,this.tarrow_r_CLICK);
         this.m_stockNode.updateNodes([this.m_timeNode],[this.m_ratioNode],null,null,this.generic_ROLL_OVER,null,this.stockbut_CLICK,this.back_CLICK,null,null,this.sarrow_l_CLICK,this.sarrow_r_CLICK);
         this.m_ratioNode.updateNodes([this.m_stockNode],[this.m_itemNode],null,null,this.generic_ROLL_OVER,null,null,this.back_CLICK,null,null,this.darrow_l_CLICK,this.darrow_r_CLICK);
         this.m_itemNode.updateNodes([this.m_ratioNode],[this.m_damageNode],null,null,this.generic_ROLL_OVER,null,null,this.back_CLICK,null,null,this.iarrow_l_CLICK,this.iarrow_r_CLICK);
         this.m_damageNode.updateNodes([this.m_itemNode],[this.m_displayNode,this.m_itemSwitchNode,this.m_stageSwitchNode],null,null,this.generic_ROLL_OVER,null,null,this.back_CLICK,null,null,this.prev_startDamage_CLICK,this.next_startDamage_CLICK);
         this.m_displayNode.updateNodes([this.m_damageNode],[this.m_hazardNode],[this.m_stageSwitchNode],[this.m_itemSwitchNode],this.generic_ROLL_OVER,null,this.pDisplaybut_CLICK,this.back_CLICK);
         this.m_hazardNode.updateNodes([this.m_displayNode],[this.m_teamDamageNode],[this.m_stageSwitchNode],[this.m_itemSwitchNode],this.generic_ROLL_OVER,null,this.hazards_CLICK,this.back_CLICK);
         this.m_teamDamageNode.updateNodes([this.m_hazardNode],[this.m_timeNode],[this.m_stageSwitchNode],[this.m_itemSwitchNode],this.generic_ROLL_OVER,null,this.teamdamage_CLICK,this.back_CLICK);
         this.m_itemSwitchNode.updateNodes([this.m_damageNode],[this.m_timeNode],[this.m_displayNode,this.m_hazardNode,this.m_teamDamageNode],[this.m_stageSwitchNode],this.generic_ROLL_OVER,null,this.iSwitch_btn_CLICK,this.back_CLICK);
         this.m_stageSwitchNode.updateNodes([this.m_damageNode],[this.m_timeNode],[this.m_itemSwitchNode],[this.m_displayNode,this.m_hazardNode,this.m_teamDamageNode],this.generic_ROLL_OVER,null,this.sSwitch_btn_CLICK,this.back_CLICK);
         this.m_controlsNode.updateNodes([this.m_stageSwitchNode],[this.m_timeNode],[this.m_timeNode],[this.m_timeNode],this.generic_ROLL_OVER,null,this.controls_CLICK,this.back_CLICK);
         m_menuMapper = new MenuMapper(this.m_timeNode);
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
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         m_subMenu.controls_btn.addEventListener(MouseEvent.CLICK,this.controls_CLICK);
         m_subMenu.controls_btn.addEventListener(MouseEvent.ROLL_OVER,this.controls_ROLL_OVER);
         m_subMenu.tarrow_l.addEventListener(MouseEvent.CLICK,this.tarrow_l_CLICK);
         m_subMenu.tarrow_r.addEventListener(MouseEvent.CLICK,this.tarrow_r_CLICK);
         m_subMenu.sarrow_l.addEventListener(MouseEvent.CLICK,this.sarrow_l_CLICK);
         m_subMenu.sarrow_r.addEventListener(MouseEvent.CLICK,this.sarrow_r_CLICK);
         m_subMenu.darrow_l.addEventListener(MouseEvent.CLICK,this.darrow_l_CLICK);
         m_subMenu.darrow_r.addEventListener(MouseEvent.CLICK,this.darrow_r_CLICK);
         m_subMenu.iarrow_l.addEventListener(MouseEvent.CLICK,this.iarrow_l_CLICK);
         m_subMenu.iarrow_r.addEventListener(MouseEvent.CLICK,this.iarrow_r_CLICK);
         m_subMenu.starrow_l.addEventListener(MouseEvent.MOUSE_DOWN,this.prev_startDamage_DOWN);
         m_subMenu.starrow_l.addEventListener(MouseEvent.MOUSE_UP,this.prev_startDamage_UP);
         m_subMenu.starrow_r.addEventListener(MouseEvent.MOUSE_DOWN,this.next_startDamage_DOWN);
         m_subMenu.starrow_r.addEventListener(MouseEvent.MOUSE_UP,this.next_startDamage_UP);
         m_subMenu.starrow_l.addEventListener(MouseEvent.MOUSE_OUT,this.prev_startDamage_UP);
         m_subMenu.starrow_r.addEventListener(MouseEvent.MOUSE_OUT,this.next_startDamage_UP);
         m_subMenu.timebut.addEventListener(MouseEvent.CLICK,this.timebut_CLICK);
         m_subMenu.stockbut.addEventListener(MouseEvent.CLICK,this.stockbut_CLICK);
         m_subMenu.pDisplaybut.addEventListener(MouseEvent.CLICK,this.pDisplaybut_CLICK);
         m_subMenu.iSwitch_btn.addEventListener(MouseEvent.CLICK,this.iSwitch_btn_CLICK);
         m_subMenu.sSwitch_btn.addEventListener(MouseEvent.CLICK,this.sSwitch_btn_CLICK);
         m_subMenu.hazardsbut.addEventListener(MouseEvent.CLICK,this.hazards_CLICK);
         m_subMenu.teamdamagebut.addEventListener(MouseEvent.CLICK,this.teamdamage_CLICK);
         m_subMenu.addEventListener(Event.ENTER_FRAME,this.updateStartDamage);
         Main.Root.stage.addEventListener(Event.ENTER_FRAME,this.manageMenuMappings);
         m_menuMapper.init();
         setMenuMappingFocus();
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         m_subMenu.controls_btn.removeEventListener(MouseEvent.CLICK,this.controls_CLICK);
         m_subMenu.controls_btn.removeEventListener(MouseEvent.ROLL_OVER,this.controls_ROLL_OVER);
         m_subMenu.tarrow_l.removeEventListener(MouseEvent.CLICK,this.tarrow_l_CLICK);
         m_subMenu.tarrow_r.removeEventListener(MouseEvent.CLICK,this.tarrow_r_CLICK);
         m_subMenu.sarrow_l.removeEventListener(MouseEvent.CLICK,this.sarrow_l_CLICK);
         m_subMenu.sarrow_r.removeEventListener(MouseEvent.CLICK,this.sarrow_r_CLICK);
         m_subMenu.darrow_l.removeEventListener(MouseEvent.CLICK,this.darrow_l_CLICK);
         m_subMenu.darrow_r.removeEventListener(MouseEvent.CLICK,this.darrow_r_CLICK);
         m_subMenu.iarrow_l.removeEventListener(MouseEvent.CLICK,this.iarrow_l_CLICK);
         m_subMenu.iarrow_r.removeEventListener(MouseEvent.CLICK,this.iarrow_r_CLICK);
         m_subMenu.starrow_l.removeEventListener(MouseEvent.MOUSE_DOWN,this.prev_startDamage_DOWN);
         m_subMenu.starrow_l.removeEventListener(MouseEvent.MOUSE_UP,this.prev_startDamage_UP);
         m_subMenu.starrow_r.removeEventListener(MouseEvent.MOUSE_DOWN,this.next_startDamage_DOWN);
         m_subMenu.starrow_r.removeEventListener(MouseEvent.MOUSE_UP,this.next_startDamage_UP);
         m_subMenu.starrow_l.removeEventListener(MouseEvent.MOUSE_OUT,this.prev_startDamage_UP);
         m_subMenu.starrow_r.removeEventListener(MouseEvent.MOUSE_OUT,this.next_startDamage_UP);
         m_subMenu.timebut.removeEventListener(MouseEvent.CLICK,this.timebut_CLICK);
         m_subMenu.stockbut.removeEventListener(MouseEvent.CLICK,this.stockbut_CLICK);
         m_subMenu.pDisplaybut.removeEventListener(MouseEvent.CLICK,this.pDisplaybut_CLICK);
         m_subMenu.iSwitch_btn.removeEventListener(MouseEvent.CLICK,this.iSwitch_btn_CLICK);
         m_subMenu.sSwitch_btn.removeEventListener(MouseEvent.CLICK,this.sSwitch_btn_CLICK);
         m_subMenu.hazardsbut.removeEventListener(MouseEvent.CLICK,this.hazards_CLICK);
         m_subMenu.teamdamagebut.removeEventListener(MouseEvent.CLICK,this.teamdamage_CLICK);
         m_subMenu.removeEventListener(Event.ENTER_FRAME,this.updateStartDamage);
         Main.Root.stage.removeEventListener(Event.ENTER_FRAME,this.manageMenuMappings);
      }
      
      override public function show() : void
      {
         this.updateFields();
         super.show();
      }
      
      private function back_CLICK(param1:MouseEvent) : void
      {
         if(GameController.currentGame != null)
         {
            GameController.currentGame.loadSavedVSOptions();
            GameController.currentGame.updateDisplay();
            Main.Root.stage.focus = Main.Root;
         }
         SoundQueue.instance.playSoundEffect("menu_back");
         SaveData.saveGame();
         if(MultiplayerManager.Connected && MultiplayerManager.IsHost)
         {
            MenuController.showPleaseWaitMenu();
            MGNEventManager.dispatcher.addEventListener(MGNEvent.ROOM_DATA,this.roomData);
            MGNEventManager.dispatcher.addEventListener(MGNEvent.ERROR_ROOM_DATA,this.roomData);
            MultiplayerManager.sendMatchSettings({
               "version":Version.getVersion(),
               "p2p":MultiplayerManager.P2PMode,
               "matchSettings":JSON.encode(GameController.currentGame.MatchSettings)
            });
         }
         else
         {
            removeSelf();
         }
      }
      
      private function roomData(param1:MGNEvent) : void
      {
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ROOM_DATA,this.roomData);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_ROOM_DATA,this.roomData);
         if(param1.type === MGNEvent.ERROR_ROOM_DATA)
         {
            MultiplayerManager.notify("Warning, room data on the server could not be updated");
         }
         removeSelf();
         MenuController.pleaseWaitMenu.removeSelf();
      }
      
      private function generic_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function back_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function controls_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         MenuController.showControlsMenu();
      }
      
      private function controls_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function tarrow_l_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleTime(false);
         this.updateFields();
      }
      
      private function tarrow_r_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleTime(true);
         this.updateFields();
      }
      
      private function sarrow_l_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleStock(false);
         this.updateFields();
      }
      
      private function sarrow_r_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleStock(true);
         this.updateFields();
      }
      
      private function darrow_l_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleDamageRatio(false);
         this.updateFields();
      }
      
      private function darrow_r_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleDamageRatio(true);
         this.updateFields();
      }
      
      private function iarrow_l_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleItemFrequency(false);
         this.updateFields();
      }
      
      private function iarrow_r_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleItemFrequency(true);
         this.updateFields();
      }
      
      private function timebut_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleUsingTime();
         this.updateFields();
      }
      
      private function stockbut_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleUsingLives();
         this.updateFields();
      }
      
      private function pDisplaybut_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleShowPlayerID();
         this.updateFields();
      }
      
      private function iSwitch_btn_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         MenuController.showItemSwitchMenu();
      }
      
      private function sSwitch_btn_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         MenuController.showStageSwitchMenu();
      }
      
      private function hazards_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleHazards();
         if(GameController.currentGame)
         {
            GameController.currentGame.LevelData.hazards = SaveData.Hazards;
         }
         this.updateFields();
      }
      
      private function teamdamage_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         SaveData.toggleTeamDamage();
         this.updateFields();
      }
      
      private function next_startDamage_DOWN(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         this.startDamageMouseDown = true;
         this.startDamageInc = true;
         this.startDamageDiff = 0;
         this.startDamageTimer.CurrentTime = this.startDamageTimer.MaxTime;
      }
      
      private function prev_startDamage_DOWN(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         this.startDamageMouseDown = true;
         this.startDamageInc = false;
         this.startDamageDiff = 0;
         this.startDamageTimer.CurrentTime = this.startDamageTimer.MaxTime;
      }
      
      private function next_startDamage_UP(param1:MouseEvent) : void
      {
         this.startDamageMouseDown = false;
         this.startDamageInc = true;
      }
      
      private function prev_startDamage_UP(param1:MouseEvent) : void
      {
         this.startDamageMouseDown = false;
         this.startDamageInc = false;
      }
      
      private function next_startDamage_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:Number = SaveData.StartDamage;
         _loc2_++;
         if(_loc2_ < 0)
         {
            _loc2_ = 999;
         }
         else if(_loc2_ > 999)
         {
            _loc2_ = 0;
         }
         SaveData.setStartDamage(_loc2_);
         if(GameController.currentGame != null)
         {
            GameController.currentGame.loadSavedVSOptions();
         }
         m_subMenu.startDmgTxt.text = "" + SaveData.StartDamage;
      }
      
      private function prev_startDamage_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:Number = SaveData.StartDamage;
         _loc2_--;
         if(_loc2_ < 0)
         {
            _loc2_ = 999;
         }
         else if(_loc2_ > 999)
         {
            _loc2_ = 0;
         }
         SaveData.setStartDamage(_loc2_);
         if(GameController.currentGame != null)
         {
            GameController.currentGame.loadSavedVSOptions();
         }
         m_subMenu.startDmgTxt.text = "" + SaveData.StartDamage;
      }
      
      private function updateStartDamage(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         if(this.startDamageMouseDown)
         {
            this.startDamageTimer.tick();
            if(this.startDamageTimer.IsComplete)
            {
               _loc2_ = SaveData.StartDamage;
               this.startDamageTimer.reset();
               this.startDamageDiff++;
               if(this.startDamageDiff >= 5)
               {
                  this.startDamageTimer.MaxTime = 1;
               }
               else if(this.startDamageDiff < 5)
               {
                  this.startDamageTimer.MaxTime = 5;
               }
               if(this.startDamageInc)
               {
                  _loc2_ = _loc2_ + (this.startDamageDiff >= 60?6:1);
               }
               else
               {
                  _loc2_ = _loc2_ - (this.startDamageDiff >= 60?6:1);
               }
               if(_loc2_ < 0)
               {
                  _loc2_ = 999;
               }
               else if(_loc2_ > 999)
               {
                  _loc2_ = 0;
               }
               SaveData.setStartDamage(_loc2_);
               if(GameController.currentGame != null)
               {
                  GameController.currentGame.loadSavedVSOptions();
               }
               m_subMenu.startDmgTxt.text = "" + SaveData.StartDamage;
            }
         }
      }
      
      private function updateFields() : void
      {
         if(!SaveData.UsingTime)
         {
            m_subMenu.timebut.gotoAndStop("off");
         }
         else
         {
            m_subMenu.timebut.gotoAndStop("on");
         }
         if(!SaveData.UsingLives)
         {
            m_subMenu.stockbut.gotoAndStop("off");
         }
         else
         {
            m_subMenu.stockbut.gotoAndStop("on");
         }
         if(!SaveData.ShowPlayerID)
         {
            m_subMenu.pDisplaybut.gotoAndStop("off");
         }
         else
         {
            m_subMenu.pDisplaybut.gotoAndStop("on");
         }
         if(!SaveData.Hazards)
         {
            m_subMenu.hazardsbut.gotoAndStop("off");
         }
         else
         {
            m_subMenu.hazardsbut.gotoAndStop("on");
         }
         if(!SaveData.TeamDamage)
         {
            m_subMenu.teamdamagebut.gotoAndStop("off");
         }
         else
         {
            m_subMenu.teamdamagebut.gotoAndStop("on");
         }
         m_subMenu.timeTxt.text = SaveData.Time + ":00";
         m_subMenu.dmgRatioTxt.text = SaveData.DamageRatio == Math.round(SaveData.DamageRatio)?"x" + SaveData.DamageRatio + ".0":"x" + SaveData.DamageRatio;
         m_subMenu.stockTxt.text = "" + SaveData.Lives;
         m_subMenu.startDmgTxt.text = "" + SaveData.StartDamage;
         switch(SaveData.ItemFrequency)
         {
            case 1:
               m_subMenu.itemFreqTxt.text = "Very Low";
               break;
            case 2:
               m_subMenu.itemFreqTxt.text = "Low";
               break;
            case 3:
               m_subMenu.itemFreqTxt.text = "Medium";
               break;
            case 4:
               m_subMenu.itemFreqTxt.text = "High";
               break;
            case 5:
               m_subMenu.itemFreqTxt.text = "Very High";
               break;
            default:
               m_subMenu.itemFreqTxt.text = "Off";
         }
      }
      
      private function home_CLICK(param1:MouseEvent) : void
      {
         if(MultiplayerManager.Connected)
         {
            MultiplayerManager.disconnect();
         }
         SaveData.saveGame();
         SoundQueue.instance.playSoundEffect("menu_back");
         SoundQueue.instance.stopMusic();
         if(MenuController.CurrentCharacterSelectMenu)
         {
            MenuController.CurrentCharacterSelectMenu.resetScreen();
         }
         if(GameController.currentGame)
         {
            GameController.currentGame.killEvents();
         }
         GameController.currentGame = null;
         MenuController.removeAllMenus();
         MenuController.showTitleMenu();
      }
   }
}
