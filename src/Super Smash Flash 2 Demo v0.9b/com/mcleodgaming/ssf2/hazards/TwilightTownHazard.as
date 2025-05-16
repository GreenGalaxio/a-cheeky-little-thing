package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class TwilightTownHazard extends StageHazard
   {
       
      
      private var m_done:Boolean;
      
      public function TwilightTownHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         m_safe = true;
         this.m_done = false;
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:Character = null;
         if(!this.m_done && STAGEDATA.GameRef.UsingTime && STAGEDATA.TimerRef)
         {
            if(STAGEDATA.TimerRef.CountDown && STAGEDATA.TimerRef.CurrentTime == 30 * 15)
            {
               STAGEDATA.StageFG.gotoAndStop("sunset");
               STAGEDATA.StageRef.gotoAndStop("sunset");
               STAGEDATA.CamRef.gotoAndPlayBG("sunset");
               this.m_done = true;
            }
         }
         if(!this.m_done && STAGEDATA.GameRef.UsingLives)
         {
            _loc1_ = false;
            _loc2_ = 0;
            while(_loc2_ < STAGEDATA.PlayerList.length)
            {
               _loc3_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc2_]);
               if(_loc3_ && _loc3_.getLives() == 1)
               {
                  _loc1_ = true;
               }
               _loc2_++;
            }
            if(_loc1_)
            {
               STAGEDATA.StageFG.gotoAndStop("sunset");
               STAGEDATA.StageRef.gotoAndStop("sunset");
               STAGEDATA.CamRef.gotoAndPlayBG("sunset");
               this.m_done = true;
            }
         }
      }
   }
}
