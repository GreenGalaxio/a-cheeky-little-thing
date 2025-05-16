package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class GalaxyTours extends StageHazard
   {
       
      
      private var m_enabled:Boolean;
      
      private var m_action:int;
      
      private var m_nextActionTimer:FrameTimer;
      
      private var m_nextTransitionTimer:FrameTimer;
      
      private var m_fullActionsList:Array;
      
      private var m_actionsList:Array;
      
      private var m_lastGalaxy:int;
      
      public function GalaxyTours(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_nextActionTimer = new FrameTimer(30 * 25);
         this.m_nextTransitionTimer = new FrameTimer(30 * 8);
         this.m_action = 0;
         this.m_enabled = param1 >= 0;
         this.m_fullActionsList = new Array(1,3);
         this.m_actionsList = new Array(1,3);
         this.m_lastGalaxy = -1;
      }
      
      override protected function runHazard() : void
      {
         this.m_enabled = true;
      }
      
      private function getNextGalaxy() : void
      {
         this.m_actionsList = new Array();
         var _loc1_:int = 0;
         while(_loc1_ < this.m_fullActionsList.length)
         {
            if(this.m_lastGalaxy != this.m_fullActionsList[_loc1_])
            {
               this.m_actionsList.push(this.m_fullActionsList[_loc1_]);
            }
            _loc1_++;
         }
         this.m_action = this.m_actionsList[Utils.randomInteger(0,this.m_actionsList.length - 1)];
         this.m_lastGalaxy = this.m_action;
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
                  this.getNextGalaxy();
                  STAGEDATA.StageBG.gotoAndPlay("transition1");
                  STAGEDATA.StageFG.gotoAndPlay("transition1");
                  STAGEDATA.StageRef.gotoAndStop("transition1");
                  STAGEDATA.CamRef.gotoAndPlayBG("transition1");
                  STAGEDATA.ShadowMaskRef.gotoAndStop("transition1");
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
                  STAGEDATA.ShadowMaskRef.gotoAndStop("transition1_end");
               }
            }
            else if(this.m_action == 2)
            {
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.m_nextActionTimer.reset();
                  this.m_action = 5;
                  STAGEDATA.StageBG.gotoAndPlay("transition2");
                  STAGEDATA.StageFG.gotoAndPlay("transition2");
                  STAGEDATA.StageRef.gotoAndStop("transition2");
                  STAGEDATA.CamRef.gotoAndPlayBG("transition2");
                  STAGEDATA.ShadowMaskRef.gotoAndStop("transition2");
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
                  STAGEDATA.ShadowMaskRef.gotoAndStop("transition2_end");
               }
            }
            else if(this.m_action == 4)
            {
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.m_nextActionTimer.reset();
                  this.m_action = 5;
                  STAGEDATA.StageBG.gotoAndPlay("transition3");
                  STAGEDATA.StageFG.gotoAndPlay("transition3");
                  STAGEDATA.StageRef.gotoAndStop("transition3");
                  STAGEDATA.CamRef.gotoAndPlayBG("transition3");
                  STAGEDATA.ShadowMaskRef.gotoAndStop("transition3");
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
                  STAGEDATA.ShadowMaskRef.gotoAndStop("transition3_end");
               }
            }
            else if(this.m_action != 6)
            {
               if(this.m_action != 7)
               {
                  if(this.m_action != 8)
                  {
                     if(this.m_action != 9)
                     {
                        if(this.m_action != 10)
                        {
                           if(this.m_action != 11)
                           {
                              if(this.m_action == 12)
                              {
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
}
