package com.mcleodgaming.ssf2.engine
{
    public class CharacterData 
    {

        private var m_statsName:String;
        private var m_displayName:String;
        private var m_linkage_id:String;
        private var m_linkage_id2:String;
        private var m_linkage_id_special:String;
        private var m_costumeID:int;
        private var m_level:int;
        private var m_x_start:Number;
        private var m_y_start:Number;
        private var m_x_respawn:Number;
        private var m_y_respawn:Number;
        private var m_facingRight:Boolean;
        private var m_player_id:int;
        private var m_thumbnail:String;
        private var m_seriesIcon:String;
        private var m_width:Number;
        private var m_height:Number;
        private var m_cam_width:Number;
        private var m_cam_height:Number;
        private var m_cam_x_offset:Number;
        private var m_cam_y_offset:Number;
        private var m_deathSwitchID:String;
        private var m_revivalEffect:String;
        private var m_jumpSpeed:Number;
        private var m_jumpSpeedMidair:Number;
        private var m_jumpSpeedList:String;
        private var m_shortHopSpeed:Number;
        private var m_jumpStartup:int;
        private var m_max_jumpSpeed:Number;
        private var m_midAirTurn:Boolean;
        private var m_midAirHover:int;
        private var m_midAirJumpConstant:int;
        private var m_midAirJumpConstantDelay:int;
        private var m_midAirJumpConstantAccel:Number;
        private var m_wallJump:Boolean;
        private var m_wallStick:int;
        private var m_airDodgeSpeed:Number;
        private var m_dodgeSpeed:Number;
		private var m_dodgeDecel:Number;
        private var m_dodgeLength:int;
        private var m_dodgeInvincibility:int;
        private var m_sideStepLength:int;
        private var m_sideStepInvincibility:int;
        private var m_airDodgeLength:int;
        private var m_airDodgeInvincibility:int;
        private var m_ledgeAttackInvincibility:int;
        private var m_ledgeClimbInvincibility:int;
        private var m_ledgeRollInvincibility:int;
        private var m_roll_invincibility:int;
        private var m_gravity:Number;
        private var m_weight1:Number;
        private var m_weight2:Number;
        private var m_power:String;
        private var m_norm_xSpeed:Number;
        private var m_max_xSpeed:Number;
        private var m_max_ySpeed:Number;
        private var m_fastFallSpeed:Number;
        private var m_accel_start:Number;
        private var m_accel_start_dash:Number;
        private var m_accel_rate:Number;
        private var m_accel_rate_air:Number;
        private var m_decel_rate:Number;
        private var m_decel_rate_air:Number;
        private var m_glideSpeed:Number;
        private var m_holdJump:Boolean;
        private var m_max_jump:int;
        private var m_max_projectile:int;
        private var m_tetherGrab:Boolean;
        private var m_roll_speed:Number;
        private var m_roll_decay:Number;
        private var m_roll_decay_ice:Number;
        private var m_roll_delay:int;
        private var m_getup_roll_delay:int;
        private var m_itemScaleRatio:Number;
        private var m_sizeRatio:Number;
        private var m_shieldType:String;
        private var m_shieldBreakPower:Number;
        private var m_shieldBreakKBConstant:Number;
        private var m_shieldBreakWeightKB:Number;
        private var m_shield_x_offset:Number;
        private var m_shield_y_offset:Number;
        private var m_shield_scale:Number;
        private var m_special_type:int;
        private var m_normalStats_id:String;
        private var m_alternateStats_id:String;
        private var m_specialStats_id:String;
        private var m_sounds:Array;
        private var m_hurtFrames:int;
        private var m_attacks:AttackData;
        private var m_canThrow:Boolean;
        private var m_canHoldItems:Boolean;
        private var m_canUseItems:Boolean;
        private var m_canShield:Boolean;
        private var m_canDodge:Boolean;
        private var m_canTaunt:Boolean;
        private var m_canBarrel:Boolean;
        private var m_grabDamage:int;
        private var m_damageIncrease:Number;
        private var m_damageIncreaseInterval:int;
        private var m_heavyArmor:Number;
        private var m_customShield:Boolean;
        private var m_customShieldStartup:int;
        private var m_crouchWalkSpeed:Number;
        private var m_volume_sfx:Number;
        private var m_volume_vfx:Number;
        private var m_forceTransformTime:int;
        private var m_forceTransformID:String;
        private var m_fs_time_limit:int;
        private var m_fs_magnet:Boolean;
        private var m_timePriority:int;

        public function CharacterData()
        {
            this.m_costumeID = -1;
            this.m_level = 1;
            this.m_x_start = 0;
            this.m_y_start = 0;
            this.m_x_respawn = 0;
            this.m_y_respawn = 0;
            this.m_facingRight = true;
            this.m_player_id = 0;
            this.m_shieldType = null;
            this.m_sizeRatio = 1;
            this.m_statsName = null;
            this.m_displayName = null;
            this.m_linkage_id = null;
            this.m_linkage_id2 = null;
            this.m_linkage_id_special = null;
            this.m_thumbnail = null;
            this.m_seriesIcon = null;
            this.m_width = 0;
            this.m_height = 0;
            this.m_cam_width = 150;
            this.m_cam_height = 150;
            this.m_cam_x_offset = 25;
            this.m_cam_y_offset = 50;
            this.m_deathSwitchID = null;
            this.m_revivalEffect = null;
            this.m_jumpSpeed = 0;
            this.m_jumpSpeedMidair = 0;
            this.m_jumpSpeedList = null;
            this.m_shortHopSpeed = 0;
            this.m_jumpStartup = 0;
            this.m_max_jumpSpeed = 0;
            this.m_midAirTurn = false;
            this.m_midAirHover = 0;
            this.m_midAirJumpConstant = 0;
            this.m_midAirJumpConstantDelay = 0;
            this.m_midAirJumpConstantAccel = 0;
            this.m_wallJump = false;
            this.m_wallStick = 0;
            this.m_airDodgeSpeed = 6.5;
            this.m_dodgeSpeed = 7;
			this.m_dodgeDecel = 0;
            this.m_gravity = 0;
            this.m_weight1 = 1;
            this.m_weight2 = 0.45;
            this.m_power = null;
            this.m_norm_xSpeed = 0;
            this.m_max_xSpeed = 0;
            this.m_max_ySpeed = 0;
            this.m_fastFallSpeed = 0;
            this.m_accel_start = 0;
            this.m_accel_start_dash = -1;
            this.m_accel_rate = 0;
            this.m_accel_rate_air = 0.7;
            this.m_decel_rate = 0;
            this.m_decel_rate_air = -0.15;
            this.m_glideSpeed = 0;
            this.m_holdJump = false;
            this.m_max_jump = 1;
            this.m_max_projectile = 10;
            this.m_tetherGrab = false;
            this.m_roll_speed = 0;
            this.m_roll_decay = 0.65;
            this.m_roll_decay_ice = 0.93;
            this.m_roll_delay = 0;
            this.m_getup_roll_delay = 0;
            this.m_itemScaleRatio = 0;
            this.m_shieldBreakPower = 14;
            this.m_shieldBreakKBConstant = 100;
            this.m_shieldBreakWeightKB = 40;
            this.m_shield_x_offset = 0;
            this.m_shield_y_offset = 0;
            this.m_shield_scale = 1;
            this.m_special_type = 0;
            this.m_normalStats_id = null;
            this.m_alternateStats_id = null;
            this.m_specialStats_id = null;
            this.m_sounds = new Array();
            this.m_hurtFrames = 1;
            this.m_attacks = new AttackData(null, ["a", "a_up", "a_up_tilt", "a_forward", "a_forward_tilt", "a_forwardsmash", "a_down", "a_air", "a_air_up", "a_air_forward", "a_air_backward", "a_air_down", "b", "b_air", "b_up", "b_up_air", "b_forward", "b_forward_air", "b_down", "b_down_air", "throw_up", "throw_forward", "throw_back", "throw_down", "crouch_attack", "ledge_attack", "getup_attack", "kirby", "kirby_air", "star", "item", "special"]);
            this.m_canDodge = true;
            this.m_canHoldItems = true;
            this.m_canShield = true;
            this.m_canThrow = true;
            this.m_canUseItems = true;
            this.m_canTaunt = true;
            this.m_canBarrel = true;
            this.m_grabDamage = 0;
            this.m_damageIncrease = 0;
            this.m_damageIncreaseInterval = 30;
            this.m_heavyArmor = 0;
            this.m_customShield = false;
            this.m_customShieldStartup = 0;
            this.m_crouchWalkSpeed = 0;
            this.m_volume_sfx = 1;
            this.m_volume_vfx = 1;
            this.m_forceTransformTime = 0;
            this.m_forceTransformID = null;
            this.m_fs_time_limit = 0;
            this.m_fs_magnet = false;
            this.m_timePriority = 0;
        }

        public function get StatsName():String
        {
            return (this.m_statsName);
        }

        public function get DisplayName():String
        {
            if (this.m_displayName == null)
            {
                return ("");
            };
            var _local_1:String = this.m_displayName;
            while (_local_1.indexOf("%20") >= 0)
            {
                _local_1 = _local_1.replace("%20", " ");
            };
            return (_local_1);
        }

        public function get LinkageID():String
        {
            return (this.m_linkage_id);
        }

        public function get LinkageID2():String
        {
            return (this.m_linkage_id2);
        }

        public function get LinkageIDSpecial():String
        {
            return (this.m_linkage_id_special);
        }

        public function get CostumeID():int
        {
            return (this.m_costumeID);
        }

        public function get Level():int
        {
            return (this.m_level);
        }

        public function set Level(_arg_1:int):void
        {
            this.m_level = _arg_1;
        }

        public function get XStart():Number
        {
            return (this.m_x_start);
        }

        public function get YStart():Number
        {
            return (this.m_y_start);
        }

        public function get XRespawn():Number
        {
            return (this.m_x_respawn);
        }

        public function get YRespawn():Number
        {
            return (this.m_y_respawn);
        }

        public function get FacingRight():Boolean
        {
            return (this.m_facingRight);
        }

        public function get PlayerID():int
        {
            return (this.m_player_id);
        }

        public function get Thumbnail():String
        {
            return (this.m_thumbnail);
        }

        public function get SeriesIcon():String
        {
            return (this.m_seriesIcon);
        }

        public function get Width():Number
        {
            return (this.m_width);
        }

        public function get Height():Number
        {
            return (this.m_height);
        }

        public function get CamWidth():Number
        {
            return (this.m_cam_width);
        }

        public function get CamHeight():Number
        {
            return (this.m_cam_height);
        }

        public function get CamXOffset():Number
        {
            return (this.m_cam_x_offset);
        }

        public function get CamYOffset():Number
        {
            return (this.m_cam_y_offset);
        }

        public function get DeathSwitchID():String
        {
            return (this.m_deathSwitchID);
        }

        public function get RevivalEffect():String
        {
            return (this.m_revivalEffect);
        }

        public function get JumpSpeed():Number
        {
            return (this.m_jumpSpeed);
        }

        public function get JumpSpeedMidAir():Number
        {
            return (this.m_jumpSpeedMidair);
        }

        public function get JumpSpeedList():String
        {
            return (this.m_jumpSpeedList);
        }

        public function get ShortHopSpeed():Number
        {
            return (this.m_shortHopSpeed);
        }

        public function get JumpStartup():int
        {
            return (this.m_jumpStartup);
        }

        public function get MaxJumpSpeed():Number
        {
            return (this.m_max_jumpSpeed);
        }

        public function set MaxJumpSpeed(_arg_1:Number):void
        {
            this.m_max_jumpSpeed = _arg_1;
        }

        public function get MidAirTurn():Boolean
        {
            return (this.m_midAirTurn);
        }

		public function get DodgeDecel():Number
        {
            return (this.m_dodgeDecel);
        }
		
        public function get MidAirHover():int
        {
            return (this.m_midAirHover);
        }

        public function get MidAirJumpConstant():int
        {
            return (this.m_midAirJumpConstant);
        }

        public function get MidAirJumpConstantDelay():int
        {
            return (this.m_midAirJumpConstantDelay);
        }

        public function get MidAirJumpConstantAccel():Number
        {
            return (this.m_midAirJumpConstantAccel);
        }

        public function get WallJump():Boolean
        {
            return (this.m_wallJump);
        }

        public function get WallStick():int
        {
            return (this.m_wallStick);
        }

        public function get AirDodgeSpeed():int
        {
            return (this.m_airDodgeSpeed);
        }

        public function get DodgeSpeed():Number
        {
            return (this.m_dodgeSpeed);
        }

        public function get Gravity():Number
        {
            return (this.m_gravity);
        }

        public function get Weight1():Number
        {
            return (this.m_weight1);
        }

        public function get Weight2():Number
        {
            return (this.m_weight2);
        }

        public function get Power():String
        {
            return (this.m_power);
        }

        public function set Power(_arg_1:String):void
        {
            this.m_power = _arg_1;
        }

        public function get NormalXSpeed():Number
        {
            return (this.m_norm_xSpeed);
        }

        public function get MaxXSpeed():Number
        {
            return (this.m_max_xSpeed);
        }

        public function get MaxYSpeed():Number
        {
            return (this.m_max_ySpeed);
        }

        public function get FastFallSpeed():Number
        {
            return (this.m_fastFallSpeed);
        }

        public function get AccelStart():Number
        {
            return (this.m_accel_start);
        }

        public function get AccelStartDash():Number
        {
            return (this.m_accel_start_dash);
        }

        public function get AccelRate():Number
        {
            return (this.m_accel_rate);
        }

        public function get AccelRateAir():Number
        {
            return (this.m_accel_rate_air);
        }

        public function get DecelRate():Number
        {
            return (this.m_decel_rate);
        }

        public function get DecelRateAir():Number
        {
            return (this.m_decel_rate_air);
        }

        public function get GlideSpeed():Number
        {
            return (this.m_glideSpeed);
        }

        public function get HoldJump():Boolean
        {
            return (this.m_holdJump);
        }

        public function get MaxJump():int
        {
            return (this.m_max_jump);
        }

        public function get MaxProjectile():int
        {
            return (this.m_max_projectile);
        }

        public function get TetherGrab():Boolean
        {
            return (this.m_tetherGrab);
        }

        public function get RollSpeed():Number
        {
            return (this.m_roll_speed);
        }

        public function get RollDecay():Number
        {
            return (this.m_roll_decay);
        }

        public function get RollDecayIce():Number
        {
            return (this.m_roll_decay_ice);
        }

        public function get RollDelay():int
        {
            return (this.m_roll_delay);
        }

        public function get GetupRollDelay():int
        {
            return (this.m_getup_roll_delay);
        }

        public function get ItemScaleRatio():Number
        {
            return (this.m_itemScaleRatio);
        }

        public function get SizeRatio():Number
        {
            return (this.m_sizeRatio);
        }

        public function get ShieldType():String
        {
            return (this.m_shieldType);
        }

        public function get ShieldBreakPower():Number
        {
            return (this.m_shieldBreakPower);
        }

        public function get ShieldBreakKBConstant():Number
        {
            return (this.m_shieldBreakKBConstant);
        }

        public function get ShieldBreakWeightKB():Number
        {
            return (this.m_shieldBreakWeightKB);
        }

        public function get ShieldXOffset():Number
        {
            return (this.m_shield_x_offset);
        }

        public function get ShieldYOffset():Number
        {
            return (this.m_shield_y_offset);
        }

        public function get ShieldScale():Number
        {
            return (this.m_shield_scale);
        }

        public function get SpecialType():int
        {
            return (this.m_special_type);
        }

        public function get NormalStatsID():String
        {
            return (this.m_normalStats_id);
        }

        public function get AlternateStatsID():String
        {
            return (this.m_alternateStats_id);
        }

        public function get SpecialStatsID():String
        {
            return (this.m_specialStats_id);
        }

        public function get Sounds():Array
        {
            return (this.m_sounds);
        }

        public function set Sounds(_arg_1:Array):void
        {
            this.m_sounds = _arg_1;
        }

        public function get HurtFrames():int
        {
            return (this.m_hurtFrames);
        }

        public function get Attacks():AttackData
        {
            return (this.m_attacks);
        }

        public function get CanDodge():Boolean
        {
            return (this.m_canDodge);
        }

        public function get CanHoldItems():Boolean
        {
            return (this.m_canHoldItems);
        }

        public function get CanThrow():Boolean
        {
            return (this.m_canThrow);
        }

        public function get CanShield():Boolean
        {
            return (this.m_canShield);
        }

        public function get CanUseItems():Boolean
        {
            return (this.m_canUseItems);
        }

        public function get CanTaunt():Boolean
        {
            return (this.m_canTaunt);
        }

        public function get CanBarrel():Boolean
        {
            return (this.m_canBarrel);
        }

        public function get GrabDamage():int
        {
            return (this.m_grabDamage);
        }

        public function get DamageIncrease():Number
        {
            return (this.m_damageIncrease);
        }

        public function get DamageIncreaseInterval():int
        {
            return (this.m_damageIncreaseInterval);
        }

        public function get HeavyArmor():Number
        {
            return (this.m_heavyArmor);
        }

        public function get CustomShield():Boolean
        {
            return (this.m_customShield);
        }

        public function get CustomShieldStartup():int
        {
            return (this.m_customShieldStartup);
        }

        public function get CrouchWalkSpeed():Number
        {
            return (this.m_crouchWalkSpeed);
        }

        public function get VolumeSFX():Number
        {
            return (this.m_volume_sfx);
        }

        public function get VolumeVFX():Number
        {
            return (this.m_volume_vfx);
        }

        public function get ForceTransformTime():int
        {
            return (this.m_forceTransformTime);
        }

        public function get ForceTransformID():String
        {
            return (this.m_forceTransformID);
        }

        public function get FSTimer():int
        {
            return (this.m_fs_time_limit);
        }

        public function get FSMagnet():Boolean
        {
            return (this.m_fs_magnet);
        }

        public function get TimePriority():int
        {
            return (this.m_timePriority);
        }

        public function set TimePriority(value:int):void
        {
            this.m_timePriority = value;
        }

        public function importData(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            if (_arg_1 != null)
            {
                for (_local_2 in _arg_1)
                {
                    if (this[("m_" + _local_2)] !== undefined)
                    {
                        if (_local_2 == "sounds")
                        {
                            for (_local_3 in _arg_1[_local_2])
                            {
                                this.m_sounds[_local_3] = _arg_1[_local_2][_local_3];
                            };
                        }
                        else
                        {
                            this[("m_" + _local_2)] = _arg_1[_local_2];
                        };
                    }
                    else
                    {
                        trace((('You tried to set "m_' + _local_2) + "\" but it doesn't exist in the CharacterData class."));
                    };
                };
                if (this.m_volume_sfx > 1)
                {
                    this.m_volume_sfx = 1;
                }
                else
                {
                    if (this.m_volume_sfx < 0)
                    {
                        this.m_volume_sfx = 0;
                    };
                };
                if (this.m_volume_vfx > 1)
                {
                    this.m_volume_vfx = 1;
                }
                else
                {
                    if (this.m_volume_vfx < 0)
                    {
                        this.m_volume_vfx = 0;
                    };
                };
            };
        }

        public function importAttacks(_arg_1:Object):void
        {
            if (_arg_1 != null)
            {
                this.m_attacks.importAttacks(_arg_1);
            };
        }

        public function addProjectiles(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:ProjectileAttack;
            if (_arg_1 != null)
            {
                for (_local_2 in _arg_1)
                {
                    _local_3 = new ProjectileAttack();
                    _local_3.importProjectileData(_arg_1[_local_2]);
                    this.m_attacks.addProjectile(_local_2, _local_3);
                };
            };
        }

        public function addItems(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:ItemData;
            if (_arg_1 != null)
            {
                for (_local_2 in _arg_1)
                {
                    _local_3 = new ItemData();
                    _local_3.importItemData(_arg_1[_local_2]);
                    this.m_attacks.addItem(_local_2, _local_3);
                };
            };
        }

        public function exportCharacterData(_arg_1:Boolean=false):Object
        {
            var _local_2:Object = new Object();
            var _local_3:int;
            var _local_4:* = null;
            if (_arg_1)
            {
                _local_2.costumeID = this.m_costumeID;
                _local_2.level = this.m_level;
                _local_2.x_start = this.m_x_start;
                _local_2.y_start = this.m_y_start;
                _local_2.x_respawn = this.m_x_respawn;
                _local_2.y_respawn = this.m_y_respawn;
                _local_2.facingRight = this.m_facingRight;
                _local_2.player_id = this.m_player_id;
                _local_2.sizeRatio = this.m_sizeRatio;
                _local_2.shieldType = this.m_shieldType;
            };
            _local_2.statsName = this.m_statsName;
            _local_2.displayName = this.m_displayName;
            _local_2.linkage_id = this.m_linkage_id;
            _local_2.linkage_id2 = this.m_linkage_id2;
            _local_2.linkage_id_special = this.m_linkage_id_special;
            _local_2.thumbnail = this.m_thumbnail;
            _local_2.seriesIcon = this.m_seriesIcon;
            _local_2.width = this.m_width;
            _local_2.height = this.m_height;
            _local_2.cam_width = this.m_cam_width;
            _local_2.cam_height = this.m_cam_height;
            _local_2.cam_x_offset = this.m_cam_x_offset;
            _local_2.cam_y_offset = this.m_cam_y_offset;
            _local_2.deathSwitchID = this.m_deathSwitchID;
            _local_2.revivalEffect = this.m_revivalEffect;
            _local_2.jumpSpeed = this.m_jumpSpeed;
            _local_2.jumpSpeedMidair = this.m_jumpSpeedMidair;
            _local_2.jumpSpeedList = this.m_jumpSpeedList;
            _local_2.shortHopSpeed = this.m_shortHopSpeed;
            _local_2.jumpStartup = this.m_jumpStartup;
            _local_2.max_jumpSpeed = this.m_max_jumpSpeed;
            _local_2.midAirTurn = this.m_midAirTurn;
            _local_2.midAirHover = this.m_midAirHover;
            _local_2.midAirJumpConstant = this.m_midAirJumpConstant;
            _local_2.midAirJumpConstantDelay = this.m_midAirJumpConstantDelay;
            _local_2.midAirJumpConstantAccel = this.m_midAirJumpConstantAccel;
            _local_2.wallJump = this.m_wallJump;
            _local_2.wallStick = this.m_wallStick;
            _local_2.airDodgeSpeed = this.m_airDodgeSpeed;
            _local_2.dodgeSpeed = this.m_dodgeSpeed;
			_local_2.dodgeDecel = this.m_dodgeDecel;
            _local_2.gravity = this.m_gravity;
            _local_2.weight1 = this.m_weight1;
            _local_2.weight2 = this.m_weight2;
            _local_2.power = this.m_power;
            _local_2.norm_xSpeed = this.m_norm_xSpeed;
            _local_2.max_xSpeed = this.m_max_xSpeed;
            _local_2.max_ySpeed = this.m_max_ySpeed;
            _local_2.fastFallSpeed = this.m_fastFallSpeed;
            _local_2.accel_start = this.m_accel_start;
            _local_2.accel_start_dash = this.m_accel_start_dash;
            _local_2.accel_rate = this.m_accel_rate;
            _local_2.accel_rate_air = this.m_accel_rate_air;
            _local_2.decel_rate = this.m_decel_rate;
            _local_2.decel_rate_air = this.m_decel_rate_air;
            _local_2.glideSpeed = this.m_glideSpeed;
            _local_2.holdJump = this.m_holdJump;
            _local_2.max_jump = this.m_max_jump;
            _local_2.max_projectile = this.m_max_projectile;
            _local_2.tetherGrab = this.m_tetherGrab;
            _local_2.roll_speed = this.m_roll_speed;
            _local_2.roll_decay = this.m_roll_decay;
            _local_2.roll_decay_ice = this.m_roll_decay_ice;
            _local_2.roll_delay = this.m_roll_delay;
            _local_2.getup_roll_delay = this.m_getup_roll_delay;
            _local_2.itemScaleRatio = this.m_itemScaleRatio;
            _local_2.shieldBreakPower = this.m_shieldBreakPower;
            _local_2.shieldBreakKBConstant = this.m_shieldBreakKBConstant;
            _local_2.shieldBreakWeightKB = this.m_shieldBreakWeightKB;
            _local_2.shield_x_offset = this.m_shield_x_offset;
            _local_2.shield_y_offset = this.m_shield_y_offset;
            _local_2.shield_scale = this.m_shield_scale;
            _local_2.special_type = this.m_special_type;
            _local_2.normalStats_id = this.m_normalStats_id;
            _local_2.alternateStats_id = this.m_alternateStats_id;
            _local_2.specialStats_id = this.m_specialStats_id;
            _local_2.sounds = new Array();
            for (_local_4 in this.m_sounds)
            {
                _local_2.sounds[_local_4] = this.m_sounds[_local_4];
            };
            _local_2.hurtFrames = this.m_hurtFrames;
            _local_2.attacks = new AttackData(this.m_attacks.Owner, []);
            AttackData(_local_2.attacks).importAttacks(this.m_attacks.AttackArray);
            AttackData(_local_2.attacks).importItems(this.m_attacks.ItemsArray);
            AttackData(_local_2.attacks).importProjectiles(this.m_attacks.ProjectilesArray);
            _local_2.canDodge = this.m_canDodge;
            _local_2.canHoldItems = this.m_canHoldItems;
            _local_2.canShield = this.m_canShield;
            _local_2.canThrow = this.m_canThrow;
            _local_2.canUseItems = this.m_canUseItems;
            _local_2.canTaunt = this.m_canTaunt;
            _local_2.canBarrel = this.m_canBarrel;
            _local_2.grabDamage = this.m_grabDamage;
            _local_2.damageIncrease = this.m_damageIncrease;
            _local_2.damageIncreaseInterval = this.m_damageIncreaseInterval;
            _local_2.heavyArmor = this.m_heavyArmor;
            _local_2.customShield = this.m_customShield;
            _local_2.customShieldStartup = this.m_customShieldStartup;
            _local_2.crouchWalkSpeed = this.m_crouchWalkSpeed;
            _local_2.volume_sfx = this.m_volume_sfx;
            _local_2.volume_vfx = this.m_volume_vfx;
            _local_2.forceTransformTime = this.m_forceTransformTime;
            _local_2.forceTransformID = this.m_forceTransformID;
            _local_2.fs_time_limit = this.m_fs_time_limit;
            _local_2.fs_magnet = this.m_fs_magnet;
            _local_2.timePriority = this.m_timePriority;
            return (_local_2);
        }

        public function getVar(_arg_1:String):*
        {
            if (this[("m_" + _arg_1)] !== undefined)
            {
                return (this[("m_" + _arg_1)]);
            };
            return (null);
        }


    }
}//package com.mcleodgaming.ssf2.engine