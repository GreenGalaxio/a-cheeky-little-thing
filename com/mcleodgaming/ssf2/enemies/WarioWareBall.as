package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.hazards.WarioWareHazard;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class WarioWareBall extends Enemy
   {
       
      
      private var SPEED:Number = 18;
      
      private var m_action:int;
      
      private var m_bounceTimer:FrameTimer;
      
      public function WarioWareBall(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("warioware_ball",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("warioware_stats"));
         Attack("ball");
         m_xSpeed = Utils.random() > 0.5?Number(this.SPEED):Number(-this.SPEED);
         m_ySpeed = Utils.random() > 0.5?Number(this.SPEED):Number(-this.SPEED);
         this.m_action = 0;
         this.m_bounceTimer = new FrameTimer(30 * 3);
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
            if(m_sprite.x < STAGEDATA.CamBounds.x)
            {
               m_xSpeed = this.SPEED;
            }
            else if(m_sprite.x > STAGEDATA.CamBounds.x + STAGEDATA.CamBounds.width)
            {
               m_xSpeed = -this.SPEED;
            }
            if(m_sprite.y < STAGEDATA.CamBounds.y)
            {
               m_ySpeed = this.SPEED;
            }
            else if(m_sprite.y > STAGEDATA.CamBounds.y + STAGEDATA.CamBounds.height)
            {
               m_ySpeed = -this.SPEED;
            }
            this.m_bounceTimer.tick();
            if(this.m_bounceTimer.IsComplete)
            {
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            checkDeath();
         }
      }
      
      override protected function m_groundCollisionTest() : void
      {
         super.m_groundCollisionTest();
         if(m_collision.ground)
         {
            m_ySpeed = -this.SPEED;
            unnattachFromGround();
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
               this.m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
