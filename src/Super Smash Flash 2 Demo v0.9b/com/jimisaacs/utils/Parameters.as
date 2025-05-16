package com.jimisaacs.utils
{
   import flash.utils.Dictionary;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public dynamic class Parameters extends Proxy
   {
       
      
      private var _props:Dictionary;
      
      public function Parameters(... rest)
      {
         super();
         this._props = new Dictionary(true);
         this.add.apply(this,rest);
      }
      
      public function addParam(param1:*, param2:*) : void
      {
         this._props[param1] = param2;
      }
      
      public function clear() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this._props)
         {
            this._props[_loc1_] = null;
            delete this._props[_loc1_];
         }
      }
      
      public function addObj(param1:Object) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in param1)
         {
            this.addParam(_loc2_,param1[_loc2_]);
         }
      }
      
      public function add(... rest) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in rest)
         {
            this.addObj(_loc2_);
         }
      }
      
      public function get properties() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = [];
         for(_loc2_ in this._props)
         {
            _loc1_.push({
               "name":_loc2_,
               "value":this._props[_loc2_]
            });
         }
         return _loc1_;
      }
      
      public function set properties(param1:Array) : void
      {
         this.clear();
         this.addObj(param1);
      }
      
      public function get length() : int
      {
         return this.properties.length;
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         this.addParam(param1,param2);
      }
      
      override flash_proxy function deleteProperty(param1:*) : Boolean
      {
         if(this._props[param1])
         {
            this._props[param1] = null;
            delete this._props[param1];
            return true;
         }
         return false;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         if(isNaN(param1))
         {
            return this._props[param1];
         }
         return this.properties[param1].value;
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         return param1 < this.length?int(param1 + 1):int(0);
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return this.properties[param1 - 1].name;
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return this.properties[param1 - 1].value;
      }
   }
}
