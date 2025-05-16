package com.mcleodgaming.ssf2.engine
{
    public class ProjectileAttack 
    {

        private var m_statsName:String;
        private var m_linkage_id:String;
        private var m_inheritPalette:Boolean;
        private var m_width:Number;
        private var m_height:Number;
        private var m_time_max:int;
        private var m_xdecay:Number;
        private var m_trailEffect:String;
        private var m_trailEffectInterval:int;
        private var m_trailEffectRotate:Boolean;
        private var m_homingSpeed:Number;
        private var m_homingEase:Number;
        private var m_xspeed:Number;
        private var m_yspeed:Number;
        private var m_ghost:Boolean;
        private var m_calcAngle:Boolean;
        private var m_influenceXMovement:Number;
        private var m_influenceYMovement:Number;
        private var m_influenceXFactor:Number;
        private var m_influenceYFactor:Number;
        private var m_controlInitDirection:Boolean;
        private var m_controlDirection:Number;
        private var m_rocketSpeed:Number;
        private var m_rocketDecay:Number;
        private var m_rocketAngleAbsolute:Boolean;
        private var m_rocketRotation:Boolean;
        private var m_rotate:Boolean;
        private var m_cancel:Boolean;
        private var m_cancelSoundOnEnd:Boolean;
        private var m_cancelVoiceOnEnd:Boolean;
        private var m_gravity:Number;
        private var m_maxgravity:Number;
        private var m_rideGround:Boolean;
        private var m_disableHurtSound:Boolean;
        private var m_disableHurtFallOff:Boolean;
        private var m_disableLastHitUpdate:Boolean;
        private var m_stale:Boolean;
        private var m_bounce:Number;
        private var m_bounce_decay:Number;
        private var m_bounce_limit:int;
        private var m_bounce_max_height:Number;
        private var m_followUser:Boolean;
        private var m_xoffset:Number;
        private var m_yoffset:Number;
        private var m_canBeReversed:Boolean;
        private var m_canBeAbsorbed:Boolean;
        private var m_sticky:Boolean;
        private var m_latch:Boolean;
        private var m_latch_x_offset:Number;
        private var m_latch_y_offset:Number;
        private var m_suction:Boolean;
        private var m_boomerang:Boolean;
        private var m_limit:int;
        private var m_limitOverwrite:Boolean;
        private var m_linkAttackID:Boolean;
        private var m_lockTrajectory:Boolean;
        private var m_canFallOff:Boolean;
        private var m_noFlip:Boolean;
        private var m_lockSize:Boolean;
        private var m_dangerous:Boolean;
        private var m_suspend:Boolean;
        private var m_surviveDeathBounds:Boolean;
        private var m_sizeStatus:int;
        private var m_attackData:AttackData;

        public function ProjectileAttack()
        {
            this.m_statsName = null;
            this.m_linkage_id = null;
            this.m_inheritPalette = false;
            this.m_width = 0;
            this.m_height = 0;
            this.m_time_max = 60;
            this.m_xdecay = 0;
            this.m_trailEffect = null;
            this.m_trailEffectInterval = 1;
            this.m_trailEffectRotate = false;
            this.m_homingSpeed = -1;
            this.m_homingEase = 1;
            this.m_xspeed = 0;
            this.m_yspeed = 0;
            this.m_ghost = false;
            this.m_calcAngle = false;
            this.m_influenceXMovement = -1;
            this.m_influenceYMovement = -1;
            this.m_influenceXFactor = 1;
            this.m_influenceYFactor = 1;
            this.m_controlInitDirection = false;
            this.m_controlDirection = -1;
            this.m_rocketSpeed = 0;
            this.m_rocketDecay = -1;
            this.m_rocketAngleAbsolute = true;
            this.m_rocketRotation = false;
            this.m_rotate = false;
            this.m_cancel = false;
            this.m_cancelSoundOnEnd = false;
            this.m_cancelVoiceOnEnd = false;
            this.m_gravity = 0;
            this.m_maxgravity = 0;
            this.m_rideGround = true;
            this.m_disableHurtSound = false;
            this.m_disableHurtFallOff = false;
            this.m_disableLastHitUpdate = false;
            this.m_stale = true;
            this.m_bounce = 0;
            this.m_bounce_decay = 1;
            this.m_bounce_limit = 0;
            this.m_bounce_max_height = -1;
            this.m_followUser = false;
            this.m_xoffset = 0;
            this.m_yoffset = 0;
            this.m_canBeReversed = true;
            this.m_canBeAbsorbed = true;
            this.m_sticky = false;
            this.m_latch = false;
            this.m_latch_x_offset = 0;
            this.m_latch_y_offset = 0;
            this.m_suction = false;
            this.m_boomerang = false;
            this.m_limit = 10;
            this.m_limitOverwrite = true;
            this.m_linkAttackID = false;
            this.m_lockTrajectory = false;
            this.m_canFallOff = true;
            this.m_noFlip = false;
            this.m_lockSize = false;
            this.m_surviveDeathBounds = false;
            this.m_dangerous = true;
            this.m_suspend = false;
            this.m_sizeStatus = 0;
            this.m_attackData = new AttackData(null, ["attack_idle"]);
        }

        public function get StatsName():String
        {
            return (this.m_statsName);
        }

        public function set StatsName(_arg_1:String):void
        {
            this.m_statsName = _arg_1;
        }

        public function get LinkageID():String
        {
            return (this.m_linkage_id);
        }

        public function get InheritPalette():Boolean
        {
            return (this.m_inheritPalette);
        }

        public function get Width():Number
        {
            return (this.m_width);
        }

        public function get Height():Number
        {
            return (this.m_height);
        }

        public function get TimeMax():int
        {
            return (this.m_time_max);
        }

        public function get XDecay():Number
        {
            return (this.m_xdecay);
        }

        public function set XDecay(_arg_1:Number):void
        {
            this.m_xdecay = _arg_1;
        }

        public function get TrailEffect():String
        {
            return (this.m_trailEffect);
        }

        public function get TrailEffectInterval():int
        {
            return (this.m_trailEffectInterval);
        }

        public function get TrailEffectRotate():Boolean
        {
            return (this.m_trailEffectRotate);
        }

        public function get HomingSpeed():Number
        {
            return (this.m_homingSpeed);
        }

        public function set HomingSpeed(_arg_1:Number):void
        {
            this.m_homingSpeed = _arg_1;
        }

        public function get HomingEase():Number
        {
            return (this.m_homingEase);
        }

        public function get XSpeed():Number
        {
            return (this.m_xspeed);
        }

        public function get YSpeed():Number
        {
            return (this.m_yspeed);
        }

        public function get Gravity():Number
        {
            return (this.m_gravity);
        }

        public function get MaxGravity():Number
        {
            return (this.m_maxgravity);
        }

        public function get RideGround():Boolean
        {
            return (this.m_rideGround);
        }

        public function get Ghost():Boolean
        {
            return (this.m_ghost);
        }

        public function get CalcAngle():Boolean
        {
            return (this.m_calcAngle);
        }

        public function get InfluenceXMovement():Number
        {
            return (this.m_influenceXMovement);
        }

        public function get InfluenceYMovement():Number
        {
            return (this.m_influenceYMovement);
        }

        public function get InfluenceXFactor():Number
        {
            return (this.m_influenceXFactor);
        }

        public function get InfluenceYFactor():Number
        {
            return (this.m_influenceYFactor);
        }

        public function get ControlInitDirection():Boolean
        {
            return (this.m_controlInitDirection);
        }

        public function get ControlDirection():Number
        {
            return (this.m_controlDirection);
        }

        public function get RocketSpeed():Number
        {
            return (this.m_rocketSpeed);
        }

        public function set RocketSpeed(_arg_1:Number):void
        {
            this.m_rocketSpeed = _arg_1;
        }

        public function get RocketAngleAbsolute():Boolean
        {
            return (this.m_rocketAngleAbsolute);
        }

        public function get RocketDecay():Number
        {
            return (this.m_rocketDecay);
        }

        public function get RocketRotation():Boolean
        {
            return (this.m_rocketRotation);
        }

        public function get Rotate():Boolean
        {
            return (this.m_rotate);
        }

        public function get Cancel():Boolean
        {
            return (this.m_cancel);
        }

        public function get CancelSoundOnEnd():Boolean
        {
            return (this.m_cancelSoundOnEnd);
        }

        public function get CancelVoiceOnEnd():Boolean
        {
            return (this.m_cancelVoiceOnEnd);
        }

        public function get DisableHurtSound():Boolean
        {
            return (this.m_disableHurtSound);
        }

        public function get DisableHurtFallOff():Boolean
        {
            return (this.m_disableHurtFallOff);
        }

        public function get DisableLastHitUpdate():Boolean
        {
            return (this.m_disableLastHitUpdate);
        }

        public function get Stale():Boolean
        {
            return (this.m_stale);
        }

        public function get Bounce():Number
        {
            return (this.m_bounce);
        }

        public function set Bounce(_arg_1:Number):void
        {
            this.m_bounce = _arg_1;
        }

        public function get BounceDecay():Number
        {
            return (this.m_bounce_decay);
        }

        public function get BounceLimit():int
        {
            return (this.m_bounce_limit);
        }

        public function get BounceMaxHeight():Number
        {
            return (this.m_bounce_max_height);
        }

        public function get FollowUser():Boolean
        {
            return (this.m_followUser);
        }

        public function get XOffset():Number
        {
            return (this.m_xoffset);
        }

        public function get YOffset():Number
        {
            return (this.m_yoffset);
        }

        public function get CanBeReversed():Boolean
        {
            return (this.m_canBeReversed);
        }

        public function set CanBeReversed(_arg_1:Boolean):void
        {
            this.m_canBeReversed = _arg_1;
        }

        public function get CanBeAbsorbed():Boolean
        {
            return (this.m_canBeAbsorbed);
        }

        public function get Sticky():Boolean
        {
            return (this.m_sticky);
        }

        public function get Latch():Boolean
        {
            return (this.m_latch);
        }

        public function get LatchXOffset():Number
        {
            return (this.m_latch_x_offset);
        }

        public function get LatchYOffset():Number
        {
            return (this.m_latch_y_offset);
        }

        public function get Suction():Boolean
        {
            return (this.m_suction);
        }

        public function get Boomerang():Boolean
        {
            return (this.m_boomerang);
        }

        public function get Limit():int
        {
            return (this.m_limit);
        }

        public function get LimitOverwrite():Boolean
        {
            return (this.m_limitOverwrite);
        }

        public function get LinkAttackID():Boolean
        {
            return (this.m_linkAttackID);
        }

        public function get LockTrajectory():Boolean
        {
            return (this.m_lockTrajectory);
        }

        public function get CanFallOff():Boolean
        {
            return (this.m_canFallOff);
        }

        public function get NoFlip():Boolean
        {
            return (this.m_noFlip);
        }

        public function get LockSize():Boolean
        {
            return (this.m_lockSize);
        }

        public function get Dangerous():Boolean
        {
            return (this.m_dangerous);
        }

        public function get Suspend():Boolean
        {
            return (this.m_suspend);
        }

        public function get SurviveDeathBounds():Boolean
        {
            return (this.m_surviveDeathBounds);
        }

        public function get SizeStatus():int
        {
            return (this.m_sizeStatus);
        }

        public function get AttackDataObj():AttackData
        {
            return (this.m_attackData);
        }

        public function Clone():ProjectileAttack
        {
            var _local_1:Object = this.exportProjectileData();
            var _local_2:ProjectileAttack = new ProjectileAttack();
            _local_2.importProjectileData(_local_1);
            return (_local_2);
        }

        public function importProjectileData(_arg_1:Object):Boolean
        {
            var _local_3:*;
            var _local_2:Boolean = true;
            for (_local_3 in _arg_1)
            {
                if (this.m_attackData.getAttack(_local_3) != null)
                {
                    this.m_attackData.getAttack(_local_3).importAttackData(_arg_1[_local_3]);
                }
                else
                {
                    if (this[("m_" + _local_3)] !== undefined)
                    {
                        this[("m_" + _local_3)] = _arg_1[_local_3];
                    }
                    else
                    {
                        _local_2 = false;
                        trace((((('You tried to set "m_' + _local_3) + "\" but it doesn't exist in the ProjectileAttack class. (") + _arg_1["linkage_id"]) + ")"));
                    };
                };
            };
            return (_local_2);
        }

        public function exportProjectileData():Object
        {
            var _local_2:*;
            var _local_1:Object = new Object();
            _local_1.statsName = this.m_statsName;
            _local_1.linkage_id = this.m_linkage_id;
            _local_1.inheritPalette = this.m_inheritPalette;
            _local_1.width = this.m_width;
            _local_1.height = this.m_height;
            _local_1.time_max = this.m_time_max;
            _local_1.xdecay = this.m_xdecay;
            _local_1.trailEffect = this.m_trailEffect;
            _local_1.trailEffectInterval = this.m_trailEffectInterval;
            _local_1.trailEffectRotate = this.m_trailEffectRotate;
            _local_1.homingSpeed = this.m_homingSpeed;
            _local_1.homingEase = this.m_homingEase;
            _local_1.xspeed = this.m_xspeed;
            _local_1.yspeed = this.m_yspeed;
            _local_1.ghost = this.m_ghost;
            _local_1.calcAngle = this.m_calcAngle;
            _local_1.influenceXMovement = this.m_influenceXMovement;
            _local_1.influenceYMovement = this.m_influenceYMovement;
            _local_1.influenceXFactor = this.m_influenceXFactor;
            _local_1.influenceYFactor = this.m_influenceYFactor;
            _local_1.controlInitDirection = this.m_controlInitDirection;
            _local_1.controlDirection = this.m_controlDirection;
            _local_1.rocketSpeed = this.m_rocketSpeed;
            _local_1.rocketDecay = this.m_rocketDecay;
            _local_1.rocketAngleAbsolute = this.m_rocketAngleAbsolute;
            _local_1.rocketRotation = this.m_rocketRotation;
            _local_1.rotate = this.m_rotate;
            _local_1.cancel = this.m_cancel;
            _local_1.cancelSoundOnEnd = this.m_cancelSoundOnEnd;
            _local_1.cancelVoiceOnEnd = this.m_cancelVoiceOnEnd;
            _local_1.gravity = this.m_gravity;
            _local_1.maxgravity = this.m_maxgravity;
            _local_1.rideGround = this.m_rideGround;
            _local_1.disableHurtSound = this.m_disableHurtSound;
            _local_1.disableHurtFallOff = this.m_disableHurtFallOff;
            _local_1.disableLastHitUpdate = this.m_disableLastHitUpdate;
            _local_1.bounce = this.m_bounce;
            _local_1.bounce_decay = this.m_bounce_decay;
            _local_1.bounce_limit = this.m_bounce_limit;
            _local_1.bounce_max_height = this.m_bounce_max_height;
            _local_1.followUser = this.m_followUser;
            _local_1.xoffset = this.m_xoffset;
            _local_1.yoffset = this.m_yoffset;
            _local_1.canBeReversed = this.m_canBeReversed;
            _local_1.canBeAbsorbed = this.m_canBeAbsorbed;
            _local_1.sticky = this.m_sticky;
            _local_1.latch = this.m_latch;
            _local_1.latch_x_offset = this.m_latch_x_offset;
            _local_1.latch_y_offset = this.m_latch_y_offset;
            _local_1.suction = this.m_suction;
            _local_1.boomerang = this.m_boomerang;
            _local_1.limit = this.m_limit;
            _local_1.limitOverwrite = this.m_limitOverwrite;
            _local_1.linkAttackID = this.m_linkAttackID;
            _local_1.lockTrajectory = this.m_lockTrajectory;
            _local_1.canFallOff = this.m_canFallOff;
            _local_1.noFlip = this.m_noFlip;
            _local_1.lockSize = this.m_lockSize;
            _local_1.surviveDeathBounds = this.m_surviveDeathBounds;
            _local_1.dangerous = this.m_dangerous;
            _local_1.suspend = this.m_suspend;
            _local_1.sizeStatus = this.m_sizeStatus;
            for (_local_2 in this.m_attackData.AttackArray)
            {
                _local_1[_local_2] = this.m_attackData.AttackArray[_local_2].exportAttackData();
            };
            return (_local_1);
        }

        public function exportAttackStateData():Object
        {
            var _local_1:Object = new Object();
            _local_1.cancelSoundOnEnd = this.m_cancelSoundOnEnd;
            _local_1.cancelVoiceOnEnd = this.m_cancelVoiceOnEnd;
            _local_1.sizeStatus = this.m_sizeStatus;
            _local_1.disableHurtSound = this.m_disableHurtSound;
            _local_1.disableHurtFallOff = this.m_disableHurtFallOff;
            _local_1.disableLastHitUpdate = this.m_disableLastHitUpdate;
            _local_1.rotate = this.m_rotate;
            return (_local_1);
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
