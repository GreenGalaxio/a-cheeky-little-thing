package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.engine.StageSetting;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class StageSwitchButton extends HandButton
   {
       
      
      private var m_stageSetting:StageSetting;
      
      private var m_extraClickFunc:Function;
      
      public function StageSwitchButton(param1:MovieClip, param2:StageSetting)
      {
         super(param1);
         this.m_stageSetting = param2;
         this.m_extraClickFunc = null;
      }
      
      public function get ID() : String
      {
         return this.m_stageSetting.ID;
      }
      
      public function setClickFunc(param1:Function) : void
      {
         this.m_extraClickFunc = param1;
      }
      
      override protected function button_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         var _loc2_:Boolean = m_button.currentFrameLabel == "on";
         m_button.gotoAndStop(!!_loc2_?"off":"on");
         SaveData.VSStageDataObj[this.m_stageSetting.ID] = !_loc2_;
         if(this.m_extraClickFunc != null)
         {
            this.m_extraClickFunc(this);
         }
      }
      
      public function getStatus() : Boolean
      {
         return m_button.currentFrameLabel == "on";
      }
      
      public function setStatus(param1:Boolean) : void
      {
         m_button.gotoAndStop(!!param1?"on":"off");
         SaveData.VSStageDataObj[this.m_stageSetting.ID] = param1;
      }
   }
}
