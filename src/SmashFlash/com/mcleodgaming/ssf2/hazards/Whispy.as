package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.WhispyWind;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Whispy extends StageHazard
   {
       
      
      private var m_action:int;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_waitTimer:FrameTimer;
      
      private var m_blowTimer:FrameTimer;
      
      private var m_transitionTimer:FrameTimer;
      
      private var m_facingForward:Boolean;
      
      private var m_blowForward:Boolean;
      
      public function Whispy(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_blinkTimer = new FrameTimer(30);
         this.m_waitTimer = new FrameTimer(30 * 20);
         this.m_blowTimer = new FrameTimer(30 * 10);
         this.m_transitionTimer = new FrameTimer(8);
         this.m_facingForward = true;
         this.m_blowForward = true;
         this.setRandBlinkInterval();
         this.m_action = 0;
         Utils.tryToGotoAndPlay(STAGEDATA.StageBG.whispy,"loop");
      }
      
      protected function setRandBlinkInterval() : void
      {
         this.m_blinkTimer.reset();
         this.m_blinkTimer.MaxTime = Utils.randomInteger(5,70);
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:WhispyWind = null;
         if(this.m_action == 0)
         {
            this.m_blinkTimer.tick();
            if(this.m_blinkTimer.IsComplete)
            {
               this.setRandBlinkInterval();
               STAGEDATA.StageBG.whispy.gotoAndPlay(!!this.m_facingForward?"blink_right":"blink_left");
            }
            else
            {
               this.m_waitTimer.tick();
               if(this.m_waitTimer.IsComplete)
               {
                  this.m_waitTimer.reset();
                  this.m_waitTimer.MaxTime = 30 * 30;
                  this.setRandBlinkInterval();
                  this.m_blowForward = Utils.random() > 0.5;
                  this.m_action = 3;
               }
            }
         }
         else if(this.m_action == 1)
         {
            this.m_blowTimer.tick();
            if(this.m_blowTimer.IsComplete)
            {
               this.m_blowTimer.reset();
               this.m_action = 0;
            }
         }
         else if(this.m_action == 2)
         {
            this.m_transitionTimer.tick();
            if(this.m_transitionTimer.IsComplete)
            {
               this.m_transitionTimer.reset();
               this.m_action = 3;
            }
         }
         else if(this.m_action == 3)
         {
            if(this.m_blowForward != this.m_facingForward)
            {
               this.m_facingForward = !this.m_facingForward;
               this.m_action = 2;
               Utils.tryToGotoAndPlay(STAGEDATA.StageBG.whispy,!!this.m_facingForward?"turn_right":"turn_left");
            }
            else
            {
               STAGEDATA.SoundQueueRef.playSoundEffect("ssb_wind3");
               Utils.tryToGotoAndPlay(STAGEDATA.StageBG.whispy,!!this.m_facingForward?"blow_right":"blow_left");
               _loc1_ = WhispyWind(STAGEDATA.spawnEnemy(WhispyWind,!!this.m_facingForward?Number(168):Number(168 - 80),137));
               if(!this.m_facingForward)
               {
                  _loc1_.faceLeft();
                  _loc1_.AttackStateData.IsForward = false;
               }
               this.m_action = 1;
            }
         }
      }
      
      override protected function excess() : void
      {
         Utils.advanceFrame(STAGEDATA.StageBG.whispy);
         STAGEDATA.StageBG.whispy.stop();
      }
   }
}
