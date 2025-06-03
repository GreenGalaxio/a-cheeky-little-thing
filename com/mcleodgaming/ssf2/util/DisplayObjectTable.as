package com.mcleodgaming.ssf2.util
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class DisplayObjectTable
   {
       
      
      private var m_displayObjects:Vector.<Vector.<DisplayObject>>;
      
      private var m_rows:int;
      
      private var m_spaceRect:Rectangle;
      
      public function DisplayObjectTable(param1:int, param2:Rectangle)
      {
         super();
         if(param1 < 0)
         {
            trace("Error creating DisplayObjectTable, cannot have negative rows");
            return;
         }
         if(param2 == null)
         {
            trace("Error creating DisplayObjectTable, cannot have null spacing rectangle");
            return;
         }
         this.m_displayObjects = new Vector.<Vector.<DisplayObject>>();
         this.m_rows = param1;
         this.m_spaceRect = param2;
         var _loc3_:int = 0;
         while(_loc3_ < this.m_rows)
         {
            this.m_displayObjects.push(new Vector.<DisplayObject>());
            _loc3_++;
         }
      }
      
      public function maxPerRow() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.m_displayObjects.length)
         {
            _loc1_ = Math.max(_loc1_,this.m_displayObjects[_loc2_].length);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function insertObject(param1:int, param2:DisplayObject) : void
      {
         if(param1 < 0 || param1 > this.m_displayObjects.length)
         {
            trace("Error, rowIndex out of bounds in DisplayObjectTable.insertObject()");
            return;
         }
         if(param1 == this.m_displayObjects.length)
         {
            this.m_displayObjects.push(new Vector.<DisplayObject>());
         }
         this.m_displayObjects[param1].push(param2);
      }
      
      public function hideAll() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.m_displayObjects.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.m_displayObjects[_loc1_].length)
            {
               this.m_displayObjects[_loc1_][_loc2_].visible = false;
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function showAll() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.m_displayObjects.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.m_displayObjects[_loc1_].length)
            {
               this.m_displayObjects[_loc1_][_loc2_].visible = true;
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function scaleAll(param1:Number, param2:Number) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.m_displayObjects.length)
         {
            _loc4_ = 0;
            while(_loc4_ < this.m_displayObjects[_loc3_].length)
            {
               this.m_displayObjects[_loc3_][_loc4_].scaleX = param1;
               this.m_displayObjects[_loc3_][_loc4_].scaleY = param2;
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function fixDepths() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = this.m_displayObjects.length - 1;
         while(_loc1_ >= 0)
         {
            _loc2_ = this.m_displayObjects[_loc1_].length - 1;
            while(_loc2_ >= 0)
            {
               if(this.m_displayObjects[_loc1_][_loc2_].parent && this.m_displayObjects[_loc1_][_loc2_].parent as MovieClip)
               {
                  MovieClip(this.m_displayObjects[_loc1_][_loc2_].parent).setChildIndex(this.m_displayObjects[_loc1_][_loc2_],0);
               }
               _loc2_--;
            }
            _loc1_--;
         }
      }
      
      public function spaceObjects() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = 0;
         _loc1_ = 0;
         while(_loc1_ < this.m_displayObjects.length)
         {
            _loc4_ = 0;
            _loc5_ = 0;
            _loc2_ = 0;
            while(_loc2_ < this.m_displayObjects[_loc1_].length)
            {
               if(!this.m_displayObjects[_loc1_][_loc2_].visible)
               {
                  _loc4_ = _loc4_ + this.m_spaceRect.width / 2;
               }
               _loc2_++;
            }
            _loc6_ = this.maxPerRow() - this.m_displayObjects[_loc1_].length;
            _loc4_ = _loc4_ + _loc6_ * this.m_spaceRect.width / 2;
            _loc2_ = 0;
            while(_loc2_ < this.m_displayObjects[_loc1_].length)
            {
               if(this.m_displayObjects[_loc1_][_loc2_].visible)
               {
                  this.m_displayObjects[_loc1_][_loc2_].x = this.m_spaceRect.x + this.m_spaceRect.width * _loc5_ + _loc4_;
                  this.m_displayObjects[_loc1_][_loc2_].y = this.m_spaceRect.y + this.m_spaceRect.height * _loc3_;
                  _loc5_++;
               }
               _loc2_++;
            }
            _loc3_++;
            _loc1_++;
         }
      }
   }
}
