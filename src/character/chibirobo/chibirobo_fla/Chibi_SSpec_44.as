// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.Chibi_SSpec_44

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class Chibi_SSpec_44 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var controls:*;
        public var loop:*;
        public var hasBoosted:*;
        public var sfxStop:*;

        public function Chibi_SSpec_44()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 7, this.frame8, 18, this.frame19, 19, this.frame20, 30, this.frame31, 34, this.frame35);
        }

        public function buttonCheck():void
        {
            this.self.setXSpeed(15, false);
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.gotoAndPlay("endlag");
            };
            this.self.refreshAttackID();
        }

        public function pullBack():void
        {
            if (this.hasBoosted)
            {
                if (this.self.isOnGround())
                {
                    this.self.setXSpeed(-5, false);
                }
                else
                {
                    this.self.setXSpeed(-1, false);
                };
            };
        }

        public function bubbles():void
        {
            this.self.attachEffectOverlay("soapBubbles");
        }

        public function clean():void
        {
            if (this.self.isOnGround())
            {
                this.self.attachEffectOverlay("floorTwinkle");
            };
        }

        public function slowDown():void
        {
            this.self.setXSpeed((this.self.getXSpeed() * 0.85));
            if ((((this.self.isFacingRight()) && (this.self.getXSpeed() < 1)) || ((!(this.self.isFacingRight())) && (this.self.getXSpeed() > -1))))
            {
                this.self.setXSpeed(0);
                SSF2API.destroyTimer(this.self, this.slowDown);
                SSF2API.stopSound(this.sfxStop);
                SSF2API.destroyTimer(this.self, this.bubbles);
                SSF2API.destroyTimer(this.self, this.clean);
                this.gotoAndPlay("end");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.controls = null;
            this.loop = 0;
            this.hasBoosted = false;
            this.sfxStop = 0;
        }

        internal function frame6():*
        {
        }

        internal function frame7():*
        {
            if (this.loop == 0)
            {
                this.sfxStop = this.self.playAttackSound(1);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_HURT, function ():*
                {
                    SSF2API.print("shit");
                    SSF2API.stopSound(sfxStop);
                });
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_HURT, function ():*
                {
                    SSF2API.print("shit");
                    SSF2API.stopSound(sfxStop);
                });
                SSF2API.createTimer(this.self, 6, -1, this.pullBack);
                SSF2API.createTimer(this.self, 12, -1, this.buttonCheck);
                SSF2API.createTimer(this.self, 4, -1, this.bubbles);
                SSF2API.createTimer(this.self, 12, -1, this.clean);
            };
        }

        internal function frame8():*
        {
            this.hasBoosted = true;
        }

        internal function frame19():*
        {
            this.loop++;
            this.gotoAndPlay("loop");
        }

        internal function frame20():*
        {
            SSF2API.destroyTimer(this.self, this.buttonCheck);
            SSF2API.destroyTimer(this.self, this.pullBack);
            SSF2API.createTimer(this.self, 1, -1, this.slowDown);
        }

        internal function frame31():*
        {
            this.gotoAndPlay("endloop");
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

