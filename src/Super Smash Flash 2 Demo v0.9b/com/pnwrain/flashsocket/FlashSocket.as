package com.pnwrain.flashsocket
{
   import com.jimisaacs.data.URL;
   import com.pnwrain.flashsocket.events.FlashSocketEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.system.Security;
   import flash.utils.Timer;
   import socket.io.parser.Decoder;
   import socket.io.parser.Encoder;
   import socket.io.parser.Parser;
   
   public class FlashSocket implements IWebSocketWrapper, IWebSocketLogger, IEventDispatcher
   {
      
      private static var id:int = 0;
       
      
      protected var debug:Boolean = false;
      
      protected var callerUrl:String;
      
      protected var socketURL:String;
      
      protected var webSocket:WebSocket;
      
      public var sessionID:String;
      
      protected var connectionClosingTimeout:int;
      
      protected var protocols:Array;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var domain:String;
      
      private var protocol:String;
      
      private var proxyHost:String;
      
      private var proxyPort:int;
      
      private var headers:String;
      
      private var timer:Timer;
      
      private var channel:String = "";
      
      private var ackRegexp:RegExp;
      
      private var ackId:int = 0;
      
      private var acks:Object;
      
      private var _queryUrlSuffix:String;
      
      private var heartBeatInterval:int;
      
      private var _receiveBuffer:Array;
      
      private var _keepaliveTimer:Timer;
      
      private var _pongTimer:Timer;
      
      private var heartBeatTimeout:int;
      
      public var connected:Boolean;
      
      public var connecting:Boolean;
      
      protected var frame:String = "~m~";
      
      public function FlashSocket(param1:String, param2:String = null, param3:String = null, param4:int = 0, param5:String = null)
      {
         this._eventDispatcher = new EventDispatcher();
         this.ackRegexp = /(\d+)\+(.*)/;
         this.acks = {};
         this._receiveBuffer = [];
         super();
         var _loc6_:String = "http";
         var _loc7_:String = "ws";
         this._queryUrlSuffix = param1.split("?")[1] != undefined?"?" + param1.split("?")[1]:"";
         var _loc8_:URL = new URL(param1);
         if(_loc8_.protocol == "https")
         {
            _loc6_ = "https";
            _loc7_ = "wss";
         }
         param2 = _loc6_;
         param1 = _loc8_.host;
         this.socketURL = _loc7_ + "://" + param1 + "/socket.io/?EIO=2&transport=websocket";
         this.callerUrl = _loc6_ + "://" + param1;
         this.domain = param1;
         this.protocol = param2;
         this.proxyHost = param3;
         this.proxyPort = param4;
         this.headers = param5;
         this.channel = _loc8_.pathname || "/";
         if(this.channel && this.channel.length > 0 && this.channel.indexOf("/") != 0)
         {
            this.channel = "/" + this.channel;
         }
         var _loc9_:URLRequest = new URLRequest();
         _loc9_.url = this.getConnectionUrl(_loc6_,param1);
         _loc9_.method = URLRequestMethod.GET;
         var _loc10_:URLLoader = new URLLoader(_loc9_);
         _loc10_.addEventListener(Event.COMPLETE,this.onDiscover);
         _loc10_.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.onDiscoverError);
         _loc10_.addEventListener(IOErrorEvent.IO_ERROR,this.onDiscoverError);
      }
      
      protected function getConnectionUrl(param1:String, param2:String) : String
      {
         var _loc3_:String = param1 + "://" + param2 + "/socket.io/?EIO=2&time=" + new Date().getTime() + this._queryUrlSuffix.split("?").join("&");
         _loc3_ = _loc3_ + "&transport=polling";
         return _loc3_;
      }
      
      protected function onDiscover(param1:Event) : void
      {
         var _loc2_:String = param1.target.data;
         _loc2_ = _loc2_.substr(_loc2_.indexOf("{"));
         var _loc3_:Object = JSON.decode(_loc2_);
         this.sessionID = _loc3_.sid;
         this.heartBeatTimeout = _loc3_.pingTimeout;
         this.heartBeatInterval = _loc3_.pingInterval;
         this.protocols = _loc3_.upgrades;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < this.protocols.length)
         {
            if(this.protocols[_loc5_] == "flashsocket")
            {
               _loc4_ = true;
               break;
            }
            _loc5_++;
         }
         this.socketURL = this.socketURL + this._queryUrlSuffix.split("?").join("&");
         var _loc6_:int = this.socketURL.lastIndexOf("/");
         this.socketURL = this.socketURL.slice(0,_loc6_) + this.socketURL.slice(_loc6_) + "&sid=" + this.sessionID;
         this.onHandshake(param1);
      }
      
      protected function onHandshake(param1:Event = null) : void
      {
         this.loadDefaultPolicyFile(this.socketURL);
         this.webSocket = new WebSocket(FlashSocket.id++,this.socketURL,[this.protocol],this.getOrigin(),this.proxyHost,this.proxyPort,"",this.headers,this);
         this.webSocket.addEventListener(WebSocketEvent.MESSAGE,this.onMessage);
         this.webSocket.addEventListener(WebSocketEvent.CLOSE,this.onClose);
         this.webSocket.addEventListener(WebSocketEvent.OPEN,this.onOpen);
         this.webSocket.addEventListener(Event.CLOSE,this.onClose);
         this.webSocket.addEventListener(Event.CONNECT,this.onConnect);
         this.webSocket.addEventListener(IOErrorEvent.IO_ERROR,this.onIoError);
         this.webSocket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
      }
      
      protected function onDiscoverError(param1:Event) : void
      {
         var _loc2_:FlashSocketEvent = null;
         if(param1 is HTTPStatusEvent)
         {
            if((param1 as HTTPStatusEvent).status != 200)
            {
               _loc2_ = new FlashSocketEvent(FlashSocketEvent.CONNECT_ERROR);
               this.dispatchEvent(_loc2_);
            }
         }
      }
      
      protected function onHandshakeError(param1:Event) : void
      {
         var _loc2_:FlashSocketEvent = null;
         if(param1 is HTTPStatusEvent)
         {
            if((param1 as HTTPStatusEvent).status != 200)
            {
               _loc2_ = new FlashSocketEvent(FlashSocketEvent.CONNECT_ERROR);
               this.dispatchEvent(_loc2_);
            }
         }
      }
      
      protected function onClose(param1:Event) : void
      {
         var _loc2_:FlashSocketEvent = new FlashSocketEvent(FlashSocketEvent.CLOSE);
         this.dispatchEvent(_loc2_);
      }
      
      protected function onConnect(param1:Event) : void
      {
         var _loc2_:FlashSocketEvent = new FlashSocketEvent(FlashSocketEvent.CONNECT);
         this.dispatchEvent(_loc2_);
      }
      
      protected function onIoError(param1:Event) : void
      {
         var _loc2_:FlashSocketEvent = new FlashSocketEvent(FlashSocketEvent.IO_ERROR);
         this.dispatchEvent(_loc2_);
      }
      
      protected function onSecurityError(param1:Event) : void
      {
         var _loc2_:FlashSocketEvent = new FlashSocketEvent(FlashSocketEvent.SECURITY_ERROR);
         this.dispatchEvent(_loc2_);
      }
      
      protected function loadDefaultPolicyFile(param1:String) : void
      {
         var _loc2_:URL = new URL(param1);
         var _loc3_:String = "xmlsocket://" + _loc2_.hostname + ":843";
         Security.loadPolicyFile(_loc3_);
      }
      
      public function getOrigin() : String
      {
         var _loc1_:URL = new URL(this.callerUrl);
         return _loc1_.protocol + "://" + _loc1_.host.toLowerCase();
      }
      
      public function getCallerHost() : String
      {
         return null;
      }
      
      public function log(param1:String) : void
      {
         if(this.debug)
         {
            trace("webSocketLog: " + param1);
         }
      }
      
      public function error(param1:String) : void
      {
         trace("webSocketError: " + param1);
      }
      
      public function fatal(param1:String) : void
      {
         trace("webSocketError: " + param1);
      }
      
      protected function onOpen(param1:WebSocketEvent) : void
      {
         this.webSocket.send("2probe");
      }
      
      protected function onMessage(param1:WebSocketEvent) : void
      {
         var _loc2_:String = decodeURIComponent(param1.message);
         if(_loc2_)
         {
            this._onMessage(_loc2_);
         }
      }
      
      protected function onData(param1:WebSocketEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:FlashSocketEvent = null;
         var _loc2_:Object = param1.message;
         if(_loc2_.type == "message")
         {
            _loc3_ = decodeURIComponent(_loc2_.data);
            if(_loc3_)
            {
               this._onMessage(_loc3_);
            }
         }
         else if(_loc2_.type != "open")
         {
            if(_loc2_.type == "close")
            {
               _loc4_ = new FlashSocketEvent(FlashSocketEvent.CLOSE);
               this.dispatchEvent(_loc4_);
            }
            else
            {
               this.log("We got a data message that is not \'message\': " + _loc2_.type);
            }
         }
      }
      
      private function _onMessage(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:FlashSocketEvent = null;
         var _loc5_:Function = null;
         if(param1 == "3")
         {
            this._pongTimer.stop();
            return;
         }
         if(param1 == "3probe")
         {
            this.webSocket.send("5");
            return;
         }
         if(param1.charAt(0) == "4")
         {
            _loc3_ = new Decoder().decode(param1);
            switch(_loc3_.type)
            {
               case Parser.CONNECT:
                  if(_loc3_.nsp == this.channel)
                  {
                     this._onConnect(_loc3_);
                  }
                  else
                  {
                     try
                     {
                        this.webSocket.send(new Encoder().encodeAsString({
                           "type":0,
                           "nsp":this.channel
                        }));
                     }
                     catch(err:Error)
                     {
                     }
                  }
                  break;
               case Parser.EVENT:
                  _loc2_ = _loc3_.data || [];
                  if(null != _loc3_.id)
                  {
                     this.log("attaching ack callback to event");
                     if(this.acks.hasOwnProperty(_loc3_.id))
                     {
                        _loc2_.push(this.acks(_loc3_.id));
                     }
                  }
                  if(this.connected)
                  {
                     _loc4_ = new FlashSocketEvent(_loc2_.shift());
                     _loc4_.data = _loc2_;
                     this.dispatchEvent(_loc4_);
                  }
                  else
                  {
                     this._receiveBuffer.push(_loc2_);
                  }
                  break;
               case Parser.ACK:
                  _loc2_ = _loc3_.data || [];
                  if(this.acks.hasOwnProperty(_loc3_.id))
                  {
                     _loc5_ = this.acks[_loc3_.id] as Function;
                     if(_loc2_.length > _loc5_.length)
                     {
                        _loc5_.apply(null,_loc2_.slice(0,_loc5_.length));
                     }
                     else
                     {
                        _loc5_.apply(null,_loc2_);
                     }
                     delete this.acks[id];
                  }
                  break;
               case Parser.DISCONNECT:
                  this._onDisconnect();
                  break;
               case Parser.ERROR:
                  this.log("3: error" + JSON.encode(_loc3_.data));
            }
         }
      }
      
      public function send(param1:Object, param2:String = null, param3:Function = null) : void
      {
         var messageId:int = 0;
         var msg:Object = param1;
         var event:String = param2;
         var callback:Function = param3;
         if(msg as Array)
         {
            (msg as Array).unshift(event);
         }
         else
         {
            msg = [event,msg];
         }
         var packet:Object = {
            "type":Parser.EVENT,
            "data":msg,
            "nsp":this.channel
         };
         if(null != callback)
         {
            messageId = this.ackId;
            this.acks[this.ackId] = callback;
            this.ackId++;
            packet.id = messageId;
         }
         try
         {
            this.webSocket.send(new Encoder().encodeAsString(packet));
            return;
         }
         catch(err:Error)
         {
            fatal("Unable to send message: " + err.message);
            return;
         }
      }
      
      public function emit(param1:String, param2:Object, param3:Function = null) : void
      {
         this.send(param2,param1,param3);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._eventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._eventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._eventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._eventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._eventDispatcher.willTrigger(param1);
      }
      
      private function emitBuffered() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:FlashSocketEvent = null;
         _loc1_ = 0;
         while(_loc1_ < this._receiveBuffer.length)
         {
            _loc2_ = this._receiveBuffer[_loc1_] as Array;
            _loc3_ = new FlashSocketEvent(_loc2_.shift());
            _loc3_.data = _loc2_;
            this.dispatchEvent(_loc3_);
            _loc1_++;
         }
         this._receiveBuffer = [];
      }
      
      private function _onConnect(param1:Object) : void
      {
         this.emitBuffered();
         this.connected = true;
         this.connecting = false;
         this._keepaliveTimer = new Timer(this.heartBeatInterval);
         this._keepaliveTimer.addEventListener(TimerEvent.TIMER,this.keepaliveTimer_timer);
         this._keepaliveTimer.start();
         var _loc2_:FlashSocketEvent = new FlashSocketEvent(FlashSocketEvent.CONNECT);
         this.dispatchEvent(_loc2_);
      }
      
      private function keepaliveTimer_timer(param1:TimerEvent) : void
      {
         if(this._pongTimer && this._pongTimer.running)
         {
            return;
         }
         this._pongTimer = new Timer(this.heartBeatInterval,1);
         this._pongTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.pongTimer_timerComplete);
         this._pongTimer.start();
         this.webSocket.send("2");
      }
      
      private function pongTimer_timerComplete(param1:TimerEvent) : void
      {
         this.fatal("Server Timed Out!!");
         this.webSocket.close();
      }
      
      private function _onDisconnect() : void
      {
         this.connected = false;
         this.connecting = false;
         var _loc1_:FlashSocketEvent = new FlashSocketEvent(FlashSocketEvent.DISCONNECT);
         this.dispatchEvent(_loc1_);
      }
      
      public function get eventDispatcher() : IEventDispatcher
      {
         return this._eventDispatcher;
      }
      
      public function set eventDispatcher(param1:IEventDispatcher) : void
      {
         this._eventDispatcher = param1;
      }
      
      public function close() : void
      {
         if(this.webSocket && (this.connected || this.connecting))
         {
            this.webSocket.removeEventListener(WebSocketEvent.MESSAGE,this.onMessage);
            this.webSocket.removeEventListener(WebSocketEvent.CLOSE,this.onClose);
            this.webSocket.removeEventListener(WebSocketEvent.OPEN,this.onOpen);
            this.webSocket.removeEventListener(Event.CLOSE,this.onClose);
            this.webSocket.removeEventListener(Event.CONNECT,this.onConnect);
            this.webSocket.removeEventListener(IOErrorEvent.IO_ERROR,this.onIoError);
            this.webSocket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            if(this._keepaliveTimer)
            {
               this._keepaliveTimer.removeEventListener(TimerEvent.TIMER,this.keepaliveTimer_timer);
            }
            if(this._pongTimer)
            {
               this._pongTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.pongTimer_timerComplete);
            }
            this.webSocket.close();
         }
      }
   }
}
