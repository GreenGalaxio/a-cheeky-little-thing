// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_nspec_41

package samus_fla
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

    public dynamic class samus_nspec_41 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var controls:Object;
        public var chargeTime:*;
        public var sfxStop:Number;
        public var xframe:String;

        public function samus_nspec_41()
        {
            addFrameScript(0, this.frame1, 13, this.frame14, 14, this.frame15, 85, this.frame86, 86, this.frame87, 87, this.frame88, 102, this.frame103, 103, this.frame104, 109, this.frame110, 124, this.frame125);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.controls = this.self.getControls();
                this.chargeTime = 0;
            };
        }

        internal function frame14():*
        {
            this.sfxStop = this.self.playAttackSound(1);
            this.chargeTime = this.self.getAttackStat("chargetime");
            SSF2API.print(("chargeTime: " + this.chargeTime));
            if (this.chargeTime > 0)
            {
                gotoAndPlay(Math.round(((1 + ((this.chargeTime / 72) * 72)) + 8)));
            };
        }

        internal function frame15():*
        {
            this.xframe = "charging";
        }

        internal function frame86():*
        {
            stop();
        }

        internal function frame87():*
        {
            gotoAndPlay((currentFrame - 1));
        }

        internal function frame88():*
        {
            this.xframe = "attack";
            SSF2API.stopSound(this.sfxStop);
            this.self.updateAttackStats({"cancelSoundOnEnd":false});
            this.self.fireProjectile("unchargedshot");
            this.self.playAttackSound(2);
            if (this.self.getAttackStat("chargetime") >= this.self.getAttackStat("chargetime_max"))
            {
                this.gotoAndPlay("attack2");
            };
        }

        internal function frame103():*
        {
            this.self.endAttack();
        }

        internal function frame104():*
        {
            SSF2API.stopSound(this.sfxStop);
            this.xframe = "attack2";
        }

        internal function frame110():*
        {
            this.self.fireProjectile("chargedshot");
            this.self.playAttackSound(5);
            this.self.updateAttackStats({"cancelSoundOnEnd":false});
        }

        internal function frame125():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

