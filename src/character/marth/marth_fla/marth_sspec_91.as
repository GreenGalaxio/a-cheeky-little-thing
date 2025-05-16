// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_sspec_91

package marth_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class marth_sspec_91 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var controls:Object;
        public var failed:*;
        public var pressed1:Boolean;
        public var pressed2:Boolean;
        public var step:int;
        public var sideBUsed:Number;
        public var danceBoost:*;

        public function marth_sspec_91()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 7, this.frame8, 14, this.frame15, 15, this.frame16, 17, this.frame18, 19, this.frame20, 28, this.frame29, 29, this.frame30, 30, this.frame31, 34, this.frame35, 44, this.frame45, 45, this.frame46, 48, this.frame49, 51, this.frame52, 59, this.frame60, 60, this.frame61, 65, this.frame66, 68, this.frame69, 80, this.frame81, 81, this.frame82, 84, this.frame85, 88, this.frame89, 93, this.frame94, 94, this.frame95, 97, this.frame98, 116, this.frame117, 117, this.frame118, 119, this.frame120, 133, this.frame134, 134, this.frame135, 137, this.frame138, 142, this.frame143, 147, this.frame148, 157, this.frame158);
        }

        public function continueCombo():*
        {
            var _local_1:String;
            if (!this.failed)
            {
                this.controls = this.self.getControls();
                if (!this.controls.BUTTON1)
                {
                    this.pressed1 = true;
                };
                if (((this.pressed1) && (this.controls.BUTTON1)))
                {
                    this.pressed2 = true;
                };
            }
            else
            {
                this.pressed1 = false;
                this.pressed2 = false;
            };
            if (this.pressed2)
            {
                this.pressed1 = false;
                this.pressed2 = false;
                SSF2API.destroyTimer(this.self, this.continueCombo);
                this.self.refreshAttackID();
                this.step++;
                if ((((this.controls.RIGHT) || (this.controls.LEFT)) || ((this.controls.DOWN) && (this.step == 2))))
                {
                    _local_1 = ("forward" + this.step);
                }
                else
                {
                    if (this.controls.UP)
                    {
                        _local_1 = ("up" + this.step);
                    }
                    else
                    {
                        if (this.controls.DOWN)
                        {
                            _local_1 = ("down" + this.step);
                        }
                        else
                        {
                            _local_1 = ("forward" + this.step);
                        };
                    };
                };
                if (((_local_1 == "") || (this.step > 4)))
                {
                    this.failed = true;
                }
                else
                {
                    gotoAndPlay(_local_1);
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.failed = false;
            this.pressed1 = false;
            this.pressed2 = false;
            this.step = 1;
            this.sideBUsed = 0;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.sideBUsed = this.self.getGlobalVariable("sideBCheck");
                if (((!(this.self.isOnGround())) && (this.sideBUsed <= 2)))
                {
                    this.danceBoost = (-6 + (this.sideBUsed * 3));
                    this.self.setYSpeed(this.danceBoost);
                    this.sideBUsed++;
                    this.self.setGlobalVariable("sideBCheck", this.sideBUsed);
                };
            };
        }

        internal function frame4():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.continueCombo);
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }

        internal function frame16():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":45,
                "damage":3,
                "kbConstant":45,
                "power":30,
                "hitStun":3,
                "selfHitStun":0
            });
            this.self.updateAttackBoxStats(2, {
                "direction":45,
                "damage":4,
                "kbConstant":45,
                "power":30,
                "hitStun":3,
                "selfHitStun":0
            });
            this.self.updateAttackBoxStats(3, {
                "direction":45,
                "damage":4,
                "kbConstant":45,
                "power":30,
                "hitStun":3,
                "selfHitStun":0
            });
        }

        internal function frame18():*
        {
            this.self.playAttackSound(4);
        }

        internal function frame20():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.continueCombo);
        }

        internal function frame29():*
        {
            this.self.endAttack();
        }

        internal function frame30():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":75,
                "damage":3,
                "kbConstant":35,
                "power":40,
                "hitStun":3,
                "selfHitStun":0
            });
            this.self.updateAttackBoxStats(2, {
                "direction":75,
                "damage":3,
                "kbConstant":35,
                "power":40,
                "hitStun":3,
                "selfHitStun":0
            });
            this.self.updateAttackBoxStats(3, {
                "direction":75,
                "damage":3,
                "kbConstant":35,
                "power":40,
                "hitStun":3,
                "selfHitStun":0
            });
        }

        internal function frame31():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame35():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.continueCombo);
        }

        internal function frame45():*
        {
            this.self.endAttack();
        }

        internal function frame46():*
        {
            if (this.self.isOnGround())
            {
                this.self.setXSpeed(12, false);
            };
            this.self.updateAttackBoxStats(1, {
                "direction":45,
                "damage":4,
                "kbConstant":45,
                "power":55,
                "hitStun":3,
                "selfHitStun":0
            });
            this.self.updateAttackBoxStats(2, {
                "direction":45,
                "damage":4,
                "kbConstant":45,
                "power":55,
                "hitStun":3,
                "selfHitStun":0
            });
            this.self.updateAttackBoxStats(3, {
                "direction":45,
                "damage":4,
                "kbConstant":45,
                "power":55,
                "hitStun":3,
                "selfHitStun":0
            });
        }

        internal function frame49():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame52():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.continueCombo);
        }

        internal function frame60():*
        {
            this.self.endAttack();
        }

        internal function frame61():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":270,
                "damage":4,
                "kbConstant":20,
                "power":40,
                "hitStun":3,
                "selfHitStun":0,
                "hitLag":-0.75
            });
            this.self.updateAttackBoxStats(1, {
                "direction":270,
                "damage":5,
                "kbConstant":20,
                "power":40,
                "hitStun":3,
                "selfHitStun":0,
                "hitLag":-0.75
            });
            this.self.updateAttackBoxStats(1, {
                "direction":270,
                "damage":5,
                "kbConstant":20,
                "power":40,
                "hitStun":3,
                "selfHitStun":0,
                "hitLag":-0.75
            });
            if (this.self.isOnGround())
            {
                this.self.setXSpeed(10, false);
            };
        }

        internal function frame66():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame69():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.continueCombo);
        }

        internal function frame81():*
        {
            this.self.endAttack();
        }

        internal function frame82():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":4,
                "direction":300,
                "power":60,
                "kbConstant":30
            });
            this.self.updateAttackBoxStats(2, {
                "damage":5,
                "direction":300,
                "power":60,
                "kbConstant":30
            });
            this.self.updateAttackBoxStats(3, {
                "damage":5,
                "direction":300,
                "power":60,
                "kbConstant":30
            });
            if (this.self.isOnGround())
            {
                this.self.setXSpeed(11, false);
            };
        }

        internal function frame85():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame89():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.continueCombo);
        }

        internal function frame94():*
        {
            this.self.endAttack();
        }

        internal function frame95():*
        {
            if (this.self.isOnGround())
            {
                this.self.setXSpeed(12, false);
            };
            this.self.updateAttackBoxStats(1, {
                "damage":6,
                "direction":40,
                "power":15,
                "kbConstant":120,
                "hitStun":3,
                "selfHitStun":1,
                "hitLag":-1
            });
            this.self.updateAttackBoxStats(2, {
                "damage":8,
                "direction":40,
                "power":15,
                "kbConstant":120,
                "hitStun":3,
                "selfHitStun":1,
                "hitLag":-1
            });
            this.self.updateAttackBoxStats(3, {
                "damage":8,
                "direction":40,
                "power":15,
                "kbConstant":120,
                "hitStun":3,
                "selfHitStun":1,
                "hitLag":-1
            });
        }

        internal function frame98():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame117():*
        {
            this.self.endAttack();
        }

        internal function frame118():*
        {
            if (this.self.isOnGround())
            {
                this.self.setXSpeed(8, false);
            };
            this.self.updateAttackBoxStats(1, {
                "direction":80,
                "damage":6,
                "kbConstant":85,
                "power":70,
                "hitStun":3,
                "selfHitStun":1,
                "hitLag":-1
            });
            this.self.updateAttackBoxStats(2, {
                "direction":80,
                "damage":8,
                "kbConstant":85,
                "power":70,
                "hitStun":3,
                "selfHitStun":1,
                "hitLag":-1
            });
            this.self.updateAttackBoxStats(3, {
                "direction":80,
                "damage":8,
                "kbConstant":85,
                "power":70,
                "hitStun":3,
                "selfHitStun":1,
                "hitLag":-1
            });
        }

        internal function frame120():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame134():*
        {
            this.self.endAttack();
        }

        internal function frame135():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":80,
                "damage":3,
                "kbConstant":40,
                "power":2,
                "hitStun":3,
                "selfHitStun":0,
                "hitLag":-1
            });
            this.self.updateAttackBoxStats(2, {
                "direction":80,
                "damage":3,
                "kbConstant":40,
                "power":2,
                "hitStun":3,
                "selfHitStun":0,
                "hitLag":-1
            });
            this.self.updateAttackBoxStats(3, {
                "direction":80,
                "damage":3,
                "kbConstant":40,
                "power":2,
                "hitStun":3,
                "selfHitStun":0,
                "hitLag":-1
            });
            if (this.self.isOnGround())
            {
                this.self.setXSpeed(12, false);
            };
        }

        internal function frame138():*
        {
            this.self.playAttackSound(4);
        }

        internal function frame143():*
        {
            this.self.playAttackSound(4);
            this.self.refreshAttackID();
        }

        internal function frame148():*
        {
            this.self.playAttackSound(4);
            this.self.updateAttackBoxStats(1, {
                "direction":45,
                "damage":3,
                "kbConstant":130,
                "power":20,
                "hitStun":3,
                "selfHitStun":1
            });
            this.self.updateAttackBoxStats(2, {
                "direction":45,
                "damage":4,
                "kbConstant":130,
                "power":20,
                "hitStun":3,
                "selfHitStun":1
            });
            this.self.updateAttackBoxStats(3, {
                "direction":45,
                "damage":4,
                "kbConstant":130,
                "power":20,
                "hitStun":3,
                "selfHitStun":1
            });
            this.self.refreshAttackID();
        }

        internal function frame158():*
        {
            this.self.endAttack();
        }


    }
}//package marth_fla

