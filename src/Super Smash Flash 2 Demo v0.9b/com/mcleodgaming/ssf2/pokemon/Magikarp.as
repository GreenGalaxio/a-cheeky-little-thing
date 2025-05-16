package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Magikarp extends Pokemon
   {
       
      
      private var m_action:int;
      
      private var m_endTimer:FrameTimer;
      
      public function Magikarp(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("magikarp",param1,param2,param3,param4);
         m_gravity = 1.5;
         m_max_ySpeed = 30;
         m_width = 30;
         m_height = 50;
         this.m_action = 0;
         m_ySpeed = -3;
         unnattachFromGround();
         this.m_endTimer = new FrameTimer(30 * 10);
         if(Utils.random() > 0.5)
         {
            m_faceLeft();
         }
      }
      
      private function runAI() : void
      {
         var _loc1_:Number = NaN;
         if(this.m_action == 0)
         {
            if(m_collision.ground)
            {
               unnattachFromGround();
               m_ySpeed = Utils.random() * (-12 - -6) + -6;
               _loc1_ = Utils.random() * (2 - 1) + 1;
               m_xSpeed = Utils.random() > 0.5?Number(_loc1_):Number(-_loc1_);
               if(m_xSpeed > 0)
               {
                  m_sprite.rotation = !!m_facingForward?Number(10):Number(-10);
               }
               else
               {
                  m_sprite.rotation = !!m_facingForward?Number(-10):Number(10);
               }
            }
            this.m_endTimer.tick();
            if(this.m_endTimer.IsComplete)
            {
               m_fadeTimer.reset();
               this.m_action = 1;
               m_xSpeed = 0;
               m_ySpeed = 0;
               m_gravity = 0;
            }
         }
         else if(this.m_action == 1)
         {
            fadeOut();
            if(m_fadeTimer.IsComplete)
            {
               destroy();
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
               if(this.m_action != 1)
               {
                  fadeIn();
               }
               performAttackChecks();
               attackCollisionTest();
               move();
               gravity();
               m_groundCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
