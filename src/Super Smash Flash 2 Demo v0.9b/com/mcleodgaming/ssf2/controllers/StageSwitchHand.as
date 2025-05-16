package com.mcleodgaming.ssf2.controllers
{
   import flash.display.MovieClip;
   
   public class StageSwitchHand extends SelectHand
   {
       
      
      public function StageSwitchHand(param1:MovieClip, param2:Vector.<StageSwitchButton>, param3:Function)
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
         BOUNDS_RECT.width = 563;
         BOUNDS_RECT.height = 320;
      }
   }
}
