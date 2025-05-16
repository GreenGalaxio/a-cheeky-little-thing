package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class WhispyWind extends Enemy
   {
       
      
      private var m_destroyTimer:FrameTimer;
      
      public function WhispyWind(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("whispywind",param1,param2,param3,param4);
         m_gravity = 0;
         m_max_ySpeed = 0;
         m_attackData.importAttacks(Main.getEnemyAttackData("whispy_stats"));
         m_width = 0;
         m_height = 0;
         Attack("wind");
         this.m_destroyTimer = new FrameTimer(30 * 10);
      }
      
      private function runAI() : void
      {
         this.m_destroyTimer.tick();
         if(this.m_destroyTimer.IsComplete)
         {
            destroy();
         }
      }
      
      override protected function move() : void
      {
         m_attemptToMove(m_xSpeed,0);
         m_attemptToMove(0,m_ySpeed);
      }
      
      override public function reactionHit(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         var _loc3_:Character = null;
         if(param1 is Character)
         {
            _loc3_ = Character(param1);
            if(_loc3_.inState(CState.INJURED) || _loc3_.inState(CState.FLYING))
            {
               return false;
            }
         }
         return super.reactionHit(param1,param2);
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               this.move();
               gravity();
               m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
