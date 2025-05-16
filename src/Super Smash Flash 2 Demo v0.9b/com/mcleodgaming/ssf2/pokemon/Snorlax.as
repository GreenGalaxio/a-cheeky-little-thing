package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class Snorlax extends Pokemon
   {
       
      
      private var m_action:uint;
      
      private var m_target:Target;
      
      private var m_attackTimer:FrameTimer;
      
      private var m_maxRiseSpeed:Number;
      
      public function Snorlax(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("snorlax",param1,param2,param3,param4);
         m_gravity = 1.5;
         m_max_ySpeed = 14;
         m_attackData.importAttacks(Main.getEnemyAttackData("snorlax_stats"));
         Attack("rise");
         this.m_action = 0;
         this.m_attackTimer = new FrameTimer(22);
         this.m_maxRiseSpeed = -18;
         STAGEDATA.playSpecificVoice("snorlax_rise");
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            fadeIn();
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               this.m_action = 1;
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 30 * 3;
               unnattachFromGround();
               m_ySpeed = -0.1;
            }
         }
         else if(this.m_action == 1)
         {
            m_ySpeed = m_ySpeed - (m_ySpeed > this.m_maxRiseSpeed?1:0);
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               STAGEDATA.playSpecificVoice("snorlax_fall");
               this.m_action = 2;
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 30 * 4;
               m_sprite.scaleX = 3;
               m_sprite.scaleY = 3;
               m_sprite.y = STAGEDATA.CamRef.MainTerrain.y - 100;
               m_ySpeed = m_max_ySpeed;
               Attack("fall");
            }
         }
         else if(this.m_action == 2)
         {
            if(this.m_attackTimer.IsComplete)
            {
               this.m_action = 2;
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 30 * 4;
            }
         }
      }
      
      override protected function move() : void
      {
         if(this.m_action == 0)
         {
            if(!m_collision.ground)
            {
               m_attemptToMove(m_xSpeed,m_ySpeed);
            }
            else
            {
               applyGroundInfluence();
               m_sprite.x = m_sprite.x + m_xSpeed;
               m_sprite.y = m_sprite.y + m_ySpeed;
               attachToGround();
            }
         }
         else
         {
            applyGroundInfluence();
            m_sprite.x = m_sprite.x + m_xSpeed;
            m_sprite.y = m_sprite.y + m_ySpeed;
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            this.runAI();
            if(!m_dead)
            {
               fadeIn();
               performAttackChecks();
               attackCollisionTest();
               this.move();
               if(this.m_action == 2)
               {
                  gravity();
               }
               if(this.m_action == 0)
               {
                  m_groundCollisionTest();
               }
            }
         }
      }
   }
}
