// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmslow_45

package blackmage_fla
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

    public dynamic class bmslow_45 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox4:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var cancel:Number;
        public var self:*;
        public var xframe:String;
        public var wasFacingLeft:Boolean;
        public var tempCharge:*;
        public var sfxStop:*;
        public var controls:*;

        public function bmslow_45()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 12, this.frame13, 20, this.frame21, 24, this.frame25, 28, this.frame29, 36, this.frame37, 40, this.frame41, 44, this.frame45, 52, this.frame53, 56, this.frame57, 60, this.frame61, 68, this.frame69, 72, this.frame73, 76, this.frame77, 84, this.frame85, 88, this.frame89, 92, this.frame93, 101, this.frame102, 102, this.frame103, 103, this.frame104, 108, this.frame109, 127, this.frame128);
        }

        internal function frame1():*
        {
            this.cancel = 0;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = null;
            this.wasFacingLeft = false;
            this.tempCharge = null;
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("Boost", 0);
                this.tempCharge = this.self.getGlobalVariable("SlowCharge");
                if (!this.self.isFacingRight())
                {
                    this.self.faceRight();
                    this.wasFacingLeft = true;
                };
                this.sfxStop = 0;
                this.sfxStop = SSF2API.playSound("bm_stop_charge");
            };
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame13():*
        {
            if (this.tempCharge >= 1)
            {
                this.gotoAndPlay("attack");
            };
        }

        internal function frame21():*
        {
            SSF2API.playSound("bm_stop_number");
        }

        internal function frame25():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame29():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame37():*
        {
            this.self.setGlobalVariable("SlowCharge", 2);
            SSF2API.playSound("bm_stop_number");
        }

        internal function frame41():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame45():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame53():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":90,
                "hitStunProjectile":180
            });
            this.self.setGlobalVariable("SlowCharge", 3);
            SSF2API.playSound("bm_stop_number");
        }

        internal function frame57():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame61():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame69():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":120,
                "hitStunProjectile":240
            });
            this.self.setGlobalVariable("SlowCharge", 4);
            SSF2API.playSound("bm_stop_number");
        }

        internal function frame73():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame77():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame85():*
        {
            this.self.setGlobalVariable("SlowCharge", 5);
            SSF2API.playSound("bm_stop_number");
        }

        internal function frame89():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame93():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame102():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":180,
                "hitStunProjectile":360
            });
            this.self.setGlobalVariable("SlowCharge", 6);
            SSF2API.playSound("bm_stop_number");
        }

        internal function frame103():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
            };
        }

        internal function frame104():*
        {
            this.xframe = "attack";
            this.tempCharge = this.self.getGlobalVariable("SlowCharge");
            if (((this.tempCharge == null) || (this.tempCharge == 0)))
            {
                this.tempCharge = 1;
            };
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "hitStun":(15 * this.tempCharge),
                "hitStunProjectile":((15 * this.tempCharge) * 2)
            });
            if (this.self.isCPU())
            {
                if (this.tempCharge >= 3)
                {
                    this.self.setCPUAttackQueue("a_forwardsmash,a_up");
                };
            };
        }

        internal function frame109():*
        {
            this.self.setGlobalVariable("SlowCharge", null);
            SSF2API.stopSound(this.sfxStop);
        }

        internal function frame128():*
        {
            if (this.wasFacingLeft)
            {
                this.self.faceLeft();
            };
            this.self.endAttack();
        }


    }
}//package blackmage_fla

