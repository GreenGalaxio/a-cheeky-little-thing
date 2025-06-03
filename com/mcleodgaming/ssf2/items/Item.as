package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.AttackObject;
   import com.mcleodgaming.ssf2.engine.AttackState;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.Collision;
   import com.mcleodgaming.ssf2.engine.HitBoxAnimation;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.HitBoxManager;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.ProjectileAttack;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.engine.TargetTestTarget;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.enums.IState;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.enums.ModeFeatures;
   import com.mcleodgaming.ssf2.events.SSF2Event;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import com.mcleodgaming.ssf2.util.Vcam;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class Item extends InteractiveSprite
   {
      
      public static const ATTACK_IDLE:String = "attack_idle";
      
      public static const ATTACK_NEUTRAL:String = "attack_neutral";
      
      public static const ATTACK_SMASH:String = "attack_smash";
      
      public static const ATTACK_TOSS:String = "attack_toss";
      
      public static const ATTACK_THROW:String = "attack_throw";
      
      public static const ATTACK_HOLD:String = "attack_hold";
       
      
      protected var m_linkage_id:String;
      
      protected var m_playerClassInstance:String;
      
      protected var m_slot:int;
      
      protected var m_originalPlayerID:int;
      
      protected var m_uses:int;
      
      protected var m_time:int;
      
      protected var m_dead:Boolean;
      
      protected var m_projectile:Vector.<Projectile>;
      
      protected var m_lastProjectile:int;
      
      protected var m_pickedUp:Boolean;
      
      protected var m_bounceOrig:Number;
      
      protected var m_bounce_limit:FrameTimer;
      
      protected var m_bounce_total:int;
      
      protected var m_specialActionOriginal:Boolean;
      
      protected var m_totalTime:int;
      
      protected var m_effectSound:String;
      
      protected var m_landSound:String;
      
      protected var m_thrown:Boolean;
      
      protected var m_backToss:Boolean;
      
      protected var m_hasHitPlayer:Boolean;
      
      protected var m_tossTimer:int;
      
      protected var m_opponents:Vector.<int>;
      
      protected var m_initTimer:int;
      
      protected var m_isSmashball:Boolean;
      
      protected var m_smashballTimer:int;
      
      protected var m_smashballSpeedingUp:Boolean;
      
      protected var m_smashballDamage:Number;
      
      protected var m_smashBallXOverride:Number;
      
      protected var m_smashBallXOverride_right:Boolean;
      
      protected var m_smashBallTarget:Object;
      
      protected var m_reverseTimer:int;
      
      protected var m_wasReversed:Boolean;
      
      protected var m_reverse_id:int;
      
      protected var m_richochetTimer:FrameTimer;
      
      protected var m_richochetX:Number;
      
      protected var m_richochetY:Number;
      
      protected var m_reactivationDelay:FrameTimer;
      
      protected var m_tmpVar:Boolean;
      
      protected var m_bounce_remaining:int;
      
      protected var m_itemStats:ItemData;
      
      public function Item(param1:ItemData, param2:int, param3:StageData)
      {
         var _loc6_:Number = NaN;
         var _loc7_:Vector.<MovieClip> = null;
         this.m_itemStats = new ItemData();
         this.m_itemStats.importItemData(param1.exportItemData());
         this.m_slot = param2;
         this.m_linkage_id = param1.LinkageID;
         m_sizeRatio = param1.SizeRatio;
         param3.ItemsRef.ItemsInUse[param2] = this;
         var _loc4_:MovieClip = Main.getLibraryMC(this.m_linkage_id);
         _loc4_.name = "item" + Main.GuidString;
         _loc4_.ACTIVE = true;
         super(_loc4_,param3);
         _loc4_.width = _loc4_.width * m_sizeRatio;
         _loc4_.height = _loc4_.height * m_sizeRatio;
         m_currentPlatform = null;
         m_player_id = 0;
         this.m_originalPlayerID = 0;
         m_team_id = -1;
         this.m_playerClassInstance = null;
         m_sprite.item_id = m_uid;
         if(this.m_linkage_id == "fooditem")
         {
            _loc6_ = Math.round(Utils.random() * (45 - 1) + 1);
            Utils.tryToGotoAndStop(m_sprite,_loc6_ * 2);
            if(_loc6_ >= 1 && _loc6_ <= 6)
            {
               this.m_itemStats.importItemData({"recover":10});
            }
            else if(_loc6_ >= 7 && _loc6_ <= 12)
            {
               this.m_itemStats.importItemData({"recover":5});
            }
            else if(_loc6_ >= 13 && _loc6_ <= 20)
            {
               this.m_itemStats.importItemData({"recover":4});
            }
            else if(_loc6_ >= 21 && _loc6_ <= 29)
            {
               this.m_itemStats.importItemData({"recover":3});
            }
            else if(_loc6_ >= 30 && _loc6_ <= 38)
            {
               this.m_itemStats.importItemData({"recover":2});
            }
            else if(_loc6_ >= 39 && _loc6_ <= 45)
            {
               this.m_itemStats.importItemData({"recover":1});
            }
         }
         this.m_specialActionOriginal = this.m_itemStats.SpecialAction;
         this.m_bounceOrig = this.m_itemStats.Bounce;
         this.m_bounce_limit = new FrameTimer(param1.BounceLimit);
         this.m_bounce_total = 0;
         this.m_uses = 0;
         this.m_tossTimer = 0;
         m_gravity = param1.Gravity;
         m_max_ySpeed = param1.MaxGravity;
         m_xSpeed = 0;
         m_ySpeed = 0;
         this.m_totalTime = 0;
         this.m_initTimer = 0;
         this.m_time = param1.TimeMax;
         m_lastAttackID = new Array(15);
         m_lastAttackIndex = 0;
         m_width = param1.Width;
         m_height = param1.Height;
         this.m_thrown = false;
         this.m_backToss = false;
         this.m_backToss = false;
         this.m_hasHitPlayer = false;
         this.m_opponents = new Vector.<int>();
         this.m_dead = false;
         this.m_pickedUp = false;
         m_collision = new Collision();
         this.m_effectSound = param1.EffectSound;
         this.m_landSound = param1.LandSound;
         m_attack = new AttackState(this);
         m_attackData = param1.AttackDataObj;
         m_attackData.Owner = this;
         m_attackData.importProjectiles(param1.Projectiles);
         this.m_projectile = new Vector.<Projectile>();
         var _loc5_:int = 0;
         while(_loc5_ < this.m_itemStats.MaxProjectile)
         {
            this.m_projectile[_loc5_] = null;
            _loc5_++;
         }
         this.m_bounce_remaining = !!param1.InitialBounce?int(3):int(0);
         this.m_lastProjectile = 0;
         this.m_isSmashball = Boolean(this.m_linkage_id == "smashball");
         this.m_smashballTimer = -1;
         this.m_smashballSpeedingUp = true;
         this.m_smashballDamage = Utils.random() * (30 - 25) + 25;
         this.m_smashBallXOverride = 0;
         this.m_smashBallXOverride_right = true;
         this.m_smashBallTarget = {
            "player":null,
            "X":0,
            "Y":0,
            "distance":0,
            "ground":true,
            "caught":false
         };
         m_actionShot = false;
         m_actionTimer = 0;
         m_hitStunTimer = 0;
         m_hitStunToggle = false;
         this.m_reverseTimer = 0;
         this.m_wasReversed = false;
         this.m_reverse_id = 0;
         this.m_richochetTimer = new FrameTimer(2);
         this.m_richochetX = 0;
         this.m_richochetY = 0;
         m_sprite.cam_width = m_width;
         m_sprite.cam_height = m_height;
         this.m_reactivationDelay = new FrameTimer(3);
         if(!this.m_isSmashball && Utils.random() > 0.5)
         {
            this.m_faceLeft();
         }
         this.buildHitBoxData();
         if(Main.DEBUG)
         {
            verifiyHitBoxData();
         }
         this.Attack(Item.ATTACK_IDLE,m_facingForward);
         this.getTerrainData();
         if(this.m_isSmashball && !STAGEDATA.FreezeKeys && CAM.Mode == Vcam.NORMAL_MODE)
         {
            _loc7_ = new Vector.<MovieClip>();
            _loc7_.push(m_sprite);
            STAGEDATA.CamRef.addTargets(_loc7_);
         }
         this.m_tmpVar = false;
         m_state = IState.IDLE;
         if(Stance && Stance["frame1"] as Function)
         {
            (Stance["frame1"] as Function)();
         }
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
      
      protected function m_initFunctions() : void
      {
      }
      
      public function isReversed() : Boolean
      {
         return this.m_wasReversed;
      }
      
      public function getCurrentProjectile() : Projectile
      {
         if(this.m_lastProjectile >= 0 && this.m_lastProjectile < this.m_projectile.length)
         {
            return this.m_projectile[this.m_lastProjectile];
         }
         return null;
      }
      
      public function getProjectile(param1:Number) : Projectile
      {
         if(param1 >= 0 && param1 < this.m_projectile.length)
         {
            return this.m_projectile[param1];
         }
         return null;
      }
      
      public function getProjectiles() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc2_] && !this.m_projectile[_loc2_].Dead)
            {
               _loc1_.push(this.m_projectile[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function getProjectileLimit(param1:String) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc3_] != null && this.m_projectile[_loc3_].LinkageID == param1)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function checkDeadProjectiles() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc1_] != null && this.m_projectile[_loc1_].Dead)
            {
               this.m_projectile[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      public function destroyAllProjectiles() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_itemStats.MaxProjectile && _loc1_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc1_] != null)
            {
               this.m_projectile[_loc1_].destroy();
               this.m_projectile[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      private function getIndexOfOldestProjectile(param1:String) : int
      {
         var _loc2_:int = -1;
         var _loc3_:int = 0;
         while(_loc3_ < this.m_itemStats.MaxProjectile && _loc3_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc3_] != null && this.m_projectile[_loc3_].LinkageID == param1 && (_loc2_ < 0 || this.m_projectile[_loc3_].Time > this.m_projectile[_loc2_].Time))
            {
               _loc2_ = _loc3_;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function fireProjectile(param1:String, param2:Number = 0, param3:Number = 0, param4:Boolean = false, param5:Object = null) : Boolean
      {
         var _loc7_:ProjectileAttack = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Point = null;
         var _loc11_:Boolean = false;
         var _loc12_:int = 0;
         var _loc6_:Boolean = false;
         if(!param5)
         {
            param5 = {};
         }
         if(m_attackData.getProjectile(param1) != null)
         {
            _loc7_ = m_attackData.getProjectile(param1);
            _loc8_ = 0;
            while(_loc8_ < this.m_itemStats.MaxProjectile && _loc8_ < this.m_projectile.length && !_loc6_)
            {
               if((this.m_projectile[_loc8_] == null || _loc7_.LimitOverwrite) && _loc7_.LinkageID != null && (this.getProjectileLimit(_loc7_.LinkageID) < _loc7_.Limit || _loc7_.LimitOverwrite))
               {
                  _loc9_ = _loc8_;
                  if(_loc7_.LimitOverwrite && this.getProjectileLimit(_loc7_.LinkageID) >= _loc7_.Limit)
                  {
                     _loc8_ = this.getIndexOfOldestProjectile(_loc7_.LinkageID);
                     if(_loc8_ < 0)
                     {
                        return false;
                     }
                     this.m_projectile[_loc8_].destroy();
                     this.m_projectile[_loc8_] = null;
                  }
                  else if(_loc7_.LimitOverwrite)
                  {
                     _loc8_ = this.getIndexOfOldestProjectile(_loc7_.StatsName);
                     _loc12_ = 0;
                     while(_loc12_ < this.m_projectile.length)
                     {
                        if(this.m_projectile[_loc12_] == null)
                        {
                           _loc8_ = _loc12_;
                           break;
                        }
                        _loc12_++;
                     }
                  }
                  _loc10_ = new Point(m_sprite.x,m_sprite.y);
                  _loc11_ = m_facingForward;
                  if(m_player_id > 0 && this.m_pickedUp && this.m_itemStats.Ability == "attack")
                  {
                     _loc10_.x = STAGEDATA.getPlayer(m_player_id).X;
                     _loc10_.y = STAGEDATA.getPlayer(m_player_id).Y;
                     _loc11_ = STAGEDATA.getPlayer(m_player_id).isFacingRight();
                  }
                  this.m_projectile[_loc8_] = new Projectile({
                     "player_id":m_player_id,
                     "x_start":_loc10_.x,
                     "y_start":_loc10_.y,
                     "sizeRatio":m_sizeRatio,
                     "facingForward":_loc11_,
                     "chargetime":param5.chargetime || m_attack.ChargeTime,
                     "chargetime_max":param5.chargetime_max || m_attack.ChargeTimeMax,
                     "frame":param1 + "_proj",
                     "staleMultiplier":1,
                     "sizeStatus":1,
                     "opponents":this.m_opponents,
                     "terrains":m_terrains,
                     "platforms":m_platforms,
                     "team_id":m_team_id,
                     "keys":(m_player_id > 0?STAGEDATA.getPlayer(m_player_id).ControlSettings:null),
                     "volume_sfx":1,
                     "volume_vfx":1
                  },_loc7_,STAGEDATA);
                  _loc6_ = true;
                  this.m_lastProjectile = _loc8_;
                  if(param2 != 0 || param3 != 0)
                  {
                     if(param4)
                     {
                        this.m_projectile[_loc8_].X = param2;
                        this.m_projectile[_loc8_].Y = param3;
                        this.m_projectile[_loc8_].X = this.m_projectile[_loc8_].X + (!!m_facingForward?_loc7_.XOffset * m_sizeRatio:-_loc7_.XOffset * m_sizeRatio);
                        this.m_projectile[_loc8_].Y = this.m_projectile[_loc8_].Y + _loc7_.YOffset * m_sizeRatio;
                     }
                     else
                     {
                        this.m_projectile[_loc8_].X = this.m_projectile[_loc8_].X + (!!m_facingForward?param2:-param2);
                        this.m_projectile[_loc8_].Y = this.m_projectile[_loc8_].Y + param3 * m_sizeRatio;
                        this.m_projectile[_loc8_].X = this.m_projectile[_loc8_].X + (!!m_facingForward?_loc7_.XOffset * m_sizeRatio:-_loc7_.XOffset * m_sizeRatio);
                        this.m_projectile[_loc8_].Y = this.m_projectile[_loc8_].Y + _loc7_.YOffset * m_sizeRatio;
                     }
                  }
                  else
                  {
                     this.m_projectile[_loc8_].X = this.m_projectile[_loc8_].X + (!!m_facingForward?_loc7_.XOffset * m_sizeRatio:-_loc7_.XOffset * m_sizeRatio);
                     this.m_projectile[_loc8_].Y = this.m_projectile[_loc8_].Y + _loc7_.YOffset * m_sizeRatio;
                  }
                  break;
               }
               _loc8_++;
            }
         }
         return _loc6_;
      }
      
      public function getTerrainData() : void
      {
         this.m_opponents = new Vector.<int>();
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < STAGEDATA.PlayerList.length)
         {
            this.m_opponents.push(STAGEDATA.PlayerList[_loc1_]);
            _loc1_++;
         }
      }
      
      protected function m_checkReverse() : void
      {
         if(!this.m_dead)
         {
            if(this.m_reverseTimer > 0)
            {
               this.m_reverseTimer--;
            }
         }
      }
      
      protected function m_itemAttack() : void
      {
         if(inState(IState.ATTACKING) || HasAttackBox)
         {
            m_attack.XLoc = m_sprite.x;
            m_attack.YLoc = m_sprite.y;
            this.itemAttackCollisionTest();
         }
         if(this.m_pickedUp && m_attack.IsAttacking && this.Ability != "attack")
         {
            if(m_attack.ChargeTimeMax > 0)
            {
               if(m_attack.ChargeTime < m_attack.ChargeTimeMax)
               {
                  m_attack.ChargeTime++;
               }
               if(m_attack.ChargeTime >= m_attack.ChargeTimeMax || m_attack.LetGo && this.currentStanceFrameIs("charging"))
               {
                  if(this.currentStanceFrameIs("attack"))
                  {
                  }
               }
            }
            if(currentFrameIs("idle") && m_attack.ExecTime > 1)
            {
            }
         }
         if(!isHitStunOrParalysis())
         {
            m_attack.ExecTime++;
            m_attack.RefreshRateTimer++;
            if(m_attack.RefreshRate > 0 && m_attack.RefreshRateReady && m_attack.RefreshRateTimer % m_attack.RefreshRate == 0)
            {
               m_attack.AttackID = Utils.getUID();
            }
         }
      }
      
      public function Attack(param1:String, param2:Boolean) : void
      {
         var _loc3_:AttackObject = m_attackData.getAttack(param1);
         _loc3_.OverrideMap.clear();
         m_attack.simpleReset();
         m_attack.Frame = param1;
         m_attack.IsAttacking = true;
         m_attack.ExecTime = 0;
         m_attack.AttackID = Utils.getUID();
         m_attack.ChargeTime = _loc3_.ChargeTime;
         m_attack.ChargeTimeMax = _loc3_.ChargeTimeMax;
         m_attack.ChargeRetain = _loc3_.ChargeRetain;
         m_attack.ResetMovement = _loc3_.ResetMovement;
         m_attack.RefreshRate = _loc3_.RefreshRate;
         m_attack.ForceComboContinue = _loc3_.ForceComboContinue;
         m_attack.AirEase = _loc3_.AirEase;
         m_attack.RefreshRateReady = false;
         playFrame(m_attack.Frame);
         if(!_loc3_.ChargeRetain)
         {
            _loc3_.ChargeTime = 0;
         }
         this.setState(IState.ATTACKING);
      }
      
      override public function reactionShield(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         var _loc3_:Character = Boolean(param1 as Character)?Character(param1):null;
         var _loc4_:AttackDamage = m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack);
         if(!(param1.ID == m_player_id && !this.m_itemStats.OwnerCanAffect) && _loc3_ && _loc3_.inState(CState.SHIELDING))
         {
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT_SHIELD,{
               "caller":this,
               "receiver":param1,
               "attackBoxData":_loc4_.exportAttackDamageData()
            }));
            if(_loc3_.takeShieldDamage(_loc4_,param2.OverlapHitBox))
            {
               m_eventManager.dispatchEvent(new SSF2Event(!!Character(param1).PerfectShield?SSF2Event.ATTACK_HIT_POWER_SHIELD:SSF2Event.ATTACK_HIT_SHIELD,{
                  "caller":this,
                  "receiver":param1,
                  "attackBoxData":_loc4_.exportAttackDamageData()
               }));
               return true;
            }
         }
         return false;
      }
      
      override public function reactionAbsorb(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         if(!(param1.ID == m_player_id && !this.m_itemStats.OwnerCanAffect) && param1.LastAttackID.indexOf(m_attack.AttackID) < 0)
         {
            param1.stackAttackID(m_attack.AttackID);
            return true;
         }
         return false;
      }
      
      override public function reactionReverse(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
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
      
      override public function reactionCounter(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         var _loc3_:AttackDamage = param1.AttackDataObj.getAttackBoxData(param1.AttackStateData.Frame,param2.SecondHitBox.Name).syncState(param1.AttackStateData);
         if(!(param1.ID == m_player_id && !this.m_itemStats.OwnerCanAffect) && !(param1.ID == m_player_id && m_player_id > 0 && !this.m_wasReversed))
         {
            return true;
         }
         return false;
      }
      
      override public function reactionHit(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc3_:AttackDamage = m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack);
         var _loc4_:Boolean = !(param1.ID == m_player_id && !this.m_itemStats.OwnerCanAffect) || _loc3_.HurtSelf;
         if(_loc4_ && !(this.m_thrown && param1 is Character && param1.ID == m_player_id && this.m_tossTimer < 5))
         {
            m_attack.RefreshRateReady = true;
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT,{
               "caller":this,
               "receiver":param1,
               "attackBoxData":_loc3_.exportAttackDamageData()
            }));
            _loc5_ = param1.Team == m_team_id && m_team_id > 0 && !STAGEDATA.TeamDamage || m_player_id == param1.ID;
            if(_loc5_)
            {
               _loc3_.PlayerID = -1;
            }
            if(!(_loc5_ && !_loc3_.HurtSelf) && param1.takeDamage(_loc3_,param2.OverlapHitBox))
            {
               m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_HIT,{
                  "caller":this,
                  "receiver":param1,
                  "attackBoxData":_loc3_.exportAttackDamageData()
               }));
               this.m_tmpVar = true;
               this.checkBreak();
               if(this.m_thrown)
               {
                  this.m_hasHitPlayer = true;
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
                  Item(param1).activate(_loc3_,Item);
               }
               return true;
            }
         }
         return false;
      }
      
      override public function reactionTouch(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         if(!param1.Invincible)
         {
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ITEM_TOUCH,{
               "caller":this,
               "receiver":param1
            }));
            return true;
         }
         return false;
      }
      
      public function itemAttackCollisionTest() : void
      {
         if(m_bypassCollisionTesting)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:Character = null;
         var _loc3_:Enemy = null;
         var _loc4_:Item = null;
         var _loc5_:Vector.<HitBoxCollisionResult> = null;
         var _loc6_:Array = null;
         var _loc7_:TargetTestTarget = null;
         this.m_tmpVar = false;
         if(m_attack.IsAttacking)
         {
            _loc1_ = 0;
            while(_loc1_ < this.m_opponents.length && !this.m_dead)
            {
               _loc2_ = STAGEDATA.getPlayer(this.m_opponents[_loc1_]);
               if(_loc2_ != null && !(!STAGEDATA.TeamDamage && _loc2_.Team == m_team_id && m_team_id > 0) && !_loc2_.StandBy && !_loc2_.Dead && !_loc2_.IsTeching && !_loc2_.inState(CState.STAR_KO) && !_loc2_.inState(CState.SCREEN_KO) && !_loc2_.inState(CState.REVIVAL))
               {
                  InteractiveSprite.hitTest(_loc2_,this,HitBoxSprite.HIT,HitBoxSprite.CATCH,_loc2_.reactionCatch);
                  InteractiveSprite.hitTest(_loc2_,this,HitBoxSprite.CATCH,HitBoxSprite.HIT,_loc2_.reactionCatch);
                  InteractiveSprite.hitTest(_loc2_,this,HitBoxSprite.CATCH,HitBoxSprite.CATCH,_loc2_.reactionCatch);
                  InteractiveSprite.hitTest(_loc2_,this,HitBoxSprite.HIT,HitBoxSprite.HIT,_loc2_.reactionCatch);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.SHIELD,this.reactionShield);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.ABSORB,this.reactionAbsorb);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.REVERSE,HitBoxSprite.ATTACK,this.reactionReverse);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.REVERSE,HitBoxSprite.HIT,this.reactionReverse);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.EGG,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.FREEZE,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.COUNTER,HitBoxSprite.ATTACK,this.reactionCounter);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.HIT,HitBoxSprite.HIT,this.reactionTouch);
               }
               _loc1_++;
            }
            if(m_player_id > 0)
            {
               _loc2_ = STAGEDATA.getPlayer(m_player_id);
               InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.SHIELD,this.reactionShield);
               InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
               InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.REVERSE,HitBoxSprite.ATTACK,this.reactionReverse);
            }
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.Enemies.length && !this.m_dead)
            {
               _loc3_ = STAGEDATA.Enemies[_loc1_];
               if(_loc3_ != null)
               {
                  InteractiveSprite.hitTest(this,_loc3_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
               }
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.ItemsRef.MAXITEMS && !this.m_dead)
            {
               _loc4_ = STAGEDATA.ItemsRef.getItemData(_loc1_);
               if(_loc4_ != null && _loc4_ != this)
               {
                  InteractiveSprite.hitTest(this,_loc4_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
               }
               _loc1_++;
            }
            if(STAGEDATA.GameRef.GameMode == Mode.TARGET_TEST)
            {
               _loc1_ = 0;
               while(_loc1_ < STAGEDATA.Targets.length && !this.m_dead)
               {
                  _loc7_ = STAGEDATA.Targets[_loc1_];
                  if(_loc7_ != null)
                  {
                     InteractiveSprite.hitTest(this,_loc7_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
                  }
                  _loc1_++;
               }
            }
         }
      }
      
      public function getOpponentByID(param1:Number) : Number
      {
         var _loc2_:* = undefined;
         for(_loc2_ in this.m_opponents)
         {
            if(this.m_opponents[_loc2_] == param1)
            {
               return _loc2_;
            }
         }
         return -1;
      }
      
      protected function m_checkDeathBounds() : void
      {
         if(!this.m_dead && (m_sprite.x < STAGEDATA.DeathBounds.x || m_sprite.x > STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width || m_sprite.y < STAGEDATA.DeathBounds.y || m_sprite.y > STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height))
         {
            STAGEDATA.ItemsRef.killItem(this.m_slot);
         }
      }
      
      override public function reverse(param1:int, param2:int, param3:Boolean) : Boolean
      {
         if(this.m_itemStats.CanBeReversed)
         {
            if(param3)
            {
               m_attack.IsForward = true;
               this.m_faceRight();
            }
            else
            {
               m_attack.IsForward = false;
               this.m_faceLeft();
            }
            this.m_reverseTimer = 5;
            this.m_reverse_id = param1;
            m_team_id = param2;
            m_player_id = param1;
            this.m_wasReversed = true;
            m_xSpeed = m_xSpeed * -1;
            m_ySpeed = m_ySpeed * -1;
            return true;
         }
         return false;
      }
      
      protected function m_checkDead() : void
      {
         this.checkDeadProjectiles();
         this.m_totalTime++;
         if(this.m_thrown && !m_actionShot)
         {
            this.m_tossTimer++;
         }
         if(this.m_itemStats.TimeMax > 0 && !this.m_dead && !this.m_pickedUp)
         {
            this.m_time--;
            if(this.m_time <= 0 && !this.m_pickedUp && (m_collision.ground || !m_collision.ground && this.m_itemStats.DieInAir))
            {
               this.destroy();
            }
         }
         if(this.m_itemStats.RemoveAfterUse && this.m_uses >= this.m_itemStats.UsesMax && !this.m_dead)
         {
            if(!this.m_itemStats.RemoveWhileHolding && !this.m_pickedUp && !(!m_collision.ground && !this.m_itemStats.DieInAir))
            {
               this.destroy();
            }
            else if(this.m_itemStats.RemoveWhileHolding && this.m_pickedUp && !STAGEDATA.getPlayer(m_player_id).inState(CState.ATTACKING))
            {
               this.destroy();
            }
         }
      }
      
      protected function setVar(param1:String, param2:*) : void
      {
         m_sprite[param1] = param2;
      }
      
      protected function getVar(param1:String, param2:*) : Boolean
      {
         if(m_sprite[param1] == param2)
         {
            return true;
         }
         return false;
      }
      
      public function get BackToss() : Boolean
      {
         return this.m_backToss;
      }
      
      public function get HasHitPlayer() : Boolean
      {
         return this.m_hasHitPlayer;
      }
      
      public function set HasHitPlayer(param1:Boolean) : void
      {
         this.m_hasHitPlayer = param1;
      }
      
      public function get Dangerous() : Boolean
      {
         return this.m_itemStats.Dangerous;
      }
      
      public function get InheritPalette() : Boolean
      {
         return this.m_itemStats.InheritPalette;
      }
      
      public function get ItemInstance() : MovieClip
      {
         return m_sprite;
      }
      
      public function get SlideDecay() : Number
      {
         return this.m_itemStats.SlideDecay;
      }
      
      public function get TossSpeed() : Number
      {
         return this.m_itemStats.TossSpeed;
      }
      
      public function get ThrowSpeed() : Number
      {
         return this.m_itemStats.ThrowSpeed;
      }
      
      public function get Thrown() : Boolean
      {
         return this.m_thrown;
      }
      
      public function get Slot() : Number
      {
         return this.m_slot;
      }
      
      public function get OriginalPlayerID() : int
      {
         return this.m_originalPlayerID;
      }
      
      public function set OriginalPlayerID(param1:int) : void
      {
         this.m_originalPlayerID = param1;
      }
      
      public function get PlayerID() : int
      {
         return m_player_id;
      }
      
      public function set PlayerID(param1:int) : void
      {
         m_player_id = param1;
      }
      
      public function get TeamID() : int
      {
         return m_team_id;
      }
      
      public function set TeamID(param1:int) : void
      {
         m_team_id = param1;
      }
      
      public function get Frame() : String
      {
         return this.m_itemStats.Frame;
      }
      
      public function get Dead() : Boolean
      {
         return this.m_dead;
      }
      
      public function get ItemStats() : ItemData
      {
         return this.m_itemStats;
      }
      
      public function get AutoPickup() : Boolean
      {
         return this.m_itemStats.AutoPickup;
      }
      
      public function get PickedUp() : Boolean
      {
         return this.m_pickedUp;
      }
      
      public function set PickedUp(param1:Boolean) : void
      {
         if(param1)
         {
            this.m_bounce_remaining = 0;
         }
         this.m_pickedUp = param1;
         if(this.m_pickedUp)
         {
            this.setState(IState.HELD);
         }
         else
         {
            this.setState(IState.IDLE);
            setVisibility(true);
            resetRotation();
         }
      }
      
      public function get AffectsOwner() : Boolean
      {
         return this.m_itemStats.AffectsOwner;
      }
      
      public function get OwnerCanAffect() : Boolean
      {
         return this.m_itemStats.OwnerCanAffect;
      }
      
      public function get UseInAir() : Boolean
      {
         return this.m_itemStats.UseInAir;
      }
      
      public function get Ability() : String
      {
         return this.m_itemStats.Ability;
      }
      
      public function get Recover() : Number
      {
         return this.m_itemStats.Recover;
      }
      
      public function get Break() : Boolean
      {
         return this.m_itemStats.WillBreak;
      }
      
      public function get SpecialAction() : Boolean
      {
         return this.m_itemStats.SpecialAction;
      }
      
      public function get CurrentAttackState() : AttackState
      {
         return m_attack;
      }
      
      public function get Attacking() : Boolean
      {
         return m_attack.IsAttacking;
      }
      
      public function get EffectSound() : String
      {
         return this.m_effectSound;
      }
      
      public function get LinkageID() : String
      {
         return this.m_linkage_id;
      }
      
      public function get CanPickup() : Boolean
      {
         return this.m_itemStats.CanPickup;
      }
      
      public function get MidairPickup() : Boolean
      {
         return this.m_itemStats.MidairPickup;
      }
      
      public function get DropInMidair() : Boolean
      {
         return this.m_itemStats.DropInMidair;
      }
      
      public function get CanHit() : Boolean
      {
         return this.m_itemStats.CanHit;
      }
      
      public function get CanBeReversed() : Boolean
      {
         return this.m_itemStats.CanBeReversed;
      }
      
      public function get CanBackToss() : Boolean
      {
         return this.m_itemStats.CanBackToss;
      }
      
      public function get CanJumpWith() : Boolean
      {
         return this.m_itemStats.CanJumpWith;
      }
      
      public function get CanAttackWith() : Boolean
      {
         return this.m_itemStats.CanAttackWith;
      }
      
      public function get CanHangWith() : Boolean
      {
         return this.m_itemStats.CanHangWith;
      }
      
      public function get CanShieldWith() : Boolean
      {
         return this.m_itemStats.CanShieldWith;
      }
      
      public function get IsHeavy() : Boolean
      {
         return this.m_itemStats.IsHeavy;
      }
      
      public function get Consume() : Boolean
      {
         return this.m_itemStats.Consume;
      }
      
      public function get LastProjectile() : Projectile
      {
         if(this.m_projectile.length == 0)
         {
            return null;
         }
         return this.m_projectile[this.m_lastProjectile];
      }
      
      public function get IsSmashBall() : Boolean
      {
         return this.m_isSmashball;
      }
      
      public function get WasReversed() : Boolean
      {
         return this.m_wasReversed;
      }
      
      public function get JustReversed() : Boolean
      {
         return Boolean(this.m_reverseTimer > 0);
      }
      
      public function set LetGo(param1:Boolean) : void
      {
         m_attack.LetGo = param1;
      }
      
      public function get DoingSmash() : Boolean
      {
         return m_attack.Frame == Item.ATTACK_SMASH;
      }
      
      public function get ClassID() : String
      {
         return this.m_itemStats.ClassID;
      }
      
      public function get Uses() : int
      {
         return this.m_uses;
      }
      
      public function set Uses(param1:int) : void
      {
         this.m_uses = param1;
      }
      
      public function get UsesMax() : int
      {
         return this.m_itemStats.UsesMax;
      }
      
      public function get DisableFlip() : Boolean
      {
         return this.m_itemStats.DisableFlip;
      }
      
      public function get DamageOnHit() : Boolean
      {
         return this.m_itemStats.DamageOnHit;
      }
      
      public function get DamageSelfOnHit() : Boolean
      {
         return this.m_itemStats.DamageSelfOnHit;
      }
      
      public function resetTime() : void
      {
         this.m_time = this.m_itemStats.TimeMax;
      }
      
      public function getDangerous() : Boolean
      {
         return this.m_itemStats.Dangerous;
      }
      
      public function getItemStat(param1:String) : *
      {
         return this.m_itemStats.getVar(param1);
      }
      
      public function updateItemStats(param1:Object) : void
      {
         this.m_itemStats.importItemData(param1);
         this.syncStats();
      }
      
      override protected function syncStats() : void
      {
         m_gravity = this.m_itemStats.Gravity;
         m_max_ySpeed = this.m_itemStats.MaxGravity;
         m_width = this.m_itemStats.Width;
         m_height = this.m_itemStats.Height;
      }
      
      public function getLinkageID() : String
      {
         return this.m_linkage_id;
      }
      
      public function getUses() : int
      {
         return this.m_uses;
      }
      
      public function activate(param1:AttackDamage, param2:Class = null) : void
      {
      }
      
      public function reactivate(param1:AttackDamage, param2:Class = null) : void
      {
      }
      
      public function SetPlayer(param1:Number) : void
      {
         var _loc2_:Vector.<MovieClip> = null;
         m_player_id = param1;
         this.m_wasReversed = false;
         if(m_player_id > 0)
         {
            this.m_playerClassInstance = param1 > 0?"player" + m_player_id:null;
            m_team_id = STAGEDATA.getPlayer(m_player_id).Team;
         }
         else
         {
            this.m_playerClassInstance = null;
            m_team_id = -1;
         }
         if(this.m_isSmashball && !STAGEDATA.FreezeKeys && STAGEDATA.CamRef.Targets.indexOf(m_sprite) >= 0)
         {
            _loc2_ = new Vector.<MovieClip>();
            _loc2_.push(m_sprite);
            STAGEDATA.CamRef.deleteTargets(_loc2_);
         }
      }
      
      public function inheritPalette() : void
      {
         if(this.m_itemStats.InheritPalette && m_player_id > 0)
         {
            STAGEDATA.getPlayer(m_player_id).updateColorFilter(m_sprite,STAGEDATA.getPlayer(m_player_id).Team > 0 && !ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME,STAGEDATA.GameRef.GameMode)?int(STAGEDATA.getPlayer(m_player_id).Team):int(null),STAGEDATA.getPlayer(m_player_id).CurrentStatsName,STAGEDATA.getPlayer(m_player_id).CostumeID);
         }
      }
      
      protected function findClosestOpponent(param1:Number = -1, param2:Number = 0) : Target
      {
         var _loc7_:* = undefined;
         var _loc8_:Number = NaN;
         var _loc3_:Target = new Target();
         var _loc4_:Boolean = false;
         var _loc5_:Number = 0;
         var _loc6_:Vector.<int> = this.m_opponents;
         for(_loc7_ in _loc6_)
         {
            if(param2 != STAGEDATA.getPlayer(_loc6_[_loc7_]).Team && param1 != STAGEDATA.getPlayer(_loc6_[_loc7_]).ID && !STAGEDATA.getPlayer(_loc6_[_loc7_]).StandBy && STAGEDATA.getPlayer(_loc6_[_loc7_]).MC.parent != null)
            {
               _loc8_ = this.getDistanceFrom(STAGEDATA.getPlayer(_loc6_[_loc7_]).X,STAGEDATA.getPlayer(_loc6_[_loc7_]).Y);
               if(_loc3_.CurrentTarget == null || _loc8_ < _loc3_.Distance)
               {
                  _loc3_.CurrentTarget = STAGEDATA.getPlayer(_loc6_[_loc7_]);
                  _loc3_.setDistance(new Point(m_sprite.x,m_sprite.y));
               }
            }
         }
         if(_loc3_.CurrentTarget == null)
         {
            return null;
         }
         return _loc3_;
      }
      
      public function checkBreak() : void
      {
         if(this.m_itemStats.Generate && !this.m_dead)
         {
            this.playGlobalSound(this.m_effectSound);
            if(this.m_itemStats.WillBreak)
            {
               this.destroy();
            }
            STAGEDATA.ItemsRef.makeItem(m_sprite.x,m_sprite.y);
         }
         if(this.m_itemStats.SpecialAction && !this.m_dead)
         {
            this.m_itemStats.SpecialAction = false;
            stancePlayFrame("finish");
            if(this.m_itemStats.FreezeOnHit)
            {
               m_xSpeed = 0;
               m_ySpeed = 0;
               m_max_ySpeed = 0;
            }
         }
         if(this.m_itemStats.Ricochet && !this.m_dead)
         {
            m_xSpeed = m_xSpeed * -0.1;
            if(!m_collision.ground)
            {
               m_ySpeed = -8;
            }
            if(m_facingForward)
            {
               this.m_faceLeft();
            }
            else
            {
               this.m_faceRight();
            }
         }
         if(this.m_itemStats.WillBreak && !this.m_dead)
         {
            this.destroy();
         }
         if(!this.m_dead && this.m_itemStats.Ability == "attack" && this.m_thrown && m_xSpeed == 0 && m_ySpeed > 0)
         {
            m_ySpeed = -4;
         }
      }
      
      public function Toss(param1:Number, param2:Number, param3:Number, param4:Number, param5:Boolean = false) : void
      {
         this.m_backToss = param5;
         this.m_hasHitPlayer = false;
         this.PickedUp = false;
         m_sprite.x = param1;
         m_sprite.y = param2;
         unnattachFromGround();
         m_xSpeed = param3;
         m_ySpeed = param4;
         if(param3 < 0)
         {
            this.m_faceLeft();
         }
         else if(m_xSpeed > 0)
         {
            this.m_faceRight();
         }
         this.m_thrown = true;
         this.m_tossTimer = 0;
         this.Attack(!!param5?Item.ATTACK_TOSS:Item.ATTACK_THROW,param3 > 0);
      }
      
      public function Drop() : void
      {
         m_xSpeed = 0;
         m_ySpeed = 0;
         this.PickedUp = false;
         this.playGlobalSound("itemdrop");
      }
      
      public function playAttackFrame(param1:String) : void
      {
         m_attack.IsAttacking = true;
         Utils.tryToGotoAndStop(m_sprite,"attack");
         this.m_uses++;
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc3_:Number = 0;
         if(this.CanHit && param1 != null && param1.HasEffect && !attackIDArrayContains(param1.AttackID) && !param1.BypassNonGrabbed)
         {
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ITEM_HURT,{
               "caller":this,
               "opponent":param1.Owner,
               "attackBoxData":param1.exportAttackDamageData()
            }));
            _loc4_ = 0;
            if(m_attack.ChargeRetain)
            {
               m_attack.ChargeTime = 0;
            }
            _loc5_ = param1.Damage;
            if(param1.Owner as Projectile && param1.ChargeTimeMax > 0)
            {
               _loc5_ = _loc5_ * 0.25 + _loc5_ * 0.75 * (param1.ChargeTime / param1.ChargeTimeMax);
            }
            else if(param1.ChargeTimeMax > 0)
            {
               if(param1.ChargeTime / param1.ChargeTimeMax > 0.95)
               {
                  _loc5_ = _loc5_ * 1.4;
               }
               else if(param1.ChargeTime / param1.ChargeTimeMax > 0.75)
               {
                  _loc5_ = _loc5_ * (1 + param1.ChargeTime / param1.ChargeTimeMax * 0.4);
               }
            }
            _loc5_ = Math.round(_loc5_);
            stackAttackID(param1.AttackID);
            if(param1.Power >= 0)
            {
               if(param1.Owner as Projectile && param1.ChargeTimeMax > 0)
               {
                  _loc3_ = param1.ChargeTimeMax > 0?Number((0.25 + 1 * (param1.ChargeTime / param1.ChargeTimeMax)) * param1.Power + 10 * param1.KBConstant * 1 / 1):Number(param1.Power + 10 * param1.KBConstant * 1 / 1);
               }
               else
               {
                  _loc3_ = param1.ChargeTimeMax > 0?Number((0.85 + 0.25 * (param1.ChargeTime / param1.ChargeTimeMax)) * param1.Power + 10 * param1.KBConstant * 1 / 1):Number(param1.Power + 10 * param1.KBConstant * 1 / 1);
               }
               if(_loc3_ < 2550)
               {
               }
               _loc3_ = _loc3_;
            }
            else
            {
               _loc3_ = -param1.Power;
            }
            _loc3_ = _loc3_ / 100;
            if(m_collision.ground)
            {
               if(_loc4_ > 180 && _loc4_ < 360)
               {
                  _loc4_ = 360 - _loc4_;
               }
            }
            if(!param1.IsForward)
            {
               _loc4_ = 180 - _loc4_;
            }
            while(_loc4_ > 360)
            {
               _loc4_ = _loc4_ - 360;
            }
            while(_loc4_ < 0)
            {
               _loc4_ = _loc4_ + 360;
            }
            _loc6_ = Math.abs(_loc3_ * Math.cos(_loc4_ * Math.PI / 180));
            _loc7_ = Math.abs(_loc3_ * Math.sin(_loc4_ * Math.PI / 180));
            _loc8_ = _loc4_ >= 0 && _loc4_ < 90 || _loc4_ >= 270 && _loc4_ < 360?Boolean(true):Boolean(false);
            _loc9_ = _loc4_ >= 0 && _loc4_ < 180?Boolean(true):Boolean(false);
            if(_loc7_ > 50 && !_loc9_)
            {
               _loc7_ = 50;
            }
            if(this.m_isSmashball)
            {
               attachEffect("smashballhit_effect",Boolean(param2)?{
                  "x":param2.centerx,
                  "y":param2.centery,
                  "absolute":true
               }:null);
               stancePlayFrame("hit");
               this.playGlobalSound("smashball_damage");
               this.m_smashballDamage = this.m_smashballDamage - _loc5_;
               this.m_smashballSpeedingUp = false;
               this.m_smashBallXOverride = 8;
               this.m_smashBallXOverride_right = !!param1.IsForward?Boolean(true):Boolean(false);
               if(this.m_smashballDamage <= 0 && param1.PlayerID > 0)
               {
                  this.playGlobalSound("smashball_break");
                  this.PickedUp = true;
                  if(!STAGEDATA.getPlayer(param1.PlayerID).inState(CState.KIRBY_STAR))
                  {
                     STAGEDATA.getPlayer(param1.PlayerID).giveFinalSmash(this);
                     STAGEDATA.getPlayer(param1.PlayerID).AttackStateData.LetGo = false;
                     STAGEDATA.getPlayer(param1.PlayerID).SmashDISelf = true;
                     STAGEDATA.getPlayer(param1.PlayerID).startActionShot(Utils.calculateSelfHitStun(param1.SelfHitStun,Utils.calculateChargeDamage(param1)));
                  }
                  else
                  {
                     STAGEDATA.getPlayer(this.m_opponents[this.getOpponentByID(param1.OtherPlayerID)]).giveFinalSmash(this);
                  }
               }
               else
               {
                  this.updateTargetPosition();
                  this.activate(param1,null);
                  if(!this.m_dead)
                  {
                     this.checkBreak();
                  }
               }
            }
            return true;
         }
         return false;
      }
      
      protected function m_removeItem() : void
      {
         var _loc1_:Vector.<MovieClip> = null;
         if(this.m_isSmashball && !STAGEDATA.FreezeKeys && STAGEDATA.CamRef.Targets.indexOf(m_sprite) >= 0)
         {
            _loc1_ = new Vector.<MovieClip>();
            _loc1_.push(m_sprite);
            STAGEDATA.CamRef.deleteTargets(_loc1_);
         }
         if(m_sprite != null && m_sprite.parent != null)
         {
            m_sprite.parent.removeChild(m_sprite);
         }
      }
      
      public function consumeAction() : void
      {
      }
      
      public function destroy(param1:* = null) : void
      {
         this.kill();
      }
      
      private function kill() : void
      {
         if(!this.m_dead)
         {
            STAGEDATA.CamRef.deleteTarget(m_sprite);
            STAGEDATA.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.GAME_ITEM_DESTROYED,{"item":this}));
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ITEM_DESTROYED,{"caller":this}));
            if(this.m_pickedUp && m_player_id > 0 && STAGEDATA.getPlayer(m_player_id).ItemObj)
            {
               STAGEDATA.getPlayer(m_player_id).dropItem();
            }
            this.m_removeItem();
            this.m_dead = true;
            removeAllTempEvents();
            STAGEDATA.ItemsRef.checkDeadItems();
         }
      }
      
      protected function m_itemFall() : void
      {
         if(!this.m_pickedUp && !m_collision.ground && !this.m_isSmashball && !isHitStunOrParalysis())
         {
            if(m_ySpeed < m_max_ySpeed)
            {
               m_ySpeed = m_ySpeed + m_gravity;
            }
            m_attemptToMove(0,m_ySpeed);
         }
      }
      
      private function calcGroundAngle() : Number
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:Number = 0;
         if(m_currentPlatform != null)
         {
            _loc2_ = 0;
            _loc3_ = m_sprite.y;
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            while(testCoordCollision(m_sprite.x - 5,_loc3_))
            {
               _loc3_ = _loc3_ - 1 / 4;
            }
            _loc2_ = m_sprite.y + 20;
            while(_loc3_ < _loc2_ && !testCoordCollision(m_sprite.x - 5,_loc3_ - 2))
            {
               _loc3_++;
            }
            if(_loc3_ < _loc2_ && testCoordCollision(m_sprite.x - 5,_loc3_))
            {
               _loc4_ = m_sprite.x - 5;
               _loc6_ = _loc3_;
               _loc3_ = m_sprite.y;
               while(testCoordCollision(m_sprite.x + 5,_loc3_))
               {
                  _loc3_ = _loc3_ - 1 / 4;
               }
               _loc2_ = m_sprite.y + 20;
               while(_loc3_ < _loc2_ && !testCoordCollision(m_sprite.x + 5,_loc3_ - 2))
               {
                  _loc3_++;
               }
               if(_loc3_ < _loc2_ && testCoordCollision(m_sprite.x + 5,_loc3_))
               {
                  _loc5_ = m_sprite.x + 5;
                  _loc7_ = _loc3_;
                  _loc1_ = _loc7_ > _loc6_?Number(Math.tan(Utils.fastAbs(_loc6_ - _loc7_) / Utils.fastAbs(_loc4_ - _loc5_)) / (Math.PI / 180)):Number(-Math.tan(Utils.fastAbs(_loc6_ - _loc7_) / Utils.fastAbs(_loc4_ - _loc5_)) / (Math.PI / 180));
               }
            }
         }
         if(_loc1_ > 45)
         {
            _loc1_ = 45;
         }
         else if(_loc1_ < -45)
         {
            _loc1_ = -45;
         }
         return _loc1_;
      }
      
      protected function m_itemMove() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(!isHitStunOrParalysis())
         {
            applyGroundInfluence();
            if(this.m_isSmashball && !this.m_dead)
            {
               this.smashballMovement();
            }
            else if(!this.m_dead)
            {
               _loc1_ = this.calcGroundAngle();
               _loc2_ = 0;
               if(_loc1_ > 20 && m_collision.ground)
               {
                  _loc2_ = 8;
               }
               else if(_loc1_ < -20 && m_collision.ground)
               {
                  _loc2_ = -8;
               }
               if(_loc2_ < 0)
               {
                  m_attemptToMove(0,_loc2_);
                  m_attemptToMove(m_xSpeed,0);
               }
               else if(_loc2_ > 0)
               {
                  m_attemptToMove(m_xSpeed,0);
                  m_attemptToMove(0,_loc2_);
               }
               else
               {
                  m_attemptToMove(m_xSpeed,_loc2_);
               }
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
      
      protected function smashballMovement() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this.m_totalTime < 700)
         {
            if(this.m_smashballTimer < 0)
            {
               this.m_smashballTimer = Utils.random() * (150 - 90) + 90;
               this.m_smashballSpeedingUp = Boolean(Utils.random() > 0.5);
               this.updateTargetPosition();
            }
            _loc1_ = (this.m_smashBallTarget.X - m_sprite.x) / 100;
            _loc2_ = (this.m_smashBallTarget.Y - m_sprite.y) / 80;
            if(_loc1_ > 10)
            {
               _loc1_ = 10;
            }
            else if(_loc1_ < -10)
            {
               _loc1_ = -10;
            }
            if(_loc2_ > 10)
            {
               _loc2_ = 10;
            }
            else if(_loc2_ < -10)
            {
               _loc2_ = -10;
            }
            if(this.m_smashBallXOverride > 0)
            {
               this.m_smashBallXOverride--;
               _loc1_ = !!this.m_smashBallXOverride_right?Number(this.m_smashBallXOverride):Number(-this.m_smashBallXOverride);
               if(this.m_smashBallXOverride <= 0)
               {
                  this.m_smashballTimer = 0;
               }
            }
            m_xSpeed = _loc1_;
            m_ySpeed = _loc2_;
            m_attemptToMove(m_xSpeed,0);
            m_attemptToMove(0,m_ySpeed);
            this.m_smashballTimer--;
         }
         else
         {
            m_xSpeed = !!this.m_smashballSpeedingUp?Number(4):Number(-4);
            m_ySpeed = -2;
            m_attemptToMove(m_xSpeed,0);
            m_attemptToMove(0,m_ySpeed);
         }
      }
      
      public function resetSmashBall() : void
      {
         var _loc1_:Vector.<MovieClip> = null;
         this.m_smashballTimer = -1;
         this.m_smashballSpeedingUp = false;
         this.m_smashballDamage = Utils.random() * (25 - 20) + 20;
         m_sprite.visible = true;
         m_sprite.x = STAGEDATA.getPlayer(m_player_id).X - 10;
         m_sprite.y = STAGEDATA.getPlayer(m_player_id).Y - 10;
         this.m_totalTime = 0;
         this.PickedUp = false;
         m_player_id = 0;
         this.m_playerClassInstance = null;
         this.updateTargetPosition();
         if(!STAGEDATA.FreezeKeys && CAM.Mode == Vcam.NORMAL_MODE)
         {
            _loc1_ = new Vector.<MovieClip>();
            _loc1_.push(m_sprite);
            STAGEDATA.CamRef.addTargets(_loc1_);
         }
      }
      
      protected function updateTargetPosition() : void
      {
         var _loc1_:Number = STAGEDATA.SmashBallBounds.x + STAGEDATA.SmashBallBounds.width;
         var _loc2_:Number = STAGEDATA.SmashBallBounds.x;
         var _loc3_:Number = STAGEDATA.SmashBallBounds.y + STAGEDATA.SmashBallBounds.height;
         var _loc4_:Number = STAGEDATA.SmashBallBounds.y;
         var _loc5_:Number = Utils.random() * (_loc1_ - _loc2_) + _loc2_;
         var _loc6_:Number = Utils.random() * (_loc3_ - _loc4_) + _loc4_;
         this.m_smashBallTarget.X = _loc5_;
         this.m_smashBallTarget.Y = _loc6_;
      }
      
      public function getAngleOfOpponent() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = this.m_smashBallTarget.X - m_sprite.x;
         var _loc3_:Number = -(this.m_smashBallTarget.Y - m_sprite.y);
         _loc1_ = Math.round(Math.atan(_loc3_ / _loc2_) / (Math.PI / 180));
         if(_loc2_ < 0)
         {
            _loc1_ = 180 + _loc1_;
         }
         if(_loc3_ < 0 && _loc2_ > 0)
         {
            _loc1_ = 360 + _loc1_;
         }
         return _loc1_;
      }
      
      protected function getDistanceFrom(param1:Number, param2:Number) : Number
      {
         return Math.sqrt(Math.pow(param1 - m_sprite.x,2) + Math.pow(param2 - m_sprite.y,2));
      }
      
      protected function checkRichochetTimer() : void
      {
         var _loc1_:Number = NaN;
         if(!isHitStunOrParalysis() && this.m_thrown)
         {
            _loc1_ = 15;
            if(this.m_itemStats.WillBreak || this.m_itemStats.Ability == "attack" || this.m_itemStats.SpecialAction)
            {
               _loc1_ = m_width / 2 + 10;
            }
            m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x - _loc1_,m_sprite.y - 35);
            m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + _loc1_,m_sprite.y - 35);
            if(!m_collision.ground && (m_collision.rightSide || m_collision.leftSide))
            {
               if(!this.m_itemStats.Ricochet && (this.m_itemStats.WillBreak || this.m_itemStats.SpecialAction || this.m_itemStats.Generate))
               {
                  this.m_thrown = false;
                  m_attack.IsAttacking = false;
                  m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HIT_WALL,{
                     "caller":this,
                     "left":m_collision.leftSide,
                     "right":m_collision.rightSide,
                     "top":false
                  }));
                  this.checkBreak();
               }
               else
               {
                  if(m_facingForward)
                  {
                     this.m_faceLeft();
                  }
                  else
                  {
                     this.m_faceRight();
                  }
                  m_xSpeed = m_xSpeed * -1;
               }
            }
            this.m_richochetTimer.tick();
            if(this.m_richochetTimer.IsComplete)
            {
               this.m_richochetTimer.reset();
               if(!m_collision.ground && m_sprite.y == this.m_richochetY && m_ySpeed < 0)
               {
                  if(!this.m_itemStats.Ricochet && (this.m_itemStats.WillBreak || this.m_itemStats.SpecialAction || this.m_itemStats.Generate))
                  {
                     m_attack.IsAttacking = false;
                     this.m_thrown = false;
                     m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HIT_WALL,{
                        "caller":this,
                        "left":m_xSpeed < 0,
                        "right":m_xSpeed > 0,
                        "top":false
                     }));
                     this.checkBreak();
                  }
                  else
                  {
                     m_ySpeed = m_ySpeed * -1;
                  }
               }
            }
            this.m_richochetX = m_sprite.x;
            this.m_richochetY = m_sprite.y;
         }
         else if(isHitStunOrParalysis())
         {
            this.m_richochetTimer.reset();
         }
      }
      
      protected function m_checkBounce() : void
      {
         if(!this.m_pickedUp && this.m_bounce_remaining > 0 && !this.m_thrown && m_collision.ground)
         {
            m_ySpeed = m_ySpeed * -0.6;
            unnattachFromGround();
            this.m_bounce_remaining--;
         }
         else if(m_collision.ground && this.m_itemStats.Bounce > 0 && m_ySpeed >= 0 && this.m_thrown)
         {
            if(!(this.m_bounce_limit.IsComplete && this.m_bounce_total < this.m_bounce_limit.MaxTime))
            {
               m_ySpeed = -this.m_itemStats.Bounce;
               this.m_itemStats.Bounce = this.m_itemStats.Bounce * this.m_itemStats.BounceDecay;
               while(this.m_itemStats.BounceMaxHeight > 0 && this.getBounceHeight(m_ySpeed) > this.m_itemStats.BounceMaxHeight)
               {
                  m_ySpeed++;
               }
               this.m_bounce_limit.tick();
               unnattachFromGround();
               m_collision.ground = false;
            }
         }
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         if(!this.m_isSmashball)
         {
            _loc1_ = Boolean(m_collision.ground);
            _loc2_ = m_ySpeed > 0;
            if(m_collision.ground && !m_ySpeed < 0)
            {
               attachToGround();
            }
            _loc3_ = (m_currentPlatform = testGroundWithCoord(m_sprite.x,m_sprite.y + 1)) != null;
            m_collision.ground = _loc3_;
            this.m_checkBounce();
            if(m_collision.ground)
            {
               attachToGround();
            }
            if(!_loc1_ && _loc2_ && m_ySpeed < 0)
            {
               STAGEDATA.playSpecificSound(this.m_landSound);
            }
            if(m_collision.ground && !m_collision.leftSide && !m_collision.rightSide)
            {
               attachToGround();
            }
            if(m_collision.ground && !_loc1_)
            {
               m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.GROUND_TOUCH,{"caller":this}));
            }
            if(m_collision.ground && this.m_thrown)
            {
               this.m_wasReversed = false;
               this.m_thrown = false;
               this.m_bounce_limit.reset();
               this.m_itemStats.Bounce = this.m_bounceOrig;
               this.setState(IState.IDLE);
               if(!this.m_dead && !this.m_itemStats.SpecialAction && Utils.hasLabel(m_sprite,"begin"))
               {
                  stancePlayFrame("begin");
                  if(!this.m_itemStats.RetainPlayerID)
                  {
                     this.m_wasReversed = false;
                     m_player_id = 0;
                     m_team_id = -1;
                  }
                  this.Attack(Item.ATTACK_IDLE,m_facingForward);
               }
               this.checkBreak();
               this.m_itemStats.SpecialAction = this.m_specialActionOriginal;
               m_xSpeed = 0;
            }
            else if(m_collision.ground && !this.m_pickedUp && !this.m_thrown)
            {
               if(!_loc1_)
               {
                  STAGEDATA.playSpecificSound(this.m_landSound);
               }
               if(this.m_itemStats.SlideDecay >= 0)
               {
                  m_xSpeed = m_xSpeed * this.m_itemStats.SlideDecay;
               }
               else if(m_xSpeed != 0)
               {
                  _loc4_ = m_xSpeed > 0;
                  m_xSpeed = m_xSpeed - (m_xSpeed > 0?Utils.fastAbs(this.m_itemStats.SlideDecay):-Utils.fastAbs(this.m_itemStats.SlideDecay));
                  if(_loc4_ && m_xSpeed < 0 || !_loc4_ && m_xSpeed > 0)
                  {
                     m_xSpeed = 0;
                  }
                  if(Utils.fastAbs(m_xSpeed) <= 0.5)
                  {
                     m_xSpeed = 0;
                  }
               }
            }
         }
      }
      
      protected function currentStanceFrameIs(param1:String) : Boolean
      {
         var _loc2_:Boolean = m_sprite.stance.frame == param1?Boolean(true):Boolean(false);
         return _loc2_;
      }
      
      public function pushAway(param1:Boolean, param2:int = 1) : void
      {
         if(!isHitStunOrParalysis() && this.m_itemStats.CanBePushed)
         {
            if(m_collision.ground && m_xSpeed == 0)
            {
               if(param1 && !m_collision.rightSide)
               {
                  m_attemptToMove(param2,0);
                  attachToGround();
               }
               else if(!param1 && !m_collision.leftSide)
               {
                  m_attemptToMove(-param2,0);
                  attachToGround();
               }
            }
         }
      }
      
      protected function m_pushAwayOpponents() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Vector.<HitBoxCollisionResult> = null;
         var _loc3_:Character = null;
         if(HasHitBox && m_collision.ground && !this.m_pickedUp && !this.m_isSmashball && !this.m_dead)
         {
            _loc1_ = 0;
            while(_loc1_ < this.m_opponents.length)
            {
               _loc2_ = null;
               _loc3_ = STAGEDATA.getPlayer(this.m_opponents[_loc1_]);
               if(HasHitBox && m_collision.ground && _loc3_ != null && _loc3_.CollisionObj.ground && _loc3_.HasHitBox && (_loc2_ = HitBoxSprite.hitTestArray(this.CurrentAnimation.getHitBoxes(CurrentFrameNum,HitBoxSprite.HIT),_loc3_.CurrentAnimation.getHitBoxes(_loc3_.CurrentFrameNum,HitBoxSprite.HIT),Location,_loc3_.Location,!m_facingForward,!_loc3_.FacingForward,CurrentScale,_loc3_.CurrentScale,CurrentRotation,_loc3_.CurrentRotation)).length > 0)
               {
                  if(m_sprite.x < _loc3_.X)
                  {
                     _loc3_.pushAway(true);
                  }
                  else
                  {
                     _loc3_.pushAway(false);
                  }
               }
               _loc1_++;
            }
         }
      }
      
      protected function m_pushAwayItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Vector.<HitBoxCollisionResult> = null;
         var _loc3_:Item = null;
         if(HasHitBox && m_collision.ground && !this.m_pickedUp && !this.m_isSmashball && !this.m_dead)
         {
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.ItemsRef.ItemsInUse.length)
            {
               _loc2_ = null;
               _loc3_ = STAGEDATA.ItemsRef.ItemsInUse[_loc1_];
               if(_loc1_ != this.m_slot && _loc3_ != null && !_loc3_.Dead && !_loc3_.PickedUp && _loc3_.Ground && !_loc3_.IsSmashBall && _loc3_.HasHitBox && (_loc2_ = HitBoxSprite.hitTestArray(this.CurrentAnimation.getHitBoxes(CurrentFrameNum,HitBoxSprite.HIT),_loc3_.CurrentAnimation.getHitBoxes(_loc3_.CurrentFrameNum,HitBoxSprite.HIT),Location,_loc3_.Location,!m_facingForward,!_loc3_.FacingForward,CurrentScale,_loc3_.CurrentScale,CurrentRotation,_loc3_.CurrentRotation)).length > 0)
               {
                  if(m_sprite.x > _loc3_.X)
                  {
                     _loc3_.pushAway(false);
                  }
                  else if(m_sprite.x < _loc3_.X)
                  {
                     _loc3_.pushAway(true);
                  }
                  else if(m_sprite.x == _loc3_.X)
                  {
                     _loc3_.pushAway(true);
                     this.pushAway(false);
                  }
               }
               _loc1_++;
            }
         }
      }
      
      override public function setState(param1:uint) : void
      {
         var _loc2_:Boolean = param1 != m_state;
         var _loc3_:uint = m_state;
         m_state = param1;
         if(_loc2_)
         {
            m_framesSinceLastState = 0;
            if(!inState(IState.ATTACKING))
            {
               flushTimers();
               removeAllTempEvents();
            }
            this.m_controlFrames();
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.STATE_CHANGE,{
               "fromState":_loc3_,
               "toState":m_state
            }));
         }
      }
      
      public function playGlobalSound(param1:String) : int
      {
         return STAGEDATA.SoundQueueRef.playSoundEffect(param1);
      }
      
      override protected function m_faceRight() : void
      {
         if(!this.m_itemStats.DisableFlip)
         {
            m_sprite.scaleX = Math.abs(m_sprite.scaleX);
         }
         m_facingForward = true;
      }
      
      override protected function m_faceLeft() : void
      {
         if(!this.m_itemStats.DisableFlip)
         {
            m_sprite.scaleX = -Math.abs(m_sprite.scaleX);
         }
         m_facingForward = false;
      }
      
      override protected function m_controlFrames() : void
      {
         if(m_state == IState.IDLE)
         {
            playFrame("attack_idle");
         }
         else if(m_state == IState.HELD)
         {
            playFrame("attack_hold");
         }
         else if(m_state == IState.ATTACKING)
         {
            if(!currentFrameIs(m_attack.Frame) && m_attack.Frame != null)
            {
               playFrame(m_attack.Frame);
            }
         }
         else if(m_state != IState.DEAD)
         {
            if(m_state == IState.DEAD)
            {
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(this.m_pickedUp && !this.m_dead)
         {
            checkTimers();
            this.m_itemAttack();
            this.m_checkDeathBounds();
            this.m_checkDead();
         }
         else if(!this.m_pickedUp && !this.m_dead)
         {
            checkHitStun();
            checkTimers();
            this.m_pushAwayItems();
            this.m_groundCollisionTest();
            this.m_itemAttack();
            this.m_checkReverse();
            this.m_itemFall();
            this.m_itemMove();
            this.checkRichochetTimer();
            this.m_checkDeathBounds();
            this.m_checkDead();
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
