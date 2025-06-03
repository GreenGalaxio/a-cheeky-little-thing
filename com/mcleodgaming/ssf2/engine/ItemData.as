package com.mcleodgaming.ssf2.engine
{
    public class ItemData 
    {

        private var m_statsName:String;
        private var m_class_id:String;
        private var m_linkage_id:String;
        private var m_inheritPalette:Boolean;
        private var m_displayName:String;
        private var m_holdLinkage_id:String;
        private var m_width:Number;
        private var m_height:Number;
        private var m_specialAction:Boolean;
        private var m_generate:Boolean;
        private var m_retainPlayerID:Boolean;
        private var m_affectsOwner:Boolean;
        private var m_ownerCanAffect:Boolean;
        private var m_ricochet:Boolean;
        private var m_damageOnHit:Boolean;
        private var m_damageSelfOnHit:Boolean;
        private var m_freezeOnHit:Boolean;
        private var m_disableFlip:Boolean;
        private var m_frame:String;
        private var m_willBreak:Boolean;
        private var m_sizeRatio:Number;
        private var m_autopickup:Boolean;
        private var m_midairPickup:Boolean;
        private var m_dropInMidair:Boolean;
        private var m_canHit:Boolean;
        private var m_canBeReversed:Boolean;
        private var m_canPickup:Boolean;
        private var m_canBackToss:Boolean;
        private var m_canJumpWith:Boolean;
        private var m_canAttackWith:Boolean;
        private var m_canHangWith:Boolean;
        private var m_canShieldWith:Boolean;
        private var m_canBePushed:Boolean;
        private var m_isHeavy:Boolean;
        private var m_consume:Boolean;
        private var m_ability:String;
        private var m_recover:int;
        private var m_removeWhileHolding:Boolean;
        private var m_removeAfterUse:Boolean;
        private var m_dieInAir:Boolean;
        private var m_uses_max:int;
        private var m_time_max:int;
        private var m_gravity:Number;
        private var m_max_gravity:Number;
        private var m_max_projectile:int;
        private var m_effectSound:String;
        private var m_landSound:String;
        private var m_useInAir:Boolean;
        private var m_continueOnGround:Boolean;
        private var m_bounce:Number;
        private var m_bounce_decay:Number;
        private var m_bounce_limit:int;
        private var m_bounce_max_height:Number;
        private var m_initialBounce:Boolean;
        private var m_slideDecay:Number;
        private var m_tossSpeed:Number;
        private var m_throwSpeed:Number;
        private var m_dangerous:Boolean;
        private var m_attackData:AttackData;
        private var m_projectiles:Object;

        public function ItemData()
        {
            this.m_statsName = null;
            this.m_class_id = null;
            this.m_linkage_id = null;
            this.m_inheritPalette = false;
            this.m_displayName = null;
            this.m_holdLinkage_id = null;
            this.m_width = 0;
            this.m_height = 0;
            this.m_specialAction = false;
            this.m_generate = false;
            this.m_retainPlayerID = false;
            this.m_affectsOwner = false;
            this.m_ownerCanAffect = false;
            this.m_ricochet = false;
            this.m_damageOnHit = false;
            this.m_damageSelfOnHit = false;
            this.m_freezeOnHit = false;
            this.m_disableFlip = false;
            this.m_frame = null;
            this.m_willBreak = false;
            this.m_sizeRatio = 1;
            this.m_autopickup = false;
            this.m_midairPickup = true;
            this.m_dropInMidair = false;
            this.m_canHit = true;
            this.m_canBeReversed = true;
            this.m_canPickup = false;
            this.m_canBackToss = false;
            this.m_canJumpWith = true;
            this.m_canAttackWith = true;
            this.m_canHangWith = true;
            this.m_canShieldWith = true;
            this.m_canBePushed = true;
            this.m_isHeavy = false;
            this.m_consume = false;
            this.m_useInAir = false;
            this.m_ability = null;
            this.m_recover = 0;
            this.m_removeAfterUse = false;
            this.m_removeWhileHolding = false;
            this.m_dieInAir = false;
            this.m_uses_max = -1;
            this.m_time_max = 750;
            this.m_gravity = 0;
            this.m_max_gravity = 5;
            this.m_max_projectile = 10;
            this.m_effectSound = null;
            this.m_landSound = "item_land";
            this.m_continueOnGround = false;
            this.m_bounce = 0;
            this.m_bounce_decay = 1;
            this.m_bounce_limit = 0;
            this.m_bounce_max_height = -1;
            this.m_initialBounce = true;
            this.m_slideDecay = 0.85;
            this.m_tossSpeed = 0;
            this.m_throwSpeed = 0;
            this.m_dangerous = false;
            this.m_attackData = new AttackData(null, ["attack_idle", "attack_neutral", "attack_smash", "attack_throw", "attack_toss", "attack_hold"]);
            this.m_projectiles = new Object();
        }

        public function get StatsName():String
        {
            return (this.m_statsName);
        }

        public function get ClassID():String
        {
            return (this.m_class_id);
        }

        public function get LinkageID():String
        {
            return (this.m_linkage_id);
        }

        public function get InheritPalette():Boolean
        {
            return (this.m_inheritPalette);
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

        public function get HoldLinkageID():String
        {
            return (this.m_holdLinkage_id);
        }

        public function get Width():Number
        {
            return (this.m_width);
        }

        public function get Height():Number
        {
            return (this.m_height);
        }

        public function get SpecialAction():Boolean
        {
            return (this.m_specialAction);
        }

        public function set SpecialAction(_arg_1:Boolean):void
        {
            this.m_specialAction = _arg_1;
        }

        public function get Generate():Boolean
        {
            return (this.m_generate);
        }

        public function get RetainPlayerID():Boolean
        {
            return (this.m_retainPlayerID);
        }

        public function get AffectsOwner():Boolean
        {
            return (this.m_affectsOwner);
        }

        public function get OwnerCanAffect():Boolean
        {
            return (this.m_ownerCanAffect);
        }

        public function get Ricochet():Boolean
        {
            return (this.m_ricochet);
        }

        public function get DamageOnHit():Boolean
        {
            return (this.m_damageOnHit);
        }

        public function get DamageSelfOnHit():Boolean
        {
            return (this.m_damageSelfOnHit);
        }

        public function get FreezeOnHit():Boolean
        {
            return (this.m_freezeOnHit);
        }

        public function get DisableFlip():Boolean
        {
            return (this.m_disableFlip);
        }

        public function get Frame():String
        {
            return (this.m_frame);
        }

        public function get WillBreak():Boolean
        {
            return (this.m_willBreak);
        }

        public function get SizeRatio():Number
        {
            return (this.m_sizeRatio);
        }

        public function get AutoPickup():Boolean
        {
            return (this.m_autopickup);
        }

        public function get MidairPickup():Boolean
        {
            return (this.m_midairPickup);
        }

        public function get DropInMidair():Boolean
        {
            return (this.m_dropInMidair);
        }

        public function get CanHit():Boolean
        {
            return (this.m_canHit);
        }

        public function set CanHit(_arg_1:Boolean):void
        {
            this.m_canHit = _arg_1;
        }

        public function get CanBeReversed():Boolean
        {
            return (this.m_canBeReversed);
        }

        public function set CanBeReversed(_arg_1:Boolean):void
        {
            this.m_canBeReversed = _arg_1;
        }

        public function get CanPickup():Boolean
        {
            return (this.m_canPickup);
        }

        public function set CanPickup(_arg_1:Boolean):void
        {
            this.m_canPickup = _arg_1;
        }

        public function get CanBackToss():Boolean
        {
            return (this.m_canBackToss);
        }

        public function get CanJumpWith():Boolean
        {
            return (this.m_canJumpWith);
        }

        public function get CanAttackWith():Boolean
        {
            return (this.m_canAttackWith);
        }

        public function get CanHangWith():Boolean
        {
            return (this.m_canHangWith);
        }

        public function get CanShieldWith():Boolean
        {
            return (this.m_canShieldWith);
        }

        public function get CanBePushed():Boolean
        {
            return (this.m_canBePushed);
        }

        public function set CanBePushed(_arg_1:Boolean):void
        {
            this.m_canBePushed = _arg_1;
        }

        public function get IsHeavy():Boolean
        {
            return (this.m_isHeavy);
        }

        public function get Consume():Boolean
        {
            return (this.m_consume);
        }

        public function get UseInAir():Boolean
        {
            return (this.m_useInAir);
        }

        public function get Ability():String
        {
            return (this.m_ability);
        }

        public function get Recover():int
        {
            return (this.m_recover);
        }

        public function get RemoveAfterUse():Boolean
        {
            return (this.m_removeAfterUse);
        }

        public function get RemoveWhileHolding():Boolean
        {
            return (this.m_removeWhileHolding);
        }

        public function get DieInAir():Boolean
        {
            return (this.m_dieInAir);
        }

        public function get UsesMax():int
        {
            return (this.m_uses_max);
        }

        public function get TimeMax():int
        {
            return (this.m_time_max);
        }

        public function set TimeMax(_arg_1:int):void
        {
            this.m_time_max = _arg_1;
        }

        public function get Gravity():Number
        {
            return (this.m_gravity);
        }

        public function get MaxGravity():Number
        {
            return (this.m_max_gravity);
        }

        public function get MaxProjectile():int
        {
            return (this.m_max_projectile);
        }

        public function get EffectSound():String
        {
            return (this.m_effectSound);
        }

        public function get LandSound():String
        {
            return (this.m_landSound);
        }

        public function get ContinueOnGround():Boolean
        {
            return (this.m_continueOnGround);
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

        public function get InitialBounce():Boolean
        {
            return (this.m_initialBounce);
        }

        public function get Dangerous():Boolean
        {
            return (this.m_dangerous);
        }

        public function set Dangerous(_arg_1:Boolean):void
        {
            this.m_dangerous = _arg_1;
        }

        public function get SlideDecay():Number
        {
            return (this.m_slideDecay);
        }

        public function set SlideDecay(_arg_1:Number):void
        {
            this.m_slideDecay = _arg_1;
        }

        public function get TossSpeed():Number
        {
            return (this.m_tossSpeed);
        }

        public function get ThrowSpeed():Number
        {
            return (this.m_throwSpeed);
        }

        public function get AttackDataObj():AttackData
        {
            return (this.m_attackData);
        }

        public function get Projectiles():Object
        {
            return (this.m_projectiles);
        }

        public function importItemData(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                if (this.m_attackData.getAttack(_local_2) != null)
                {
                    this.m_attackData.getAttack(_local_2).importAttackData(_arg_1[_local_2]);
                }
                else
                {
                    if (this[("m_" + _local_2)] !== undefined)
                    {
                        this[("m_" + _local_2)] = _arg_1[_local_2];
                    }
                    else
                    {
                        trace((('You tried to set "m_' + _local_2) + "\" but it doesn't exist in the ItemData class."));
                    };
                };
            };
        }

        public function exportItemData():Object
        {
            var _local_1:Object = new Object();
            _local_1.statsName = this.m_statsName;
            _local_1.class_id = this.m_class_id;
            _local_1.linkage_id = this.m_linkage_id;
            _local_1.inheritPalette = this.m_inheritPalette;
            _local_1.displayName = this.m_displayName;
            _local_1.holdLinkage_id = this.m_holdLinkage_id;
            _local_1.width = this.m_width;
            _local_1.height = this.m_height;
            _local_1.specialAction = this.m_specialAction;
            _local_1.generate = this.m_generate;
            _local_1.retainPlayerID = this.m_retainPlayerID;
            _local_1.affectsOwner = this.m_affectsOwner;
            _local_1.ownerCanAffect = this.m_ownerCanAffect;
            _local_1.ricochet = this.m_ricochet;
            _local_1.damageOnHit = this.m_damageOnHit;
            _local_1.damageSelfOnHit = this.m_damageSelfOnHit;
            _local_1.freezeOnHit = this.m_freezeOnHit;
            _local_1.disableFlip = this.m_disableFlip;
            _local_1.frame = this.m_frame;
            _local_1.willBreak = this.m_willBreak;
            _local_1.sizeRatio = this.m_sizeRatio;
            _local_1.autopickup = this.m_autopickup;
            _local_1.midairPickup = this.m_midairPickup;
            _local_1.dropInMidair = this.m_dropInMidair;
            _local_1.canHit = this.m_canHit;
            _local_1.canBeReversed = this.m_canBeReversed;
            _local_1.canPickup = this.m_canPickup;
            _local_1.canBackToss = this.m_canBackToss;
            _local_1.canJumpWith = this.m_canJumpWith;
            _local_1.canAttackWith = this.m_canAttackWith;
            _local_1.canHangWith = this.m_canHangWith;
            _local_1.canShieldWith = this.m_canShieldWith;
            _local_1.canBePushed = this.m_canBePushed;
            _local_1.isHeavy = this.m_isHeavy;
            _local_1.consume = this.m_consume;
            _local_1.useInAir = this.m_useInAir;
            _local_1.ability = this.m_ability;
            _local_1.recover = this.m_recover;
            _local_1.removeAfterUse = this.m_removeAfterUse;
            _local_1.removeWhileHolding = this.m_removeWhileHolding;
            _local_1.dieInAir = this.m_dieInAir;
            _local_1.uses_max = this.m_uses_max;
            _local_1.time_max = this.m_time_max;
            _local_1.gravity = this.m_gravity;
            _local_1.max_gravity = this.m_max_gravity;
            _local_1.max_projectile = this.m_max_projectile;
            _local_1.effectSound = this.m_effectSound;
            _local_1.landSound = this.m_landSound;
            _local_1.continueOnGround = this.m_continueOnGround;
            _local_1.bounce = this.m_bounce;
            _local_1.bounce_decay = this.m_bounce_decay;
            _local_1.bounce_limit = this.m_bounce_limit;
            _local_1.bounce_max_height = this.m_bounce_max_height;
            _local_1.initialBounce = this.m_initialBounce;
            _local_1.slideDecay = this.m_slideDecay;
            _local_1.tossSpeed = this.m_tossSpeed;
            _local_1.throwSpeed = this.m_throwSpeed;
            _local_1.dangerous = this.m_dangerous;
            _local_1.projectiles = this.m_projectiles;
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