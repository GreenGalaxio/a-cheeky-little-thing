package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class Amigo extends AssistTrophy
   {
       
      
      private var m_action:uint;
      
      private var m_nextActionTimer:FrameTimer;
      
      private var m_songID:String;
      
      private var m_loopLoc:Number;
      
      public function Amigo(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("amigo",param1,param2,param3,param4);
         m_gravity = 1.5;
         m_max_ySpeed = 30;
         m_width = 100;
         m_height = 80;
         this.m_action = 0;
         this.m_nextActionTimer = new FrameTimer(30 * 30);
         this.m_songID = STAGEDATA.SoundQueueRef.CurrentSongID;
         this.m_loopLoc = STAGEDATA.SoundQueueRef.LoopLocation;
         STAGEDATA.SoundQueueRef.stopMusic();
         STAGEDATA.SoundQueueRef.playMusic("samba",750);
         if(STAGEDATA.getPlayer(m_player_id) != null && STAGEDATA.getPlayer(m_player_id).Depth < Depth)
         {
            swapDepths(STAGEDATA.getPlayer(m_player_id));
         }
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < m_opponents.length)
         {
            if(STAGEDATA.getPlayer(m_opponents[_loc5_]) != null && STAGEDATA.getPlayer(m_opponents[_loc5_]).Depth < Depth)
            {
               swapDepths(STAGEDATA.getPlayer(m_opponents[_loc5_]));
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < STAGEDATA.ItemsRef.ItemsInUse.length)
         {
            if(STAGEDATA.ItemsRef.ItemsInUse[_loc5_] != null && STAGEDATA.ItemsRef.ItemsInUse[_loc5_].Depth < Depth)
            {
               swapDepths(STAGEDATA.ItemsRef.ItemsInUse[_loc5_]);
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < STAGEDATA.Enemies.length)
         {
            if(STAGEDATA.Enemies[_loc5_] != null && STAGEDATA.Enemies[_loc5_].UID != m_uid && STAGEDATA.Enemies[_loc5_].Depth < Depth)
            {
               swapDepths(STAGEDATA.Enemies[_loc5_]);
            }
            _loc5_++;
         }
      }
      
      override public function destroy() : void
      {
         super.destroy();
         if(STAGEDATA.SoundQueueRef.CurrentSongID == "samba")
         {
            STAGEDATA.SoundQueueRef.stopMusic();
            STAGEDATA.SoundQueueRef.playMusic(this.m_songID,this.m_loopLoc);
         }
      }
      
      private function runAI() : void
      {
         var _loc1_:int = 0;
         if(this.m_action == 0)
         {
            this.m_nextActionTimer.tick();
            if(this.m_nextActionTimer.IsComplete)
            {
               m_fadeTimer.reset();
               this.m_action = 1;
               if(STAGEDATA.SoundQueueRef.CurrentSongID == "samba")
               {
                  STAGEDATA.SoundQueueRef.stopMusic();
                  STAGEDATA.SoundQueueRef.playMusic(this.m_songID,this.m_loopLoc);
               }
            }
            else
            {
               _loc1_ = 0;
               _loc1_ = 0;
               while(_loc1_ < m_opponents.length)
               {
                  if(STAGEDATA.getPlayer(m_opponents[_loc1_]).ID != m_player_id)
                  {
                     STAGEDATA.getPlayer(m_opponents[_loc1_]).forceTaunt();
                  }
                  _loc1_++;
               }
            }
         }
         else if(this.m_action == 1)
         {
            if(m_fadeTimer.IsComplete)
            {
               this.destroy();
            }
         }
      }
      
      override protected function move() : void
      {
         if(!m_collision.ground)
         {
            m_attemptToMove(m_xSpeed,m_ySpeed);
         }
         else
         {
            m_sprite.x = m_sprite.x + m_xSpeed;
            attachToGround();
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
               if(this.m_action == 0)
               {
                  fadeIn();
               }
               else
               {
                  fadeOut();
               }
               performAttackChecks();
               attackCollisionTest();
               this.move();
               gravity();
               m_groundCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
