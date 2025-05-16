// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_specialN_50

package fox_fla
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

    public dynamic class fox_specialN_50 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var end:*;
        public var canContinue:*;
        public var buttonReleased:Boolean;
        public var readyNext:Boolean;
        public var controls:Object;

        public function fox_specialN_50()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 7, this.frame8, 12, this.frame13, 14, this.frame15, 15, this.frame16);
        }

        public function updateControls():void
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.buttonReleased = true;
            };
            if (((this.buttonReleased) && (this.controls.BUTTON1)))
            {
                this.readyNext = true;
            };
        }

        public function continueCombo():void
        {
            this.updateControls();
            if (this.end)
            {
                SSF2API.destroyTimer(this.self, this.continueCombo);
            }
            else
            {
                if (((this.canContinue) && (this.readyNext)))
                {
                    this.readyNext = false;
                    this.buttonReleased = false;
                    this.canContinue = false;
                    gotoAndPlay("loop");
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.end = false;
            this.canContinue = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.buttonReleased = false;
                this.readyNext = false;
                this.controls = this.self.getControls();
                SSF2API.createTimer(this.self, 1, -1, this.continueCombo);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
            if (((((parent) && (SSF2API.isReady())) && (this.self)) && (this.self.isCPU())))
            {
                if (((((this.self.getCPUAction() < 10) && (this.self.getCPUAction() > 0)) && (this.self.getCPULevel() >= 7)) && (this.self.isOnGround())))
                {
                    this.self.importCPUControls([128, 1, 0, 2, 64, 1, 0, 5, 0x0400, 1, 64, 1, 0, 1]);
                    this.self.setAttackEnabled(false, "b", 10);
                    this.self.endAttack();
                };
            };
        }

        internal function frame4():*
        {
            this.self.attachEffect("fox_blasterEffect");
            this.self.fireProjectile("laser");
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            this.canContinue = true;
        }

        internal function frame13():*
        {
            this.canContinue = false;
            this.end = true;
            this.self.playAttackSound(2);
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }

        internal function frame16():*
        {
            this.self.playAttackSound(2);
            this.self.endAttack();
        }


    }
}//package fox_fla

