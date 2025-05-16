// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsvB_71

package tails_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class tailsvB_71 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xSpeed:*;
        public var landable:*;
        public var controls:*;
        public var startOnGround:*;
        public var lvl:int;
        public var rand:int;
        public var xframe:String;
        public var isOnGround:*;

        public function tailsvB_71()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 12, this.frame13, 13, this.frame14, 14, this.frame15, 24, this.frame25, 27, this.frame28, 28, this.frame29, 31, this.frame32, 32, this.frame33, 33, this.frame34);
        }

        public function jumpCheck():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.JUMP) && (this.self.isOnGround())))
            {
                gotoAndPlay("jump");
            };
        }

        public function chargeCheck():void
        {
            var _local_1:* = this.self.getControls();
            if (_local_1.BUTTON1)
            {
                if (this.xSpeed < 30)
                {
                    this.xSpeed = (this.xSpeed + 0.5);
                };
            };
            if (!_local_1.BUTTON1)
            {
                SSF2API.destroyTimer(this.self, this.chargeCheck);
                gotoAndPlay("attack");
            };
        }

        public function leaveGroundCancel():void
        {
            if (((!(this.startOnGround)) && (this.self.isOnGround())))
            {
                this.self.updateAttackStats({"cancelWhenAirborne":true});
            };
        }

        public function landing():void
        {
            if (this.self.isOnGround())
            {
                this.isOnGround = true;
            }
            else
            {
                this.isOnGround = false;
            };
            if ((((this.isOnGround) && (this.landable)) && (!(this.startOnGround))))
            {
                SSF2API.destroyTimer(this.self, this.landing);
                this.self.toIdle();
            };
        }

        public function move():*
        {
            this.self.setXSpeed(this.xSpeed, false);
        }

        public function goToAfterHit(_arg_1:*=null):*
        {
            this.gotoAndPlay("afterHit");
        }

        public function cleanup():*
        {
            SSF2API.destroyTimer(this.self, this.move);
            SSF2API.destroyTimer(this.self, this.jumpCheck);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.goToAfterHit);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xSpeed = 12;
            this.landable = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.playAttackSound(1);
                this.controls = this.self.getControls();
                this.startOnGround = this.self.isOnGround();
                SSF2API.createTimer(this.self, 1, 0, this.jumpCheck);
            };
        }

        internal function frame2():*
        {
            this.lvl = 0;
            this.rand = 0;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.resetCPUControls();
                if (this.self.isCPU())
                {
                    this.lvl = this.self.getCPULevel();
                    this.rand = (10 * SSF2API.random());
                    if (((this.lvl >= 8) && (this.rand >= 7)))
                    {
                        this.self.importCPUControls([128, 2, 1088, 6, 128, 1, 0, 3]);
                        this.rand = (100 * SSF2API.random());
                        if (this.rand > 80)
                        {
                            this.self.setCPUAttackQueue("b_down");
                        }
                        else
                        {
                            this.self.setCPUAttackQueue("crouch_attack; a_down");
                        };
                        this.self.endAttack();
                    }
                    else
                    {
                        if ((((this.lvl >= 6) && (this.rand >= 4)) && (this.rand < 7)))
                        {
                            this.self.importCPUControls([1088, 2, 192, 6, 0, 1]);
                            this.self.endAttack();
                        }
                        else
                        {
                            if ((((this.lvl >= 4) && (this.rand >= 2)) && (this.rand < 4)))
                            {
                                this.self.importCPUControls([128, 2, 1088, 6, 128, 2]);
                                this.self.setCPUAttackQueue("a_air; a_air_up; a_air_backward; a_air_forward; b_down_air; b_forward_air, b_air");
                                this.self.endAttack();
                            };
                        };
                    };
                };
            };
        }

        internal function frame3():*
        {
            this.xframe = "charging";
            SSF2API.createTimer(this.self, 1, -1, this.chargeCheck);
        }

        internal function frame13():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame14():*
        {
            this.isOnGround = this.self.isOnGround();
            this.xframe = "attack";
            SSF2API.createTimer(this.self, 1, -1, this.landing);
            SSF2API.createTimer(this.self, 1, -1, this.leaveGroundCancel);
            this.cleanup();
            this.self.resetMovement();
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.goToAfterHit);
            SSF2API.destroyTimer(this.self, this.chargeCheck);
            this.self.setXSpeed((this.xSpeed * 1.5), false);
            this.self.playAttackSound(2);
            this.self.updateAttackStats({
                "xSpeedDecay":0,
                "airCancel":false,
                "allowJump":false,
                "jumpCancelAttack":false
            });
        }

        internal function frame15():*
        {
            SSF2API.createTimer(this.self, 1, -1, this.move);
            this.self.updateAttackStats({"xSpeedDecay":1});
        }

        internal function frame25():*
        {
            SSF2API.destroyTimer(this.self, this.leaveGroundCancel);
            this.self.updateAttackStats({"cancelWhenAirborne":false});
            this.self.resetMovement();
            this.self.setCPUAttackQueue("b_down; a_forward; a_forward_tilt; throw_up; throw_down");
            this.cleanup();
            SSF2API.destroyTimer(this.self, this.landing);
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame29():*
        {
            SSF2API.destroyTimer(this.self, this.leaveGroundCancel);
            this.self.updateAttackStats({"cancelWhenAirborne":false});
            this.self.resetMovement();
            this.self.updateAttackStats({"airCancel":true});
            this.self.setCPUAttackQueue("b_down; a_forward; a_forward_tilt; throw_up; throw_down");
            this.cleanup();
            SSF2API.destroyTimer(this.self, this.landing);
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }

        internal function frame33():*
        {
            SSF2API.destroyTimer(this.self, this.leaveGroundCancel);
            this.self.updateAttackStats({"cancelWhenAirborne":false});
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            this.self.setYSpeed(-8);
            SSF2API.destroyTimer(this.self, this.jumpCheck);
            SSF2API.destroyTimer(this.self, this.landing);
            this.landable = true;
            if (this.self.isCPU())
            {
                this.self.resetCPUControls();
            };
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.self.unnattachFromGround();
                this.gotoAndPlay("attack");
            }
            else
            {
                if (this.startOnGround)
                {
                    this.self.setYSpeed(-11);
                    SSF2API.createTimer(this.self, 1, 0, this.jumpCheck);
                    this.gotoAndPlay("charging");
                };
            };
        }

        internal function frame34():*
        {
            if (this.self.isCPU())
            {
                this.self.resetCPUControls();
            };
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.self.unnattachFromGround();
                this.gotoAndPlay("attack");
            }
            else
            {
                if (!this.startOnGround)
                {
                    this.self.endAttack("jump");
                }
                else
                {
                    this.self.setYSpeed(-11);
                    SSF2API.createTimer(this.self, 1, 0, this.jumpCheck);
                    this.gotoAndPlay("charging");
                };
            };
        }


    }
}//package tails_fla

