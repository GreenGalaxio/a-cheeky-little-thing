package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class BM_Bomb extends BlackMageEnemy
   {
       
      
      private var m_hoverTimer:FrameTimer;
      
      private var m_turnTimer:FrameTimer;
      
      private const HOVERSPEED:Number = 1;
      
      public function BM_Bomb(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         m_linkage_id = "bm_bomb";
         super(param1,param2,param3,param4);
         WALKSPEED = 2.5;
         m_max_ySpeed = 0;
         m_gravity = 0;
         this.m_hoverTimer = new FrameTimer(30 * 2);
         this.m_turnTimer = new FrameTimer(30 * 3);
         this.m_turnTimer.CurrentTime = Utils.randomInteger(1,this.m_turnTimer.MaxTime);
         m_attackData.importAttacks(Main.getEnemyAttackData("blackmage_bomb_stats"));
         Attack("walk");
      }
      
      override protected function move() : void
      {
         this.m_turnTimer.tick();
         if(this.m_turnTimer.IsComplete)
         {
            this.m_turnTimer.reset();
            if(m_facingForward)
            {
               m_faceLeft();
               m_xSpeed = m_xSpeed * -1;
            }
            else
            {
               m_faceRight();
               m_xSpeed = m_xSpeed * -1;
            }
         }
         this.m_hoverTimer.tick();
         if(this.m_hoverTimer.IsComplete)
         {
            this.m_hoverTimer.reset();
         }
         m_sprite.y = m_sprite.y + this.HOVERSPEED * Math.sin(360 * (this.m_hoverTimer.CurrentTime / this.m_hoverTimer.MaxTime) * Math.PI / 180);
         m_attemptToMove(m_xSpeed,0);
         m_attemptToMove(0,m_ySpeed);
      }
   }
}
