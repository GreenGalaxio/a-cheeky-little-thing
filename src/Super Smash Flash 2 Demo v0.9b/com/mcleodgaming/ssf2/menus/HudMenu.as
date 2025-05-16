package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.hazards.BombFactoryHazard;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import com.mcleodgaming.ssf2.util.Vcam;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class HudMenu extends Menu
   {
       
      
      private var m_currentItem:int;
      
      private var m_currentSpeed:Number;
      
      private var m_cpuNum:int;
      
      private var m_cpuAction:int;
      
      private var m_cpuDamage:Number;
      
      private var m_cpuDamageTimer:FrameTimer;
      
      private var m_cpuDamageMouseDown:Boolean;
      
      private var m_cpuDamageInc:Boolean;
      
      private var m_cpuDamageDiff:Number;
      
      private var m_hudMode:int;
      
      private var m_speedNode:MenuMapperNode;
      
      private var m_itemNode:MenuMapperNode;
      
      private var m_cpuCountNode:MenuMapperNode;
      
      private var m_cpuActionNode:MenuMapperNode;
      
      private var m_cpuDamageNode:MenuMapperNode;
      
      private var m_cameraNode:MenuMapperNode;
      
      private var m_hudNode:MenuMapperNode;
      
      private var m_resetNode:MenuMapperNode;
      
      private var m_finishNode:MenuMapperNode;
      
      public function HudMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_hud");
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         m_subMenu.visible = false;
         m_subMenu.training_menu.visible = false;
         m_subMenu.help_menu.visible = false;
         m_subMenu.pause_menu.visible = false;
         m_subMenu.camIcon.visible = false;
         m_subMenu.tabChildren = false;
         m_subMenu.tabEnabled = false;
         this.m_currentItem = 0;
         this.m_currentSpeed = 1;
         this.m_cpuNum = 1;
         this.m_cpuAction = 0;
         this.m_cpuDamage = 0;
         this.m_cpuDamageTimer = new FrameTimer(5);
         this.m_cpuDamageMouseDown = false;
         this.m_cpuDamageDiff = 0;
         this.m_cpuDamageInc = true;
         this.m_hudMode = 0;
      }
      
      public function get CpuDamage() : Number
      {
         return this.m_cpuDamage;
      }
      
      public function get HudMode() : int
      {
         return this.m_hudMode;
      }
      
      public function get CurrentItem() : int
      {
         return this.m_currentItem;
      }
      
      public function get CurrentSpeed() : Number
      {
         return this.m_currentSpeed;
      }
      
      public function get CpuAction() : int
      {
         return this.m_cpuAction;
      }
      
      override public function manageMenuMappings(param1:Event) : void
      {
         if(GameController.stageData && GameController.stageData.FreezeKeys && GameController.stageData.GameRef.GameMode == Mode.TRAINING && this.m_speedNode != null)
         {
            super.manageMenuMappings(param1);
            return;
         }
      }
      
      override public function initMenuMappings() : void
      {
         if(!GameController.stageData || this.m_speedNode != null || GameController.stageData.GameRef.GameMode != Mode.TRAINING)
         {
            return;
         }
         this.m_speedNode = new MenuMapperNode(m_subMenu.training_menu.btn_speed);
         this.m_itemNode = new MenuMapperNode(m_subMenu.training_menu.make_item);
         this.m_cpuCountNode = new MenuMapperNode(m_subMenu.training_menu.btn_cpuCount);
         this.m_cpuActionNode = new MenuMapperNode(m_subMenu.training_menu.btn_cpuAction);
         this.m_cpuDamageNode = new MenuMapperNode(m_subMenu.training_menu.btn_cpuDamage);
         this.m_cameraNode = new MenuMapperNode(m_subMenu.training_menu.btn_camera);
         this.m_hudNode = new MenuMapperNode(m_subMenu.training_menu.btn_hud);
         this.m_resetNode = new MenuMapperNode(m_subMenu.training_menu.reset_btn);
         this.m_finishNode = new MenuMapperNode(m_subMenu.training_menu.finish_btn);
         this.m_speedNode.updateNodes([this.m_finishNode,this.m_resetNode],[this.m_itemNode],null,null,this.generic_ROLL_OVER,null,null,this.unpauseGame,null,null,this.prev_speed_CLICK,this.next_speed_CLICK);
         this.m_itemNode.updateNodes([this.m_speedNode],[this.m_cpuCountNode],null,null,this.generic_ROLL_OVER,null,this.make_item_CLICK,this.unpauseGame,null,null,this.prev_item_CLICK,this.next_item_CLICK);
         this.m_cpuCountNode.updateNodes([this.m_itemNode],[this.m_cpuActionNode],null,null,this.generic_ROLL_OVER,null,null,this.unpauseGame,null,null,this.prev_cpuNum_CLICK,this.next_cpuNum_CLICK);
         this.m_cpuActionNode.updateNodes([this.m_cpuCountNode],[this.m_cpuDamageNode],null,null,this.generic_ROLL_OVER,null,null,this.unpauseGame,null,null,this.prev_cpuAction_CLICK,this.next_cpuAction_CLICK);
         this.m_cpuDamageNode.updateNodes([this.m_cpuActionNode],[this.m_cameraNode],null,null,this.generic_ROLL_OVER,null,null,this.unpauseGame,null,null,this.dec_cpuDamage,this.inc_cpuDamage);
         this.m_cameraNode.updateNodes([this.m_cpuDamageNode],[this.m_hudNode],null,null,this.generic_ROLL_OVER,null,null,this.unpauseGame,null,null,this.prev_camMode_CLICK,this.next_camMode_CLICK);
         this.m_hudNode.updateNodes([this.m_cameraNode],[this.m_resetNode],null,null,this.generic_ROLL_OVER,null,null,this.unpauseGame,null,null,this.prev_HUD_CLICK,this.next_HUD_CLICK);
         this.m_resetNode.updateNodes([this.m_hudNode],[this.m_speedNode],[this.m_finishNode],[this.m_finishNode],null,null,this.reset_CLICK,this.unpauseGame);
         this.m_finishNode.updateNodes([this.m_hudNode],[this.m_speedNode],[this.m_resetNode],[this.m_resetNode],null,null,this.finish_CLICK,this.unpauseGame);
         m_menuMapper = new MenuMapper(this.m_speedNode);
         m_menuMapper.init();
      }
      
      private function unpauseGame(param1:Event) : void
      {
         GameController.stageData.Paused = false;
      }
      
      public function showTrainingDisplay() : void
      {
         if(!GameController.stageData)
         {
            return;
         }
         m_subMenu.training_menu.item_txt.text = GameController.stageData.ItemsRef.ItemsList[GameController.hud.CurrentItem].DisplayName;
         this.formatTextField(m_subMenu.training_menu.item_txt);
         m_subMenu.training_menu.speed_txt.text = "x " + this.formatFraction(this.m_currentSpeed);
         m_subMenu.training_menu.cpuNum_txt.text = "" + this.m_cpuNum;
         m_subMenu.training_menu.cpuAction_txt.text = "" + this.formatCPUAction(this.m_cpuAction);
         m_subMenu.training_menu.camMode_txt.text = this.formatCameraMode(GameController.stageData.CamRef.Mode);
         m_subMenu.training_menu.cpuDamage_txt.text = this.m_cpuDamage;
         m_subMenu.training_menu.visible = true;
         m_subMenu.training_menu.HUD_txt.text = this.m_hudMode == 0?"Normal":this.m_hudMode == 1?"Advanced":"None";
      }
      
      public function hideTrainingDisplay() : void
      {
         m_subMenu.training_menu.visible = false;
         this.m_cpuDamageMouseDown = false;
         if(this.m_hudMode != 2)
         {
            this.showHealthBoxes();
         }
      }
      
      public function showHealthBoxes() : void
      {
         var _loc1_:int = 0;
         if(!GameController.stageData)
         {
            return;
         }
         if(GameController.hud.HudMode != 2)
         {
            _loc1_ = 1;
            while(_loc1_ <= Main.MAXPLAYERS)
            {
               if(m_subMenu["p" + _loc1_ + "health"])
               {
                  m_subMenu["p" + _loc1_ + "health"].visible = GameController.stageData.getPlayer(_loc1_) != null && !GameController.stageData.getPlayer(_loc1_).Dead?true:false;
               }
               _loc1_++;
            }
         }
      }
      
      public function hideHealthBoxes() : void
      {
         if(!GameController.stageData)
         {
            return;
         }
         var _loc1_:int = 1;
         while(_loc1_ <= Main.MAXPLAYERS)
         {
            if(m_subMenu["p" + _loc1_ + "health"])
            {
               m_subMenu["p" + _loc1_ + "health"].visible = false;
            }
            _loc1_++;
         }
      }
      
      override public function makeEvents() : void
      {
         var _loc1_:int = 0;
         this.initMenuMappings();
         if(m_showCount == 0)
         {
            findSubMenuButtons();
         }
         super.makeEvents();
         resetAllButtons();
         m_subMenu.pause_menu.addEventListener(MouseEvent.CLICK,this.pausemenu_CLICK);
         m_subMenu.camIcon.addEventListener(MouseEvent.CLICK,this.camIcon_CLICK);
         if(m_menuMapper != null)
         {
            Main.Root.stage.addEventListener(Event.ENTER_FRAME,this.manageMenuMappings);
            setMenuMappingFocus();
         }
         if(GameController.stageData && GameController.stageData.GameRef.GameMode == Mode.TRAINING)
         {
            m_subMenu.training_menu.prev_item.addEventListener(MouseEvent.CLICK,this.prev_item_CLICK);
            m_subMenu.training_menu.next_item.addEventListener(MouseEvent.CLICK,this.next_item_CLICK);
            m_subMenu.training_menu.make_item.addEventListener(MouseEvent.CLICK,this.make_item_CLICK);
            m_subMenu.training_menu.prev_speed.addEventListener(MouseEvent.CLICK,this.prev_speed_CLICK);
            m_subMenu.training_menu.next_speed.addEventListener(MouseEvent.CLICK,this.next_speed_CLICK);
            m_subMenu.training_menu.prev_cpuNum.addEventListener(MouseEvent.CLICK,this.prev_cpuNum_CLICK);
            m_subMenu.training_menu.next_cpuNum.addEventListener(MouseEvent.CLICK,this.next_cpuNum_CLICK);
            m_subMenu.training_menu.prev_cpuAction.addEventListener(MouseEvent.CLICK,this.prev_cpuAction_CLICK);
            m_subMenu.training_menu.next_cpuAction.addEventListener(MouseEvent.CLICK,this.next_cpuAction_CLICK);
            m_subMenu.training_menu.prev_cpuDamage.addEventListener(MouseEvent.MOUSE_DOWN,this.prev_cpuDamage_DOWN);
            m_subMenu.training_menu.next_cpuDamage.addEventListener(MouseEvent.MOUSE_DOWN,this.next_cpuDamage_DOWN);
            m_subMenu.training_menu.prev_cpuDamage.addEventListener(MouseEvent.MOUSE_UP,this.prev_cpuDamage_UP);
            m_subMenu.training_menu.next_cpuDamage.addEventListener(MouseEvent.MOUSE_UP,this.next_cpuDamage_UP);
            m_subMenu.training_menu.prev_cpuDamage.addEventListener(MouseEvent.MOUSE_OUT,this.prev_cpuDamage_UP);
            m_subMenu.training_menu.next_cpuDamage.addEventListener(MouseEvent.MOUSE_OUT,this.next_cpuDamage_UP);
            m_subMenu.training_menu.prev_HUD.addEventListener(MouseEvent.CLICK,this.prev_HUD_CLICK);
            m_subMenu.training_menu.next_HUD.addEventListener(MouseEvent.CLICK,this.next_HUD_CLICK);
            m_subMenu.training_menu.finish_btn.addEventListener(MouseEvent.CLICK,this.finish_CLICK);
            m_subMenu.training_menu.reset_btn.addEventListener(MouseEvent.CLICK,this.reset_CLICK);
            m_subMenu.training_menu.prev_camMode.addEventListener(MouseEvent.CLICK,this.prev_camMode_CLICK);
            m_subMenu.training_menu.next_camMode.addEventListener(MouseEvent.CLICK,this.next_camMode_CLICK);
            _loc1_ = 2;
            while(_loc1_ <= Main.MAXPLAYERS)
            {
               if(GameController.stageData.getPlayer(_loc1_))
               {
                  GameController.stageData.getPlayer(_loc1_).setHumanControl(false,GameController.stageData.GameRef.PlayerSettings[_loc1_ - 1].level);
                  GameController.stageData.getPlayer(_loc1_).getAI().ActionText = this.formatCPUActionShorthand(this.m_cpuAction);
               }
               _loc1_++;
            }
         }
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.pause_menu.removeEventListener(MouseEvent.CLICK,this.pausemenu_CLICK);
         m_subMenu.camIcon.removeEventListener(MouseEvent.CLICK,this.camIcon_CLICK);
         if(m_menuMapper != null)
         {
            Main.Root.stage.removeEventListener(Event.ENTER_FRAME,this.manageMenuMappings);
         }
         if(GameController.stageData && GameController.stageData.GameRef.GameMode == Mode.TRAINING)
         {
            m_subMenu.training_menu.prev_item.removeEventListener(MouseEvent.CLICK,this.prev_item_CLICK);
            m_subMenu.training_menu.next_item.removeEventListener(MouseEvent.CLICK,this.next_item_CLICK);
            m_subMenu.training_menu.make_item.removeEventListener(MouseEvent.CLICK,this.make_item_CLICK);
            m_subMenu.training_menu.prev_speed.removeEventListener(MouseEvent.CLICK,this.prev_speed_CLICK);
            m_subMenu.training_menu.next_speed.removeEventListener(MouseEvent.CLICK,this.next_speed_CLICK);
            m_subMenu.training_menu.prev_cpuNum.removeEventListener(MouseEvent.CLICK,this.prev_cpuNum_CLICK);
            m_subMenu.training_menu.next_cpuNum.removeEventListener(MouseEvent.CLICK,this.next_cpuNum_CLICK);
            m_subMenu.training_menu.prev_cpuAction.removeEventListener(MouseEvent.CLICK,this.prev_cpuAction_CLICK);
            m_subMenu.training_menu.next_cpuAction.removeEventListener(MouseEvent.CLICK,this.next_cpuAction_CLICK);
            m_subMenu.training_menu.prev_cpuDamage.removeEventListener(MouseEvent.MOUSE_DOWN,this.prev_cpuDamage_DOWN);
            m_subMenu.training_menu.next_cpuDamage.removeEventListener(MouseEvent.MOUSE_DOWN,this.next_cpuDamage_DOWN);
            m_subMenu.training_menu.prev_cpuDamage.removeEventListener(MouseEvent.MOUSE_UP,this.prev_cpuDamage_UP);
            m_subMenu.training_menu.next_cpuDamage.removeEventListener(MouseEvent.MOUSE_UP,this.next_cpuDamage_UP);
            m_subMenu.training_menu.prev_cpuDamage.removeEventListener(MouseEvent.MOUSE_OUT,this.prev_cpuDamage_UP);
            m_subMenu.training_menu.next_cpuDamage.removeEventListener(MouseEvent.MOUSE_OUT,this.next_cpuDamage_UP);
            m_subMenu.training_menu.prev_HUD.removeEventListener(MouseEvent.CLICK,this.prev_HUD_CLICK);
            m_subMenu.training_menu.next_HUD.removeEventListener(MouseEvent.CLICK,this.next_HUD_CLICK);
            m_subMenu.training_menu.finish_btn.removeEventListener(MouseEvent.CLICK,this.finish_CLICK);
            m_subMenu.training_menu.reset_btn.removeEventListener(MouseEvent.CLICK,this.reset_CLICK);
            m_subMenu.training_menu.prev_camMode.removeEventListener(MouseEvent.CLICK,this.prev_camMode_CLICK);
            m_subMenu.training_menu.next_camMode.removeEventListener(MouseEvent.CLICK,this.next_camMode_CLICK);
         }
      }
      
      private function generic_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function pausemenu_CLICK(param1:MouseEvent) : void
      {
         m_subMenu.pause_menu.visible = false;
         m_subMenu.camIcon.gotoAndStop(1);
      }
      
      private function camIcon_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_camera");
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         m_subMenu.camIcon.visible = false;
         if(m_subMenu.pause_menu.visible)
         {
            _loc3_ = true;
            m_subMenu.pause_menu.visible = false;
         }
         if(Main.DEBUG)
         {
            _loc2_ = true;
            GameController.constantDebugger.SubMenu.visible = false;
         }
         Utils.getSnapShot(Main.Root);
         m_subMenu.camIcon.visible = true;
         m_subMenu.camIcon.gotoAndPlay("snapshot");
         if(_loc2_ && Main.DEBUG)
         {
            GameController.constantDebugger.SubMenu.visible = true;
         }
         if(_loc3_)
         {
            m_subMenu.pause_menu.visible = true;
         }
      }
      
      public function prev_item_CLICK(param1:MouseEvent) : void
      {
         if(!GameController.stageData)
         {
            return;
         }
         this.m_currentItem--;
         if(this.m_currentItem < 0)
         {
            this.m_currentItem = GameController.stageData.ItemsRef.ItemsList.length - 1;
         }
         m_subMenu.training_menu.item_txt.text = GameController.stageData.ItemsRef.ItemsList[this.m_currentItem].DisplayName;
         this.formatTextField(m_subMenu.training_menu.item_txt);
      }
      
      public function next_item_CLICK(param1:MouseEvent) : void
      {
         if(!GameController.stageData)
         {
            return;
         }
         this.m_currentItem++;
         if(this.m_currentItem >= GameController.stageData.ItemsRef.ItemsList.length)
         {
            this.m_currentItem = 0;
         }
         m_subMenu.training_menu.item_txt.text = GameController.stageData.ItemsRef.ItemsList[this.m_currentItem].DisplayName;
         this.formatTextField(m_subMenu.training_menu.item_txt);
      }
      
      public function make_item_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(!GameController.stageData)
         {
            return;
         }
         GameController.stageData.SoundQueueRef.playSoundEffect("item_spawntraining");
         if(GameController.stageData.getPlayer(1) && GameController.stageData.getPlayer(1).CollisionObj.ground)
         {
            _loc2_ = GameController.stageData.getPlayer(1).X + (!!GameController.stageData.getPlayer(1).FacingForward?GameController.stageData.getPlayer(1).Width:-GameController.stageData.getPlayer(1).Width);
            _loc3_ = GameController.stageData.getPlayer(1).Y - GameController.stageData.getPlayer(1).Height * 2;
            _loc4_ = 0;
            while(GameController.stageData.getPlayer(1).testTerrainWithCoord(_loc2_,_loc3_) && _loc4_ < 360)
            {
               _loc2_ = _loc2_ + Utils.calculateXSpeed(10,_loc4_);
               _loc3_ = _loc3_ + Utils.calculateYSpeed(10,_loc4_);
               _loc4_ = _loc4_ + 10;
            }
            if(_loc4_ >= 360 && GameController.stageData.getPlayer(1).testTerrainWithCoord(_loc2_,_loc3_))
            {
               _loc2_ = GameController.stageData.getPlayer(1).X;
               _loc3_ = GameController.stageData.getPlayer(1).Y - 10;
            }
            GameController.stageData.ItemsRef.generateItemObj(GameController.stageData.ItemsRef.ItemsList[this.m_currentItem],_loc2_,_loc3_);
         }
         else
         {
            GameController.stageData.ItemsRef.generateItemObj(GameController.stageData.ItemsRef.ItemsList[this.m_currentItem]);
         }
      }
      
      public function prev_speed_CLICK(param1:MouseEvent) : void
      {
         if(!GameController.stageData)
         {
            return;
         }
         if(this.m_currentSpeed == 2)
         {
            this.m_currentSpeed = 1.5;
         }
         else if(this.m_currentSpeed == 1.5)
         {
            this.m_currentSpeed = 1;
         }
         else
         {
            this.m_currentSpeed = this.m_currentSpeed / 2;
         }
         if(this.m_currentSpeed < 1 / 4)
         {
            this.m_currentSpeed = 1 / 4;
         }
         Main.Root.stage.frameRate = Main.FRAMERATE * this.m_currentSpeed;
         m_subMenu.training_menu.speed_txt.text = "x " + this.formatFraction(this.m_currentSpeed);
      }
      
      public function next_speed_CLICK(param1:MouseEvent) : void
      {
         if(!GameController.stageData)
         {
            return;
         }
         if(this.m_currentSpeed == 1)
         {
            this.m_currentSpeed = 1.5;
         }
         else if(this.m_currentSpeed == 1.5)
         {
            this.m_currentSpeed = 2;
         }
         else
         {
            this.m_currentSpeed = this.m_currentSpeed * 2;
         }
         if(this.m_currentSpeed > 2)
         {
            this.m_currentSpeed = 2;
         }
         Main.Root.stage.frameRate = Main.FRAMERATE * this.m_currentSpeed;
         m_subMenu.training_menu.speed_txt.text = "x " + this.formatFraction(this.m_currentSpeed);
      }
      
      public function prev_cpuNum_CLICK(param1:MouseEvent) : void
      {
         if(!GameController.stageData)
         {
            return;
         }
         this.m_cpuNum--;
         if(this.m_cpuNum < 0)
         {
            this.m_cpuNum = 0;
         }
         else
         {
            m_subMenu.training_menu.cpuNum_txt.text = "" + this.m_cpuNum;
            if(GameController.stageData.getPlayer(this.m_cpuNum + 2))
            {
               GameController.stageData.getPlayer(this.m_cpuNum + 2).StandBy = true;
            }
         }
      }
      
      public function next_cpuNum_CLICK(param1:MouseEvent) : void
      {
         if(!GameController.stageData)
         {
            return;
         }
         this.m_cpuNum++;
         if(this.m_cpuNum > Main.MAXPLAYERS - 1)
         {
            this.m_cpuNum = Main.MAXPLAYERS - 1;
         }
         else
         {
            m_subMenu.training_menu.cpuNum_txt.text = "" + this.m_cpuNum;
            if(GameController.stageData.getPlayer(this.m_cpuNum + 1))
            {
               GameController.stageData.getPlayer(this.m_cpuNum + 1).StandBy = false;
            }
            if(this.m_hudMode == 2)
            {
               this.setHealthBoxVisibility(false);
            }
         }
      }
      
      public function prev_cpuAction_CLICK(param1:MouseEvent) : void
      {
         if(!GameController.stageData)
         {
            return;
         }
         this.m_cpuAction--;
         if(this.m_cpuAction < -2)
         {
            this.m_cpuAction = 5;
         }
         var _loc2_:int = 2;
         while(_loc2_ <= Main.MAXPLAYERS)
         {
            if(GameController.stageData.getPlayer(_loc2_) != null)
            {
               if(this.m_cpuAction == -2)
               {
                  GameController.stageData.getPlayer(_loc2_).setHumanControl(true,GameController.stageData.GameRef.PlayerSettings[_loc2_ - 1].level);
               }
               else
               {
                  GameController.stageData.getPlayer(_loc2_).setHumanControl(false,GameController.stageData.GameRef.PlayerSettings[_loc2_ - 1].level);
                  GameController.stageData.getPlayer(_loc2_).getAI().ActionText = this.formatCPUActionShorthand(this.m_cpuAction);
               }
            }
            _loc2_++;
         }
         m_subMenu.training_menu.cpuAction_txt.text = this.formatCPUAction(this.m_cpuAction);
      }
      
      public function next_cpuAction_CLICK(param1:MouseEvent) : void
      {
         this.m_cpuAction++;
         if(this.m_cpuAction > 5)
         {
            this.m_cpuAction = -2;
         }
         var _loc2_:int = 2;
         while(_loc2_ <= Main.MAXPLAYERS)
         {
            if(GameController.stageData.getPlayer(_loc2_) != null)
            {
               if(this.m_cpuAction == -2)
               {
                  GameController.stageData.getPlayer(_loc2_).setHumanControl(true,GameController.stageData.GameRef.PlayerSettings[_loc2_ - 1].level);
               }
               else
               {
                  GameController.stageData.getPlayer(_loc2_).setHumanControl(false,GameController.stageData.GameRef.PlayerSettings[_loc2_ - 1].level);
                  GameController.stageData.getPlayer(_loc2_).getAI().ActionText = this.formatCPUActionShorthand(this.m_cpuAction);
               }
            }
            _loc2_++;
         }
         m_subMenu.training_menu.cpuAction_txt.text = this.formatCPUAction(this.m_cpuAction);
      }
      
      public function next_cpuDamage_DOWN(param1:MouseEvent) : void
      {
         this.m_cpuDamageMouseDown = true;
         this.m_cpuDamageInc = true;
         this.m_cpuDamageDiff = 0;
         this.m_cpuDamageTimer.CurrentTime = this.m_cpuDamageTimer.MaxTime;
      }
      
      public function prev_cpuDamage_DOWN(param1:MouseEvent) : void
      {
         this.m_cpuDamageMouseDown = true;
         this.m_cpuDamageInc = false;
         this.m_cpuDamageDiff = 0;
         this.m_cpuDamageTimer.CurrentTime = this.m_cpuDamageTimer.MaxTime;
      }
      
      public function next_cpuDamage_UP(param1:MouseEvent) : void
      {
         this.m_cpuDamageMouseDown = false;
         this.m_cpuDamageInc = true;
      }
      
      public function prev_cpuDamage_UP(param1:MouseEvent) : void
      {
         this.m_cpuDamageMouseDown = false;
         this.m_cpuDamageInc = false;
      }
      
      public function inc_cpuDamage(param1:MouseEvent) : void
      {
         this.m_cpuDamage++;
         if(this.m_cpuDamage > 999)
         {
            this.m_cpuDamage = 0;
         }
         m_subMenu.training_menu.cpuDamage_txt.text = this.m_cpuDamage;
      }
      
      public function dec_cpuDamage(param1:MouseEvent) : void
      {
         this.m_cpuDamage--;
         if(this.m_cpuDamage < 0)
         {
            this.m_cpuDamage = 999;
         }
         m_subMenu.training_menu.cpuDamage_txt.text = this.m_cpuDamage;
      }
      
      public function next_camMode_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:Vector.<MovieClip> = null;
         var _loc3_:int = 0;
         if(!GameController.stageData)
         {
            return;
         }
         GameController.stageData.CamRef.Mode++;
         m_subMenu.training_menu.camMode_txt.text = this.formatCameraMode(GameController.stageData.CamRef.Mode);
         if(GameController.stageData.CamRef.Mode == Vcam.ZOOM_MODE && GameController.stageData.CamRef.Targets.length > 1)
         {
            _loc2_ = new Vector.<MovieClip>();
            _loc3_ = 1;
            while(_loc3_ <= Main.MAXPLAYERS)
            {
               if(GameController.stageData.getPlayer(_loc3_) != null && !GameController.stageData.getPlayer(_loc3_).StandBy)
               {
                  _loc2_.push(GameController.stageData.getPlayer(_loc3_).MC);
               }
               _loc3_++;
            }
            if(GameController.stageData.ItemsRef.CurrentSmashBall != null)
            {
               _loc2_.push(GameController.stageData.ItemsRef.CurrentSmashBall.ItemInstance);
            }
            GameController.stageData.CamRef.deleteTargets(_loc2_);
            _loc2_ = _loc2_.slice(0,1);
            GameController.stageData.CamRef.addTargets(_loc2_);
         }
         else if(GameController.stageData.CamRef.Mode == Vcam.STAGE_MODE)
         {
            GameController.stageData.CamRef.fixBG();
         }
      }
      
      public function prev_camMode_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:Vector.<MovieClip> = null;
         var _loc3_:int = 0;
         if(!GameController.stageData)
         {
            return;
         }
         GameController.stageData.CamRef.Mode--;
         m_subMenu.training_menu.camMode_txt.text = this.formatCameraMode(GameController.stageData.CamRef.Mode);
         if(GameController.stageData.CamRef.Mode == Vcam.ZOOM_MODE && GameController.stageData.CamRef.Targets.length > 1)
         {
            _loc2_ = new Vector.<MovieClip>();
            _loc3_ = 1;
            while(_loc3_ <= Main.MAXPLAYERS)
            {
               if(GameController.stageData.getPlayer(_loc3_) != null && !GameController.stageData.getPlayer(_loc3_).StandBy)
               {
                  _loc2_.push(GameController.stageData.getPlayer(_loc3_).MC);
               }
               _loc3_++;
            }
            if(GameController.stageData.ItemsRef.CurrentSmashBall != null)
            {
               _loc2_.push(GameController.stageData.ItemsRef.CurrentSmashBall.ItemInstance);
            }
            GameController.stageData.CamRef.deleteTargets(_loc2_);
            _loc2_ = _loc2_.slice(0,1);
            GameController.stageData.CamRef.addTargets(_loc2_);
         }
         else if(GameController.stageData.CamRef.Mode == Vcam.STAGE_MODE)
         {
            GameController.stageData.CamRef.fixBG();
         }
      }
      
      public function next_HUD_CLICK(param1:MouseEvent) : void
      {
         GameController.stageData.SoundQueueRef.playSoundEffect("menu_select");
         this.m_hudMode++;
         if(this.m_hudMode > 2)
         {
            this.m_hudMode = 0;
         }
         switch(this.m_hudMode)
         {
            case 0:
               m_subMenu.training_menu.HUD_txt.text = "Normal";
               this.setHealthBoxVisibility(true);
               break;
            case 1:
               m_subMenu.help_menu.visible = true;
               m_subMenu.training_menu.HUD_txt.text = "Advanced";
               break;
            case 2:
               m_subMenu.help_menu.visible = false;
               m_subMenu.training_menu.HUD_txt.text = "None";
               this.setHealthBoxVisibility(false);
         }
      }
      
      public function prev_HUD_CLICK(param1:MouseEvent) : void
      {
         GameController.stageData.SoundQueueRef.playSoundEffect("menu_select");
         this.m_hudMode--;
         if(this.m_hudMode < 0)
         {
            this.m_hudMode = 2;
         }
         switch(this.m_hudMode)
         {
            case 0:
               m_subMenu.help_menu.visible = false;
               m_subMenu.training_menu.HUD_txt.text = "Normal";
               break;
            case 1:
               m_subMenu.help_menu.visible = true;
               m_subMenu.training_menu.HUD_txt.text = "Advanced";
               this.setHealthBoxVisibility(true);
               break;
            case 2:
               m_subMenu.training_menu.HUD_txt.text = "None";
               this.setHealthBoxVisibility(false);
         }
      }
      
      public function reset_CLICK(param1:MouseEvent) : void
      {
         if(!GameController.stageData)
         {
            return;
         }
         var _loc2_:int = 0;
         GameController.stageData.SoundQueueRef.playSoundEffect("menu_back");
         this.m_currentItem = 0;
         this.m_currentSpeed = 1;
         Main.Root.stage.frameRate = Main.FRAMERATE * this.m_currentSpeed;
         this.m_cpuNum = 1;
         m_subMenu.training_menu.cpuNum_txt.text = "" + this.m_cpuNum;
         if(GameController.stageData.getPlayer(1))
         {
            GameController.stageData.getPlayer(1).StandBy = false;
         }
         _loc2_ = 2;
         while(_loc2_ <= Main.MAXPLAYERS)
         {
            if(GameController.stageData.getPlayer(_loc2_))
            {
               GameController.stageData.getPlayer(_loc2_).StandBy = true;
            }
            _loc2_++;
         }
         if(GameController.stageData.getPlayer(2))
         {
            GameController.stageData.getPlayer(2).StandBy = false;
         }
         this.m_cpuAction = 0;
         _loc2_ = 2;
         while(_loc2_ <= Main.MAXPLAYERS)
         {
            if(GameController.stageData.getPlayer(_loc2_) != null)
            {
               GameController.stageData.getPlayer(_loc2_).setHumanControl(false,GameController.stageData.GameRef.PlayerSettings[_loc2_ - 1].level);
               GameController.stageData.getPlayer(_loc2_).getAI().ActionText = this.formatCPUActionShorthand(this.m_cpuAction);
            }
            _loc2_++;
         }
         GameController.stageData.CamRef.Mode = Vcam.NORMAL_MODE;
         this.m_cpuDamage = 0;
         m_subMenu.training_menu.item_txt.text = GameController.stageData.ItemsRef.ItemsList[this.m_currentItem].DisplayName;
         this.formatTextField(m_subMenu.training_menu.item_txt);
         m_subMenu.training_menu.speed_txt.text = "x " + this.formatFraction(this.m_currentSpeed);
         m_subMenu.training_menu.cpuNum_txt.text = "" + this.m_cpuNum;
         m_subMenu.training_menu.cpuAction_txt.text = "" + this.formatCPUAction(this.m_cpuAction);
         m_subMenu.training_menu.camMode_txt.text = this.formatCameraMode(GameController.stageData.CamRef.Mode);
         m_subMenu.training_menu.cpuDamage_txt.text = this.m_cpuDamage;
         this.m_hudMode = 0;
         m_subMenu.help_menu.visible = false;
         m_subMenu.training_menu.HUD_txt.text = "Normal";
      }
      
      public function finish_CLICK(param1:MouseEvent) : void
      {
         GameController.stageData.SoundQueueRef.playSoundEffect("menu_back");
         GameController.stageData.endGame();
      }
      
      private function formatTextField(param1:TextField) : void
      {
         param1 = m_subMenu.training_menu.item_txt;
         param1.autoSize = TextFieldAutoSize.CENTER;
         var _loc2_:TextFormat = param1.getTextFormat();
         while(param1.numLines > 1)
         {
            _loc2_.size = Number(_loc2_.size) - 1;
            param1.setTextFormat(_loc2_);
         }
         while(param1.numLines < 2)
         {
            _loc2_.size = Number(_loc2_.size) + 1;
            param1.setTextFormat(_loc2_);
         }
         _loc2_.size = Number(_loc2_.size) - 1;
         if(Number(_loc2_.size) > 14)
         {
            _loc2_.size = Number(14);
         }
         param1.setTextFormat(_loc2_);
      }
      
      private function formatFraction(param1:Number) : String
      {
         if(param1 < 1)
         {
            if(param1 == 0.5)
            {
               return "1/2";
            }
            if(param1 == 0.25)
            {
               return "1/4";
            }
         }
         return String(param1);
      }
      
      private function formatCameraMode(param1:int) : String
      {
         var _loc2_:String = "???";
         switch(param1)
         {
            case Vcam.NORMAL_MODE:
               _loc2_ = "Normal";
               break;
            case Vcam.ZOOM_MODE:
               _loc2_ = "Zoom";
               break;
            case Vcam.STAGE_MODE:
               _loc2_ = "Stage";
         }
         return _loc2_;
      }
      
      private function formatCPUAction(param1:int) : String
      {
         var _loc2_:String = "???";
         switch(param1)
         {
            case -2:
               _loc2_ = "Human";
               break;
            case -1:
               _loc2_ = "Attack";
               break;
            case 0:
               _loc2_ = "Idle";
               break;
            case 1:
               _loc2_ = "Chase";
               break;
            case 2:
               _loc2_ = "Evade";
               break;
            case 3:
               _loc2_ = "Jump";
               break;
            case 4:
               _loc2_ = "Walk";
               break;
            case 5:
               _loc2_ = "Run";
         }
         return _loc2_;
      }
      
      private function formatCPUActionShorthand(param1:int) : String
      {
         var _loc2_:String = "???";
         switch(param1)
         {
            case -2:
               _loc2_ = "human";
               break;
            case -1:
               _loc2_ = "attack";
               break;
            case 0:
               _loc2_ = "idle";
               break;
            case 1:
               _loc2_ = "chase";
               break;
            case 2:
               _loc2_ = "evade";
               break;
            case 3:
               _loc2_ = "jump";
               break;
            case 4:
               _loc2_ = "walk";
               break;
            case 5:
               _loc2_ = "run";
         }
         return _loc2_;
      }
      
      public function updateCPUDamage() : void
      {
         if(GameController.stageData.GameRef.GameMode == Mode.TRAINING && this.m_cpuDamageMouseDown)
         {
            this.m_cpuDamageTimer.tick();
            if(this.m_cpuDamageTimer.IsComplete)
            {
               this.m_cpuDamageTimer.reset();
               this.m_cpuDamageDiff++;
               if(this.m_cpuDamageDiff >= 5)
               {
                  this.m_cpuDamageTimer.MaxTime = 1;
               }
               else if(this.m_cpuDamageDiff < 5)
               {
                  this.m_cpuDamageTimer.MaxTime = 5;
               }
               if(this.m_cpuDamageInc)
               {
                  this.m_cpuDamage = this.m_cpuDamage + (this.m_cpuDamageDiff >= 60?6:1);
               }
               else
               {
                  this.m_cpuDamage = this.m_cpuDamage - (this.m_cpuDamageDiff >= 60?6:1);
               }
               if(this.m_cpuDamage < 0)
               {
                  this.m_cpuDamage = 999;
               }
               else if(this.m_cpuDamage > 999)
               {
                  this.m_cpuDamage = 0;
               }
            }
            m_subMenu.training_menu.cpuDamage_txt.text = this.m_cpuDamage;
         }
      }
      
      public function updateHelpMenu() : void
      {
         if(GameController.stageData.getPlayer(1))
         {
            m_subMenu.help_menu.speed_txt.text = "x " + this.formatFraction(this.m_currentSpeed);
            m_subMenu.help_menu.enemy_txt.text = "" + this.formatCPUAction(this.m_cpuAction);
            m_subMenu.help_menu.comboCount_txt.text = "" + GameController.stageData.getPlayer(1).Combo;
            m_subMenu.help_menu.comboCount_txt.text = "" + GameController.stageData.getPlayer(1).Combo;
            m_subMenu.help_menu.comboDamageCount_txt.text = "" + Math.ceil(GameController.stageData.getPlayer(1).ComboDamage);
            m_subMenu.help_menu.comboDamageTotalCount_txt.text = "" + Math.ceil(GameController.stageData.getPlayer(1).ComboDamageTotal);
         }
      }
      
      public function getHealthBox(param1:int) : MovieClip
      {
         var _loc2_:MovieClip = m_subMenu["p" + param1 + "health"].display;
         return _loc2_;
      }
      
      private function setHealthBoxVisibility(param1:Boolean) : void
      {
         var _loc3_:MovieClip = null;
         var _loc2_:int = 0;
         _loc2_ = 1;
         while(_loc2_ <= Main.MAXPLAYERS)
         {
            _loc3_ = GameController.stageData.getPlayer(_loc2_) == null?null:this.getHealthBox(GameController.stageData.getPlayer(_loc2_).ID);
            if(_loc3_ != null)
            {
               if(GameController.stageData.getPlayer(_loc2_) != null && !GameController.stageData.getPlayer(_loc2_).Dead && !GameController.stageData.getPlayer(_loc2_).StandBy)
               {
                  _loc3_.visible = param1;
               }
               else
               {
                  _loc3_.visible = false;
               }
            }
            _loc2_++;
         }
      }
      
      public function forceHitBoxVisiblity(param1:Boolean) : void
      {
         var _loc3_:MovieClip = null;
         var _loc2_:int = 1;
         while(_loc2_ <= Main.MAXPLAYERS)
         {
            _loc3_ = GameController.stageData.getPlayer(_loc2_) == null?null:this.getHealthBox(GameController.stageData.getPlayer(_loc2_).ID);
            if(_loc3_ != null)
            {
               _loc3_.visible = param1;
            }
            _loc2_++;
         }
      }
      
      public function updateHealthBoxVisibility() : void
      {
         var _loc6_:MovieClip = null;
         var _loc7_:Boolean = false;
         var _loc8_:Array = null;
         var _loc1_:BombFactoryHazard = BombFactoryHazard(GameController.stageData.getHazard(BombFactoryHazard));
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = 1;
         while(_loc3_ <= Main.MAXPLAYERS)
         {
            if(GameController.stageData.getPlayer(_loc3_) != null && GameController.stageData.getPlayer(_loc3_).UsingFinalSmash && (GameController.stageData.getPlayer(_loc3_).SpecialType == 4 || GameController.stageData.getPlayer(_loc3_).SpecialType == 5))
            {
               _loc2_ = true;
            }
            _loc3_++;
         }
         _loc3_ = 1;
         while(_loc3_ <= Main.MAXPLAYERS)
         {
            _loc6_ = GameController.stageData.getPlayer(_loc3_) == null?null:this.getHealthBox(GameController.stageData.getPlayer(_loc3_).ID);
            if(_loc6_ != null)
            {
               _loc7_ = false;
               _loc4_ = 1;
               while(_loc4_ <= Main.MAXPLAYERS && !_loc7_)
               {
                  if(GameController.stageData.getPlayer(_loc4_) != null && !GameController.stageData.getPlayer(_loc4_).Dead && !GameController.stageData.getPlayer(_loc4_).StandBy && GameController.stageData.getPlayer(_loc4_).HasHitBox && GameController.stageData.getPlayer(_loc4_).HitBox && GameController.stageData.getPlayer(_loc4_).HitBox.hitTestObject(_loc6_))
                  {
                     _loc7_ = true;
                  }
                  _loc4_++;
               }
               if(_loc1_)
               {
                  _loc8_ = _loc1_.Grid;
                  _loc4_ = 0;
                  while(_loc4_ < _loc8_.length)
                  {
                     _loc5_ = 0;
                     while(_loc5_ < _loc8_[_loc4_].length)
                     {
                        if(_loc8_[_loc4_][_loc5_] && InteractiveSprite(_loc8_[_loc4_][_loc5_]).MC.hitTestObject(_loc6_))
                        {
                           _loc7_ = true;
                        }
                        _loc5_++;
                     }
                     _loc4_++;
                  }
               }
               if((_loc2_ || _loc7_) && _loc6_.alpha > 0.4)
               {
                  _loc6_.alpha = _loc6_.alpha - 0.05;
               }
               else if(!_loc7_ && !_loc2_ && _loc6_.alpha < 1)
               {
                  _loc6_.alpha = _loc6_.alpha + 0.05;
               }
            }
            _loc3_++;
         }
      }
   }
}
