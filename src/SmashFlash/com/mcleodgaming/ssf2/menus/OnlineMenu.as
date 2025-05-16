package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.mgn.events.MGNEvent;
   import com.mcleodgaming.mgn.events.MGNEventManager;
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.Version;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.Game;
   import com.mcleodgaming.ssf2.controllers.ItemSettings;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.net.MultiplayerManager;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   import fl.controls.ComboBox;
   import fl.controls.DataGrid;
   import fl.controls.ScrollPolicy;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFieldType;
   
   public class OnlineMenu extends Menu
   {
       
      
      private var m_loginNode:MenuMapperNode;
      
      private var m_joinNode:MenuMapperNode;
      
      private var m_createNode:MenuMapperNode;
      
      private var m_battleTypeFilter:String;
      
      private var m_itemsFilter:String;
      
      private var m_hazardsFilter:String;
      
      private var m_friendsFilter:String;
      
      private var m_usernameFocus:Boolean;
      
      private var m_makeRoomFocus:Boolean;
      
      private var m_roomList:DataGrid;
      
      private var m_latencyDropDown:ComboBox;
      
      private var m_battleTypeDropdown:ComboBox;
      
      private var m_itemsDropdown:ComboBox;
      
      private var m_hazardsDropdown:ComboBox;
      
      private var m_friendsDropdown:ComboBox;
      
      public function OnlineMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_online");
         m_subMenu.onlinebg.visible = false;
         m_subMenu.online_makeroom.visible = false;
         m_subMenu.online_joinroom.visible = false;
         m_container.addChild(m_subMenu);
         this.initMenuMappings();
         this.m_battleTypeFilter = "n/a";
         this.m_itemsFilter = "n/a";
         this.m_hazardsFilter = "n/a";
         this.m_friendsFilter = "no";
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         this.m_roomList = m_subMenu.roomList;
         this.m_latencyDropDown = m_subMenu.online_makeroom.latencyDropdown;
         this.m_battleTypeDropdown = m_subMenu.online_filter.battleTypeDropdown;
         this.m_itemsDropdown = m_subMenu.online_filter.itemsDropdown;
         this.m_hazardsDropdown = m_subMenu.online_filter.hazardsDropdown;
         this.m_friendsDropdown = m_subMenu.online_filter.friendsDropdown;
         this.m_usernameFocus = false;
         this.m_makeRoomFocus = false;
         m_subMenu.username_txt.tabIndex = 1;
         m_subMenu.password_txt.tabIndex = 2;
         m_subMenu.username_txt.tabEnabled = true;
         m_subMenu.password_txt.tabEnabled = true;
         this.m_roomList.addColumn("Room");
         this.m_roomList.addColumn("Creator");
         this.m_roomList.addColumn("Password");
         this.m_roomList.addColumn("Locked");
         this.m_roomList.addColumn("Players");
         this.m_roomList.addColumn("Latency");
         this.m_roomList.getColumnAt(0).width = 150;
         this.m_roomList.getColumnAt(0).minWidth = 50;
         this.m_roomList.getColumnAt(1).minWidth = 50;
         this.m_roomList.getColumnAt(2).minWidth = 75;
         this.m_roomList.getColumnAt(3).minWidth = 50;
         this.m_roomList.getColumnAt(4).minWidth = 50;
         this.m_roomList.getColumnAt(5).minWidth = 75;
         this.m_latencyDropDown.addItem({
            "label":"Low",
            "value":"low"
         });
         this.m_latencyDropDown.addItem({
            "label":"High",
            "value":"high"
         });
         this.m_battleTypeDropdown.addItem({
            "label":"N/A",
            "value":"n/a"
         });
         this.m_battleTypeDropdown.addItem({
            "label":"Stock Only",
            "value":"stock"
         });
         this.m_battleTypeDropdown.addItem({
            "label":"Time Only",
            "value":"time"
         });
         this.m_battleTypeDropdown.addItem({
            "label":"Stock + Time",
            "value":"stocktime"
         });
         this.m_itemsDropdown.addItem({
            "label":"N/A",
            "value":"n/a"
         });
         this.m_itemsDropdown.addItem({
            "label":"On",
            "value":"on"
         });
         this.m_itemsDropdown.addItem({
            "label":"Off",
            "value":"off"
         });
         this.m_hazardsDropdown.addItem({
            "label":"N/A",
            "value":"n/a"
         });
         this.m_hazardsDropdown.addItem({
            "label":"On",
            "value":"on"
         });
         this.m_hazardsDropdown.addItem({
            "label":"Off",
            "value":"off"
         });
         this.m_friendsDropdown.addItem({
            "label":"No",
            "value":"no"
         });
         this.m_friendsDropdown.addItem({
            "label":"Yes",
            "value":"yes"
         });
         this.hideAllButtons();
      }
      
      override public function manageMenuMappings(param1:Event) : void
      {
         if(this.m_makeRoomFocus || this.m_usernameFocus)
         {
            return;
         }
         super.manageMenuMappings(param1);
      }
      
      override public function initMenuMappings() : void
      {
         super.initMenuMappings();
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
         m_subMenu.loginBG.register_btn.buttonMode = true;
         m_subMenu.loginBG.register_btn.useHandCursor = true;
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK_online);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_online);
         m_subMenu.online_makeroom.createRoom_txt.addEventListener(FocusEvent.FOCUS_IN,this.makeRoom_FOCUS);
         m_subMenu.username_txt.addEventListener(FocusEvent.FOCUS_IN,this.username_FOCUS);
         m_subMenu.online_makeroom.createRoom_txt.addEventListener(FocusEvent.FOCUS_OUT,this.makeRoom_FOCUS);
         m_subMenu.username_txt.addEventListener(FocusEvent.FOCUS_OUT,this.username_UNFOCUS);
         m_subMenu.login_btn.addEventListener(MouseEvent.MOUSE_OVER,this.login_MOUSE_OVER);
         m_subMenu.login_btn.addEventListener(MouseEvent.MOUSE_OUT,this.login_MOUSE_OUT);
         m_subMenu.login_btn.addEventListener(MouseEvent.CLICK,this.login_CLICK);
         m_subMenu.loginBG.register_btn.addEventListener(MouseEvent.CLICK,this.register_CLICK);
         m_subMenu.refresh_btn.addEventListener(MouseEvent.MOUSE_OVER,this.refresh_MOUSE_OVER);
         m_subMenu.refresh_btn.addEventListener(MouseEvent.MOUSE_OUT,this.refresh_MOUSE_OUT);
         m_subMenu.refresh_btn.addEventListener(MouseEvent.CLICK,this.refresh_CLICK);
         m_subMenu.join_btn.addEventListener(MouseEvent.MOUSE_OVER,this.join_MOUSE_OVER);
         m_subMenu.join_btn.addEventListener(MouseEvent.MOUSE_OUT,this.join_MOUSE_OUT);
         m_subMenu.join_btn.addEventListener(MouseEvent.CLICK,this.join_CLICK);
         m_subMenu.logout_btn.addEventListener(MouseEvent.MOUSE_OVER,this.logout_MOUSE_OVER);
         m_subMenu.logout_btn.addEventListener(MouseEvent.MOUSE_OUT,this.logout_MOUSE_OUT);
         m_subMenu.logout_btn.addEventListener(MouseEvent.CLICK,this.logout_CLICK);
         m_subMenu.filter_btn.addEventListener(MouseEvent.MOUSE_OVER,this.filter_MOUSE_OVER);
         m_subMenu.filter_btn.addEventListener(MouseEvent.MOUSE_OUT,this.filter_MOUSE_OUT);
         m_subMenu.filter_btn.addEventListener(MouseEvent.CLICK,this.filter_CLICK);
         m_subMenu.online_makeroom.createRoom_btn.addEventListener(MouseEvent.MOUSE_OVER,this.createRoom_MOUSE_OVER);
         m_subMenu.online_makeroom.createRoom_btn.addEventListener(MouseEvent.MOUSE_OUT,this.createRoom_MOUSE_OUT);
         m_subMenu.online_makeroom.createRoom_btn.addEventListener(MouseEvent.CLICK,this.createRoom_CLICK);
         m_subMenu.online_joinroom.joinRoom_btn.addEventListener(MouseEvent.MOUSE_OVER,this.joinRoomPassword_MOUSE_OVER);
         m_subMenu.online_joinroom.joinRoom_btn.addEventListener(MouseEvent.MOUSE_OUT,this.joinRoomPassword_MOUSE_OUT);
         m_subMenu.online_joinroom.joinRoom_btn.addEventListener(MouseEvent.CLICK,this.joinRoomPassword_CLICK);
         m_subMenu.online_filter.close_btn.addEventListener(MouseEvent.CLICK,this.filterClose_CLICK);
         m_subMenu.createRoom_btn.addEventListener(MouseEvent.MOUSE_OVER,this.createRoomPopup_MOUSE_OVER);
         m_subMenu.createRoom_btn.addEventListener(MouseEvent.MOUSE_OUT,this.createRoomPopup_MOUSE_OUT);
         m_subMenu.createRoom_btn.addEventListener(MouseEvent.CLICK,this.createRoomPopup_CLICK);
         m_subMenu.online_makeroom.close_btn.addEventListener(MouseEvent.CLICK,this.createRoomClose_CLICK);
         m_subMenu.online_joinroom.close_btn.addEventListener(MouseEvent.CLICK,this.joinRoomPasswordClose_CLICK);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.CONNECT,this.onConnect);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.DISCONNECT,this.onDisconnect);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.LOGIN,this.onLogin);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.ROOM_CREATED,this.onCreateRoom);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.ROOM_JOINED,this.onJoinRoom);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.ERROR_LOGIN,this.onLoginError);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.ERROR_CREATE_ROOM,this.onCreateRoomError);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.ERROR_JOIN_ROOM,this.onJoinRoomError);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.ERROR_CONNECT,this.onConnectError);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.ERROR_OFFLINE,this.onConnectError);
         MGNEventManager.dispatcher.addEventListener(MGNEvent.ROOM_LIST,this.refreshRoomList);
         if(MultiplayerManager.Connected)
         {
            this.showRoomList();
         }
         else
         {
            this.showLoginButtons();
         }
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK_online);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.ROLL_OVER,this.back_ROLL_OVER_online);
         m_subMenu.online_makeroom.createRoom_txt.removeEventListener(FocusEvent.FOCUS_IN,this.makeRoom_FOCUS);
         m_subMenu.username_txt.removeEventListener(FocusEvent.FOCUS_IN,this.username_FOCUS);
         m_subMenu.online_makeroom.createRoom_txt.removeEventListener(FocusEvent.FOCUS_OUT,this.makeRoom_FOCUS);
         m_subMenu.username_txt.removeEventListener(FocusEvent.FOCUS_OUT,this.username_UNFOCUS);
         m_subMenu.login_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.login_MOUSE_OVER);
         m_subMenu.login_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.login_MOUSE_OUT);
         m_subMenu.login_btn.removeEventListener(MouseEvent.CLICK,this.login_CLICK);
         m_subMenu.loginBG.register_btn.removeEventListener(MouseEvent.CLICK,this.register_CLICK);
         m_subMenu.refresh_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.refresh_MOUSE_OVER);
         m_subMenu.refresh_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.refresh_MOUSE_OUT);
         m_subMenu.refresh_btn.removeEventListener(MouseEvent.CLICK,this.refresh_CLICK);
         m_subMenu.join_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.join_MOUSE_OVER);
         m_subMenu.join_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.join_MOUSE_OUT);
         m_subMenu.join_btn.removeEventListener(MouseEvent.CLICK,this.join_CLICK);
         m_subMenu.logout_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.logout_MOUSE_OVER);
         m_subMenu.logout_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.logout_MOUSE_OUT);
         m_subMenu.logout_btn.removeEventListener(MouseEvent.CLICK,this.logout_CLICK);
         m_subMenu.filter_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.filter_MOUSE_OVER);
         m_subMenu.filter_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.filter_MOUSE_OUT);
         m_subMenu.filter_btn.removeEventListener(MouseEvent.CLICK,this.filter_CLICK);
         m_subMenu.online_makeroom.createRoom_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.createRoom_MOUSE_OVER);
         m_subMenu.online_makeroom.createRoom_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.createRoom_MOUSE_OUT);
         m_subMenu.online_makeroom.createRoom_btn.removeEventListener(MouseEvent.CLICK,this.createRoom_CLICK);
         m_subMenu.online_joinroom.joinRoom_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.joinRoomPassword_MOUSE_OVER);
         m_subMenu.online_joinroom.joinRoom_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.joinRoomPassword_MOUSE_OUT);
         m_subMenu.online_joinroom.joinRoom_btn.removeEventListener(MouseEvent.CLICK,this.joinRoomPassword_CLICK);
         m_subMenu.online_filter.close_btn.removeEventListener(MouseEvent.CLICK,this.filterClose_CLICK);
         m_subMenu.createRoom_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.createRoomPopup_MOUSE_OVER);
         m_subMenu.createRoom_btn.removeEventListener(MouseEvent.MOUSE_OUT,this.createRoomPopup_MOUSE_OUT);
         m_subMenu.createRoom_btn.removeEventListener(MouseEvent.CLICK,this.createRoomPopup_CLICK);
         m_subMenu.online_makeroom.close_btn.removeEventListener(MouseEvent.CLICK,this.createRoomClose_CLICK);
         m_subMenu.online_joinroom.close_btn.removeEventListener(MouseEvent.CLICK,this.joinRoomPasswordClose_CLICK);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.CONNECT,this.onConnect);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.DISCONNECT,this.onDisconnect);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.LOGIN,this.onLogin);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ROOM_CREATED,this.onCreateRoom);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ROOM_JOINED,this.onJoinRoom);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_LOGIN,this.onLoginError);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_CREATE_ROOM,this.onCreateRoomError);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_JOIN_ROOM,this.onJoinRoomError);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_CONNECT,this.onConnectError);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ERROR_OFFLINE,this.onConnectError);
         MGNEventManager.dispatcher.removeEventListener(MGNEvent.ROOM_LIST,this.refreshRoomList);
         m_subMenu.username_txt.text = "";
         m_subMenu.password_txt.text = "";
      }
      
      private function hideAllButtons() : void
      {
         m_subMenu.onlinebg.visible = false;
         m_subMenu.online_makeroom.visible = false;
         m_subMenu.online_joinroom.visible = false;
         m_subMenu.online_filter.visible = false;
         m_subMenu.username_txt.visible = false;
         m_subMenu.password_txt.visible = false;
         m_subMenu.loginBG.visible = false;
         m_subMenu.login_btn.visible = false;
         m_subMenu.roomListBG.visible = false;
         m_subMenu.roomList.visible = false;
         m_subMenu.createRoom_btn.visible = false;
         m_subMenu.join_btn.visible = false;
         m_subMenu.refresh_btn.visible = false;
         m_subMenu.filter_btn.visible = false;
         m_subMenu.logout_btn.visible = false;
      }
      
      private function showLoginButtons() : void
      {
         this.hideAllButtons();
         Utils.setBrightness(m_subMenu.loginBG,0);
         m_subMenu.username_txt.type = TextFieldType.INPUT;
         m_subMenu.password_txt.type = TextFieldType.INPUT;
         m_subMenu.loginBG.visible = true;
         m_subMenu.login_btn.visible = true;
         m_subMenu.username_txt.visible = true;
         m_subMenu.password_txt.visible = true;
         if(SaveData.RememberMe)
         {
            m_subMenu.username_txt.text = SaveData.RememberMe;
            m_subMenu.loginBG.rememberMe.selected = true;
         }
         else
         {
            m_subMenu.loginBG.rememberMe.selected = false;
         }
      }
      
      private function showRoomList() : void
      {
         this.hideAllButtons();
         m_subMenu.roomListBG.visible = true;
         m_subMenu.roomList.visible = true;
         m_subMenu.createRoom_btn.visible = true;
         m_subMenu.join_btn.visible = true;
         m_subMenu.refresh_btn.visible = true;
         m_subMenu.filter_btn.visible = true;
         m_subMenu.logout_btn.visible = true;
      }
      
      private function makeRoom_FOCUS(param1:FocusEvent) : void
      {
         this.m_makeRoomFocus = true;
      }
      
      private function makeRoom_UNFOCUS(param1:FocusEvent) : void
      {
         this.m_makeRoomFocus = false;
      }
      
      private function username_FOCUS(param1:FocusEvent) : void
      {
         this.m_usernameFocus = true;
      }
      
      private function username_UNFOCUS(param1:FocusEvent) : void
      {
         this.m_usernameFocus = false;
      }
      
      private function login_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Click to log on.";
      }
      
      private function login_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function register_CLICK(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var url:String = "http://mgn.mcleodgaming.com/account/register";
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
      
      private function login_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_selectstage");
         m_subMenu.desc_txt.text = "";
         if(!MultiplayerManager.Connected)
         {
            m_subMenu.login_btn.visible = false;
            m_subMenu.username_txt.type = TextFieldType.DYNAMIC;
            m_subMenu.password_txt.type = TextFieldType.DYNAMIC;
            Utils.setBrightness(m_subMenu.loginBG,-50);
            MultiplayerManager.connect(m_subMenu.username_txt.text,m_subMenu.password_txt.text,Version.getVersion());
            m_subMenu.password_txt.text = "";
            if(m_subMenu.loginBG.rememberMe.selected)
            {
               SaveData.RememberMe = m_subMenu.username_txt.text;
               SaveData.saveGame();
            }
            else
            {
               SaveData.RememberMe = null;
               SaveData.saveGame();
            }
         }
      }
      
      private function refresh_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Refresh list of rooms.";
      }
      
      private function refresh_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function refresh_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_selectstage");
         if(MultiplayerManager.Connected)
         {
            MultiplayerManager.refreshRoomList(this.m_friendsFilter === "yes");
         }
      }
      
      private function refreshRoomList(param1:MGNEvent) : void
      {
         this.populateRoomList(param1.data.rooms);
      }
      
      private function onLogin(param1:MGNEvent) : void
      {
         MultiplayerManager.refreshRoomList(this.m_friendsFilter === "yes");
         this.showRoomList();
         Main.tracker.trackPageview("SSF2 Online Mode v" + Version.getVersion());
      }
      
      private function onLoginError(param1:MGNEvent) : void
      {
         this.showLoginButtons();
      }
      
      private function onConnect(param1:MGNEvent) : void
      {
         trace("Connection complete (inside online menu)");
      }
      
      private function onConnectError(param1:MGNEvent) : void
      {
         trace("Some error has occured while connecting (inside online menu)");
         this.showLoginButtons();
      }
      
      private function onDisconnect(param1:MGNEvent) : void
      {
         this.showLoginButtons();
      }
      
      private function onCreateRoom(param1:MGNEvent) : void
      {
         MenuController.pleaseWaitMenu.removeSelf();
         removeSelf();
         m_container.visible = true;
         MenuController.onlineCharacterMenu.reset();
         MenuController.showOnlineCharacterMenu();
      }
      
      private function onCreateRoomError(param1:MGNEvent) : void
      {
         MenuController.pleaseWaitMenu.removeSelf();
         m_container.visible = true;
      }
      
      private function onJoinRoom(param1:MGNEvent) : void
      {
         removeSelf();
         m_container.visible = true;
         MenuController.pleaseWaitMenu.removeSelf();
         MenuController.onlineCharacterMenu.reset();
         MenuController.showOnlineCharacterMenu();
         this.m_roomList.removeAll();
      }
      
      private function onJoinRoomError(param1:MGNEvent) : void
      {
         MenuController.pleaseWaitMenu.removeSelf();
         m_container.visible = true;
      }
      
      private function populateRoomList(param1:Array) : void
      {
         var i:* = undefined;
         var roomData:Object = null;
         var rooms:Array = param1;
         if(this.m_roomList != null)
         {
            this.m_roomList.removeAll();
            this.m_roomList.horizontalScrollPolicy = ScrollPolicy.OFF;
            this.m_roomList.verticalScrollPolicy = ScrollPolicy.ON;
            for(i in rooms)
            {
               roomData = null;
               try
               {
                  roomData = JSON.decode(rooms[i].room_data);
                  roomData.parsedMatchSettings = JSON.decode(roomData.matchSettings);
               }
               catch(e:*)
               {
                  roomData = {"version":null};
               }
               if(roomData.version === Version.getVersion())
               {
                  if(this.m_battleTypeFilter === "stock" && roomData.parsedMatchSettings.levelData.usingTime || this.m_battleTypeFilter === "time" && roomData.parsedMatchSettings.levelData.usingLives || this.m_battleTypeFilter === "stocktime" && (!roomData.parsedMatchSettings.levelData.usingTime || !roomData.parsedMatchSettings.levelData.usingLives))
                  {
                     continue;
                  }
                  if(this.m_hazardsFilter === "on" && !roomData.parsedMatchSettings.levelData.hazards || this.m_hazardsFilter === "off" && roomData.parsedMatchSettings.levelData.hazards)
                  {
                     continue;
                  }
                  if(this.m_itemsFilter === "on" && !(roomData.parsedMatchSettings.items.frequency !== ItemSettings.FREQUENCY_OFF && this.activeItemCount(roomData.parsedMatchSettings.items.items) > 0) || this.m_itemsFilter === "off" && (roomData.parsedMatchSettings.items.frequency !== ItemSettings.FREQUENCY_OFF && this.activeItemCount(roomData.parsedMatchSettings.items.items) > 0))
                  {
                     continue;
                  }
                  this.m_roomList.addItem({
                     "Room":rooms[i].room_name,
                     "Creator":rooms[i].creator,
                     "Password":(rooms[i].hasPassword == 1?"Y":"N"),
                     "Locked":(rooms[i].room_locked == 1?"Y":"N"),
                     "Players":rooms[i].room_total + "/" + rooms[i].room_max,
                     "room_key":rooms[i].room_key,
                     "room_name":rooms[i].room_name,
                     "Latency":(roomData.p2p === true?"Low":"High")
                  });
               }
               roomData = null;
            }
         }
      }
      
      private function activeItemCount(param1:Object) : int
      {
         var _loc3_:* = undefined;
         var _loc2_:int = 0;
         for(_loc3_ in param1)
         {
            if(param1[_loc3_] === true)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      private function logout_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Sign out of your account.";
      }
      
      private function logout_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function logout_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_back");
         MultiplayerManager.disconnect();
         this.showLoginButtons();
      }
      
      private function filter_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Narrow down your search for a room.";
      }
      
      private function filter_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function filter_CLICK(param1:MouseEvent) : void
      {
         this.setSelectedItem(this.m_battleTypeDropdown,this.m_battleTypeFilter);
         this.setSelectedItem(this.m_itemsDropdown,this.m_itemsFilter);
         this.setSelectedItem(this.m_hazardsDropdown,this.m_hazardsFilter);
         this.setSelectedItem(this.m_friendsDropdown,this.m_friendsFilter);
         this.setSelectedItem(this.m_battleTypeDropdown,this.m_battleTypeFilter);
         m_subMenu.onlinebg.visible = true;
         m_subMenu.online_filter.visible = true;
         SoundQueue.instance.playSoundEffect("menu_selectstage");
      }
      
      private function setSelectedItem(param1:ComboBox, param2:*) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1.getItemAt(_loc3_).value === param2)
            {
               param1.selectedIndex = _loc3_;
               return;
            }
            _loc3_++;
         }
      }
      
      private function filterClose_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_back");
         m_subMenu.onlinebg.visible = false;
         m_subMenu.online_filter.visible = false;
         this.m_battleTypeFilter = this.m_battleTypeDropdown.selectedItem.value;
         this.m_itemsFilter = this.m_itemsDropdown.selectedItem.value;
         this.m_hazardsFilter = this.m_hazardsDropdown.selectedItem.value;
         this.m_friendsFilter = this.m_friendsDropdown.selectedItem.value;
         MultiplayerManager.refreshRoomList(this.m_friendsFilter === "yes");
      }
      
      private function join_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Click to join match.";
      }
      
      private function join_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function join_CLICK(param1:MouseEvent) : void
      {
         if(this.m_roomList.length > 0 && this.m_roomList.selectedItem && MultiplayerManager.Connected)
         {
            if(this.m_roomList.selectedItem.Password === "Y")
            {
               m_subMenu.onlinebg.visible = true;
               m_subMenu.online_joinroom.visible = true;
            }
            else
            {
               this.joinRoom();
            }
         }
      }
      
      private function joinRoomPassword_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "";
      }
      
      private function joinRoomPassword_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function joinRoomPassword_CLICK(param1:MouseEvent) : void
      {
         if(this.m_roomList.length > 0 && this.m_roomList.selectedItem && MultiplayerManager.Connected)
         {
            this.joinRoom();
         }
      }
      
      private function joinRoomPasswordClose_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_back");
         m_subMenu.onlinebg.visible = false;
         m_subMenu.online_joinroom.visible = false;
      }
      
      private function joinRoom() : void
      {
         m_subMenu.onlinebg.visible = false;
         m_subMenu.online_makeroom.visible = false;
         m_subMenu.online_joinroom.visible = false;
         m_container.visible = false;
         SoundQueue.instance.playSoundEffect("menu_selectstage");
         m_subMenu.desc_txt.text = "";
         MultiplayerManager.joinRoom(this.m_roomList.selectedItem.room_key,m_subMenu.online_joinroom.roomPass_txt.text);
         m_subMenu.online_joinroom.roomPass_txt.text = "";
         MenuController.showPleaseWaitMenu();
      }
      
      private function createRoom_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function createRoom_MOUSE_OUT(param1:MouseEvent) : void
      {
      }
      
      private function createRoom_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:Game = null;
         if(m_subMenu.online_makeroom.createRoom_txt.text != "")
         {
            MultiplayerManager.P2PMode = this.m_latencyDropDown.selectedItem && this.m_latencyDropDown.selectedItem.value === "high"?Boolean(false):Boolean(true);
            m_subMenu.onlinebg.visible = false;
            m_subMenu.online_makeroom.visible = false;
            m_container.visible = false;
            SoundQueue.instance.playSoundEffect("menu_selectstage");
            _loc2_ = new Game();
            _loc2_.loadSavedVSOptions();
            MultiplayerManager.createRoom(m_subMenu.online_makeroom.createRoom_txt.text,m_subMenu.online_makeroom.roomPass_txt.text,{
               "version":Version.getVersion(),
               "p2p":MultiplayerManager.P2PMode,
               "matchSettings":JSON.encode(_loc2_.MatchSettings)
            });
            m_subMenu.online_makeroom.roomPass_txt.text = "";
            _loc2_ = null;
            MenuController.showPleaseWaitMenu();
         }
      }
      
      private function createRoomPopup_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.desc_txt.text = "Click to create a new room.";
      }
      
      private function createRoomPopup_MOUSE_OUT(param1:MouseEvent) : void
      {
         m_subMenu.desc_txt.text = "";
      }
      
      private function createRoomPopup_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_selectstage");
         m_subMenu.onlinebg.visible = true;
         m_subMenu.online_makeroom.visible = true;
      }
      
      private function createRoomClose_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_back");
         m_subMenu.onlinebg.visible = false;
         m_subMenu.online_makeroom.visible = false;
      }
      
      private function back_CLICK_online(param1:MouseEvent) : void
      {
         MultiplayerManager.disconnect();
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_back");
         m_subMenu.desc_txt.text = "";
         MenuController.showMainMenu();
      }
      
      private function back_ROLL_OVER_online(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function home_CLICK(param1:MouseEvent) : void
      {
         MultiplayerManager.disconnect();
         SoundQueue.instance.playSoundEffect("menu_back");
         SoundQueue.instance.stopMusic();
         removeSelf();
         MenuController.showTitleMenu();
      }
   }
}
