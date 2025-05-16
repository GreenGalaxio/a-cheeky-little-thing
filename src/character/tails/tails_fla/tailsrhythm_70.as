// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsrhythm_70

package tails_fla
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

    public dynamic class tailsrhythm_70 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var getTarget:*;
        public var rand:*;
        public var isCPU:*;
        public var isOnGround:*;
        public var controls:Object;
        public var facing:Boolean;
        public var normSpeed:Number;
        public var slowSpeed:Number;
        public var fastSpeed:Number;

        public function tailsrhythm_70()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 12, this.frame13);
        }

        public function cpuCancel():void
        {
            this.isOnGround = this.self.isOnGround();
            if (this.isCPU)
            {
                this.getTarget = this.self.getCPUTarget();
            };
            if ((((this.isCPU) && (!(this.getTarget == null))) && (!(this.isOnGround))))
            {
                this.rand = (SSF2API.random() * 100);
                if (((((this.getTarget.getMC().x < (parent.x + 150)) && (this.getTarget.getMC().x > (parent.x - 30))) && (this.getTarget.getMC().y < (parent.y + 50))) && (this.getTarget.getMC().y > (parent.y - 30))))
                {
                    if (this.rand <= 50)
                    {
                        this.self.setGlobalVariable("fromSideB", true);
                        this.self.forceAttack("a_air_forward");
                    }
                    else
                    {
                        this.self.forceAttack("a_air_backward");
                    };
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.normSpeed = 6.5;
            this.slowSpeed = 3;
            this.fastSpeed = 10;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.facing = this.self.isFacingRight();
            };
        }

        internal function frame2():*
        {
            this.isCPU = this.self.isCPU();
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
            this.controls = this.self.getControls();
            this.facing = this.self.isFacingRight();
            if ((((this.facing) && (this.controls.RIGHT)) || ((!(this.facing)) && (this.controls.LEFT))))
            {
                this.self.setXSpeed(this.fastSpeed, false);
            };
            if ((((this.facing) && (this.controls.LEFT)) || ((!(this.facing)) && (this.controls.RIGHT))))
            {
                this.self.setXSpeed(this.slowSpeed, false);
            };
            if (((!(this.controls.RIGHT)) && (!(this.controls.LEFT))))
            {
                this.self.setXSpeed(this.normSpeed, false);
            };
        }

        internal function frame4():*
        {
            this.cpuCancel();
            this.controls = this.self.getControls();
            this.facing = this.self.isFacingRight();
            if ((((this.facing) && (this.controls.RIGHT)) || ((!(this.facing)) && (this.controls.LEFT))))
            {
                this.self.setXSpeed(this.fastSpeed, false);
            };
            if ((((this.facing) && (this.controls.LEFT)) || ((!(this.facing)) && (this.controls.RIGHT))))
            {
                this.self.setXSpeed(this.slowSpeed, false);
            };
            if (((!(this.controls.RIGHT)) && (!(this.controls.LEFT))))
            {
                this.self.setXSpeed(this.normSpeed, false);
            };
        }

        internal function frame5():*
        {
            this.cpuCancel();
            this.controls = this.self.getControls();
            this.facing = this.self.isFacingRight();
            if ((((this.facing) && (this.controls.RIGHT)) || ((!(this.facing)) && (this.controls.LEFT))))
            {
                this.self.setXSpeed(this.fastSpeed, false);
            };
            if ((((this.facing) && (this.controls.LEFT)) || ((!(this.facing)) && (this.controls.RIGHT))))
            {
                this.self.setXSpeed(this.slowSpeed, false);
            };
            if (((!(this.controls.RIGHT)) && (!(this.controls.LEFT))))
            {
                this.self.setXSpeed(this.normSpeed, false);
            };
        }

        internal function frame6():*
        {
            this.cpuCancel();
            this.controls = this.self.getControls();
            this.facing = this.self.isFacingRight();
            if ((((this.facing) && (this.controls.RIGHT)) || ((!(this.facing)) && (this.controls.LEFT))))
            {
                this.self.setXSpeed(this.fastSpeed, false);
            };
            if ((((this.facing) && (this.controls.LEFT)) || ((!(this.facing)) && (this.controls.RIGHT))))
            {
                this.self.setXSpeed(this.slowSpeed, false);
            };
            if (((!(this.controls.RIGHT)) && (!(this.controls.LEFT))))
            {
                this.self.setXSpeed(this.normSpeed, false);
            };
        }

        internal function frame7():*
        {
            this.cpuCancel();
            this.controls = this.self.getControls();
            this.facing = this.self.isFacingRight();
            if ((((this.facing) && (this.controls.RIGHT)) || ((!(this.facing)) && (this.controls.LEFT))))
            {
                this.self.setXSpeed(this.fastSpeed, false);
            };
            if ((((this.facing) && (this.controls.LEFT)) || ((!(this.facing)) && (this.controls.RIGHT))))
            {
                this.self.setXSpeed(this.slowSpeed, false);
            };
            if (((!(this.controls.RIGHT)) && (!(this.controls.LEFT))))
            {
                this.self.setXSpeed(this.normSpeed, false);
            };
        }

        internal function frame8():*
        {
            this.cpuCancel();
            this.controls = this.self.getControls();
            this.facing = this.self.isFacingRight();
            if ((((this.facing) && (this.controls.RIGHT)) || ((!(this.facing)) && (this.controls.LEFT))))
            {
                this.self.setXSpeed(this.fastSpeed, false);
            };
            if ((((this.facing) && (this.controls.LEFT)) || ((!(this.facing)) && (this.controls.RIGHT))))
            {
                this.self.setXSpeed(this.slowSpeed, false);
            };
            if (((!(this.controls.RIGHT)) && (!(this.controls.LEFT))))
            {
                this.self.setXSpeed(this.normSpeed, false);
            };
        }

        internal function frame9():*
        {
            this.cpuCancel();
            this.controls = this.self.getControls();
            this.facing = this.self.isFacingRight();
            if ((((this.facing) && (this.controls.RIGHT)) || ((!(this.facing)) && (this.controls.LEFT))))
            {
                this.self.setXSpeed(this.fastSpeed, false);
            };
            if ((((this.facing) && (this.controls.LEFT)) || ((!(this.facing)) && (this.controls.RIGHT))))
            {
                this.self.setXSpeed(this.slowSpeed, false);
            };
            if (((!(this.controls.RIGHT)) && (!(this.controls.LEFT))))
            {
                this.self.setXSpeed(this.normSpeed, false);
            };
            this.self.refreshAttackID();
        }

        internal function frame10():*
        {
            this.cpuCancel();
            this.controls = this.self.getControls();
            this.facing = this.self.isFacingRight();
            if ((((this.facing) && (this.controls.RIGHT)) || ((!(this.facing)) && (this.controls.LEFT))))
            {
                this.self.setXSpeed(this.fastSpeed, false);
            };
            if ((((this.facing) && (this.controls.LEFT)) || ((!(this.facing)) && (this.controls.RIGHT))))
            {
                this.self.setXSpeed(this.slowSpeed, false);
            };
            if (((!(this.controls.RIGHT)) && (!(this.controls.LEFT))))
            {
                this.self.setXSpeed(this.normSpeed, false);
            };
            if (this.controls.BUTTON1)
            {
                if (!this.isCPU)
                {
                    gotoAndPlay("attack");
                }
                else
                {
                    if ((((((this.isCPU) && (!(this.self.inUpperRightWarningBounds()))) && (!(this.self.inLowerRightWarningBounds()))) && (!(this.self.inUpperLeftWarningBounds()))) && (!(this.self.inLowerLeftWarningBounds()))))
                    {
                        gotoAndPlay("attack");
                    };
                };
            };
        }

        internal function frame13():*
        {
            this.self.endAttack();
        }


    }
}//package tails_fla

