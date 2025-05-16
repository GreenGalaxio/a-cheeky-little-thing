package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.hazards.WarioWareHazard;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class WarioWareFoot extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_flipTimer:FrameTimer;
      
      private var m_stompTimer:FrameTimer;
      
      private var m_finishTimer:FrameTimer;
      
      private var m_movingRight:Boolean;
      
      public function WarioWareFoot(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("warioware_foot",param1,param2,param3,param4);
         m_gravity = 2;
         m_max_ySpeed = 9;
         m_attackData.importAttacks(Main.getEnemyAttackData("warioware_stats"));
         Attack("stomp");
         this.m_action = 0;
         this.m_flipTimer = new FrameTimer(Utils.randomInteger(10,50));
         this.m_stompTimer = new FrameTimer(58);
         this.m_movingRight = Utils.random() > 0.5;
         this.m_stompTimer = new FrameTimer(58);
         this.m_finishTimer = new FrameTimer(58);
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
         if(this.m_action == 0)
         {
            this.m_flipTimer.tick();
            if(this.m_flipTimer.IsComplete)
            {
               this.m_flipTimer.reset();
               this.m_flipTimer.MaxTime = Utils.randomInteger(10,50);
               this.m_movingRight = !this.m_movingRight;
            }
            m_xSpeed = !!this.m_movingRight?Number(8):Number(-8);
            this.m_stompTimer.tick();
            if(this.m_stompTimer.IsComplete)
            {
               this.m_stompTimer.reset();
               this.m_action = 1;
               m_xSpeed = 0;
               m_attack.IsAttacking = true;
            }
         }
         else if(this.m_action == 1)
         {
            this.m_finishTimer.tick();
            if(this.m_finishTimer.IsComplete)
            {
               this.m_finishTimer.reset();
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
               m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
