package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class ItemButton extends HandButton
   {
       
      
      private var m_itemName:String;
      
      public function ItemButton(param1:MovieClip, param2:String)
      {
         super(param1);
         this.m_itemName = param2;
      }
      
      private function splitItemStatus() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:String = "";
         var _loc3_:Number = 0;
         while(_loc3_ < this.m_itemName.length)
         {
            if(this.m_itemName.charAt(_loc3_) == ",")
            {
               _loc1_.push(_loc2_);
               _loc2_ = "";
            }
            else
            {
               _loc2_ = _loc2_ + this.m_itemName.charAt(_loc3_);
            }
            _loc3_++;
         }
         _loc1_.push(_loc2_);
         return _loc1_;
      }
      
      override protected function button_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         var _loc2_:Boolean = m_button.currentFrameLabel == "on";
         m_button.gotoAndStop(!!_loc2_?"off":"on");
         var _loc3_:Array = this.splitItemStatus();
         var _loc4_:Number = 0;
         while(_loc4_ < _loc3_.length)
         {
            SaveData.ItemDataObj[_loc3_[_loc4_]] = !_loc2_;
            _loc4_++;
         }
         MenuController.itemSwitchMenu.checkAllBtn();
      }
      
      override protected function button_ROLLOVER(param1:MouseEvent) : void
      {
         m_button.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
      }
      
      override protected function button_ROLLOUT(param1:MouseEvent) : void
      {
         m_button.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OUT));
      }
      
      public function getStatus() : Boolean
      {
         return m_button.currentFrameLabel == "on";
      }
      
      public function setStatus(param1:Boolean) : void
      {
         m_button.gotoAndStop(!!param1?"on":"off");
         var _loc2_:Array = this.splitItemStatus();
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_.length)
         {
            SaveData.ItemDataObj[_loc2_[_loc3_]] = param1;
            _loc3_++;
         }
      }
   }
}
