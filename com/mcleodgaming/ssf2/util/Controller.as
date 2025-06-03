package com.mcleodgaming.ssf2.util
{
   import com.mcleodgaming.ssf2.Main;
   import flash.display.MovieClip;
   
   public class Controller
   {
      
      public static const MAX_INPUTS:int = 21;
      
      public static var ControlsMap:Array = function():Array
      {
         var _loc1_:* = new Array();
         var _loc2_:* = 0;
         var _loc3_:* = 1;
         while(_loc2_ < MAX_INPUTS)
         {
            _loc1_.push(_loc3_);
            _loc2_++;
            _loc3_ = _loc3_ * 2;
         }
         return _loc1_;
      }();
       
      
      private var ROOT:MovieClip;
      
      public var _UP:int;
      
      public var _DOWN:int;
      
      public var _LEFT:int;
      
      public var _RIGHT:int;
      
      public var _JUMP:int;
      
      public var _BUTTON1:int;
      
      public var _BUTTON2:int;
      
      public var _GRAB:int;
      
      public var _START:int;
      
      public var _TAUNT:int;
      
      public var _SHIELD:int;
      
      public var _SHIELD2:int;
      
      public var _JUMP2:int;
      
      public var _C_UP:int;
      
      public var _C_DOWN:int;
      
      public var _C_LEFT:int;
      
      public var _C_RIGHT:int;
      
      public var _DASH:int;
      
      public var _TAP_JUMP:int;
      
      public var _AUTO_DASH:int;
      
      public var _DT_DASH:int;
      
      public var WII:Boolean;
      
      private var m_controlsObject:Object;
      
      private var ID:int;
      
      private var m_controlBitsQueue:Vector.<int>;
      
      private var m_objQueue:Vector.<Object>;
      
      public function Controller(param1:int, param2:Object)
      {
         var _loc3_:String = null;
         super();
         this.ROOT = Main.Root;
         this.ID = param1;
         this.setControls(param2);
         this.WII = SaveData.WiiMode;
         this.m_controlsObject = new Object();
         this.m_controlsObject["UP"] = false;
         this.m_controlsObject["DOWN"] = false;
         this.m_controlsObject["LEFT"] = false;
         this.m_controlsObject["RIGHT"] = false;
         this.m_controlsObject["JUMP"] = false;
         this.m_controlsObject["BUTTON1"] = false;
         this.m_controlsObject["BUTTON2"] = false;
         this.m_controlsObject["GRAB"] = false;
         this.m_controlsObject["START"] = false;
         this.m_controlsObject["TAUNT"] = false;
         this.m_controlsObject["SHIELD"] = false;
         this.m_controlsObject["JUMP2"] = false;
         this.m_controlsObject["C_UP"] = false;
         this.m_controlsObject["C_DOWN"] = false;
         this.m_controlsObject["C_LEFT"] = false;
         this.m_controlsObject["C_RIGHT"] = false;
         this.m_controlsObject["DASH"] = false;
         this.m_controlsObject["TAP_JUMP"] = false;
         this.m_controlsObject["AUTO_DASH"] = false;
         this.m_controlsObject["DT_DASH"] = false;
         this.m_controlsObject["SHIELD2"] = false;
         this.m_controlBitsQueue = new Vector.<int>();
         this.m_objQueue = new Vector.<Object>();
      }
      
      public static function convertBitsToControlsObject(param1:int) : Object
      {
         var _loc2_:Object = new Object();
         _loc2_["TAP_JUMP"] = (param1 & Controller.ControlsMap[0]) > 0?true:false;
         _loc2_["SHIELD"] = (param1 & Controller.ControlsMap[1]) > 0?true:false;
         _loc2_["TAUNT"] = (param1 & Controller.ControlsMap[2]) > 0?true:false;
         _loc2_["START"] = (param1 & Controller.ControlsMap[3]) > 0?true:false;
         _loc2_["GRAB"] = (param1 & Controller.ControlsMap[4]) > 0?true:false;
         _loc2_["BUTTON2"] = (param1 & Controller.ControlsMap[5]) > 0?true:false;
         _loc2_["BUTTON1"] = (param1 & Controller.ControlsMap[6]) > 0?true:false;
         _loc2_["JUMP"] = (param1 & Controller.ControlsMap[7]) > 0?true:false;
         _loc2_["RIGHT"] = (param1 & Controller.ControlsMap[8]) > 0?true:false;
         _loc2_["LEFT"] = (param1 & Controller.ControlsMap[9]) > 0?true:false;
         _loc2_["DOWN"] = (param1 & Controller.ControlsMap[10]) > 0?true:false;
         _loc2_["UP"] = (param1 & Controller.ControlsMap[11]) > 0?true:false;
         _loc2_["DT_DASH"] = (param1 & Controller.ControlsMap[12]) > 0?true:false;
         _loc2_["AUTO_DASH"] = (param1 & Controller.ControlsMap[13]) > 0?true:false;
         _loc2_["DASH"] = (param1 & Controller.ControlsMap[14]) > 0?true:false;
         _loc2_["C_RIGHT"] = (param1 & Controller.ControlsMap[15]) > 0?true:false;
         _loc2_["C_LEFT"] = (param1 & Controller.ControlsMap[16]) > 0?true:false;
         _loc2_["C_DOWN"] = (param1 & Controller.ControlsMap[17]) > 0?true:false;
         _loc2_["C_UP"] = (param1 & Controller.ControlsMap[18]) > 0?true:false;
         _loc2_["JUMP2"] = (param1 & Controller.ControlsMap[19]) > 0?true:false;
         _loc2_["SHIELD2"] = (param1 & Controller.ControlsMap[20]) > 0?true:false;
         return _loc2_;
      }
      
      public function get ControlsQueue() : Vector.<int>
      {
         return this.m_controlBitsQueue;
      }
      
      public function setKey(param1:String, param2:Number) : void
      {
         this[param1] = param2;
      }
      
      public function getControls() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_["UP"] = this._UP;
         _loc1_["DOWN"] = this._DOWN;
         _loc1_["LEFT"] = this._LEFT;
         _loc1_["RIGHT"] = this._RIGHT;
         _loc1_["JUMP"] = this._JUMP;
         _loc1_["BUTTON1"] = this._BUTTON1;
         _loc1_["BUTTON2"] = this._BUTTON2;
         _loc1_["GRAB"] = this._GRAB;
         _loc1_["START"] = this._START;
         _loc1_["TAUNT"] = this._TAUNT;
         _loc1_["SHIELD"] = this._SHIELD;
         _loc1_["JUMP2"] = this._JUMP2;
         _loc1_["C_UP"] = this._C_UP;
         _loc1_["C_DOWN"] = this._C_DOWN;
         _loc1_["C_LEFT"] = this._C_LEFT;
         _loc1_["C_RIGHT"] = this._C_RIGHT;
         _loc1_["DASH"] = this._DASH;
         _loc1_["TAP_JUMP"] = this._TAP_JUMP;
         _loc1_["AUTO_DASH"] = this._AUTO_DASH;
         _loc1_["DT_DASH"] = this._DT_DASH;
         _loc1_["SHIELD2"] = this._SHIELD2;
         return _loc1_;
      }
      
      public function getControlStatus() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_["UP"] = this.IsDown(this._UP);
         _loc1_["DOWN"] = this.IsDown(this._DOWN);
         _loc1_["LEFT"] = this.IsDown(this._LEFT);
         _loc1_["RIGHT"] = this.IsDown(this._RIGHT);
         _loc1_["JUMP"] = this.IsDown(this._JUMP);
         _loc1_["BUTTON1"] = this.IsDown(this._BUTTON1);
         _loc1_["BUTTON2"] = this.IsDown(this._BUTTON2);
         _loc1_["GRAB"] = this.IsDown(this._GRAB);
         _loc1_["START"] = this.IsDown(this._START);
         _loc1_["TAUNT"] = this.IsDown(this._TAUNT);
         _loc1_["SHIELD"] = this.IsDown(this._SHIELD);
         _loc1_["JUMP2"] = this.IsDown(this._JUMP2);
         _loc1_["C_UP"] = this.IsDown(this._C_UP);
         _loc1_["C_DOWN"] = this.IsDown(this._C_DOWN);
         _loc1_["C_LEFT"] = this.IsDown(this._C_LEFT);
         _loc1_["C_RIGHT"] = this.IsDown(this._C_RIGHT);
         _loc1_["DASH"] = this.IsDown(this._DASH);
         _loc1_["TAP_JUMP"] = this._TAP_JUMP == 1;
         _loc1_["AUTO_DASH"] = this._AUTO_DASH == 1;
         _loc1_["DT_DASH"] = this._DT_DASH == 1;
         _loc1_["SHIELD2"] = this.IsDown(this._SHIELD2);
         return _loc1_;
      }
      
      public function getControlObjectBits(param1:Object = null) : int
      {
         if(param1 == null)
         {
            param1 = this.m_controlsObject;
         }
         var _loc2_:int = 0;
         _loc2_ = _loc2_ + (Boolean(param1["TAP_JUMP"])?Controller.ControlsMap[0]:0);
         _loc2_ = _loc2_ + (Boolean(param1["SHIELD"])?Controller.ControlsMap[1]:0);
         _loc2_ = _loc2_ + (Boolean(param1["TAUNT"])?Controller.ControlsMap[2]:0);
         _loc2_ = _loc2_ + (Boolean(param1["START"])?Controller.ControlsMap[3]:0);
         _loc2_ = _loc2_ + (Boolean(param1["GRAB"])?Controller.ControlsMap[4]:0);
         _loc2_ = _loc2_ + (Boolean(param1["BUTTON2"])?Controller.ControlsMap[5]:0);
         _loc2_ = _loc2_ + (Boolean(param1["BUTTON1"])?Controller.ControlsMap[6]:0);
         _loc2_ = _loc2_ + (Boolean(param1["JUMP"])?Controller.ControlsMap[7]:0);
         _loc2_ = _loc2_ + (Boolean(param1["RIGHT"])?Controller.ControlsMap[8]:0);
         _loc2_ = _loc2_ + (Boolean(param1["LEFT"])?Controller.ControlsMap[9]:0);
         _loc2_ = _loc2_ + (Boolean(param1["DOWN"])?Controller.ControlsMap[10]:0);
         _loc2_ = _loc2_ + (Boolean(param1["UP"])?Controller.ControlsMap[11]:0);
         _loc2_ = _loc2_ + (Boolean(param1["DT_DASH"])?Controller.ControlsMap[12]:0);
         _loc2_ = _loc2_ + (Boolean(param1["AUTO_DASH"])?Controller.ControlsMap[13]:0);
         _loc2_ = _loc2_ + (Boolean(param1["DASH"])?Controller.ControlsMap[14]:0);
         _loc2_ = _loc2_ + (Boolean(param1["C_RIGHT"])?Controller.ControlsMap[15]:0);
         _loc2_ = _loc2_ + (Boolean(param1["C_LEFT"])?Controller.ControlsMap[16]:0);
         _loc2_ = _loc2_ + (Boolean(param1["C_DOWN"])?Controller.ControlsMap[17]:0);
         _loc2_ = _loc2_ + (Boolean(param1["C_UP"])?Controller.ControlsMap[18]:0);
         _loc2_ = _loc2_ + (Boolean(param1["JUMP2"])?Controller.ControlsMap[19]:0);
         _loc2_ = _loc2_ + (Boolean(param1["SHIELD2"])?Controller.ControlsMap[20]:0);
         return _loc2_;
      }
      
      public function queueControlBits(param1:int) : void
      {
         this.m_controlBitsQueue.push(param1);
      }
      
      public function nextControlBits() : int
      {
         var _loc1_:int = this.m_controlBitsQueue.length > 0?int(this.m_controlBitsQueue[0]):int(0);
         this.m_controlBitsQueue.splice(0,1);
         return _loc1_;
      }
      
      public function flushControlBits() : Vector.<int>
      {
         return this.m_controlBitsQueue.splice(0,this.m_controlBitsQueue.length);
      }
      
      public function queueObj(param1:Object) : void
      {
         this.m_objQueue.push(param1);
      }
      
      public function nextObj() : Object
      {
         var _loc1_:Object = this.m_objQueue.length > 0?this.m_objQueue[0]:null;
         this.m_objQueue.splice(0,1);
         return _loc1_;
      }
      
      public function setControlObjectBits(param1:int) : void
      {
         this.m_controlsObject["TAP_JUMP"] = (param1 & Controller.ControlsMap[0]) > 0?true:false;
         this.m_controlsObject["SHIELD"] = (param1 & Controller.ControlsMap[1]) > 0?true:false;
         this.m_controlsObject["TAUNT"] = (param1 & Controller.ControlsMap[2]) > 0?true:false;
         this.m_controlsObject["START"] = (param1 & Controller.ControlsMap[3]) > 0?true:false;
         this.m_controlsObject["GRAB"] = (param1 & Controller.ControlsMap[4]) > 0?true:false;
         this.m_controlsObject["BUTTON2"] = (param1 & Controller.ControlsMap[5]) > 0?true:false;
         this.m_controlsObject["BUTTON1"] = (param1 & Controller.ControlsMap[6]) > 0?true:false;
         this.m_controlsObject["JUMP"] = (param1 & Controller.ControlsMap[7]) > 0?true:false;
         this.m_controlsObject["RIGHT"] = (param1 & Controller.ControlsMap[8]) > 0?true:false;
         this.m_controlsObject["LEFT"] = (param1 & Controller.ControlsMap[9]) > 0?true:false;
         this.m_controlsObject["DOWN"] = (param1 & Controller.ControlsMap[10]) > 0?true:false;
         this.m_controlsObject["UP"] = (param1 & Controller.ControlsMap[11]) > 0?true:false;
         this.m_controlsObject["DT_DASH"] = (param1 & Controller.ControlsMap[12]) > 0?true:false;
         this.m_controlsObject["AUTO_DASH"] = (param1 & Controller.ControlsMap[13]) > 0?true:false;
         this.m_controlsObject["DASH"] = (param1 & Controller.ControlsMap[14]) > 0?true:false;
         this.m_controlsObject["C_RIGHT"] = (param1 & Controller.ControlsMap[15]) > 0?true:false;
         this.m_controlsObject["C_LEFT"] = (param1 & Controller.ControlsMap[16]) > 0?true:false;
         this.m_controlsObject["C_DOWN"] = (param1 & Controller.ControlsMap[17]) > 0?true:false;
         this.m_controlsObject["C_UP"] = (param1 & Controller.ControlsMap[18]) > 0?true:false;
         this.m_controlsObject["JUMP2"] = (param1 & Controller.ControlsMap[19]) > 0?true:false;
         this.m_controlsObject["SHIELD2"] = (param1 & Controller.ControlsMap[20]) > 0?true:false;
      }
      
      public function getControlsObject() : Object
      {
         return this.m_controlsObject;
      }
      
      public function setControlsObject(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 != null)
         {
            for(_loc2_ in param1)
            {
               if(this.m_controlsObject[_loc2_] == undefined)
               {
                  trace("A control wasn\'t set somewhere (" + _loc2_ + ")");
               }
               else
               {
                  this.m_controlsObject[_loc2_] = param1[_loc2_];
               }
            }
         }
      }
      
      public function setControls(param1:Object) : void
      {
         var key:String = null;
         var controls:Object = param1;
         if(controls != null)
         {
            for(key in controls)
            {
               try
               {
                  if(this["_" + key] == undefined)
                  {
                     trace("A control wasn\'t set somewhere (" + key + ")");
                  }
                  else
                  {
                     this["_" + key] = controls[key];
                  }
               }
               catch(e:*)
               {
                  trace("A control wasn\'t set somewhere (" + key + ")");
                  continue;
               }
            }
         }
      }
      
      public function IsDown(param1:Number) : Boolean
      {
         var _loc2_:Boolean = false;
         if(!this.WII)
         {
            if(Key.isDown(param1))
            {
               _loc2_ = true;
            }
            else
            {
               _loc2_ = false;
            }
         }
         return _loc2_;
      }
   }
}
