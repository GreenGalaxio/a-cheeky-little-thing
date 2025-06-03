package com.mcleodgaming.ssf2.controllers
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class HandButton
   {
       
      
      protected var m_button:MovieClip;
      
      public function HandButton(param1:MovieClip)
      {
         super();
         this.m_button = param1;
      }
      
      public function get ButtonInstance() : MovieClip
      {
         return this.m_button;
      }
      
      public function makeEvents() : void
      {
         this.m_button.addEventListener(MouseEvent.ROLL_OVER,this.button_ROLLOVER);
         this.m_button.addEventListener(MouseEvent.CLICK,this.button_CLICK);
         this.m_button.addEventListener(MouseEvent.ROLL_OUT,this.button_ROLLOUT);
      }
      
      public function killEvents() : void
      {
         this.m_button.removeEventListener(MouseEvent.ROLL_OVER,this.button_ROLLOVER);
         this.m_button.removeEventListener(MouseEvent.CLICK,this.button_CLICK);
         this.m_button.removeEventListener(MouseEvent.ROLL_OUT,this.button_ROLLOUT);
      }
      
      public function rollover() : void
      {
         this.button_ROLLOVER(null);
      }
      
      public function click() : void
      {
         this.button_CLICK(null);
      }
      
      public function rollout() : void
      {
         this.button_ROLLOUT(null);
      }
      
      protected function button_ROLLOVER(param1:MouseEvent) : void
      {
      }
      
      protected function button_CLICK(param1:MouseEvent) : void
      {
      }
      
      protected function button_ROLLOUT(param1:MouseEvent) : void
      {
      }
   }
}
