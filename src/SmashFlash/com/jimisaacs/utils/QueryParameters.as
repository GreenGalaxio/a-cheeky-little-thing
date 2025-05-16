package com.jimisaacs.utils
{
   public dynamic class QueryParameters extends Parameters
   {
       
      
      public function QueryParameters(param1:String = "")
      {
         super();
         this.addStr(param1);
      }
      
      override public function addParam(param1:*, param2:*) : void
      {
         var _loc3_:RegExp = /\s+/g;
         param1 = String(param1).replace(_loc3_,"_");
         param2 = encodeURI(String(param2));
         super.addParam(param1,param2);
      }
      
      private function addStr(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc2_:Array = param1.split("&");
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.indexOf("=") >= 0)
            {
               _loc4_ = _loc3_.split("=");
               this.addParam(_loc4_[0],_loc4_[1]);
            }
            else if(_loc3_.length > 0)
            {
               this.addParam(_loc3_,"");
            }
         }
      }
      
      public function get queryString() : String
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < super.length)
         {
            _loc1_[_loc2_] = super.properties[_loc2_].name;
            if(super.properties[_loc2_].value != "")
            {
               _loc1_[_loc2_] = _loc1_[_loc2_] + ("=" + super.properties[_loc2_].value);
            }
            _loc2_++;
         }
         if(_loc1_.length > 0)
         {
            return _loc1_.join("&");
         }
         return "";
      }
      
      public function set queryString(param1:String) : void
      {
         super.clear();
         this.addStr(param1);
      }
      
      public function valueOf() : Object
      {
         return this.queryString;
      }
      
      public function toString() : String
      {
         return this.queryString;
      }
   }
}
