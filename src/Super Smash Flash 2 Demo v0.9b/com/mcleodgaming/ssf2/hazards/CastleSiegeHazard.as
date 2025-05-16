package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class CastleSiegeHazard extends StageHazard
   {
      
      public static var CASTLE_OUTSIDE_TIME:int = 40;
      
      public static var CASTLE_INSIDE_TIME:int = 40;
      
      public static var ROCK_TIME:int = 26;
      
      public static var TRANSITION_TIME:int = 5;
       
      
      private var m_enabled:Boolean;
      
      private var m_action:int;
      
      private var m_nextActionTimer:FrameTimer;
      
      private var m_nextTransitionTimer:FrameTimer;
      
      private var m_fullActionsList:Array;
      
      private var m_actionsList:Array;
      
      private var m_lastGalaxy:int;
      
      public function CastleSiegeHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_nextActionTimer = new FrameTimer(30 * CastleSiegeHazard.CASTLE_OUTSIDE_TIME);
         this.m_nextTransitionTimer = new FrameTimer(30 * CastleSiegeHazard.TRANSITION_TIME);
         this.m_action = 0;
      }
      
      override protected function runHazard() : void
      {
         this.m_enabled = true;
      }
      
      override protected function excess() : void
      {
         if(this.m_enabled)
         {
            if(this.m_action == 0)
            {
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.m_nextActionTimer.reset();
                  this.m_nextActionTimer.MaxTime = 30 * CastleSiegeHazard.CASTLE_INSIDE_TIME;
                  this.m_action = 1;
                  STAGEDATA.StageBG.gotoAndPlay("transition1");
                  STAGEDATA.StageFG.gotoAndPlay("transition1");
                  STAGEDATA.StageRef.gotoAndStop("transition1");
                  STAGEDATA.CamRef.gotoAndPlayBG("transition1");
                  STAGEDATA.ShadowMaskRef.gotoAndPlay("transition1");
               }
            }
            else if(this.m_action == 1)
            {
               this.m_nextTransitionTimer.tick();
               if(this.m_nextTransitionTimer.IsComplete)
               {
                  this.m_nextTransitionTimer.reset();
                  this.m_action = 2;
                  STAGEDATA.StageBG.gotoAndPlay("transition1_end");
                  STAGEDATA.StageFG.gotoAndPlay("transition1_end");
                  STAGEDATA.StageRef.gotoAndStop("transition1_end");
                  STAGEDATA.CamRef.gotoAndPlayBG("transition1_end");
                  STAGEDATA.ShadowMaskRef.gotoAndPlay("transition1_end");
               }
            }
            else if(this.m_action == 2)
            {
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.m_nextActionTimer.reset();
                  this.m_nextActionTimer.MaxTime = 30 * CastleSiegeHazard.ROCK_TIME;
                  this.m_action = 3;
                  STAGEDATA.StageBG.gotoAndPlay("transition2");
                  STAGEDATA.StageFG.gotoAndPlay("transition2");
                  STAGEDATA.StageRef.gotoAndStop("transition2");
                  STAGEDATA.CamRef.gotoAndPlayBG("transition2");
                  STAGEDATA.ShadowMaskRef.gotoAndPlay("transition2");
               }
            }
            else if(this.m_action == 3)
            {
               this.m_nextTransitionTimer.tick();
               if(this.m_nextTransitionTimer.IsComplete)
               {
                  this.m_nextTransitionTimer.reset();
                  this.m_action = 4;
                  STAGEDATA.StageBG.gotoAndPlay("transition2_end");
                  STAGEDATA.StageFG.gotoAndPlay("transition2_end");
                  STAGEDATA.StageRef.gotoAndStop("transition2_end");
                  STAGEDATA.CamRef.gotoAndPlayBG("transition2_end");
                  STAGEDATA.ShadowMaskRef.gotoAndPlay("transition2_end");
               }
            }
            else if(this.m_action == 4)
            {
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.m_nextActionTimer.reset();
                  this.m_nextActionTimer.MaxTime = 30 * CastleSiegeHazard.CASTLE_OUTSIDE_TIME;
                  this.m_action = 5;
                  STAGEDATA.StageBG.gotoAndPlay("transition3");
                  STAGEDATA.StageFG.gotoAndPlay("transition3");
                  STAGEDATA.StageRef.gotoAndStop("transition3");
                  STAGEDATA.CamRef.gotoAndPlayBG("transition3");
                  STAGEDATA.ShadowMaskRef.gotoAndPlay("transition3");
               }
            }
            else if(this.m_action == 5)
            {
               this.m_nextTransitionTimer.tick();
               if(this.m_nextTransitionTimer.IsComplete)
               {
                  this.m_nextTransitionTimer.reset();
                  this.m_action = 0;
                  STAGEDATA.StageBG.gotoAndPlay("transition3_end");
                  STAGEDATA.StageFG.gotoAndPlay("transition3_end");
                  STAGEDATA.StageRef.gotoAndStop("transition3_end");
                  STAGEDATA.CamRef.gotoAndPlayBG("transition3_end");
                  STAGEDATA.ShadowMaskRef.gotoAndPlay("transition3_end");
               }
            }
         }
      }
   }
}
