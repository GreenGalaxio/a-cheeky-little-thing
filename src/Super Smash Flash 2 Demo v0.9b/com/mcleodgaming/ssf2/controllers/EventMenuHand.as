package com.mcleodgaming.ssf2.controllers
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class EventMenuHand extends SelectHand
   {
       
      
      public function EventMenuHand(param1:MovieClip, param2:Vector.<EventButton>, param3:Function)
      {
         var _loc4_:Vector.<HandButton> = new Vector.<HandButton>();
         var _loc5_:int = 0;
         while(_loc5_ < param2.length)
         {
            _loc4_.push(param2[_loc5_]);
            _loc5_++;
         }
         super(param1,_loc4_,param3);
         START_POSITION.x = -246;
         START_POSITION.y = -132;
         BOUNDS_RECT.x = -287;
         BOUNDS_RECT.y = -145;
         BOUNDS_RECT.width = 585;
         BOUNDS_RECT.height = 320;
         resetPosition();
      }
      
      override protected function checkBounds(param1:DisplayObject) : Boolean
      {
         var _loc2_:Rectangle = param1.getBounds(param1.parent.parent);
         return param1.visible && _loc2_.containsPoint(new Point(m_hand.x,m_hand.y));
      }
   }
}
