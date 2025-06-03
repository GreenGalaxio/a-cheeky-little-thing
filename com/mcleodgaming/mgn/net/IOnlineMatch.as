package com.mcleodgaming.mgn.net
{
   public interface IOnlineMatch
   {
       
      
      function get Username() : String;
      
      function get RoomList() : Array;
      
      function get ControlBits() : Vector.<Vector.<int>>;
      
      function get Connected() : Boolean;
      
      function get Active() : Boolean;
      
      function set Active(param1:Boolean) : void;
      
      function get NumPlayers() : int;
      
      function get MasterFrame() : int;
      
      function set MasterFrame(param1:int) : void;
      
      function get PlayerID() : int;
      
      function get RoomLocked() : Boolean;
      
      function get IsHost() : Boolean;
      
      function get P2PMode() : Boolean;
      
      function set P2PMode(param1:Boolean) : void;
      
      function resetMasterFrame() : void;
      
      function connect(param1:String, param2:String, param3:String) : void;
      
      function disconnect() : void;
      
      function broadcast(param1:Object) : void;
      
      function sendMatchReadySignal(param1:Object) : void;
      
      function sendMatchEndSignal() : void;
      
      function sendMatchFinishedSignal(param1:Object) : void;
      
      function sendMatchSettings(param1:Object) : void;
      
      function createRoom(param1:String, param2:String, param3:Object) : void;
      
      function joinRoom(param1:String, param2:String) : void;
      
      function createJoinRoom(param1:String, param2:String, param3:Object) : void;
      
      function lockRoom() : void;
      
      function unlockRoom() : void;
      
      function refreshRoomList(param1:Boolean = false) : void;
      
      function sendMyDataFrame(param1:int, param2:Object) : void;
      
      function resendRequest(param1:Object) : void;
      
      function checkResend() : void;
      
      function PERFORMALL() : void;
   }
}
