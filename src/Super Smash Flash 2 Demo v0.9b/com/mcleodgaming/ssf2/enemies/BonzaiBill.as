package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class BonzaiBill extends Enemy
   {
       
      
      private var SPEED:Number = 2;
      
      private var DIG_SPEED:Number = 0.1;
      
      private var m_action:int;
      
      private var m_angle:Number;
      
      private var m_digTimer:FrameTimer;
      
      private var m_waitTimer:FrameTimer;
      
      private var m_deathTimer:FrameTimer;
      
      private var m_targetLocation:Point;
      
      public function BonzaiBill(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("bonzaibill",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("bonzaibill_stats"));
         this.m_digTimer = new FrameTimer(30 * 5);
         this.m_waitTimer = new FrameTimer(30 * 1);
         this.m_deathTimer = new FrameTimer(30 * 3);
         this.m_action = 0;
         this.m_targetLocation = new Point(236,308);
         Attack("idle");
         this.m_angle = Utils.getAngleBetween(new Point(m_sprite.x,m_sprite.y),this.m_targetLocation);
         m_sprite.rotation = 270 - this.m_angle;
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            if(m_xSpeed < 0 && m_facingForward)
            {
               m_faceLeft();
            }
            m_xSpeed = Utils.calculateXSpeed(this.SPEED,this.m_angle);
            m_ySpeed = -Utils.calculateYSpeed(this.SPEED,this.m_angle);
            if(testTerrainWithCoord(m_sprite.x,m_sprite.y))
            {
               this.m_action = 1;
               Attack("idle");
            }
         }
         else if(this.m_action == 1)
         {
            STAGEDATA.shakeCamera(2);
            m_xSpeed = Utils.calculateXSpeed(this.DIG_SPEED,this.m_angle);
            m_ySpeed = -Utils.calculateYSpeed(this.DIG_SPEED,this.m_angle);
            this.m_digTimer.tick();
            if(this.m_digTimer.IsComplete)
            {
               this.m_action = 2;
               Attack("cry");
               m_xSpeed = 0;
               m_ySpeed = 0;
            }
         }
         else if(this.m_action == 2)
         {
            if(HasStance && m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames - 1)
            {
               this.m_action = 3;
               Attack("explode");
            }
         }
         else if(this.m_action == 3)
         {
            if(HasStance && m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames - 1)
            {
               destroy();
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               move();
               gravity();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
