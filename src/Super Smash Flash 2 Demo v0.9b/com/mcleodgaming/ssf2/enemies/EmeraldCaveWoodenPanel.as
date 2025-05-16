package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class EmeraldCaveWoodenPanel extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_type:String;
      
      private var m_respawnTimer:FrameTimer;
      
      private var m_regenerateTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_damage:Number;
      
      public function EmeraldCaveWoodenPanel(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("ecave_wood",param1,param2,param3,param4);
         this.m_action = 0;
         this.m_blinkToggle = false;
         this.m_regenerateTimer = new FrameTimer(30 * 2);
         this.m_respawnTimer = new FrameTimer(30 * 20);
         this.m_damage = 0;
         this.m_type = "";
      }
      
      public function setType(param1:String) : void
      {
         if(param1 == "ecave_wood_left")
         {
            m_sprite.x = -15.2;
            m_sprite.y = 128.7;
            createSelfPlatform(-13 / 2,-70 / 2,13,70);
            m_selfPlatform.setForegroundPiece(STAGEDATA.StageFG.woodpanel_left);
         }
         else if(param1 == "ecave_wood_topleft")
         {
            m_sprite.x = 87.25;
            m_sprite.y = 14.9;
            createSelfPlatform(-135 / 2,0,133,10);
            m_selfPlatform.setForegroundPiece(STAGEDATA.StageFG.woodpanel_topleft);
         }
         else if(param1 == "ecave_wood_topright")
         {
            m_sprite.x = 391.2;
            m_sprite.y = 14.9;
            createSelfPlatform(-135 / 2,0,133,10);
            m_selfPlatform.setForegroundPiece(STAGEDATA.StageFG.woodpanel_topright);
         }
         else if(param1 == "ecave_wood_right")
         {
            m_sprite.x = 494.05;
            m_sprite.y = 129.35;
            createSelfPlatform(-13 / 2,-70 / 2,13,70);
            m_selfPlatform.setForegroundPiece(STAGEDATA.StageFG.woodpanel_right);
         }
         else if(param1 == "ecave_wood_bottom")
         {
            m_sprite.x = 239.4;
            m_sprite.y = 209.4;
            createSelfPlatform(-150 / 2,0,150,10);
            m_selfPlatform.setForegroundPiece(STAGEDATA.StageFG.woodpanel_bottom);
         }
         m_selfPlatform.updateStart(new Point(m_sprite.x,m_sprite.y));
         playFrame(param1);
         this.m_type = param1;
      }
      
      private function runAI() : void
      {
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
               {
                  m_sprite.visible = false;
               }
               this.m_respawnTimer.tick();
               if(this.m_respawnTimer.IsComplete)
               {
                  this.m_respawnTimer.reset();
                  this.m_action = 2;
                  playFrame(this.m_type);
                  m_sprite.visible = true;
               }
            }
            else if(this.m_action == 2)
            {
               m_sprite.alpha = !!this.m_blinkToggle?Number(0.8):Number(0);
               m_selfPlatform.setAlpha(m_sprite.alpha);
               this.m_blinkToggle = !this.m_blinkToggle;
               this.m_regenerateTimer.tick();
               if(this.m_regenerateTimer.IsComplete)
               {
                  this.m_regenerateTimer.reset();
                  m_sprite.alpha = 1;
                  m_selfPlatform.setAlpha(m_sprite.alpha);
                  this.m_action = 0;
                  m_selfPlatform.fallthrough = false;
               }
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(param1.BypassEnemies || attackIDArrayContains(param1.AttackID) || this.m_action != 0)
         {
            return false;
         }
         stackAttackID(param1.AttackID);
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         STAGEDATA.playSpecificSound("emerald_door_break");
         this.m_damage = this.m_damage + Utils.calculateChargeDamage(param1);
         if(this.m_damage >= 20)
         {
            this.m_action = 1;
            m_selfPlatform.fallthrough = true;
            playFrame(this.m_type + "_break");
            m_selfPlatform.setAlpha(0);
         }
         return true;
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
               updateSelfPlatform();
            }
         }
      }
   }
}
