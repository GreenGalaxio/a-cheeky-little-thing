// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_blackmage_105

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class kirby_blackmage_105 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var wasFacingLeft:Boolean;
        public var tempCharge:*;
        public var controls:*;
        public var sfxStop:Number;

        public function kirby_blackmage_105()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 12, this.frame13, 20, this.frame21, 24, this.frame25, 28, this.frame29, 36, this.frame37, 40, this.frame41, 44, this.frame45, 52, this.frame53, 56, this.frame57, 60, this.frame61, 68, this.frame69, 72, this.frame73, 76, this.frame77, 84, this.frame85, 88, this.frame89, 92, this.frame93, 100, this.frame101, 101, this.frame102, 102, this.frame103, 110, this.frame111, 126, this.frame127);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            this.wasFacingLeft = false;
            this.tempCharge = null;
            this.controls = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.tempCharge = this.self.getGlobalVariable("SlowCharge");
                this.sfxStop = SSF2API.playSound("bm_stop_charge");
                if (!this.self.isFacingRight())
                {
                    this.self.faceRight();
                    this.wasFacingLeft = true;
                };
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
                SSF2API.stopSound(this.sfxStop);
            };
        }

        internal function frame29():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
                SSF2API.stopSound(this.sfxStop);
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
                SSF2API.stopSound(this.sfxStop);
            };
        }

        internal function frame45():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
                SSF2API.stopSound(this.sfxStop);
            };
        }

        internal function frame53():*
        {
            this.self.setGlobalVariable("SlowCharge", 3);
            SSF2API.playSound("bm_stop_number");
        }

        internal function frame57():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
                SSF2API.stopSound(this.sfxStop);
            };
        }

        internal function frame61():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
                SSF2API.stopSound(this.sfxStop);
            };
        }

        internal function frame69():*
        {
            this.self.setGlobalVariable("SlowCharge", 4);
            SSF2API.playSound("bm_stop_number");
        }

        internal function frame73():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
                SSF2API.stopSound(this.sfxStop);
            };
        }

        internal function frame77():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
                SSF2API.stopSound(this.sfxStop);
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
                SSF2API.stopSound(this.sfxStop);
            };
        }

        internal function frame93():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
                SSF2API.stopSound(this.sfxStop);
            };
        }

        internal function frame101():*
        {
            this.self.setGlobalVariable("SlowCharge", 6);
            SSF2API.playSound("bm_stop_number");
        }

        internal function frame102():*
        {
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack("defend");
                SSF2API.stopSound(this.sfxStop);
            };
        }

        internal function frame103():*
        {
            this.xframe = "attack";
            this.tempCharge = this.self.getGlobalVariable("SlowCharge");
            SSF2API.print(this.tempCharge);
            if (((this.tempCharge == null) || (this.tempCharge == 0)))
            {
                this.tempCharge = 1;
            };
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "hitStun":(15 * this.tempCharge),
                "hitStunProjectile":((15 * this.tempCharge) * 2)
            });
        }

        internal function frame111():*
        {
            SSF2API.stopSound(this.sfxStop);
            this.self.setGlobalVariable("SlowCharge", null);
        }

        internal function frame127():*
        {
            if (this.wasFacingLeft)
            {
                this.self.faceLeft();
            };
            this.self.endAttack();
        }


    }
}//package kirby_fla

