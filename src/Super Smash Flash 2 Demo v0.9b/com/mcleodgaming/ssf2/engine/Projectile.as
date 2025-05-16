package com.mcleodgaming.ssf2.engine
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundObject;
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.enums.ModeFeatures;
   import com.mcleodgaming.ssf2.enums.PState;
   import com.mcleodgaming.ssf2.events.SSF2Event;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.platforms.Platform;
   import com.mcleodgaming.ssf2.util.Controller;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class Projectile extends InteractiveSprite
   {
      
      public static const ATTACK_IDLE:String = "attack_idle";
       
      
      private var m_linkage_id:String;
      
      private var m_masterSprite:InteractiveSprite;
      
      private var m_bounce_total:int;
      
      private var m_xSpeedInit:Number;
      
      private var m_ySpeedInit:Number;
      
      private var m_x_start:Number;
      
      private var m_y_start:Number;
      
      private var m_time:int;
      
      private var m_dead:Boolean;
      
      private var m_attachedEffect:Boolean;
      
      private var m_trailEffectTimer:int;
      
      private var m_homingAngle:Number;
      
      private var m_opponents:Vector.<int>;
      
      private var m_reverseTimer:int;
      
      private var m_wasReversed:Boolean;
      
      private var m_damageWasDone:Boolean;
      
      private var m_x_influence:Number;
      
      private var m_y_influence:Number;
      
      private var m_angle:Number;
      
      private var m_latch_id:InteractiveSprite;
      
      private var m_latch_xLoc:Number;
      
      private var m_latch_yLoc:Number;
      
      private var m_hasSwitched:Boolean;
      
      private var m_rocketReadyTimer:FrameTimer;
      
      private var m_lastSFX:int;
      
      private var m_lastVFX:int;
      
      private var m_keys:Controller;
      
      private var m_enemyFlag:Boolean;
      
      private var m_enemy:Enemy;
      
      private var m_volume_sfx:Number;
      
      private var m_volume_vfx:Number;
      
      private var m_projectileStats:ProjectileAttack;
      
      private var m_projectileStatsOriginal:ProjectileAttack;
      
      private var m_staleID:String;
      
      public function Projectile(param1:Object, param2:ProjectileAttack, param3:StageData, param4:Enemy = null)
      {
         this.m_enemyFlag = param4 !== null;
         this.m_enemy = param4;
         this.m_linkage_id = param2.LinkageID;
         var _loc5_:MovieClip = Main.getLibraryMC(this.m_linkage_id,!this.m_enemyFlag && m_player_id > 0?Number(param3.getPlayer(m_player_id).ExpansionID):Number(-1));
         _loc5_.name = "proj" + Main.GuidString;
         _loc5_.ACTIVE = true;
         super(_loc5_,param3);
         m_player_id = param1["player_id"];
         m_attackData = param2.AttackDataObj;
         m_attackData.Owner = this;
         this.m_projectileStats = new ProjectileAttack();
         this.m_projectileStats.importProjectileData(param2.exportProjectileData());
         this.m_projectileStatsOriginal = new ProjectileAttack();
         this.m_projectileStatsOriginal.importProjectileData(param2.exportProjectileData());
         var _loc6_:String = null;
         m_xSpeed = Boolean(param1["facingForward"])?Number(param2.XSpeed):Number(-param2.XSpeed);
         this.m_xSpeedInit = m_xSpeed;
         m_ySpeed = param2.YSpeed;
         this.m_ySpeedInit = param2.YSpeed;
         this.m_dead = false;
         this.m_bounce_total = 0;
         this.m_x_start = param1["x_start"];
         this.m_y_start = param1["y_start"];
         m_sizeRatio = param1["sizeRatio"];
         this.m_staleID = param1["frame"];
         if(this.m_projectileStats.LockSize && !this.m_enemyFlag)
         {
            m_sizeRatio = STAGEDATA.getPlayer(m_player_id).OriginalSizeRatio;
         }
         if(!this.m_enemyFlag)
         {
            this.m_volume_sfx = param1["volume_sfx"];
            this.m_volume_vfx = param1["volume_vfx"];
         }
         else
         {
            this.m_volume_sfx = 1;
            this.m_volume_vfx = 1;
         }
         m_sprite.width = m_sprite.width * m_sizeRatio;
         m_sprite.height = m_sprite.height * m_sizeRatio;
         m_width = param2.Width;
         m_height = param2.Height;
         m_facingForward = param1["facingForward"];
         m_sprite.x = param1["x_start"];
         m_sprite.y = this.m_y_start;
         this.m_hasSwitched = false;
         this.m_keys = param1["keys"];
         if(param2.InheritPalette && m_player_id > 0)
         {
            STAGEDATA.getPlayer(m_player_id).updateColorFilter(m_sprite,STAGEDATA.getPlayer(m_player_id).Team > 0 && !ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME,STAGEDATA.GameRef.GameMode)?int(STAGEDATA.getPlayer(m_player_id).Team):int(null),STAGEDATA.getPlayer(m_player_id).CurrentStatsName,STAGEDATA.getPlayer(m_player_id).CostumeID);
         }
         m_lastAttackID = new Array(15);
         m_lastAttackIndex = 0;
         this.m_x_influence = 0;
         this.m_y_influence = 0;
         if(this.m_projectileStats.ControlDirection >= 0)
         {
            this.m_projectileStats.importProjectileData({"controlDirection":Utils.forceBase360(this.m_projectileStats.ControlDirection)});
            this.m_angle = this.m_projectileStats.ControlDirection;
            m_xSpeed = Utils.fastAbs(m_xSpeed);
            this.m_xSpeedInit = m_xSpeed;
            this.angleControl(this.m_xSpeedInit,this.m_projectileStats.ControlDirection);
         }
         else
         {
            this.m_angle = 0;
         }
         this.m_lastSFX = -1;
         this.m_lastVFX = -1;
         this.m_rocketReadyTimer = new FrameTimer(5);
         this.m_latch_id = null;
         this.m_latch_xLoc = 0;
         this.m_latch_yLoc = 0;
         this.m_reverseTimer = 0;
         this.m_wasReversed = false;
         this.m_opponents = param1["opponents"];
         m_terrains = param1["terrains"];
         m_platforms = param1["platforms"];
         this.m_homingAngle = Utils.forceBase360(Utils.getAngleBetween(new Point(),new Point(m_xSpeed,m_ySpeed)));
         this.m_trailEffectTimer = 0;
         this.m_attachedEffect = false;
         this.m_damageWasDone = false;
         m_sprite.player_id = m_player_id;
         m_sprite.projectile_id = m_uid;
         STAGEDATA.addProjectile(this);
         m_sprite.cam_width = m_width;
         m_sprite.cam_height = m_height;
         m_currentPlatform = null;
         m_collision = new Collision();
         if(!m_facingForward)
         {
            this.m_faceLeft();
         }
         this.m_time = 0;
         m_attack = new AttackState(this);
         m_attack.importAttackStateData(param2.exportAttackStateData());
         if(this.m_enemyFlag)
         {
            m_attack.AttackID = !!this.m_projectileStats.LinkAttackID?int(this.m_enemy.AttackStateData.AttackID):int(Utils.getUID());
         }
         else
         {
            m_attack.AttackID = this.m_projectileStats.LinkAttackID && m_player_id > 0?int(STAGEDATA.getPlayer(m_player_id).AttackStateData.AttackID):int(Utils.getUID());
         }
         m_attack.XLoc = m_sprite.x;
         m_attack.YLoc = m_sprite.y;
         m_attack.IsForward = m_facingForward;
         m_attack.ChargeTime = param1["chargetime"];
         m_attack.ChargeTimeMax = param1["chargetime_max"];
         m_attack.Frame = Projectile.ATTACK_IDLE;
         m_attack.SizeStatus = param1["sizeStatus"];
         m_attack.ExecTime = 0;
         m_attack.RefreshRate = m_attackData.getAttack(m_attack.Frame).RefreshRate;
         m_attack.ForceComboContinue = m_attackData.getAttack(m_attack.Frame).ForceComboContinue;
         m_attack.RefreshRateReady = false;
         m_attackData.getAttack(m_attack.Frame).OverrideMap.clear();
         m_attack.StaleMultiplier = param1["staleMultiplier"];
         m_attack.IsAttacking = true;
         m_team_id = param1["team_id"];
         if(!this.m_enemyFlag && m_player_id > 0 && STAGEDATA.getPlayer(m_player_id) != null && STAGEDATA.getPlayer(m_player_id).AttackStateData.IsAttacking && STAGEDATA.getPlayer(m_player_id).AttackStateData.IsThrow)
         {
            m_attack.IsThrow = true;
         }
         if(!this.m_enemyFlag)
         {
            this.m_masterSprite = STAGEDATA.getPlayer(m_player_id);
         }
         else
         {
            this.m_masterSprite = this.m_enemy;
         }
         m_started = false;
         this.buildHitBoxData();
         if(Main.DEBUG)
         {
            verifiyHitBoxData();
         }
         if(Stance && Stance["frame1"] as Function)
         {
            (Stance["frame1"] as Function)();
         }
         this.syncStats();
      }
      
      private function buildHitBoxData() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:MovieClip = null;
         if(HitBoxManager.HitBoxManageList[this.m_linkage_id] != null)
         {
            m_hitBoxManager = HitBoxManager.HitBoxManageList[this.m_linkage_id];
         }
         else
         {
            m_hitBoxManager = new HitBoxManager(this.m_linkage_id);
            _loc2_ = 0;
            _loc3_ = 0;
            _loc1_ = Main.getLibraryMC(this.m_linkage_id);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.totalFrames)
            {
               _loc1_.gotoAndStop(_loc2_ + 1);
               if(_loc1_)
               {
                  if(_loc1_.stance)
                  {
                     Utils.removeActionScript(_loc1_.stance);
                     m_hitBoxManager.addHitBoxAnimation(HitBoxAnimation.createHitBoxAnimation(this.m_linkage_id + "_" + _loc1_.currentLabel,_loc1_.stance,_loc1_));
                  }
               }
               _loc2_++;
            }
         }
      }
      
      override public function get CurrentAnimation() : HitBoxAnimation
      {
         return m_hitBoxManager == null?null:m_hitBoxManager.HitBoxAnimationList.length <= 0 || !m_sprite.currentLabel?null:m_hitBoxManager.getHitBoxAnimation(this.m_linkage_id + "_" + m_sprite.currentLabel);
      }
      
      override public function m_attemptToMove(param1:Number, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Point = null;
         var _loc5_:Platform = null;
         var _loc6_:Boolean = false;
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         if(!(param1 == 0 && param2 == 0))
         {
            _loc3_ = 0;
            m_collision.leftSide = param1 < 0 && m_collision.ground && testTerrainWithCoord(m_sprite.x + param1 - 11,m_sprite.y + param2 - 25);
            m_collision.rightSide = param1 > 0 && m_collision.ground && testTerrainWithCoord(m_sprite.x + param1 + 11,m_sprite.y + param2 - 25);
            if(!m_collision.ground && !this.m_projectileStats.Ghost && !this.m_projectileStats.Latch)
            {
               _loc4_ = Location.clone();
               _loc5_ = moveSprite(param1,param2);
               _loc6_ = _loc5_ != null;
               if(m_collision.rightSide && param1 > 0 || m_collision.leftSide && param1 < 0)
               {
                  m_sprite.x = _loc4_.x;
               }
               _loc7_ = getCollisionQuadrants(Utils.getAngleBetween(new Point(_loc4_.x,_loc4_.y),new Point(m_sprite.x,m_sprite.y)));
               if(_loc6_ && !_loc7_.bottom && !(m_sprite.x == _loc4_.x && m_sprite.y == _loc4_.y))
               {
                  m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HIT_WALL,{
                     "caller":this,
                     "left":_loc7_.left,
                     "right":_loc7_.right,
                     "top":_loc7_.top
                  }));
               }
               if(_loc6_ && param2 >= 0)
               {
                  this.m_groundCollisionTest();
               }
               if(_loc6_ && this.m_projectileStats.Sticky)
               {
                  this.stick();
               }
               if(this.m_projectileStats.Boomerang)
               {
                  if(_loc6_ || m_collision.leftSide && m_xSpeed < 0 || m_collision.rightSide && m_xSpeed > 0)
                  {
                     this.m_hasSwitched = true;
                     m_xSpeed = m_xSpeed * -1;
                     m_ySpeed = m_ySpeed * -1;
                  }
               }
            }
            else if(!this.m_projectileStats.Ghost && !this.m_projectileStats.Latch)
            {
               _loc8_ = 10;
               param1 = param1 / _loc8_;
               param2 = param2 / _loc8_;
               _loc9_ = false;
               _loc3_ = 0;
               while(_loc3_ < _loc8_ && !this.m_dead)
               {
                  m_collision.leftSide = param1 < 0 && m_collision.ground && testTerrainWithCoord(m_sprite.x + param1 - 11,m_sprite.y + param2 - 25);
                  m_collision.rightSide = param1 > 0 && m_collision.ground && testTerrainWithCoord(m_sprite.x + param1 + 11,m_sprite.y + param2 - 25);
                  if(m_collision.leftSide || m_collision.rightSide)
                  {
                     _loc9_ = true;
                  }
                  if(param2 < 0 && !testTerrainWithCoord(m_sprite.x,m_sprite.y + param2))
                  {
                     m_sprite.y = m_sprite.y + param2;
                  }
                  m_sprite.x = m_sprite.x + (!(!this.m_projectileStats.Ghost && m_collision.rightSide && param1 > 0 || !this.m_projectileStats.Ghost && m_collision.leftSide && param1 < 0)?param1:0);
                  if(param2 > 0 && !testTerrainWithCoord(m_sprite.x,m_sprite.y + param2))
                  {
                     m_sprite.y = m_sprite.y + param2;
                  }
                  if(!this.m_dead)
                  {
                     this.attachToGround();
                  }
                  _loc3_++;
               }
               if(_loc9_)
               {
                  m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HIT_WALL,{
                     "caller":this,
                     "left":m_collision.leftSide,
                     "right":m_collision.rightSide,
                     "top":false
                  }));
                  if(this.m_projectileStats.Boomerang)
                  {
                     if(m_collision.leftSide && m_xSpeed < 0 || m_collision.rightSide && m_xSpeed > 0)
                     {
                        this.m_hasSwitched = true;
                        m_xSpeed = m_xSpeed * -1;
                        m_ySpeed = m_ySpeed * -1;
                     }
                  }
               }
            }
            else
            {
               m_sprite.x = m_sprite.x + param1;
               m_sprite.y = m_sprite.y + param2;
            }
         }
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         if(this.m_projectileStats.Suspend)
         {
            return;
         }
         if(!this.m_projectileStats.Ghost && !this.m_dead && m_ySpeed >= 0 && !this.m_projectileStats.Latch && this.m_projectileStats.RideGround)
         {
            _loc1_ = m_collision.ground;
            if(m_collision.ground && !m_ySpeed < 0)
            {
               this.attachToGround();
            }
            _loc2_ = (m_currentPlatform = testGroundWithCoord(m_sprite.x,m_sprite.y + 1)) != null;
            m_currentPlatform = testGroundWithCoord(m_sprite.x,m_sprite.y + 1);
            m_collision.ground = _loc2_;
            if(m_collision.ground && !m_collision.leftSide && !m_collision.rightSide)
            {
               this.attachToGround();
            }
            if(!this.m_dead && m_collision.ground && !(this.m_ySpeedInit == 0 && m_gravity == 0) && !_loc1_)
            {
            }
            if(!this.m_dead && m_collision.ground && !_loc1_)
            {
               m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.GROUND_TOUCH,{"caller":this}));
            }
         }
      }
      
      private function getGround(param1:Number, param2:Number) : Platform
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < m_terrains.length && !m_terrains[_loc3_].hitTestPoint(param1,param2 + 1,true))
         {
            _loc3_++;
         }
         if(_loc3_ < m_terrains.length && m_terrains[_loc3_].hitTestPoint(param1,param2 + 1,true) && m_terrains[_loc3_].fallthrough != true)
         {
            return m_terrains[_loc3_];
         }
         _loc3_ = 0;
         while(_loc3_ < m_platforms.length && !m_platforms[_loc3_].hitTestPoint(param1,param2 + 1,true))
         {
            _loc3_++;
         }
         if(_loc3_ < m_platforms.length && m_platforms[_loc3_].hitTestPoint(param1,param2 + 1,true) && m_ySpeed >= 0 && m_platforms[_loc3_].fallthrough != true)
         {
            return m_platforms[_loc3_];
         }
         return null;
      }
      
      override protected function m_faceRight() : void
      {
         if(!this.m_projectileStats.NoFlip)
         {
            m_sprite.scaleX = Math.abs(m_sprite.scaleX);
         }
         m_facingForward = true;
      }
      
      override protected function m_faceLeft() : void
      {
         if(!this.m_projectileStats.NoFlip)
         {
            m_sprite.scaleX = -Math.abs(m_sprite.scaleX);
         }
         m_facingForward = false;
      }
      
      override protected function attachToGround() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Boolean = true;
         if(m_ySpeed >= 0 && this.m_projectileStats.RideGround)
         {
            _loc3_ = 0;
            _loc2_ = m_sprite.y + 20;
            while(m_sprite.y < _loc2_ && !testCoordCollision(m_sprite.x,m_sprite.y))
            {
               m_sprite.y++;
            }
            this.checkIfDead();
            if(!testCoordCollision(m_sprite.x,m_sprite.y) || this.m_dead)
            {
               m_sprite.y = _loc2_ - 20;
            }
            if(m_currentPlatform != null && m_ySpeed >= 0)
            {
               _loc3_ = 0;
               while(m_currentPlatform.hitTestPoint(GlobalX,GlobalY,true) && m_currentPlatform.fallthrough != true)
               {
                  m_sprite.y = m_sprite.y - 1 / 4;
                  _loc3_ = _loc3_ + 1 / 4;
               }
               this.checkIfDead();
               if((_loc3_ >= (STAGEDATA.Terrains.indexOf(m_currentPlatform) >= 0)?Boolean(40):Boolean(10)) || this.m_dead)
               {
                  m_sprite.y = m_sprite.y + _loc3_;
                  if(!OnTerrain)
                  {
                  }
                  if(this.m_projectileStats.Sticky && OnTerrain)
                  {
                     this.stick();
                  }
                  if(!OnTerrain)
                  {
                  }
                  _loc1_ = false;
               }
            }
            else
            {
               _loc1_ = false;
            }
         }
         else
         {
            _loc1_ = false;
         }
         return _loc1_;
      }
      
      public function get ProjectileAttackObj() : ProjectileAttack
      {
         return this.m_projectileStats;
      }
      
      public function get Dead() : Boolean
      {
         return this.m_dead;
      }
      
      public function get Attack() : AttackState
      {
         return m_attack;
      }
      
      public function get Visible() : Boolean
      {
         return m_sprite.visible;
      }
      
      public function get LinkageID() : String
      {
         return this.m_linkage_id;
      }
      
      public function get PlayerID() : int
      {
         return m_player_id;
      }
      
      public function get TeamID() : int
      {
         return m_team_id;
      }
      
      public function get Time() : int
      {
         return this.m_time;
      }
      
      public function get Instance() : MovieClip
      {
         return m_sprite;
      }
      
      public function get Latched() : Boolean
      {
         return this.m_latch_id != null;
      }
      
      public function get LatchID() : InteractiveSprite
      {
         return this.m_latch_id;
      }
      
      public function get WasReversed() : Boolean
      {
         return this.m_wasReversed;
      }
      
      public function get JustReversed() : Boolean
      {
         return Boolean(this.m_reverseTimer > 0);
      }
      
      public function isReversed() : Boolean
      {
         return this.m_wasReversed;
      }
      
      public function isDead() : Boolean
      {
         return this.m_dead;
      }
      
      public function getCurrentCharge() : int
      {
         return m_attack.ChargeTime;
      }
      
      public function getCurrentMaxCharge() : int
      {
         return m_attack.ChargeTimeMax;
      }
      
      public function getLinkageID() : String
      {
         return this.m_linkage_id;
      }
      
      public function getProjectileStat(param1:String) : *
      {
         return this.m_projectileStats.getVar(param1);
      }
      
      public function exportStats() : Object
      {
         return this.m_projectileStatsOriginal.exportProjectileData();
      }
      
      public function updateProjectileStats(param1:Object) : void
      {
         this.m_projectileStats.importProjectileData(param1);
         this.syncStats();
      }
      
      override public function updateAttackStats(param1:Object) : void
      {
         super.updateAttackStats(param1);
         this.syncStats();
      }
      
      override protected function syncStats() : void
      {
         m_gravity = this.m_projectileStats.Gravity;
         m_max_ySpeed = this.m_projectileStats.MaxGravity;
         m_width = this.m_projectileStats.Width;
         m_height = this.m_projectileStats.Height;
      }
      
      public function forceContinue() : void
      {
         this.continueAfterCrash();
      }
      
      public function setMasterSprite(param1:InteractiveSprite) : void
      {
         this.m_masterSprite = param1;
      }
      
      public function angleControl(param1:Number, param2:Number) : void
      {
         m_xSpeed = param1 * Math.cos(param2 * Math.PI / 180);
         m_ySpeed = -param1 * Math.sin(param2 * Math.PI / 180);
      }
      
      private function checkIfDead() : void
      {
         if(this.m_projectileStats.Suspend)
         {
            return;
         }
         if(!this.m_dead && !this.m_projectileStats.SurviveDeathBounds && (this.m_projectileStats.ControlDirection == -1 && (m_sprite.x < STAGEDATA.DeathBounds.x || m_sprite.x > STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width || m_sprite.y < STAGEDATA.DeathBounds.y || m_sprite.y > STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height)))
         {
            this.destroy();
         }
         else if(this.m_projectileStats.TimeMax != -1 && this.m_time >= this.m_projectileStats.TimeMax && !this.m_dead)
         {
            this.destroy();
         }
         else if((m_xSpeed <= 0 && this.m_xSpeedInit > 0 || m_xSpeed >= 0 && this.m_xSpeedInit < 0) && this.m_projectileStats.XDecay != 0)
         {
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.PROJ_X_DECAY_COMPLETE,{"caller":this}));
         }
      }
      
      private function stopSoundsAfterDeath() : void
      {
         if(m_attack.CancelSoundOnEnd)
         {
            this.stopSoundID(this.m_lastSFX);
            this.m_lastSFX = -1;
         }
         if(m_attack.CancelVoiceOnEnd)
         {
            this.stopSoundID(this.m_lastSFX);
            this.m_lastVFX = -1;
         }
      }
      
      private function stopSoundID(param1:int) : void
      {
         var _loc2_:SoundObject = null;
         if(param1 >= 0)
         {
            _loc2_ = STAGEDATA.SoundQueueRef.getSoundObject(param1);
            if(_loc2_.IsPlaying && _loc2_.IsPlaying)
            {
               _loc2_.stop();
            }
         }
      }
      
      public function playSpecificSound(param1:String) : int
      {
         return this.m_lastSFX = STAGEDATA.SoundQueueRef.playSoundEffect(param1,this.m_volume_sfx);
      }
      
      public function playSpecificVoice(param1:String) : int
      {
         return this.m_lastVFX = STAGEDATA.SoundQueueRef.playVoiceEffect(param1,this.m_volume_vfx);
      }
      
      public function playGlobalSound(param1:String) : int
      {
         return this.m_lastSFX = STAGEDATA.SoundQueueRef.playSoundEffect(param1,this.m_volume_sfx);
      }
      
      public function destroy(param1:SSF2Event = null) : void
      {
         if(!this.m_dead)
         {
            STAGEDATA.CamRef.deleteTarget(m_sprite);
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.PROJ_DESTROYED,{"caller":this}));
            this.stopSoundsAfterDeath();
            this.m_dead = true;
            if(m_sprite.parent)
            {
               m_sprite.parent.removeChild(m_sprite);
            }
            removeAllTempEvents();
            flushTimers();
         }
      }
      
      public function endControl() : void
      {
         this.m_projectileStats.importProjectileData({
            "controlDirection":-1,
            "influenceXMovement":-1,
            "influenceYMovement":-2
         });
         this.m_x_influence = 0;
         this.m_y_influence = 0;
      }
      
      public function stick() : void
      {
         m_xSpeed = 0;
         m_ySpeed = 0;
         this.m_projectileStats.importProjectileData({
            "xdecay":0,
            "sticky":false
         });
         m_max_ySpeed = 0;
         m_gravity = 0;
      }
      
      private function continueAfterCrash() : void
      {
      }
      
      private function checkInfluence() : void
      {
         var _loc1_:Object = !this.m_enemyFlag?STAGEDATA.getPlayer(m_player_id).getControls():null;
         if(!this.m_enemyFlag && (this.m_projectileStats.InfluenceXMovement > 0 || this.m_projectileStats.InfluenceYMovement > 0) && !(STAGEDATA.getPlayer(m_player_id).IsCaught || STAGEDATA.getPlayer(m_player_id).StandBy))
         {
            if(_loc1_.UP && !_loc1_.DOWN && _loc1_.LEFT && !_loc1_.RIGHT)
            {
               this.m_x_influence = this.m_x_influence - (this.m_projectileStats.InfluenceXFactor > 0 && this.m_projectileStats.InfluenceXMovement > 0?this.m_projectileStats.InfluenceXFactor:0);
               this.m_y_influence = this.m_y_influence - (this.m_projectileStats.InfluenceYFactor > 0 && this.m_projectileStats.InfluenceYMovement > 0?this.m_projectileStats.InfluenceYFactor:0);
            }
            else if(_loc1_.UP && !_loc1_.DOWN && !_loc1_.LEFT && _loc1_.RIGHT)
            {
               this.m_x_influence = this.m_x_influence + (this.m_projectileStats.InfluenceXFactor > 0 && this.m_projectileStats.InfluenceXMovement > 0?this.m_projectileStats.InfluenceXFactor:0);
               this.m_y_influence = this.m_y_influence - (this.m_projectileStats.InfluenceYFactor > 0 && this.m_projectileStats.InfluenceYMovement > 0?this.m_projectileStats.InfluenceYFactor:0);
            }
            else if(!_loc1_.UP && _loc1_.DOWN && _loc1_.LEFT && !_loc1_.RIGHT)
            {
               this.m_x_influence = this.m_x_influence - (this.m_projectileStats.InfluenceXFactor > 0 && this.m_projectileStats.InfluenceXMovement > 0?this.m_projectileStats.InfluenceXFactor:0);
               this.m_y_influence = this.m_y_influence + (this.m_projectileStats.InfluenceYFactor > 0 && this.m_projectileStats.InfluenceYMovement > 0?this.m_projectileStats.InfluenceYFactor:0);
            }
            else if(!_loc1_.UP && _loc1_.DOWN && !_loc1_.LEFT && _loc1_.RIGHT)
            {
               this.m_x_influence = this.m_x_influence + (this.m_projectileStats.InfluenceXFactor > 0 && this.m_projectileStats.InfluenceXMovement > 0?this.m_projectileStats.InfluenceXFactor:0);
               this.m_y_influence = this.m_y_influence + (this.m_projectileStats.InfluenceYFactor > 0 && this.m_projectileStats.InfluenceYMovement > 0?this.m_projectileStats.InfluenceYFactor:0);
            }
            else if(_loc1_.UP && !_loc1_.DOWN && !_loc1_.LEFT && !_loc1_.RIGHT)
            {
               this.m_y_influence = this.m_y_influence - (this.m_projectileStats.InfluenceYFactor > 0 && this.m_projectileStats.InfluenceYMovement > 0?this.m_projectileStats.InfluenceYFactor:0);
            }
            else if(!_loc1_.UP && _loc1_.DOWN && !_loc1_.LEFT && !_loc1_.RIGHT)
            {
               this.m_y_influence = this.m_y_influence + (this.m_projectileStats.InfluenceYFactor > 0 && this.m_projectileStats.InfluenceYMovement > 0?this.m_projectileStats.InfluenceYFactor:0);
            }
            else if(!_loc1_.UP && !_loc1_.DOWN && _loc1_.LEFT && !_loc1_.RIGHT)
            {
               this.m_x_influence = this.m_x_influence - (this.m_projectileStats.InfluenceXFactor > 0 && this.m_projectileStats.InfluenceXMovement > 0?this.m_projectileStats.InfluenceXFactor:0);
            }
            else if(!_loc1_.UP && !_loc1_.DOWN && !_loc1_.LEFT && _loc1_.RIGHT)
            {
               this.m_x_influence = this.m_x_influence + (this.m_projectileStats.InfluenceXFactor > 0 && this.m_projectileStats.InfluenceXMovement > 0?this.m_projectileStats.InfluenceXFactor:0);
            }
            else
            {
               if(this.m_x_influence > 0 && this.m_x_influence - this.m_projectileStats.InfluenceXFactor < 0 && this.m_projectileStats.InfluenceXFactor > 0)
               {
                  this.m_x_influence = 0;
               }
               else if(this.m_x_influence < 0 && this.m_x_influence + this.m_projectileStats.InfluenceXFactor > 0 && this.m_projectileStats.InfluenceXFactor > 0)
               {
                  this.m_x_influence = 0;
               }
               else if(this.m_x_influence != 0 && this.m_projectileStats.InfluenceXFactor > 0)
               {
                  this.m_x_influence = this.m_x_influence - this.m_projectileStats.InfluenceXFactor;
               }
               if(this.m_y_influence > 0 && this.m_y_influence - this.m_projectileStats.InfluenceYFactor < 0 && this.m_projectileStats.InfluenceYFactor > 0)
               {
                  this.m_y_influence = 0;
               }
               else if(this.m_y_influence < 0 && this.m_y_influence + this.m_projectileStats.InfluenceYFactor > 0 && this.m_projectileStats.InfluenceYFactor > 0)
               {
                  this.m_y_influence = 0;
               }
               else if(this.m_y_influence != 0 && this.m_projectileStats.InfluenceYFactor > 0)
               {
                  this.m_y_influence = this.m_y_influence - this.m_projectileStats.InfluenceYFactor;
               }
            }
            if(this.m_x_influence > this.m_projectileStats.InfluenceXMovement)
            {
               this.m_x_influence = this.m_projectileStats.InfluenceXMovement;
            }
            if(this.m_x_influence < -this.m_projectileStats.InfluenceXMovement)
            {
               this.m_x_influence = -this.m_projectileStats.InfluenceXMovement;
            }
            if(this.m_y_influence > this.m_projectileStats.InfluenceYMovement)
            {
               this.m_y_influence = this.m_projectileStats.InfluenceYMovement;
            }
            if(this.m_y_influence < -this.m_projectileStats.InfluenceYMovement)
            {
               this.m_y_influence = -this.m_projectileStats.InfluenceYMovement;
            }
         }
      }
      
      private function checkControls() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:Object = !this.m_enemyFlag?STAGEDATA.getPlayer(m_player_id).getControls():null;
         if(!this.m_enemyFlag && this.m_projectileStats.ControlDirection >= 0 && !(STAGEDATA.getPlayer(m_player_id).IsCaught || STAGEDATA.getPlayer(m_player_id).StandBy))
         {
            if(this.m_projectileStats.CalcAngle)
            {
               _loc2_ = this.m_angle;
               _loc3_ = this.m_angle;
               if(_loc1_.UP && !_loc1_.DOWN && _loc1_.LEFT && !_loc1_.RIGHT)
               {
                  _loc2_ = 135;
               }
               else if(_loc1_.UP && !_loc1_.DOWN && !_loc1_.LEFT && _loc1_.RIGHT)
               {
                  _loc2_ = 45;
               }
               else if(!_loc1_.UP && _loc1_.DOWN && _loc1_.LEFT && !_loc1_.RIGHT)
               {
                  _loc2_ = 225;
               }
               else if(!_loc1_.UP && _loc1_.DOWN && !_loc1_.LEFT && _loc1_.RIGHT)
               {
                  _loc2_ = 315;
               }
               else if(_loc1_.UP && !_loc1_.DOWN && !_loc1_.LEFT && !_loc1_.RIGHT)
               {
                  _loc2_ = 90;
               }
               else if(!_loc1_.UP && _loc1_.DOWN && !_loc1_.LEFT && !_loc1_.RIGHT)
               {
                  _loc2_ = 270;
               }
               else if(!_loc1_.UP && !_loc1_.DOWN && _loc1_.LEFT && !_loc1_.RIGHT)
               {
                  _loc2_ = 180;
               }
               else if(!_loc1_.UP && !_loc1_.DOWN && !_loc1_.LEFT && _loc1_.RIGHT)
               {
                  _loc2_ = 0;
               }
               _loc4_ = Utils.calculateDifferenceBetweenAngles(_loc2_,_loc3_) / 6;
               this.m_angle = this.m_angle - _loc4_;
               this.m_angle = Utils.forceBase360(this.m_angle);
               this.angleControl(this.m_xSpeedInit,this.m_angle);
            }
            else
            {
               if(_loc1_.UP && !_loc1_.DOWN && _loc1_.LEFT && !_loc1_.RIGHT)
               {
                  this.m_angle = 135;
               }
               else if(_loc1_.UP && !_loc1_.DOWN && !_loc1_.LEFT && _loc1_.RIGHT)
               {
                  this.m_angle = 45;
               }
               else if(!_loc1_.UP && _loc1_.DOWN && _loc1_.LEFT && !_loc1_.RIGHT)
               {
                  this.m_angle = 225;
               }
               else if(!_loc1_.UP && _loc1_.DOWN && !_loc1_.LEFT && _loc1_.RIGHT)
               {
                  this.m_angle = 315;
               }
               else if(_loc1_.UP && !_loc1_.DOWN && !_loc1_.LEFT && !_loc1_.RIGHT)
               {
                  this.m_angle = 90;
               }
               else if(!_loc1_.UP && _loc1_.DOWN && !_loc1_.LEFT && !_loc1_.RIGHT)
               {
                  this.m_angle = 270;
               }
               else if(!_loc1_.UP && !_loc1_.DOWN && _loc1_.LEFT && !_loc1_.RIGHT)
               {
                  this.m_angle = 180;
               }
               else if(!_loc1_.UP && !_loc1_.DOWN && !_loc1_.LEFT && _loc1_.RIGHT)
               {
                  this.m_angle = 0;
               }
               this.angleControl(this.m_xSpeedInit,this.m_angle);
            }
            return true;
         }
         return false;
      }
      
      public function syncPosition() : void
      {
         var _loc1_:Point = null;
         var _loc2_:Point = null;
         if(this.m_projectileStats.LockTrajectory && !this.m_enemyFlag && STAGEDATA.getPlayer(m_player_id).HasPLockBox)
         {
            _loc1_ = STAGEDATA.getPlayer(m_player_id).MC.stance.localToGlobal(new Point(STAGEDATA.getPlayer(m_player_id).MC.stance.pLockBox.x,STAGEDATA.getPlayer(m_player_id).MC.stance.pLockBox.y));
            _loc1_ = STAGEDATA.getPlayer(m_player_id).MC.stance.localToGlobal(new Point(STAGEDATA.getPlayer(m_player_id).MC.stance.pLockBox.x,STAGEDATA.getPlayer(m_player_id).MC.stance.pLockBox.y));
            _loc2_ = STAGE.globalToLocal(_loc1_);
            m_sprite.x = _loc2_.x;
            m_sprite.y = _loc2_.y;
            m_attack.XLoc = m_sprite.x;
            m_attack.YLoc = m_sprite.y;
         }
         else if(this.m_projectileStats.LockTrajectory && this.m_enemyFlag)
         {
            m_sprite.x = this.m_enemy.X;
            m_sprite.y = this.m_enemy.Y;
            m_attack.XLoc = m_sprite.x;
            m_attack.YLoc = m_sprite.y;
         }
      }
      
      private function getDistanceFrom(param1:Number, param2:Number) : Number
      {
         return Math.sqrt(Math.pow(param1 - m_sprite.x,2) + Math.pow(param2 - m_sprite.y,2));
      }
      
      private function findHomingTarget() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = 99999999;
         var _loc3_:Vector.<HitBoxCollisionResult> = null;
         var _loc4_:Character = null;
         var _loc5_:Item = null;
         var _loc6_:TargetTestTarget = null;
         m_attack.HomingTarget = null;
         _loc1_ = 0;
         while(_loc1_ < STAGEDATA.ItemsRef.MAXITEMS && m_attack.HomingTarget == null)
         {
            if(HasHoming)
            {
               _loc5_ = STAGEDATA.ItemsRef.ItemsInUse[_loc1_];
               if(_loc5_ != null && _loc5_.MC.hitBox != null && _loc5_.IsSmashBall && (_loc3_ = InteractiveSprite.hitTest(this,_loc5_,HitBoxSprite.HOMING,HitBoxSprite.HIT)).length > 0)
               {
                  m_attack.HomingTarget = _loc5_;
                  m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HOMING_TARGET,{
                     "caller":this,
                     "target":_loc4_,
                     "type":"Item"
                  }));
               }
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.m_opponents.length)
         {
            if(HasHoming)
            {
               _loc4_ = STAGEDATA.getPlayer(this.m_opponents[_loc1_]);
               if(!_loc4_.StandBy && !_loc4_.Revival && !_loc4_.AirDodge && _loc4_.HasHitBox && !_loc4_.Dead && !_loc4_.Invincible && (m_attack.HomingTarget == null || this.getDistanceFrom(m_attack.HomingTarget.X,m_attack.HomingTarget.Y) < _loc2_) && (_loc3_ = InteractiveSprite.hitTest(this,_loc4_,HitBoxSprite.HOMING,HitBoxSprite.HIT)).length > 0 && !(this.m_wasReversed && (m_attack.ReverseID == _loc4_.ID || m_attack.ReverseTeam == m_team_id && !STAGEDATA.TeamDamage)))
               {
                  m_attack.HomingTarget = _loc4_;
                  _loc2_ = this.getDistanceFrom(m_attack.HomingTarget.X,m_attack.HomingTarget.Y);
                  m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HOMING_TARGET,{
                     "caller":this,
                     "target":_loc4_,
                     "type":"Character"
                  }));
               }
            }
            _loc1_++;
         }
         if(this.m_wasReversed && HasHoming)
         {
            _loc4_ = STAGEDATA.getPlayer(m_player_id);
            if(!_loc4_.StandBy && !_loc4_.Revival && !_loc4_.AirDodge && _loc4_.HasHitBox && !_loc4_.Dead && !_loc4_.Invincible && (m_attack.HomingTarget == null || this.getDistanceFrom(m_attack.HomingTarget.X,m_attack.HomingTarget.Y) < _loc2_) && (_loc3_ = InteractiveSprite.hitTest(this,_loc4_,HitBoxSprite.HOMING,HitBoxSprite.HIT)).length > 0)
            {
               m_attack.HomingTarget = _loc4_;
               _loc2_ = this.getDistanceFrom(m_attack.HomingTarget.X,m_attack.HomingTarget.Y);
               m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HOMING_TARGET,{
                  "caller":this,
                  "target":_loc4_,
                  "type":"Character"
               }));
            }
         }
         _loc1_ = 0;
         while(_loc1_ < STAGEDATA.Targets.length)
         {
            if(HasHoming)
            {
               _loc6_ = STAGEDATA.Targets[_loc1_];
               if(!_loc6_.Broken && (m_attack.HomingTarget == null || this.getDistanceFrom(m_attack.HomingTarget.X,m_attack.HomingTarget.Y) < _loc2_) && (_loc3_ = InteractiveSprite.hitTest(this,_loc6_,HitBoxSprite.HOMING,HitBoxSprite.HIT)).length > 0)
               {
                  m_attack.HomingTarget = _loc6_;
                  _loc2_ = this.getDistanceFrom(m_attack.HomingTarget.X,m_attack.HomingTarget.Y);
                  m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HOMING_TARGET,{
                     "caller":this,
                     "target":_loc5_,
                     "type":"Item"
                  }));
               }
            }
            _loc1_++;
         }
      }
      
      private function projectileMove() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         var _loc5_:MovieClip = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.m_projectileStats.Suspend)
         {
            return;
         }
         if(!this.m_dead && !isHitStunOrParalysis())
         {
            if(this.m_projectileStats.HomingSpeed >= 0 && !m_attack.HomingTarget)
            {
               this.findHomingTarget();
            }
            if(m_attack.HomingTarget)
            {
               _loc1_ = Utils.getAngleBetween(new Point(m_sprite.x,m_sprite.y),new Point(m_attack.HomingTarget.X,m_attack.HomingTarget.Y));
               _loc2_ = Utils.calculateDifferenceBetweenAngles(this.m_homingAngle,_loc1_);
               this.m_homingAngle = this.m_homingAngle + Utils.forceBase360(_loc2_ / this.m_projectileStats.HomingEase);
               m_xSpeed = Utils.calculateXSpeed(this.m_projectileStats.HomingSpeed,this.m_homingAngle);
               m_ySpeed = -Utils.calculateYSpeed(this.m_projectileStats.HomingSpeed,this.m_homingAngle);
               if(this.m_projectileStats.HomingSpeed != 0 && this.m_projectileStats.XDecay != 0)
               {
                  _loc3_ = this.m_projectileStats.HomingSpeed > 0;
                  this.m_projectileStats.HomingSpeed = this.m_projectileStats.HomingSpeed - this.m_projectileStats.XDecay;
                  if(_loc3_ && this.m_projectileStats.HomingSpeed < 0 || !_loc3_ && this.m_projectileStats.HomingSpeed > 0)
                  {
                     this.m_projectileStats.HomingSpeed = 0;
                     this.checkIfDead();
                  }
               }
            }
            applyGroundInfluence();
            this.m_rocketReadyTimer.tick();
            this.checkInfluence();
            if(this.checkControls())
            {
               this.m_attemptToMove(m_xSpeed + this.m_x_influence,0);
               this.m_attemptToMove(0,m_ySpeed + this.m_y_influence);
            }
            else if(this.m_projectileStats.LockTrajectory)
            {
               this.syncPosition();
            }
            else
            {
               if(!m_collision.ground && !this.m_projectileStats.Boomerang && m_gravity > 0)
               {
                  if(!this.m_projectileStats.Boomerang && m_ySpeed < m_max_ySpeed)
                  {
                     m_ySpeed = m_ySpeed + m_gravity;
                  }
               }
               else if(this.m_projectileStats.Bounce <= 0 && m_ySpeed > 0 && m_collision.ground && !this.m_projectileStats.Boomerang)
               {
                  m_ySpeed = 0;
               }
               else if(this.m_projectileStats.Boomerang)
               {
                  if(this.m_hasSwitched && (this.m_xSpeedInit < 0 && m_sprite.x <= this.m_masterSprite.MC.x || this.m_xSpeedInit > 0 && m_sprite.x >= this.m_masterSprite.MC.x))
                  {
                     if(m_sprite.y <= this.m_masterSprite.MC.y && m_ySpeed < m_max_ySpeed)
                     {
                        m_ySpeed = m_ySpeed + m_gravity;
                     }
                     else if(m_sprite.y > this.m_masterSprite.MC.y && m_ySpeed > -m_max_ySpeed)
                     {
                        m_ySpeed = m_ySpeed - m_gravity;
                     }
                  }
                  else if(!this.m_hasSwitched)
                  {
                     if(this.m_xSpeedInit < 0 && m_xSpeed >= 0 || this.m_xSpeedInit > 0 && m_xSpeed <= 0)
                     {
                        this.m_hasSwitched = true;
                        this.m_projectileStats.importProjectileData({"ghost":true});
                     }
                     else if(Math.abs(m_ySpeed) > 1)
                     {
                        if(m_ySpeed > 0)
                        {
                           m_ySpeed = m_ySpeed - m_gravity;
                        }
                        else if(m_ySpeed < 0)
                        {
                           m_ySpeed = m_ySpeed + m_gravity;
                        }
                     }
                  }
               }
               _loc4_ = 0;
               if(m_sprite.rotation > 20 && m_collision.ground)
               {
                  _loc4_ = 8;
               }
               else if(m_sprite.rotation < -20 && m_collision.ground)
               {
                  _loc4_ = -8;
               }
               if(_loc4_ < 0)
               {
               }
               if(!(m_attack.IsAttacking && !this.m_projectileStats.CanFallOff && !m_attack.CanFallOff && m_collision.ground && !testGroundWithCoord(m_xSpeed > 0?Number(m_sprite.x + m_xSpeed + 10):Number(m_sprite.x + m_xSpeed - 10),m_sprite.y + 9)))
               {
                  if(_loc4_ < 0)
                  {
                     this.m_attemptToMove(0,_loc4_);
                     this.m_attemptToMove(m_xSpeed + this.m_x_influence,0);
                  }
                  else if(_loc4_ > 0)
                  {
                     this.m_attemptToMove(m_xSpeed + this.m_x_influence,0);
                     this.m_attemptToMove(0,_loc4_);
                     this.m_attemptToMove(0,_loc4_);
                  }
                  else
                  {
                     this.m_attemptToMove(m_xSpeed + this.m_x_influence,_loc4_);
                  }
               }
               if(m_collision.ground)
               {
                  this.attachToGround();
               }
               if(this.m_xSpeedInit > 0)
               {
                  m_xSpeed = m_xSpeed - (m_xSpeed > -this.m_xSpeedInit?this.m_projectileStats.XDecay:0);
                  if(!this.m_projectileStats.Boomerang && m_xSpeed < 0 && this.m_projectileStats.XDecay != 0)
                  {
                     this.m_projectileStats.importProjectileData({"xdecay":0});
                     m_xSpeed = 0;
                  }
               }
               else
               {
                  m_xSpeed = m_xSpeed + (m_xSpeed < -this.m_xSpeedInit?this.m_projectileStats.XDecay:0);
                  if(!this.m_projectileStats.Boomerang && m_xSpeed > 0 && this.m_projectileStats.XDecay != 0)
                  {
                     this.m_projectileStats.importProjectileData({"xdecay":0});
                     m_xSpeed = 0;
                  }
               }
               this.m_attemptToMove(0,m_ySpeed + this.m_y_influence);
               if(m_collision.ground && this.m_projectileStats.Bounce > 0 && m_ySpeed >= 0)
               {
                  this.m_bounce_total++;
                  if(!(this.m_projectileStats.BounceLimit > 0 && this.m_bounce_total > this.m_projectileStats.BounceLimit))
                  {
                     m_ySpeed = -this.m_projectileStats.Bounce;
                     this.m_projectileStats.Bounce = this.m_projectileStats.Bounce * this.m_projectileStats.BounceDecay;
                     while(this.m_projectileStats.BounceMaxHeight > 0 && this.getBounceHeight(m_ySpeed) > this.m_projectileStats.BounceMaxHeight)
                     {
                        m_ySpeed++;
                     }
                     unnattachFromGround();
                     m_collision.ground = false;
                  }
               }
               if(this.m_projectileStats.FollowUser)
               {
                  m_sprite.x = !!m_facingForward?Number(this.m_masterSprite.MC.x + this.m_projectileStats.XOffset * m_sizeRatio):Number(this.m_masterSprite.MC.x - this.m_projectileStats.XOffset * m_sizeRatio);
                  m_sprite.y = this.m_masterSprite.MC.y + this.m_projectileStats.YOffset * m_sizeRatio;
               }
            }
            if(!this.m_dead)
            {
               m_attack.XLoc = m_sprite.x;
               m_attack.YLoc = m_sprite.y;
               m_attack.IsForward = this.m_projectileStats.ControlDirection >= 0?Boolean(m_xSpeed > 0):Boolean(m_facingForward);
            }
         }
         if(!this.m_dead && this.m_projectileStats.TrailEffect != null)
         {
            this.m_trailEffectTimer++;
            if(this.m_trailEffectTimer >= this.m_projectileStats.TrailEffectInterval)
            {
               this.m_trailEffectTimer = 0;
               _loc5_ = STAGEDATA.attachEffectOverlay(this.m_projectileStats.TrailEffect);
               _loc5_.x = OverlayX;
               _loc5_.y = OverlayY;
               if(!m_facingForward)
               {
                  _loc5_.scaleX = _loc5_.scaleX * -1;
               }
               if(this.m_projectileStats.TrailEffectRotate)
               {
                  if(this.m_projectileStats.ControlDirection && this.m_projectileStats.CalcAngle)
                  {
                     _loc6_ = this.m_angle;
                     _loc6_ = Utils.forceBase360(!!m_facingForward?Number(-_loc6_):Number(-_loc6_ + 180));
                     _loc5_.rotation = _loc6_;
                  }
                  else
                  {
                     _loc7_ = Utils.getAngleBetween(new Point(0,0),new Point(m_xSpeed,m_ySpeed));
                     _loc7_ = Utils.forceBase360(!!m_facingForward?Number(-_loc7_):Number(-_loc7_ + 180));
                     _loc5_.rotation = _loc7_;
                  }
               }
            }
         }
         if(!this.m_dead && !this.m_projectileStats.Ghost)
         {
            if(m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35) || m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35))
            {
               m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HIT_WALL,{
                  "caller":this,
                  "left":m_xSpeed < 0,
                  "right":m_xSpeed > 0,
                  "top":false
               }));
            }
         }
      }
      
      private function getBounceHeight(param1:int) : Number
      {
         var _loc2_:Number = 0;
         while(param1 < 0 && m_gravity > 0)
         {
            _loc2_ = _loc2_ - param1;
            param1 = param1 + m_gravity;
         }
         return _loc2_;
      }
      
      override public function reverse(param1:int, param2:int, param3:Boolean) : Boolean
      {
         if(this.m_reverseTimer <= 0 && this.m_projectileStats.CanBeReversed && m_attack.ReverseID !== param1 && !(param2 == m_team_id && m_team_id > 0 && !STAGEDATA.TeamDamage))
         {
            if(!m_facingForward)
            {
               m_facingForward = true;
               this.m_faceRight();
               m_attack.IsForward = true;
            }
            else
            {
               m_facingForward = false;
               this.m_faceLeft();
               m_attack.IsForward = false;
            }
            this.m_reverseTimer = 2;
            m_team_id = param2;
            m_attack.ReverseID = param1;
            m_attack.ReverseTeam = param2;
            this.m_wasReversed = true;
            m_xSpeed = m_xSpeed * -1;
            if(this.m_projectileStats.ControlInitDirection < 0)
            {
               this.m_xSpeedInit = this.m_xSpeedInit * -1;
            }
            if(this.m_projectileStats.TimeMax != -1)
            {
               this.m_time = this.m_time - Math.round(this.m_projectileStats.TimeMax / 2);
            }
            if(this.m_projectileStats.TimeMax != -1 && this.m_time < 0)
            {
               this.m_time = 0;
            }
            if(this.m_projectileStats.Boomerang)
            {
               this.m_hasSwitched = true;
            }
            return true;
         }
         return false;
      }
      
      private function checkReverse() : void
      {
         if(!this.m_dead)
         {
            if(this.m_reverseTimer > 0)
            {
               this.m_reverseTimer--;
            }
         }
      }
      
      private function checkIfLinked() : void
      {
         if(this.m_projectileStats.LinkAttackID)
         {
            if(this.m_enemyFlag)
            {
               this.m_enemy.AttackStateData.AttackID = m_attack.AttackID;
            }
            else if(m_player_id > 0)
            {
               STAGEDATA.getPlayer(m_player_id).AttackStateData.AttackID = m_attack.AttackID;
            }
         }
      }
      
      override public function reactionShield(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         if(this.m_projectileStats.Suspend)
         {
            return false;
         }
         var _loc3_:Character = Boolean(param1 as Character)?Character(param1):null;
         var _loc4_:AttackDamage = m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack);
         if(_loc3_ && _loc3_.inState(CState.SHIELDING))
         {
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT_SHIELD,{
               "caller":this,
               "receiver":param1,
               "attackBoxData":_loc4_.exportAttackDamageData()
            }));
            if(_loc3_.takeShieldDamage(m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack),param2.OverlapHitBox))
            {
               m_eventManager.dispatchEvent(new SSF2Event(!!Character(param1).PerfectShield?SSF2Event.ATTACK_HIT_POWER_SHIELD:SSF2Event.ATTACK_HIT_SHIELD,{
                  "caller":this,
                  "receiver":param1,
                  "attackBoxData":_loc4_.exportAttackDamageData()
               }));
               m_attack.RefreshRateReady = true;
               if(_loc3_.PerfectShield && _loc4_.Priority >= -1 && _loc4_.Priority < 7)
               {
                  if(this.m_projectileStats.CanBeReversed)
                  {
                     this.reverse(param1.ID,param1.Team,param1.FacingForward);
                  }
               }
               return true;
            }
            return false;
         }
         return false;
      }
      
      override public function reactionShieldProjectile(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         if(this.m_projectileStats.Suspend)
         {
            return false;
         }
         var _loc3_:AttackDamage = m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack);
         if(_loc3_.Priority < 7 && _loc3_.Priority > -1)
         {
            attachEffect("effect_cancel",param2 && param2.OverlapHitBox?{
               "x":param2.OverlapHitBox.centerx,
               "y":param2.OverlapHitBox.centery,
               "absolute":true
            }:null);
            this.destroy();
            if(param1 as Character)
            {
               Character(param1).pushBackSlightly(m_sprite.x < param1.X);
            }
            return true;
         }
         return false;
      }
      
      override public function reactionReverse(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         if(this.m_projectileStats.Suspend)
         {
            return false;
         }
         if(!(param1 as Character) && !(param1 as Item && (!Item(param1).CanBeReversed || Item(param1).JustReversed || !Item(param1).Thrown || param1.ID == m_player_id && !Item(param1).OwnerCanAffect)) && !(param1 as Projectile && (!Projectile(param1).ProjectileAttackObj.CanBeReversed || Projectile(param1).JustReversed)))
         {
            if(param1.reverse(m_player_id,m_team_id,!m_facingForward))
            {
               param1.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.REVERSE,{
                  "caller":param1,
                  "opponent":this,
                  "attackBoxData":null
               }));
               return true;
            }
            return false;
         }
         return false;
      }
      
      override public function reactionAbsorb(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         if(this.m_projectileStats.Suspend)
         {
            return false;
         }
         if(this.m_projectileStats.CanBeAbsorbed && param1.LastAttackID.indexOf(m_attack.AttackID) < 0)
         {
            this.destroy();
            return true;
         }
         return false;
      }
      
      override public function reactionClank(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         if(this.m_projectileStats.Suspend)
         {
            return false;
         }
         if(this.m_dead)
         {
            return false;
         }
         var _loc3_:AttackDamage = m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack);
         var _loc4_:AttackDamage = param1.AttackDataObj.getAttackBoxData(param1.AttackStateData.Frame,param2.SecondHitBox.Name).syncState(param1.AttackStateData);
         if(!attackIDArrayContains(_loc4_.AttackID) && !(_loc3_.PlayerID == _loc4_.PlayerID && !_loc3_.HurtSelf) && !(_loc3_.TeamID > 0 && _loc3_.TeamID == _loc4_.TeamID && (_loc3_.HurtSelf || STAGEDATA.TeamDamage)))
         {
            m_attack.RefreshRateReady = true;
            stackAttackID(param1.AttackStateData.AttackID);
            if(_loc3_.Priority == _loc4_.Priority && _loc3_.Priority < 7 && _loc3_.Priority > -1)
            {
               m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CLANK,{
                  "caller":this,
                  "receiver":param1,
                  "callerAttackBoxData":_loc3_.exportAttackDamageData(),
                  "receiverAttackBoxData":_loc4_.exportAttackDamageData()
               }));
               param1.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CLANK,{
                  "caller":param1,
                  "receiver":this,
                  "callerAttackBoxData":_loc4_.exportAttackDamageData(),
                  "receiverAttackBoxData":_loc3_.exportAttackDamageData()
               }));
               attachEffect("effect_cancel",param2 && param2.OverlapHitBox?{
                  "x":param2.OverlapHitBox.centerx,
                  "y":param2.OverlapHitBox.centery,
                  "absolute":true
               }:null);
               param1.attachEffect("effect_cancel",param2 && param2.OverlapHitBox?{
                  "x":param2.OverlapHitBox.centerx,
                  "y":param2.OverlapHitBox.centery,
                  "absolute":true
               }:null);
               this.destroy();
               if(param1 is Projectile)
               {
                  Projectile(param1).destroy();
               }
               if(!this.m_enemyFlag && m_player_id > 0)
               {
                  STAGEDATA.getPlayer(m_player_id).startActionShot(_loc3_.SelfHitStun);
               }
            }
            else if(_loc3_.Priority > _loc4_.Priority && _loc4_.Priority < 7 && _loc4_.Priority > -1)
            {
               if(_loc4_.HitStunProjectile <= 0)
               {
                  param1.attachEffect("effect_cancel",param2 && param2.OverlapHitBox?{
                     "x":param2.OverlapHitBox.centerx,
                     "y":param2.OverlapHitBox.centery,
                     "absolute":true
                  }:null);
                  if(param1 is Projectile)
                  {
                     Projectile(param1).destroy();
                  }
               }
               else
               {
                  startActionShot(_loc4_.HitStunProjectile);
               }
               if(!this.m_enemyFlag && m_player_id > 0)
               {
                  STAGEDATA.getPlayer(m_player_id).startActionShot(_loc3_.SelfHitStun);
               }
            }
            else if(_loc3_.Priority < _loc4_.Priority && _loc3_.Priority < 7 && _loc3_.Priority > -1)
            {
               attachEffect("effect_cancel",param2 && param2.OverlapHitBox?{
                  "x":param2.OverlapHitBox.centerx,
                  "y":param2.OverlapHitBox.centery,
                  "absolute":true
               }:null);
               this.destroy();
               if(!this.m_enemyFlag && m_player_id > 0)
               {
                  STAGEDATA.getPlayer(m_player_id).startActionShot(_loc3_.SelfHitStun);
               }
            }
            return true;
         }
         return false;
      }
      
      override public function reactionCounter(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         if(this.m_projectileStats.Suspend)
         {
            return false;
         }
         var _loc3_:AttackDamage = param1.AttackDataObj.getAttackBoxData(param1.AttackStateData.Frame,param2.SecondHitBox.Name).syncState(m_attack);
         return true;
      }
      
      override public function reactionRange(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(this.m_projectileStats.Suspend)
         {
            return false;
         }
         var _loc3_:Character = Boolean(param1 as Character)?Character(param1):null;
         if(this.m_projectileStats.Suction && _loc3_ && !(_loc3_ && (_loc3_.isLandingOrSkiddingOrChambering() || _loc3_.Caught() || _loc3_.StandBy || _loc3_.Revival || _loc3_.Hanging)))
         {
            _loc4_ = (m_sprite.x - param1.X) / 20;
            _loc5_ = (m_sprite.y - param1.Y) / 20;
            param1.unnattachFromGround();
            param1.m_attemptToMove(_loc4_,0);
            param1.setYSpeed(_loc5_);
            return true;
         }
         return false;
      }
      
      override public function reactionHit(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         var _loc4_:Character = null;
         if(this.m_projectileStats.Suspend)
         {
            return false;
         }
         if(this.m_dead)
         {
            return false;
         }
         var _loc3_:AttackDamage = m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack);
         if(param1.ID == m_player_id && !param1.isIntangible() && !this.m_enemyFlag && !this.m_dead && this.m_rocketReadyTimer.IsComplete && this.m_projectileStats.RocketSpeed != 0 && !this.m_wasReversed && param1 as Character)
         {
            m_attack.RefreshRateReady = true;
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT,{
               "caller":this,
               "receiver":param1,
               "attackBoxData":_loc3_.exportAttackDamageData()
            }));
            _loc4_ = Character(param1);
            _loc4_.rocketCharacter(this.m_projectileStats.RocketSpeed,!!this.m_projectileStats.RocketAngleAbsolute?Number(Utils.getAngleBetween(new Point(m_sprite.x,m_sprite.y),new Point(_loc4_.X,_loc4_.Y - _loc4_.Height / 2))):Number(this.m_angle),this.m_projectileStats.RocketDecay,this.m_projectileStats.RocketRotation);
            this.m_projectileStats.RocketSpeed = 0;
            return true;
         }
         if(param1.takeDamage(_loc3_,param2.OverlapHitBox))
         {
            m_attack.RefreshRateReady = true;
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT,{
               "caller":this,
               "receiver":param1,
               "attackBoxData":_loc3_.exportAttackDamageData()
            }));
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_HIT,{
               "caller":this,
               "receiver":param1,
               "attackBoxData":_loc3_.exportAttackDamageData()
            }));
            if(param1.Invincible && !param1.Intangible && !(param1 as Character && Character(param1).Revival))
            {
               param1.attachEffect("effect_cancel",param2 && param2.OverlapHitBox?{
                  "x":param2.OverlapHitBox.centerx,
                  "y":param2.OverlapHitBox.centery,
                  "absolute":true
               }:null);
            }
            else
            {
               if(this.m_projectileStats.Stale && !this.m_enemyFlag && m_attack.Frame != null && m_player_id > 0 && this.m_staleID)
               {
                  STAGEDATA.getPlayer(m_player_id).queueMove(this.m_staleID);
                  this.m_staleID = null;
               }
               if(!this.m_enemyFlag)
               {
                  STAGEDATA.getPlayer(m_player_id).increaseComboCount(_loc3_,param1.ID);
               }
               startActionShot(Utils.calculateSelfHitStun(_loc3_.SelfHitStun,Utils.calculateChargeDamage(_loc3_)));
            }
            if(_loc3_.ReverseCharacter && param1 as Character || _loc3_.ReverseProjectile && param1 as Projectile || _loc3_.ReverseItem && param1 as Item)
            {
               if(param1.reverse(_loc3_.PlayerID,_loc3_.TeamID,_loc3_.IsForward))
               {
                  param1.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.REVERSE,{
                     "caller":param1,
                     "opponent":this,
                     "attackBoxData":_loc3_.exportAttackDamageData()
                  }));
               }
            }
            if(param1 as Item)
            {
               Item(param1).activate(_loc3_,Projectile);
            }
            return true;
         }
         return false;
      }
      
      override public function reactionCollide(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         if(this.m_projectileStats.Suspend)
         {
            return false;
         }
         if(!param1.Intangible)
         {
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.PROJ_COLLIDE,{
               "caller":this,
               "opponent":param1
            }));
         }
         if(param1.ID !== m_player_id && !param1.Intangible && this.m_projectileStats.Latch && this.m_latch_id == null && param1 as Character)
         {
            m_xSpeed = 0;
            this.m_projectileStats.XDecay = 0;
            m_ySpeed = 0;
            m_gravity = 0;
            m_max_ySpeed = 0;
            this.m_projectileStats.CanBeReversed = false;
            this.m_latch_id = Character(param1);
            this.m_latch_xLoc = m_sprite.x - param1.X;
            this.m_latch_yLoc = m_sprite.y - param1.Y;
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.PROJ_LATCHED,{
               "caller":this,
               "opponent":param1
            }));
            return true;
         }
         return false;
      }
      
      private function projectileAttackCollisionTest() : void
      {
         if(m_bypassCollisionTesting)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:Character = null;
         var _loc3_:Enemy = null;
         var _loc4_:Projectile = null;
         var _loc5_:Item = null;
         var _loc6_:TargetTestTarget = null;
         var _loc7_:Vector.<HitBoxCollisionResult> = null;
         var _loc8_:Array = null;
         if(!this.m_dead)
         {
            if(!isHitStunOrParalysis())
            {
               m_attack.ExecTime++;
               m_attack.RefreshRateTimer++;
               if(m_attack.RefreshRate > 0 && m_attack.RefreshRateReady && m_attack.RefreshRateTimer % m_attack.RefreshRate == 0)
               {
                  m_attack.AttackID = Utils.getUID();
               }
            }
            this.checkIfLinked();
            _loc1_ = 0;
            while(_loc1_ < this.m_opponents.length)
            {
               _loc2_ = STAGEDATA.getPlayer(this.m_opponents[_loc1_]);
               if(_loc2_ != null && !(!STAGEDATA.TeamDamage && _loc2_.Team == m_team_id && m_team_id > 0) && !_loc2_.StandBy && !_loc2_.Dead && !_loc2_.IsTeching && !_loc2_.inState(CState.STAR_KO) && !_loc2_.inState(CState.SCREEN_KO) && !_loc2_.inState(CState.REVIVAL))
               {
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.SHIELD,this.reactionShield);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.SHIELDPROJECTILE,this.reactionShieldProjectile);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.ABSORB,this.reactionAbsorb);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.REVERSE,HitBoxSprite.ATTACK,this.reactionReverse);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.REVERSE,HitBoxSprite.HIT,this.reactionReverse);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.ATTACK,this.reactionClank);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.EGG,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.FREEZE,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.STAR,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.COUNTER,HitBoxSprite.ATTACK,this.reactionCounter);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.RANGE,HitBoxSprite.HIT,this.reactionRange);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.HIT,HitBoxSprite.HIT,this.reactionCollide);
               }
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.Projectiles.length)
            {
               _loc4_ = STAGEDATA.Projectiles[_loc1_];
               if(_loc4_ && _loc4_ != this)
               {
                  InteractiveSprite.hitTest(this,_loc4_,HitBoxSprite.ATTACK,HitBoxSprite.ATTACK,this.reactionClank);
               }
               _loc1_++;
            }
            if(m_player_id > 0)
            {
               InteractiveSprite.hitTest(this,STAGEDATA.getPlayer(m_player_id),HitBoxSprite.REVERSE,HitBoxSprite.ATTACK,this.reactionReverse);
               InteractiveSprite.hitTest(this,STAGEDATA.getPlayer(m_player_id),HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
               InteractiveSprite.hitTest(this,STAGEDATA.getPlayer(m_player_id),HitBoxSprite.ATTACK,HitBoxSprite.SHIELD,this.reactionShield);
               InteractiveSprite.hitTest(this,STAGEDATA.getPlayer(m_player_id),HitBoxSprite.RANGE,HitBoxSprite.HIT,this.reactionRange);
               InteractiveSprite.hitTest(this,STAGEDATA.getPlayer(m_player_id),HitBoxSprite.HIT,HitBoxSprite.HIT,this.reactionCollide);
            }
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.Enemies.length)
            {
               _loc3_ = STAGEDATA.Enemies[_loc1_];
               if(_loc3_ != null)
               {
                  InteractiveSprite.hitTest(this,_loc3_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc3_,HitBoxSprite.COUNTER,HitBoxSprite.ATTACK,this.reactionCounter);
               }
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.ItemsRef.MAXITEMS)
            {
               _loc5_ = STAGEDATA.ItemsRef.getItemData(_loc1_);
               if(_loc5_ != null)
               {
                  InteractiveSprite.hitTest(this,_loc5_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
               }
               _loc1_++;
            }
            if(STAGEDATA.GameRef.GameMode == Mode.TARGET_TEST)
            {
               _loc1_ = 0;
               while(_loc1_ < STAGEDATA.Targets.length)
               {
                  _loc6_ = STAGEDATA.Targets[_loc1_];
                  if(_loc6_ != null)
                  {
                     InteractiveSprite.hitTest(this,_loc6_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
                  }
                  _loc1_++;
               }
            }
            this.checkLatch();
         }
      }
      
      public function checkLatch() : void
      {
         var _loc1_:Character = null;
         if(this.m_latch_id != null)
         {
            _loc1_ = Boolean(this.m_latch_id as Character)?Character(this.m_latch_id):null;
            if(_loc1_ && (_loc1_.Revival || _loc1_.Dead || _loc1_.StandBy))
            {
               this.destroy();
               this.m_latch_id = null;
            }
            else if(this.m_projectileStats.LatchXOffset == 0 && this.m_projectileStats.LatchYOffset == 0)
            {
               m_sprite.x = this.m_latch_id.X + this.m_latch_xLoc;
               m_sprite.y = _loc1_ && _loc1_.Hanging?Number(this.m_latch_id.Y + this.m_latch_yLoc + this.m_latch_id.Height / 2):Number(this.m_latch_id.Y + this.m_latch_yLoc - this.m_latch_id.Height / 2);
            }
            else
            {
               m_sprite.x = this.m_latch_id.X + this.m_projectileStats.LatchXOffset;
               m_sprite.y = _loc1_ && _loc1_.Hanging?Number(this.m_latch_id.Y + this.m_projectileStats.LatchYOffset + this.m_latch_id.Height / 2):Number(this.m_latch_id.Y + this.m_projectileStats.LatchYOffset - this.m_latch_id.Height / 2);
            }
         }
      }
      
      private function visible() : Boolean
      {
         return m_sprite.visible;
      }
      
      private function setVar(param1:String, param2:*) : void
      {
         m_sprite[param1] = param2;
      }
      
      private function m_calcFlyingAngle() : void
      {
         var _loc1_:Number = NaN;
         if(m_attack.Rotate && !(m_xSpeed == 0 && m_ySpeed == 0 || this.m_projectileStats.HomingSpeed == 0 && m_attack.HomingTarget))
         {
            _loc1_ = Utils.getAngleBetween(new Point(0,0),new Point(m_xSpeed,m_ySpeed));
            _loc1_ = Utils.forceBase360(!!m_facingForward?Number(-_loc1_):Number(-_loc1_ + 180));
            m_sprite.rotation = _loc1_;
         }
      }
      
      private function checkWall() : void
      {
         if(!m_collision.ground && this.m_projectileStats.XOffset != 0 && !this.m_projectileStats.Ghost && !this.m_projectileStats.Latch && !this.m_dead && testTerrainWithCoord(m_sprite.x,m_sprite.y))
         {
            if(m_facingForward)
            {
               m_sprite.x = m_sprite.x - (this.m_projectileStats.XOffset > 0?1:-1);
            }
            else
            {
               m_sprite.x = m_sprite.x + (this.m_projectileStats.XOffset > 0?1:-1);
            }
         }
      }
      
      override protected function m_controlFrames() : void
      {
         if(m_state == PState.IDLE)
         {
            playFrame("idle");
         }
         else if(m_state == PState.DEAD)
         {
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!this.m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            if(this.m_projectileStats.TimeMax != -1 && !isHitStunOrParalysis())
            {
               this.m_time++;
            }
            checkHitStun();
            this.checkIfDead();
            this.projectileAttackCollisionTest();
            this.checkWall();
            this.m_groundCollisionTest();
            this.m_calcFlyingAngle();
            this.checkReverse();
            this.projectileMove();
            m_sprite.player_id = m_player_id;
            checkShowHitBoxes();
         }
      }
      
      override public function PREPERFORM() : void
      {
         if(m_started && HasStance && !this.m_dead && !STAGEDATA.Paused && !isHitStunOrParalysis())
         {
            Utils.advanceFrame(m_sprite.stance);
            Utils.recursiveMovieClipPlay(m_sprite.stance,true);
         }
      }
   }
}
