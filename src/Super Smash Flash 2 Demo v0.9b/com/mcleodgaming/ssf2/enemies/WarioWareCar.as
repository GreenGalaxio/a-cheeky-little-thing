package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.hazards.WarioWareHazard;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class WarioWareCar extends Enemy
   {
       
      
      private var X_SPEED:Number = 42;
      
      private var m_jump:Boolean;
      
      public function WarioWareCar(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("warioware_car",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("warioware_stats"));
         m_gravity = 2;
         m_max_ySpeed = 20;
         m_attack.IsAttacking = true;
         m_xSpeed = this.X_SPEED;
         var _loc5_:Array = ["car_potato","car_hotdog","car_shark"];
         Attack(_loc5_[Utils.randomInteger(0,2)]);
         this.m_jump = Utils.random() > 0.65;
         this.m_jump = true;
         forceOnGround();
      }
      
      override protected function m_faceLeft() : void
      {
         super.m_faceLeft();
         m_xSpeed = -this.X_SPEED;
      }
      
      override protected function m_faceRight() : void
      {
         super.m_faceRight();
         m_xSpeed = this.X_SPEED;
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
         if(this.m_jump && m_sprite.x > 0 && m_sprite.x < 450)
         {
            this.m_jump = false;
            unnattachFromGround();
            m_ySpeed = -20;
         }
         if(m_facingForward && m_sprite.x > STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width || !m_facingForward && m_sprite.x < STAGEDATA.DeathBounds.x)
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
               attackCollisionTest();
            }
         }
      }
   }
}
