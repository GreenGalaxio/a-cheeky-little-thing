package com.mcleodgaming.ssf2.engine
{
    import com.mcleodgaming.ssf2.util.Dictionary;
    import com.mcleodgaming.ssf2.events.SSF2Event;

    public class AttackData 
    {

        private var m_owner:InteractiveSprite;
        private var m_attacks:Object;
        private var m_attackMap:Dictionary;
        private var m_projectiles:Array;
        private var m_items:Array;

        public function AttackData(_arg_1:InteractiveSprite, _arg_2:Array=null)
        {
            this.m_owner = _arg_1;
            var _local_3:Array = ((_arg_2) ? _arg_2 : new Array());
            this.m_attacks = new Object();
            this.m_attackMap = new Dictionary(AttackObject);
            this.m_projectiles = new Array();
            this.m_items = new Array();
            var _local_4:Number = 0;
            while (_local_4 < _local_3.length)
            {
                this.m_attacks[_local_3[_local_4]] = new AttackObject(_local_3[_local_4]);
                this.m_attackMap.push(_local_3[_local_4], this.m_attacks[_local_3[_local_4]]);
                _local_4++;
            };
        }

        public function get Owner():InteractiveSprite
        {
            return (this.m_owner);
        }

        public function set Owner(_arg_1:InteractiveSprite):void
        {
            this.m_owner = _arg_1;
        }

        public function get AttackArray():Object
        {
            return (this.m_attacks);
        }

        public function get AttackMap():Dictionary
        {
            return (this.m_attackMap);
        }

        public function get ProjectilesArray():Object
        {
            return (this.m_projectiles);
        }

        public function get ItemsArray():Object
        {
            return (this.m_items);
        }

        public function setAttackDamageVar(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:*):void
        {
            var _local_5:Object;
            if (((!(this.m_attacks[_arg_1] == null)) && (!(this.m_attacks[_arg_1].AttackBoxes[_arg_2] == null))))
            {
                _local_5 = new Object();
                _local_5[_arg_3] = _arg_4;
                this.m_attacks[_arg_1].AttackBoxes[_arg_2].importAttackDamageData(_local_5);
            }
            else
            {
                trace((((_arg_1 + " does not cotnain the hitbox ") + _arg_2) + " in AttackData array"));
            };
        }

        public function setAttackBoxDataOverride(_arg_1:String, _arg_2:String, _arg_3:Object):void
        {
            var _local_5:*;
            var _local_4:AttackObject = this.getAttack(_arg_1);
            if (_local_4)
            {
                if (_local_4.AttackBoxes[_arg_2])
                {
                    if (_local_4.OverrideMap.containsKey(_arg_2))
                    {
                        for (_local_5 in _arg_3)
                        {
                            _local_4.OverrideMap.getKey(_arg_2)[_local_5] = _arg_3[_local_5];
                        };
                    }
                    else
                    {
                        _local_4.OverrideMap.setKey(_arg_2, _arg_3);
                    };
                };
            };
        }

        public function getAttackBoxData(_arg_1:String, _arg_2:String):AttackDamage
        {
            var _local_3:AttackDamage = new AttackDamage(((this.m_owner) ? this.m_owner.ID : -1), this.m_owner);
            var _local_4:AttackObject = this.getAttack(_arg_1);
            if (_local_4)
            {
                if (((_local_4.AttackBoxes[_arg_2]) && ((!(this.m_owner)) || (this.m_owner.AttackStateData))))
                {
                    _local_3.importAttackDamageData(_local_4.AttackBoxes[_arg_2].exportAttackDamageData());
                    if (_local_4.OverrideMap.containsKey(_arg_2))
                    {
                        _local_3.importAttackDamageData(_local_4.OverrideMap.getKey(_arg_2));
                    };
                };
            };
            return (_local_3);
        }

        public function resetCharges():void
        {
            var _local_1:*;
            for (_local_1 in this.m_attacks)
            {
                this.m_attacks[_local_1].ChargeTime = 0;
            };
        }

        public function resetDisabledAttacks():void
        {
            var _local_1:*;
            for (_local_1 in this.m_attacks)
            {
                this.m_attacks[_local_1].IsDisabled = false;
            };
        }

        public function incrementAttackTimers(_arg_1:Character):void
        {
            var _local_2:*;
            for (_local_2 in this.m_attacks)
            {
                if (((this.m_attacks[_local_2].ReenableTimer > 0) && (this.m_attacks[_local_2].ReenableTimerCount > 0)))
                {
                    this.m_attacks[_local_2].ReenableTimerCount--;
                    if (this.m_attacks[_local_2].ReenableTimerCount == 0)
                    {
                        if (this.m_owner)
                        {
                            this.m_owner.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_ENABLED, {
                                "caller":this,
                                "attackData":this.m_attacks[_local_2].exportAttackData()
                            }));
                        };
                        this.m_attacks[_local_2].IsDisabled = false;
                        if (this.m_attacks[_local_2].ReenableEffect != null)
                        {
                            _arg_1.attachEffect(this.m_attacks[_local_2].ReenableEffect);
                        };
                    };
                };
                this.m_attacks[_local_2].LastUsed++;
                this.m_attacks[_local_2].LastUsedPrevious++;
            };
        }

        public function addProjectile(_arg_1:String, _arg_2:ProjectileAttack):void
        {
            this.m_projectiles[_arg_1] = _arg_2;
            _arg_2.StatsName = _arg_1;
        }

        public function getProjectile(_arg_1:String):ProjectileAttack
        {
            if (this.m_projectiles[_arg_1] == undefined)
            {
                return (null);
            };
            return (this.m_projectiles[_arg_1]);
        }

        public function addItem(_arg_1:String, _arg_2:ItemData):void
        {
            this.m_items[_arg_1] = _arg_2;
        }

        public function getItem(_arg_1:String):ItemData
        {
            if (this.m_items[_arg_1] == undefined)
            {
                return (null);
            };
            return (this.m_items[_arg_1]);
        }

        public function getAttack(_arg_1:String):AttackObject
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            return ((this.m_attacks[_arg_1] != null) ? this.m_attacks[_arg_1] : null);
        }

        public function setAttack(_arg_1:String, _arg_2:AttackObject):void
        {
            if (((!(_arg_1 == null)) && (!(_arg_2 == null))))
            {
                _arg_2.Name = _arg_1;
                this.m_attacks[_arg_1] = _arg_2;
            }
            else
            {
                trace((((('Error, in attempting to set "' + _arg_1) + '" to "') + _arg_2.Name) + '"a null was returned'));
            };
        }

        public function setAttackVar(_arg_1:String, _arg_2:String, _arg_3:*):void
        {
            var _local_4:Object;
            if (this.m_attacks[_arg_1] != null)
            {
                _local_4 = new Object();
                _local_4[_arg_2] = _arg_3;
                this.m_attacks[_arg_1].importAttackData(_local_4);
            }
            else
            {
                trace((_arg_1 + " does not exist in AttackData array"));
            };
        }

        public function importAttacks(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                if (this.m_attacks[_local_2] !== undefined)
                {
                    this.m_attacks[_local_2].importAttackData(_arg_1[_local_2]);
                }
                else
                {
                    this.m_attacks[_local_2] = new AttackObject(_local_2);
                    this.m_attacks[_local_2].importAttackData(_arg_1[_local_2]);
                };
            };
        }

        public function importProjectiles(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                if (this.m_projectiles[_local_2] !== undefined)
                {
                    this.m_projectiles[_local_2].importProjectileData(_arg_1[_local_2]);
                }
                else
                {
                    this.m_projectiles[_local_2] = new ProjectileAttack();
                    this.m_projectiles[_local_2].importProjectileData(_arg_1[_local_2]);
                };
            };
        }

        public function importItems(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                if (_arg_1[_local_2] !== undefined)
                {
                    _arg_1[_local_2].importItemData(_arg_1[_local_2]);
                }
                else
                {
                    _arg_1[_local_2] = new ItemData();
                    _arg_1[_local_2].importItemData(_arg_1[_local_2]);
                };
            };
        }


    }
}//package com.mcleodgaming.ssf2.engine