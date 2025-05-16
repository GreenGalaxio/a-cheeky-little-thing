package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class Silver extends AssistTrophy
   {
       
      
      private var m_action:Number;
      
      private var m_moveTimer:FrameTimer;
      
      public function Silver(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("silver",param1,param2,param3,param4);
         m_gravity = 1;
         m_max_ySpeed = 10;
         m_width = 30;
         m_height = 40;
         this.m_action = 0;
         m_attackData.importAttacks(Main.getEnemyAttackData("silver_stats"));
         this.m_moveTimer = new FrameTimer(30);
         STAGEDATA.playSpecificVoice("silver_attack");
      }
      
      private function runAI() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Character = null;
         if(this.m_action == 0)
         {
            fadeIn();
            this.m_moveTimer.tick();
            if(m_fadeTimer.IsComplete && this.m_moveTimer.IsComplete)
            {
               this.m_moveTimer.reset();
               this.m_moveTimer.MaxTime = 30 * 8;
               this.m_action = 1;
               Attack("attack");
               m_attack.IsAttacking = true;
               m_gravity = 0;
               m_ySpeed = 0;
               unnattachFromGround();
            }
         }
         else if(this.m_action == 1)
         {
            if(this.m_moveTimer.CurrentTime >= 7)
            {
               m_sprite.y = m_sprite.y - 0.2;
               _loc2_ = 0;
               while(_loc2_ < m_opponents.length)
               {
                  _loc1_ = STAGEDATA.getPlayer(m_opponents[_loc2_]);
                  if(_loc1_)
                  {
                     if(!_loc1_.StandBy && !_loc1_.inState(CState.DEAD) && !_loc1_.inState(CState.STAR_KO) && !_loc1_.inState(CState.SCREEN_KO) && !_loc1_.inState(CState.REVIVAL) && !_loc1_.Invincible && !_loc1_.Intangible && _loc1_.HasHitBox && !_loc1_.Dodging)
                     {
                        updateAttackBoxStats(1,{"hasEffect":!(_loc1_.IsCaught || _loc1_.Flying)});
                        _loc1_.takeDamage(m_attackData.getAttackBoxData(m_attack.Frame,"attackBox").syncState(m_attack));
                     }
                  }
                  _loc2_++;
               }
            }
            this.m_moveTimer.tick();
            if(this.m_moveTimer.IsComplete)
            {
               this.m_action = 2;
               this.m_moveTimer.reset();
               this.m_moveTimer.MaxTime = 30;
               m_fadeTimer.reset();
               playFrame("end");
            }
         }
         else if(this.m_action == 2)
         {
            this.m_moveTimer.tick();
            if(this.m_moveTimer.IsComplete)
            {
               fadeOut();
               if(m_fadeTimer.IsComplete)
               {
                  destroy();
               }
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
               performAttackChecks();
               attackCollisionTest();
               move();
               checkHitStun();
               gravity();
               m_groundCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
