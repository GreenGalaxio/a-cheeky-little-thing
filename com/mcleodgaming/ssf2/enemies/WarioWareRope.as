package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.hazards.WarioWareHazard;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class WarioWareRope extends Enemy
   {
       
      
      private var m_deathTimer:FrameTimer;
      
      public function WarioWareRope(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("warioware_rope",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("warioware_stats"));
         Attack("rope");
         this.m_deathTimer = new FrameTimer(30 * 3);
      }
      
      private function runAI() : void
      {
         var _loc3_:int = 0;
         var _loc1_:WarioWareHazard = WarioWareHazard(STAGEDATA.getHazard(WarioWareHazard));
         var _loc2_:int = 0;
         while(_loc2_ < m_didDamageList.length && _loc1_)
         {
            if(m_didDamageList[_loc2_] is Character)
            {
               _loc3_ = _loc1_.Winners.indexOf(Character(m_didDamageList[_loc2_]));
               if(_loc3_ >= 0)
               {
                  _loc1_.Winners.splice(_loc3_,1);
               }
            }
            _loc2_++;
         }
         if(STAGEDATA.StageBG.rope)
         {
            if(STAGEDATA.StageBG.rope.currentFrame === 30)
            {
               refreshAttackID();
            }
            m_attack.IsAttacking = STAGEDATA.StageBG.rope.currentFrame > 30;
         }
         else
         {
            m_attack.IsAttacking = false;
         }
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
               m_groundCollisionTest();
               performAttackChecks();
               if(m_attack.IsAttacking)
               {
                  attackCollisionTest();
               }
            }
         }
      }
   }
}
