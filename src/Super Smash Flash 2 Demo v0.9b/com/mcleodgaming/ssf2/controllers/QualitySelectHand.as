package com.mcleodgaming.ssf2.controllers
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class QualitySelectHand extends SelectHand
   {
       
      
      public function QualitySelectHand(param1:MovieClip, param2:Vector.<HandButton>, param3:Function)
      {
         super(param1,param2,param3);
         START_POSITION.x = -295;
         START_POSITION.y = 113;
         BOUNDS_RECT.x = -300;
         BOUNDS_RECT.y = -165;
         BOUNDS_RECT.width = 580;
         BOUNDS_RECT.height = 360;
      }
      
      override protected function checkHit(param1:KeyboardEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         if(checkBounds(MenuController.qualityMenu.FullScreenQualityComboBox) && m_hand.visible && m_selectLetGo)
         {
            _loc3_ = MenuController.qualityMenu.FullScreenQualityComboBox.length;
            _loc4_ = MenuController.qualityMenu.FullScreenQualityComboBox.selectedIndex + 1 < _loc3_?int(MenuController.qualityMenu.FullScreenQualityComboBox.selectedIndex + 1):int(0);
            _loc2_ = 0;
            while(_loc2_ < m_players.length)
            {
               if(m_selectLetGo && m_players[_loc2_].IsDown(m_players[_loc2_]._BUTTON2))
               {
                  MenuController.qualityMenu.FullScreenQualityComboBox.selectedIndex = _loc4_;
                  MenuController.qualityMenu.FullScreenQualityComboBox.dispatchEvent(new Event(Event.CHANGE));
               }
               _loc2_++;
            }
         }
         super.checkHit(param1);
      }
   }
}
