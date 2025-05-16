// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_samus_193

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

    public dynamic class kirby_samus_193 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var chargeTime:*;
        public var controls:*;
        public var speed:int;
        public var sfxStop:Number;

        public function kirby_samus_193()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 79, this.frame80, 80, this.frame81, 95, this.frame96, 96, this.frame97, 102, this.frame103, 117, this.frame118, 124, this.frame125, 125, this.frame126);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "charging";
            this.chargeTime = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.speed = this.self.getAttackStat("chargetime");
                this.speed = (((this.speed / 12) + 3.2) * -1);
            };
        }

        internal function frame7():*
        {
            this.sfxStop = this.self.playAttackSound(1);
            this.chargeTime = this.self.getAttackStat("chargetime");
            if (this.chargeTime > 0)
            {
                gotoAndPlay(Math.round(((1 + ((this.chargeTime / 72) * 72)) + 8)));
            };
        }

        internal function frame8():*
        {
            this.xframe = "charging";
        }

        internal function frame80():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame81():*
        {
            this.xframe = "attack";
            SSF2API.stopSound(this.sfxStop);
            this.self.updateAttackStats({"cancelSoundOnEnd":false});
            if (!this.self.isOnGround())
            {
                this.self.setXSpeed(this.speed, false);
                this.self.setYSpeed(-3);
                gotoAndPlay("attackAir");
            }
            else
            {
                this.self.fireProjectile("unchargedshot", 0, 20);
                this.self.playAttackSound(2);
            };
        }

        internal function frame96():*
        {
            this.self.endAttack();
        }

        internal function frame97():*
        {
            this.xframe = "attack2";
            SSF2API.stopSound(this.sfxStop);
            this.self.updateAttackStats({"allowFullInterrupt":false});
            this.self.updateAttackStats({"cancelSoundOnEnd":false});
        }

        internal function frame103():*
        {
            this.self.fireProjectile("chargedshot", 0, 20);
            this.self.playAttackSound(5);
            if (!this.self.isOnGround())
            {
                this.self.setXSpeed(this.speed, false);
                this.self.setYSpeed(-3);
            };
        }

        internal function frame118():*
        {
            this.self.endAttack();
        }

        internal function frame125():*
        {
            this.self.fireProjectile("unchargedshot", 0, 20);
            this.self.playAttackSound(2);
        }

        internal function frame126():*
        {
            gotoAndPlay("afterShot");
        }


    }
}//package kirby_fla

