package com.mcleodgaming.mgn.net
{
    import com.pnwrain.flashsocket.FlashSocket;
    import __AS3__.vec.Vector;
    import flash.net.NetConnection;
    import flash.net.NetGroup;
    import flash.net.GroupSpecifier;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.mcleodgaming.mgn.events.MGNEventManager;
    import com.mcleodgaming.mgn.events.MGNEvent;
    import com.pnwrain.flashsocket.events.FlashSocketEvent;
    import flash.events.NetStatusEvent;
    import __AS3__.vec.*;
    import flash.net.*;

    public class MGN_Socket implements IOnlineMatch 
    {

        public static var FORCE_SERVERCLIENT:Boolean = false;
        public static var FORCE_P2P:Boolean = false;
        public static const MODE_CLIENT_JOINED:int = 0;
        public static const MODE_DATAFRAME_RECEIVED:int = 1;
        public static const MODE_RESEND_DATAFRAME:int = 2;
        public static const MODE_ACK_REQUEST:int = 3;
        public static const MODE_ACK_RESPONSE:int = 4;
        public static const MODE_CLIENT_JOINED_RESPONSE:int = 5;
        public static const MODE_MATCH_END:int = 6;

        protected const RTMFP_SERVER:String = "rtmfp://s1.mgn.mcleodgaming.com:1935/";
        protected const RTMFP_DEVKEY:String = "games/ssf2";
        protected const LOBBY_SERVER:String = "http://mgn.mcleodgaming.com:1341/";

        protected var RESEND_TIME:int = 90;
        protected var P2P_MODE:Boolean;
        protected var LOCAL_MODE:Boolean;
        protected var m_lobbySocket:FlashSocket;
        protected var m_lobbySocketID:String;
        protected var m_gameSocket:FlashSocket;
        protected var m_gameSocketID:String;
        protected var m_gameSocketUrl:String;
        protected var m_maxPlayers:int;
        protected var m_userName:String;
        protected var m_version:String;
        protected var m_playerID:int;
        protected var m_numPlayers:int;
        protected var m_connected:Boolean;
        protected var m_active:Boolean;
        protected var m_isHost:Boolean;
        protected var m_resendTimer:int;
        protected var m_matchStarted:Boolean;
        private var m_password:String;
        protected var m_roomList:Array;
        protected var m_currentRoom:String;
        protected var m_currentRoomName:String;
        protected var m_currentRoomKey:String;
        protected var m_roomData:Object;
        protected var m_roomLocked:Boolean;
        protected var m_gameSettingsObj:Object;
        protected var m_playerData:Array;
        protected var m_playerSyncStream:PlayerDataSyncStream;
        protected var m_controlBits:Vector.<Vector.<int>>;
        protected var m_masterFrame:int;
        protected var m_clientIDs:Array;
        protected var m_netConnection:NetConnection;
        protected var m_netGroup:NetGroup;
        protected var m_groupSpec:GroupSpecifier;
        protected var m_netGroupConnected:Boolean;
        protected var m_netGroupTimer:Timer;
        protected var m_pingTimer:Timer;
        protected var m_timeoutTimer:Timer;
        protected var m_gameSocketTimeout:Timer;

        public function MGN_Socket(maxPlayers:int)
        {
            super();
            this.m_maxPlayers = maxPlayers;
            this.init();
            this.m_netGroupTimer = new Timer(10000, 1);
            this.m_netGroupTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.checkNetGroup);
            this.m_pingTimer = new Timer((30 * 1000));
            this.m_pingTimer.addEventListener(TimerEvent.TIMER, this.ping);
            this.m_timeoutTimer = new Timer((30 * 1000), 1);
            this.m_gameSocketTimeout = new Timer((10 * 1000), 1);
            this.m_timeoutTimer.addEventListener(TimerEvent.TIMER_COMPLETE, function (_arg_1:TimerEvent):void
            {
                MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.NOTIFY, {"message":"Connection timeout."}));
                disconnect();
            });
            this.m_gameSocketTimeout.addEventListener(TimerEvent.TIMER_COMPLETE, function (_arg_1:TimerEvent):void
            {
                disconnectGameServer();
                m_gameSocketTimeout.stop();
            });
        }

        public function get Username():String
        {
            return (this.m_userName);
        }

        public function get RoomList():Array
        {
            return (this.m_roomList);
        }

        public function get ControlBits():Vector.<Vector.<int>>
        {
            return (this.m_controlBits);
        }

        public function get Connected():Boolean
        {
            return ((this.m_lobbySocket) && (this.m_lobbySocket.connected));
        }

        public function get Active():Boolean
        {
            return (this.m_active);
        }

        public function set Active(_arg_1:Boolean):void
        {
            this.m_active = _arg_1;
        }

        public function get NumPlayers():int
        {
            return (this.m_numPlayers);
        }

        public function get MasterFrame():int
        {
            return (this.m_masterFrame);
        }

        public function set MasterFrame(_arg_1:int):void
        {
            this.m_masterFrame = _arg_1;
        }

        public function get P2PMode():Boolean
        {
            return (this.P2P_MODE);
        }

        public function set P2PMode(_arg_1:Boolean):void
        {
            this.P2P_MODE = _arg_1;
        }

        public function get PlayerID():int
        {
            return (this.m_playerID);
        }

        public function get RoomLocked():Boolean
        {
            return (this.m_roomLocked);
        }

        public function get IsHost():Boolean
        {
            return (this.m_isHost);
        }

        protected function init():void
        {
            this.m_userName = "";
            this.m_playerID = 0;
            this.m_masterFrame = 1;
            this.m_roomData = null;
            this.m_playerData = null;
            this.m_roomList = new Array();
            this.m_connected = false;
            this.m_numPlayers = 0;
            this.m_active = false;
            this.m_isHost = true;
            this.m_resendTimer = this.RESEND_TIME;
            this.m_matchStarted = false;
            this.m_controlBits = new Vector.<Vector.<int>>();
            var _local_1:int;
            while (_local_1 < this.m_maxPlayers)
            {
                this.m_controlBits.push(new Vector.<int>());
                _local_1++;
            };
            this.m_lobbySocket = null;
            this.m_gameSocket = null;
            this.m_gameSocketID = null;
            this.m_gameSocketUrl = null;
            this.m_currentRoomKey = null;
            this.m_currentRoom = "";
            this.m_currentRoomName = "";
            this.m_roomLocked = false;
            this.m_gameSettingsObj = null;
            this.m_lobbySocketID = null;
            this.m_netGroupConnected = false;
            this.m_clientIDs = new Array();
            this.m_playerSyncStream = new PlayerDataSyncStream();
        }

        private function checkP2P():void
        {
            var _local_1:*;
            if (((!(MGN_Socket.FORCE_SERVERCLIENT)) && (!(MGN_Socket.FORCE_P2P))))
            {
                this.P2P_MODE = this.m_netGroupConnected;
                for (_local_1 in this.m_clientIDs)
                {
                    if ((!(this.m_clientIDs[_local_1].p2p_ack)))
                    {
                        this.P2P_MODE = false;
                    };
                };
            };
        }

        public function resetMasterFrame():void
        {
            this.m_masterFrame = 1;
            this.m_playerSyncStream.init(this.m_numPlayers);
            this.m_controlBits = new Vector.<Vector.<int>>();
            var _local_1:int;
            while (_local_1 < this.m_maxPlayers)
            {
                this.m_controlBits.push(new Vector.<int>());
                _local_1++;
            };
        }

        public function connect(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            if ((!(this.m_lobbySocket)))
            {
                this.m_userName = _arg_1;
                this.m_password = _arg_2;
                this.m_version = _arg_3;
                this.m_lobbySocket = new FlashSocket(this.LOBBY_SERVER);
                this.m_lobbySocket.addEventListener(FlashSocketEvent.CONNECT, this.handleLobbyConnect);
                this.m_lobbySocket.addEventListener(FlashSocketEvent.DISCONNECT, this.handleLobbyDisconnect);
                this.m_lobbySocket.addEventListener(FlashSocketEvent.MESSAGE, this.onLobbySocketMessage);
                this.m_lobbySocket.addEventListener(FlashSocketEvent.CONNECT_ERROR, this.handleLobbyConnectError);
                this.m_lobbySocket.addEventListener(FlashSocketEvent.IO_ERROR, this.handleLobbyConnectError);
                this.m_lobbySocket.addEventListener(FlashSocketEvent.SECURITY_ERROR, this.handleLobbyConnectError);
                this.m_pingTimer.start();
                this.m_timeoutTimer.start();
            };
        }

        private function connectGameServer(_arg_1:String):void
        {
            if (this.m_gameSocket)
            {
                this.m_gameSocket.removeEventListener(FlashSocketEvent.CONNECT, this.handleGameConnect);
                this.m_gameSocket.removeEventListener(FlashSocketEvent.DISCONNECT, this.handleGameDisconnect);
                this.m_gameSocket.removeEventListener(FlashSocketEvent.MESSAGE, this.onLobbySocketMessage);
                this.m_gameSocket.removeEventListener(FlashSocketEvent.CONNECT_ERROR, this.handleGameConnectError);
                this.m_gameSocket.removeEventListener(FlashSocketEvent.IO_ERROR, this.handleGameConnectError);
                this.m_gameSocket.removeEventListener(FlashSocketEvent.SECURITY_ERROR, this.handleGameConnectError);
                this.m_gameSocket.close();
                this.m_gameSocket = null;
            };
            this.m_gameSocket = new FlashSocket(_arg_1);
            this.m_gameSocket.addEventListener(FlashSocketEvent.CONNECT, this.handleGameConnect);
            this.m_gameSocket.addEventListener(FlashSocketEvent.DISCONNECT, this.handleGameDisconnect);
            this.m_gameSocket.addEventListener(FlashSocketEvent.MESSAGE, this.onLobbySocketMessage);
            this.m_gameSocket.addEventListener(FlashSocketEvent.CONNECT_ERROR, this.handleGameConnectError);
            this.m_gameSocket.addEventListener(FlashSocketEvent.IO_ERROR, this.handleGameConnectError);
            this.m_gameSocket.addEventListener(FlashSocketEvent.SECURITY_ERROR, this.handleGameConnectError);
            this.m_gameSocketTimeout.start();
        }

        public function disconnect():void
        {
            this.m_timeoutTimer.stop();
            this.m_pingTimer.stop();
            this.m_netGroupTimer.stop();
            this.disconnectGameServer();
            this.disconnectRTMFPServer();
            if (this.m_lobbySocket)
            {
                if (this.m_lobbySocket.connected)
                {
                    this.m_lobbySocket.close();
                };
                this.m_lobbySocket.removeEventListener(FlashSocketEvent.CONNECT, this.handleLobbyConnect);
                this.m_lobbySocket.removeEventListener(FlashSocketEvent.DISCONNECT, this.handleLobbyDisconnect);
                this.m_lobbySocket.removeEventListener(FlashSocketEvent.MESSAGE, this.onLobbySocketMessage);
                this.m_lobbySocket.removeEventListener(FlashSocketEvent.IO_ERROR, this.handleLobbyConnectError);
                this.m_lobbySocket.removeEventListener(FlashSocketEvent.SECURITY_ERROR, this.handleLobbyConnectError);
            };
            this.m_lobbySocket = null;
            this.init();
            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.DISCONNECT, {}));
            trace("Disconnected from lobby server. (Purposefully)");
        }

        private function disconnectGameServer():void
        {
            if (this.m_gameSocket)
            {
                if (this.m_gameSocket.connected)
                {
                    this.m_gameSocket.close();
                };
                this.m_gameSocket.removeEventListener(FlashSocketEvent.CONNECT, this.handleGameConnect);
                this.m_gameSocket.removeEventListener(FlashSocketEvent.DISCONNECT, this.handleGameDisconnect);
                this.m_gameSocket.removeEventListener(FlashSocketEvent.MESSAGE, this.onLobbySocketMessage);
                this.m_gameSocket.removeEventListener(FlashSocketEvent.IO_ERROR, this.handleGameConnectError);
                this.m_gameSocket.removeEventListener(FlashSocketEvent.SECURITY_ERROR, this.handleGameConnectError);
            };
            this.m_gameSocket = null;
            trace("Disconnected from game server. (Purposefully)");
        }

        private function disconnectRTMFPServer():void
        {
            if (this.m_netGroup)
            {
                this.m_netGroup.close();
            };
            if (this.m_netConnection)
            {
                this.m_netConnection.close();
            };
            this.m_netGroup = null;
            this.m_netConnection = null;
            trace("Disconnected from RTMFP server. (Purposefully)");
        }

        private function handleLobbyConnect(_arg_1:FlashSocketEvent):void
        {
            this.m_pingTimer.start();
            this.m_lobbySocket.send({
                "type":"login",
                "username":this.m_userName,
                "password":this.m_password,
                "version":this.m_version
            }, "message", null);
        }

        private function handleLobbyConnectError(_arg_1:FlashSocketEvent):void
        {
            this.m_timeoutTimer.stop();
            trace("Got error ", _arg_1);
            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.NOTIFY, {"message":"Could not connect to server."}));
            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ERROR_CONNECT, {}));
            this.disconnect();
        }

        private function handleLobbyDisconnect(_arg_1:FlashSocketEvent=null):void
        {
            this.m_timeoutTimer.stop();
            this.m_pingTimer.stop();
            trace("Disconnected from lobby server. (Lost Connection)");
            this.disconnect();
        }

        private function handleGameConnect(_arg_1:FlashSocketEvent):void
        {
            this.m_gameSocket.send({
                "type":"validateRoom",
                "room_key":this.m_currentRoom,
                "room_code":this.m_currentRoomKey
            }, "message", null);
        }

        private function handleGameConnectError(_arg_1:FlashSocketEvent):void
        {
            trace("Got error ", _arg_1);
            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ERROR_CONNECT_GAME, {"message":"Problem connecting to game server."}));
        }

        private function handleGameDisconnect(_arg_1:FlashSocketEvent=null):void
        {
            trace("Disconnected from game server. (Lost Connection)");
            this.disconnect();
        }

        private function onLobbySocketMessage(_arg_1:FlashSocketEvent):void
        {
            var _local_2:int;
            var _local_3:Object = _arg_1.data[0];
            if (_local_3.message)
            {
                MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.NOTIFY, {"message":_local_3.message}));
            };
            if (_local_3.type !== "broadcast")
            {
                trace(("Received message: " + _local_3.type));
            };
            if (_local_3.type == "connectSuccess")
            {
                MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.CONNECT, {}));
            }
            else
            {
                if (_local_3.type == "loginSuccess")
                {
                    this.m_timeoutTimer.stop();
                    this.m_userName = _local_3.username;
                    this.m_password = null;
                    this.m_netConnection = new NetConnection();
                    this.m_netConnection.addEventListener(NetStatusEvent.NET_STATUS, this.netStatus);
                    this.m_netConnection.connect(((this.LOCAL_MODE) ? "rtmfp:" : (this.RTMFP_SERVER + this.RTMFP_DEVKEY)));
                    MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.LOGIN, {}));
                }
                else
                {
                    if (_local_3.type == "listRoomsSuccess")
                    {
                        this.getRoomList(_local_3.rooms);
                    }
                    else
                    {
                        if (_local_3.type == "getRoomUsersSuccess")
                        {
                            trace("Got room user list");
                        }
                        else
                        {
                            if (_local_3.type == "joinRoomSuccess")
                            {
                                this.m_isHost = false;
                                this.handleJoin(_local_3);
                                MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ROOM_JOINED, {}));
                            }
                            else
                            {
                                if (_local_3.type == "createRoomSuccess")
                                {
                                    this.m_isHost = true;
                                    this.handleJoin(_local_3);
                                    MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ROOM_CREATED, {}));
                                }
                                else
                                {
                                    if (_local_3.type == "startMatch")
                                    {
                                        this.m_gameSettingsObj = _local_3;
                                        this.m_currentRoomKey = this.m_gameSettingsObj.code;
                                        this.m_gameSocketUrl = this.m_gameSettingsObj.url;
                                        this.initMatch(_local_3);
                                    }
                                    else
                                    {
                                        if (_local_3.type == "setRoomDataSuccess")
                                        {
                                            trace("Succesfully set room data");
                                            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ROOM_DATA, {}));
                                        }
                                        else
                                        {
                                            if (_local_3.type == "lockRoomSuccess")
                                            {
                                                this.m_roomLocked = true;
                                                MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.LOCK_ROOM, {}));
                                            }
                                            else
                                            {
                                                if (_local_3.type == "unlockRoomSuccess")
                                                {
                                                    this.m_roomLocked = false;
                                                    MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.UNLOCK_ROOM, {}));
                                                }
                                                else
                                                {
                                                    if (((_local_3.type == "broadcast") || (_local_3.type == "directMessage")))
                                                    {
                                                        switch (_local_3.data.type)
                                                        {
                                                            case "neighborLeave":
                                                                this.participantDisconnected(_local_3.data.id);
                                                                break;
                                                            case "broadcast":
                                                                this.receiveMessage(_local_3.data);
                                                                break;
                                                            case "directMessage":
                                                                this.receiveMessage(_local_3.data);
                                                                break;
                                                        };
                                                    }
                                                    else
                                                    {
                                                        if (_local_3.type == "validateRoomSuccess")
                                                        {
                                                            this.m_gameSocketID = _local_3.sid;
                                                            this.m_matchStarted = true;
                                                            this.m_gameSocketTimeout.stop();
                                                            trace("Room validated successfully, we can start match communication.");
                                                            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.MATCH_START, {
                                                                "room_data":this.m_roomData,
                                                                "player_data":this.m_playerData
                                                            }));
                                                        }
                                                        else
                                                        {
                                                            if (_local_3.type == "finishMatch")
                                                            {
                                                                trace("Received match finish signal");
                                                                MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.MATCH_FINISHED, {}));
                                                                this.m_matchStarted = false;
                                                                this.disconnectGameServer();
                                                            }
                                                            else
                                                            {
                                                                if (_local_3.type != "pingSuccess")
                                                                {
                                                                    if (_local_3.type == "connectError")
                                                                    {
                                                                        trace("Error, problem logging in");
                                                                        MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.NOTIFY, {"message":"Could not communicate with server."}));
                                                                        MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ERROR_OFFLINE, {}));
                                                                        this.disconnect();
                                                                    }
                                                                    else
                                                                    {
                                                                        if (_local_3.type == "loginError")
                                                                        {
                                                                            trace("Error, problem logging in");
                                                                            this.m_timeoutTimer.stop();
                                                                            this.disconnect();
                                                                            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ERROR_LOGIN, {}));
                                                                        }
                                                                        else
                                                                        {
                                                                            if (_local_3.type == "listRoomsError")
                                                                            {
                                                                                trace("Error, could not retrieve rooms list");
                                                                            }
                                                                            else
                                                                            {
                                                                                if (_local_3.type == "getRoomUsersError")
                                                                                {
                                                                                    trace("Error, could not retrieve room user list");
                                                                                }
                                                                                else
                                                                                {
                                                                                    if (_local_3.type == "joinRoomError")
                                                                                    {
                                                                                        trace("Error, there was a problem trying to join the room.");
                                                                                        MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ERROR_CREATE_ROOM, {}));
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        if (_local_3.type == "createRoomError")
                                                                                        {
                                                                                            trace("Error, there was a problem trying to create a room.");
                                                                                            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ERROR_JOIN_ROOM, {}));
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            if (_local_3.type == "lockRoomError")
                                                                                            {
                                                                                                trace("Error, there was a problem trying to lock the room.");
                                                                                                MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ERROR_LOCK_ROOM, {}));
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                if (_local_3.type == "unlockRoomError")
                                                                                                {
                                                                                                    trace("Error, there was a problem trying to unlock the room.");
                                                                                                    MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ERROR_UNLOCK_ROOM, {}));
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    if (_local_3.type == "setReadyError")
                                                                                                    {
                                                                                                        trace("Error, there was a problem trying to set ready status on the room.");
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        if (_local_3.type == "setRoomDataError")
                                                                                                        {
                                                                                                            trace("Error, there was a problem trying to update the room data.");
                                                                                                            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ERROR_ROOM_DATA, {}));
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            if (_local_3.type == "validateRoomError")
                                                                                                            {
                                                                                                                trace("Error, there was a problem validating the room data.");
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                                if (_local_3.type == "startMatchError")
                                                                                                                {
                                                                                                                    trace("Error, there was a problem starting the match");
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                    if (_local_3.type == "finishMatchError")
                                                                                                                    {
                                                                                                                        trace("Error, there was a problem ending the match");
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                        if (_local_3.type == "pingError")
                                                                                                                        {
                                                                                                                            this.disconnect();
                                                                                                                        };
                                                                                                                    };
                                                                                                                };
                                                                                                            };
                                                                                                        };
                                                                                                    };
                                                                                                };
                                                                                            };
                                                                                        };
                                                                                    };
                                                                                };
                                                                            };
                                                                        };
                                                                    };
                                                                };
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function sendMatchReadySignal(_arg_1:Object):void
        {
            this.m_lobbySocket.send({
                "type":"setReady",
                "player_data":{
                    "data":_arg_1,
                    "p2p":this.P2P_MODE
                }
            }, "message", null);
        }

        public function sendMatchFinishedSignal(_arg_1:Object):void
        {
            this.m_lobbySocket.send({
                "type":"setFinish",
                "player_data":{
                    "data":_arg_1,
                    "p2p":this.P2P_MODE
                }
            }, "message", null);
        }

        public function sendMatchEndSignal():void
        {
            this.broadcast({
                "type":"broadcast",
                "mode":MODE_MATCH_END,
                "sender":this.m_lobbySocketID,
                "playerID":this.m_playerID
            });
        }

        public function sendMatchSettings(_arg_1:Object):void
        {
            this.m_lobbySocket.send({
                "type":"setRoomData",
                "room_data":_arg_1
            }, "message", null);
        }

        public function createRoom(_arg_1:String, _arg_2:String, _arg_3:Object):void
        {
            this.createJoinRoom(_arg_1, _arg_2, _arg_3);
        }

        public function joinRoom(_arg_1:String, _arg_2:String):void
        {
            if (((this.m_lobbySocket) && (this.m_lobbySocket.connected)))
            {
                this.m_lobbySocket.send({
                    "type":"joinRoom",
                    "room_key":_arg_1,
                    "room_password":_arg_2
                }, "message", null);
            };
        }

        public function createJoinRoom(_arg_1:String, _arg_2:String, _arg_3:Object):void
        {
            if (((this.m_lobbySocket) && (this.m_lobbySocket.connected)))
            {
                this.m_lobbySocket.send({
                    "type":"createRoom",
                    "room_name":_arg_1,
                    "room_password":_arg_2,
                    "room_data":_arg_3
                }, "message", null);
            };
        }

        public function refreshRoomList(_arg_1:Boolean=false):void
        {
            if (this.m_lobbySocket.connected)
            {
                this.m_lobbySocket.send({
                    "type":"listRooms",
                    "friendsOnly":_arg_1
                }, "message", null);
            };
        }

        private function getRoomList(_arg_1:Array):void
        {
            this.m_roomList.splice(0, this.m_roomList.length);
            trace((("Found: " + _arg_1.length) + " other rooms"));
            var _local_2:int;
            while (_local_2 < _arg_1.length)
            {
                this.m_roomList.push(_arg_1[_local_2]);
                _local_2++;
            };
            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.ROOM_LIST, {
                "rooms":this.m_roomList,
                "message":"Room listing refresh complete."
            }));
        }

        public function lockRoom():void
        {
            this.m_lobbySocket.send({"type":"lockRoom"}, "message", null);
        }

        public function unlockRoom():void
        {
            this.m_lobbySocket.send({"type":"unlockRoom"}, "message", null);
        }

        public function sendMyDataFrame(_arg_1:int, _arg_2:Object):void
        {
            var _local_3:Object;
            var _local_4:Vector.<DataFrameGroup>;
            var _local_5:int;
            var _local_6:DataFrameGroup;
            if (this.m_active)
            {
                _local_3 = new Object();
                _local_3.playerID = this.m_playerID;
                _local_3.mode = MODE_DATAFRAME_RECEIVED;
                _local_3.dataList = [];
                _local_3.type = "broadcast";
                this.m_playerSyncStream.updateDataFrame(_arg_1, (this.m_playerID - 1), _arg_2);
                _local_4 = this.m_playerSyncStream.getSurroundingDataFrames(3, 4);
                _local_5 = 0;
                while (_local_5 < _local_4.length)
                {
                    _local_6 = _local_4[_local_5];
                    if (_local_6.getDataFrameFor((this.m_playerID - 1)).isReady())
                    {
                        _local_3.dataList.push({
                            "masterFrame":_local_6.Frame,
                            "data":_local_6.getDataFrameFor((this.m_playerID - 1)).getData()
                        });
                    }
                    else
                    {
                        break;
                    };
                    _local_5++;
                };
                this.updateControls();
                this.broadcast(_local_3);
            };
        }

        public function checkResend():void
        {
            this.m_resendTimer--;
            if (this.m_resendTimer < 0)
            {
                this.tryToRetrieve((this.m_playerSyncStream.Pointer + 1));
                this.m_resendTimer = this.RESEND_TIME;
            };
        }

        private function tryToRetrieve(_arg_1:int):void
        {
            var _local_3:int;
            var _local_2:DataFrameGroup = this.m_playerSyncStream.getDataFrameGroup(_arg_1);
            if (((_local_2) && (!(_local_2.Complete))))
            {
                trace((("Too long of a delay, attempting to retrieve frame " + _arg_1) + " data from another player."));
                _local_3 = 0;
                while (_local_3 < _local_2.Size)
                {
                    if (((!((_local_3 + 1) == this.m_playerID)) && (!(_local_2.getDataFrameFor(_local_3).isReady()))))
                    {
                        this.resendRequest({
                            "frame":_arg_1,
                            "playerID":(_local_3 + 1)
                        });
                    };
                    _local_3++;
                };
            };
        }

        public function resendRequest(_arg_1:Object):void
        {
            var _local_2:Object = new Object();
            _local_2.playerID = _arg_1.playerID;
            _local_2.mode = MODE_RESEND_DATAFRAME;
            _local_2.masterFrame = _arg_1.frame;
            _local_2.type = "broadcast";
            this.broadcast(_local_2);
        }

        public function broadcast(_arg_1:Object):void
        {
            if (((this.P2P_MODE) && (this.m_netGroup)))
            {
                this.m_netGroup.sendToAllNeighbors(_arg_1);
            }
            else
            {
                if ((((!(this.P2P_MODE)) && (this.m_gameSocket)) && (this.m_gameSocket.connected)))
                {
                    this.m_gameSocket.send({
                        "type":"broadcast",
                        "data":_arg_1
                    }, "message", null);
                };
            };
        }

        private function handleJoin(_arg_1:Object):void
        {
            if (this.m_lobbySocket.connected)
            {
                this.m_playerID = (_arg_1.player_index + 1);
                this.m_lobbySocketID = _arg_1.sid;
                this.m_currentRoom = _arg_1.room_key;
                this.m_currentRoomName = _arg_1.room_name;
                this.m_numPlayers = 1;
                trace(((("Sucessfully joined room: " + _arg_1.room_name) + " w/ player index ") + _arg_1.player_index));
                this.setupGroup();
            };
        }

        private function receiveControls(_arg_1:Object):void
        {
            var _local_2:int;
            while (_local_2 < this.m_numPlayers)
            {
                this.m_controlBits[_local_2].push(_arg_1[("player" + (_local_2 + 1))].controls);
                _local_2++;
            };
        }

        private function setupGroup():void
        {
            var _local_1:GroupSpecifier;
            var _local_2:Object;
            if (this.m_lobbySocket.connected)
            {
                _local_1 = new GroupSpecifier(this.m_currentRoom);
                _local_1.serverChannelEnabled = true;
                _local_1.routingEnabled = true;
                _local_1.ipMulticastMemberUpdatesEnabled = true;
                _local_1.postingEnabled = true;
                this.m_groupSpec = _local_1;
                if (this.LOCAL_MODE)
                {
                    this.m_groupSpec.addIPMulticastAddress("225.225.0.1:30303");
                };
                if (((this.m_netConnection) && (this.m_netConnection.connected)))
                {
                    this.m_netGroup = new NetGroup(this.m_netConnection, this.m_groupSpec.groupspecWithAuthorizations());
                    this.m_netGroup.addEventListener(NetStatusEvent.NET_STATUS, this.netStatus);
                    this.m_netGroupTimer.start();
                };
                this.m_connected = true;
                _local_2 = new Object();
                _local_2.mode = MODE_CLIENT_JOINED;
                _local_2.user = this.m_userName;
                _local_2.sender = this.m_lobbySocketID;
                _local_2.playerID = this.m_playerID;
                _local_2.type = "broadcast";
                this.m_lobbySocket.send({
                    "type":"broadcast",
                    "data":_local_2
                }, "message", null);
            };
        }

        private function checkNetGroup(_arg_1:TimerEvent):void
        {
            if ((!(this.m_netGroupConnected)))
            {
                if (this.m_netGroup)
                {
                    this.m_netGroup.removeEventListener(NetStatusEvent.NET_STATUS, this.netStatus);
                    this.m_netGroup.close();
                };
                trace("P2P connection failed, will fallback to sockets");
            }
            else
            {
                trace("P2P NetGroup connection verified");
            };
        }

        private function ping(_arg_1:TimerEvent):void
        {
            this.m_lobbySocket.send({"type":"ping"}, "message", null);
        }

        private function receiveMessage(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_4:Object;
            var _local_5:DataFrame;
            var _local_3:Object = _arg_1;
            if (_local_3.mode == MODE_CLIENT_JOINED)
            {
                this.m_numPlayers++;
                this.resetMasterFrame();
                MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.PLAYER_JOINED, {"user":_local_3.user}));
                this.m_clientIDs[_local_3.sender] = new Object();
                this.m_clientIDs[_local_3.sender].sender = _local_3.sender;
                this.m_clientIDs[_local_3.sender].user = _local_3.user;
                _local_4 = new Object();
                _local_4.mode = MODE_CLIENT_JOINED_RESPONSE;
                _local_4.user = this.m_userName;
                _local_4.sender = this.m_lobbySocketID;
                _local_4.playerID = this.m_playerID;
                _local_4.type = "directMessage";
                this.m_lobbySocket.send({
                    "type":"directMessage",
                    "target":_local_3.sender,
                    "data":_local_4
                }, "message", null);
            }
            else
            {
                if (_local_3.mode == MODE_CLIENT_JOINED_RESPONSE)
                {
                    this.m_numPlayers++;
                    this.resetMasterFrame();
                    MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.PLAYER_JOINED, {"user":_local_3.user}));
                    this.m_clientIDs[_local_3.sender] = new Object();
                    this.m_clientIDs[_local_3.sender].sender = _local_3.sender;
                    this.m_clientIDs[_local_3.sender].user = _local_3.user;
                }
                else
                {
                    if (((_local_3.mode == MODE_DATAFRAME_RECEIVED) && (!(_local_3.playerID == this.m_playerID))))
                    {
                        _local_2 = 0;
                        while (_local_2 < _local_3.dataList.length)
                        {
                            this.m_playerSyncStream.updateDataFrame(_local_3.dataList[_local_2].masterFrame, (_local_3.playerID - 1), _local_3.dataList[_local_2].data);
                            _local_2++;
                        };
                        this.updateControls();
                        this.m_resendTimer = this.RESEND_TIME;
                    }
                    else
                    {
                        if (_local_3.mode == MODE_RESEND_DATAFRAME)
                        {
                            trace(("Recieved resend request for player " + _local_3.playerID));
                            _local_5 = this.m_playerSyncStream.getDataFrameGroup(_local_3.masterFrame).getDataFrameFor((_local_3.playerID - 1));
                            if (_local_5.isReady())
                            {
                                this.broadcast({
                                    "type":"broadcast",
                                    "mode":MODE_DATAFRAME_RECEIVED,
                                    "sender":this.m_lobbySocketID,
                                    "playerID":_local_3.playerID,
                                    "dataList":[{
                                        "masterFrame":_local_3.masterFrame,
                                        "data":_local_5.getData()
                                    }]
                                });
                                trace("Sent a manually requested data packet back to player.");
                            };
                        }
                        else
                        {
                            if (_local_3.mode != MODE_ACK_REQUEST)
                            {
                                if (_local_3.mode != MODE_ACK_RESPONSE)
                                {
                                    if (_local_3.mode == MODE_MATCH_END)
                                    {
                                        MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.MATCH_END, {}));
                                    };
                                };
                            };
                        };
                    };
                };
            };
            MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.DATA, _local_3));
        }

        private function participantDisconnected(_arg_1:String):void
        {
            var _local_2:*;
            this.m_numPlayers--;
            for (_local_2 in this.m_clientIDs)
            {
                if (((!(this.m_clientIDs[_local_2] == null)) && (this.m_clientIDs[_local_2].sender == _arg_1)))
                {
                    MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.PLAYER_LEFT, {"user":this.m_clientIDs[_local_2].user}));
                    break;
                };
            };
        }

        private function netStatus(_arg_1:NetStatusEvent):void
        {
            var _local_2:Object;
            var _local_3:int;
            switch (_arg_1.info.code)
            {
                case "NetConnection.Connect.Success":
                    MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.NOTIFY, {"message":"Sucessfully connected to RTMFP Server.."}));
                    return;
                case "NetConnection.Connect.Failed":
                    MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.NOTIFY, {"message":"Warning, could not connect to RTMFP server. Gameplay may be slower than usual."}));
                    return;
                case "NetGroup.Connect.Success":
                    this.m_netGroupTimer.stop();
                    this.m_netGroupConnected = true;
                    MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.NOTIFY, {"message":"Sucessfully connected to RTMFP Group."}));
                    return;
                case "NetConnection.Connect.Failed":
                    MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.NOTIFY, {"message":"Error, could not connect to RTMFP Group. Gameplay may be slower than usual."}));
                    return;
                case "NetGroup.Posting.Notify":
                    trace("Posting Message received.");
                    return;
                case "NetGroup.Neighbor.Connect":
                    return;
                case "NetGroup.Neighbor.Disconnect":
                    return;
                case "NetGroup.Replication.Fetch.SendNotify":
                    return;
                case "NetGroup.Replication.Fetch.Failed":
                    trace(("FAIL ____ index: " + _arg_1.info.index));
                    return;
                case "NetGroup.Replication.Fetch.Result":
                    return;
                case "NetGroup.Replication.Request":
                    return;
                case "NetGroup.SendTo.Notify":
                    this.receiveMessage(_arg_1.info.message);
                    return;
            };
        }

        private function updateControls():void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:int;
            var _local_1:Vector.<DataFrameGroup> = this.m_playerSyncStream.getFilledDataFrameGroups();
            if (_local_1.length > 0)
            {
                _local_2 = 0;
                while (_local_2 < _local_1.length)
                {
                    _local_3 = new Object();
                    _local_4 = 0;
                    while (_local_4 < _local_1[_local_2].Size)
                    {
                        _local_5 = _local_1[_local_2].getDataFrameFor(_local_4).getData();
                        _local_6 = (_local_4 + 1);
                        _local_3[("player" + _local_6)] = new Object();
                        _local_3[("player" + _local_6)].playerID = _local_6;
                        _local_3[("player" + _local_6)].controls = _local_5.controls;
                        _local_4++;
                    };
                    this.receiveControls(_local_3);
                    _local_2++;
                };
            };
        }

        private function initMatch(_arg_1:Object):void
        {
            if (this.m_matchStarted)
            {
                return;
            };
            this.m_roomData = _arg_1.room_data;
            this.m_playerData = _arg_1.player_data;
            if ((!(this.m_isHost)))
            {
                this.P2P_MODE = (((!(this.m_playerData[0].p2p)) || (this.m_playerData[0].p2p === "false")) ? false : true);
            };
            if (this.P2P_MODE)
            {
                this.m_matchStarted = true;
                MGNEventManager.dispatcher.dispatchEvent(new MGNEvent(MGNEvent.MATCH_START, {
                    "room_data":this.m_roomData,
                    "player_data":this.m_playerData
                }));
            }
            else
            {
                if ((!(this.m_gameSocket)))
                {
                    this.connectGameServer(this.m_gameSocketUrl);
                };
            };
        }

        public function PERFORMALL():void
        {
            if (this.m_active)
            {
                this.checkResend();
            };
        }


    }
}//package com.mcleodgaming.mgn.net