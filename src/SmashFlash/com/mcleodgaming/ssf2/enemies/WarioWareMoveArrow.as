package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class WarioWareMoveArrow extends Enemy
   {
      
      public static const UP:int = 1;
      
      public static const DOWN:int = 2;
      
      public static const LEFT:int = 3;
      
      public static const RIGHT:int = 4;
       
      
      private var m_deathTimer:FrameTimer;
      
      public var m_directionID:int;
      
      public function WarioWareMoveArrow(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         var _loc5_:String = "warioware_";
         this.m_directionID = Utils.randomInteger(1,4);
         if(this.m_directionID == UP)
         {
            _loc5_ = _loc5_ + "up";
         }
         else if(this.m_directionID == DOWN)
         {
            _loc5_ = _loc5_ + "down";
         }
         else if(this.m_directionID == LEFT)
         {
            _loc5_ = _loc5_ + "left";
         }
         else if(this.m_directionID == RIGHT)
         {
            _loc5_ = _loc5_ + "right";
         }
         super(_loc5_,param1,param2,param3,param4);
         this.m_deathTimer = new FrameTimer(30 * 4);
      }
      
      public function get DirectionID() : int
      {
         return this.m_directionID;
      }
      
      private function runAI() : void
      {
         this.m_deathTimer.tick();
         if(this.m_deathTimer.IsComplete)
         {
            destroy();
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
