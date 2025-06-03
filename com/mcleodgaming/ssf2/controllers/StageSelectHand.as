package com.mcleodgaming.ssf2.controllers
{
   import com.mcleodgaming.ssf2.Main;
   import flash.display.MovieClip;
   import flash.events.KeyboardEvent;
   
   public class StageSelectHand extends SelectHand
   {
       
      
      protected var m_spaceLetGo:Boolean;
      
      public function StageSelectHand(param1:MovieClip, param2:Vector.<StageButton>, param3:Function)
      {
         var _loc4_:Vector.<HandButton> = new Vector.<HandButton>();
         var _loc5_:int = 0;
         while(_loc5_ < param2.length)
         {
            _loc4_.push(param2[_loc5_]);
            _loc5_++;
         }
         super(param1,_loc4_,param3);
         this.m_spaceLetGo = false;
         START_POSITION.x = -295;
         START_POSITION.y = 113;
         BOUNDS_RECT.x = -315;
         BOUNDS_RECT.y = -165;
         BOUNDS_RECT.width = 500;
         BOUNDS_RECT.height = 360;
      }
      
      override public function makeEvents() : void
      {
         this.m_spaceLetGo = false;
         super.makeEvents();
         Main.Root.stage.addEventListener(KeyboardEvent.KEY_UP,this.releaseKey);
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         Main.Root.stage.removeEventListener(KeyboardEvent.KEY_UP,this.releaseKey);
      }
      
      protected function releaseKey(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 32)
         {
            this.m_spaceLetGo = true;
         }
      }
      
      override protected function checkHit(param1:KeyboardEvent) : void
      {
         var _loc5_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = param1.keyCode == 32;
         if(!_loc4_)
         {
            this.m_spaceLetGo = true;
         }
         if(m_targetMC.root == null)
         {
            this.killEvents();
         }
         else if(!GameController.isStarted)
         {
            _loc5_ = false;
            _loc2_ = 0;
            while(_loc2_ < m_buttons.length && !_loc5_)
            {
               _loc3_ = 0;
               while(_loc3_ < m_players.length)
               {
                  if(m_players[_loc3_].IsDown(m_players[_loc3_]._BUTTON1) && m_backLetGo)
                  {
                     this.killEvents();
                     m_backFunc(null);
                     return;
                  }
                  _loc3_++;
               }
               if(checkBounds(m_buttons[_loc2_].ButtonInstance) && m_hand.visible)
               {
                  if(m_rollOverID != _loc2_)
                  {
                     if(m_rollOverID != -1)
                     {
                        m_buttons[m_rollOverID].rollout();
                     }
                     m_buttons[_loc2_].rollover();
                  }
                  m_rollOverID = _loc2_;
                  _loc5_ = true;
                  _loc3_ = 0;
                  while(_loc3_ < m_players.length)
                  {
                     if(m_selectLetGo && m_players[_loc3_].IsDown(m_players[_loc3_]._BUTTON2) || m_players[_loc3_].IsDown(m_players[_loc3_]._START) && m_startLetGo)
                     {
                        this.killEvents();
                        m_buttons[_loc2_].click();
                        return;
                     }
                     _loc3_++;
                  }
               }
               _loc2_++;
            }
            evaluateExtraButtons();
            if(!_loc5_)
            {
               if(m_rollOverID != -1)
               {
                  m_buttons[m_rollOverID].rollout();
               }
               m_rollOverID = -1;
            }
            _loc2_ = 0;
            while(_loc2_ < m_buttons.length && !_loc5_)
            {
               if(StageButton(m_buttons[_loc2_]).StageInfo.DisplayName == "Random")
               {
                  _loc3_ = 0;
                  while(_loc3_ < m_players.length)
                  {
                     if(m_players[_loc3_].IsDown(m_players[_loc3_]._START) && m_startLetGo || _loc4_ && this.m_spaceLetGo)
                     {
                        this.killEvents();
                        m_buttons[_loc2_].rollover();
                        m_buttons[_loc2_].click();
                        return;
                     }
                     _loc3_++;
                  }
               }
               _loc2_++;
            }
         }
         if(_loc4_)
         {
            this.m_spaceLetGo = false;
         }
      }
   }
}
