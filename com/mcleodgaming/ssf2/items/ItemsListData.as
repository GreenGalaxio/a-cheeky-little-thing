package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.Main;
   
   public class ItemsListData
   {
      
      public static var DATA:Array = null;
      
      public static var OBJECTS:Object;
       
      
      public function ItemsListData()
      {
         super();
      }
      
      public static function init() : void
      {
         DATA = Main.getFunction("getItemData")();
         OBJECTS = new Object();
         var _loc1_:int = 0;
         while(_loc1_ < DATA.length)
         {
            OBJECTS[DATA[_loc1_].statsName] = DATA[_loc1_];
            _loc1_++;
         }
      }
      
      public static function getItemByID(param1:String) : Object
      {
         return Boolean(OBJECTS[param1])?OBJECTS[param1]:null;
      }
   }
}
