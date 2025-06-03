package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class Missingno extends Pokemon
   {
       
      
      private var m_action:uint;
      
      private var m_waitTimer:FrameTimer;
      
      private var m_overlay:MovieClip;
      
      public function Missingno(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("missingno",param1,param2,param3,param4);
         this.m_overlay = null;
         m_gravity = 1.5;
         m_max_ySpeed = 30;
         this.m_action = 0;
         this.m_waitTimer = new FrameTimer(30 * 3);
         playFrame("idle");
         STAGEDATA.SoundQueueRef.playSoundEffect("pokemon_rattata");
      }
      
      private function runAI() : void
      {
         var _loc3_:Character = null;
         var _loc1_:Character = null;
         var _loc2_:int = 0;
         if(this.m_action == 0)
         {
            fadeIn();
            this.m_waitTimer.tick();
            if(this.m_waitTimer.IsComplete)
            {
               this.m_waitTimer.reset();
               this.m_waitTimer.MaxTime = 30;
               this.m_action = 1;
               playFrame("glitch");
               STAGEDATA.SoundQueueRef.playSoundEffect("pokemon_glitchy");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_waitTimer.tick();
            if(this.m_waitTimer.IsComplete)
            {
               this.m_waitTimer.reset();
               this.m_waitTimer.MaxTime = 30 * 6;
               _loc2_ = 0;
               while(_loc2_ < STAGEDATA.PlayerList.length)
               {
                  _loc3_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc2_]);
                  if(_loc3_ && _loc3_.isCPU() && _loc3_.CpuAI)
                  {
                     _loc3_.CpuAI.beginConfusion(this.m_waitTimer.MaxTime);
                  }
                  _loc2_++;
               }
               this.m_action = 2;
               playFrame("glitch");
               STAGEDATA.SoundQueueRef.playSoundEffect("windows_error");
               this.m_overlay = STAGEDATA.attachUniqueMovieHUDOverlay("missingno_bluescreen");
               this.m_overlay.x = 0;
               this.m_overlay.y = 0;
               GameController.hud.hideHealthBoxes();
            }
         }
         else if(this.m_action == 2)
         {
            this.m_waitTimer.tick();
            if(this.m_waitTimer.IsComplete)
            {
               GameController.hud.showHealthBoxes();
               destroy();
               if(this.m_overlay && this.m_overlay.parent)
               {
                  this.m_overlay.parent.removeChild(this.m_overlay);
               }
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            this.runAI();
            if(!m_dead)
            {
               performAttackChecks();
               attackCollisionTest();
               move();
               gravity();
               m_groundCollisionTest();
            }
         }
      }
   }
}
