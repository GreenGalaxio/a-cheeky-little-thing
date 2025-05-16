// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_suck_alone_45

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

    public dynamic class kirby_suck_alone_45 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var kirbyForce:String;
        public var xframe:*;
        public var action:String;
        public var waiting:Boolean;
        public var hasHit:Boolean;
        public var inhaling:*;
        public var power:String;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var controls:Object;
        public var sfxStop:Number;
        public var sfxStop2:Number;
        public var stats1:Object;
        public var stats2:Object;

        public function kirby_suck_alone_45()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 15, this.frame16, 26, this.frame27, 35, this.frame36, 42, this.frame43, 43, this.frame44, 52, this.frame53, 62, this.frame63, 63, this.frame64, 67, this.frame68, 72, this.frame73, 73, this.frame74);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                if (this.self.getCurrentKirbyPower() != null)
                {
                    this.kirbyForce = ("kirby_" + this.self.getCurrentKirbyPower());
                    this.self.forceAttack(this.kirbyForce, null, true);
                    gotoAndPlay("failed");
                };
            };
            this.xframe = "sucking";
            this.action = null;
            this.waiting = false;
            this.hasHit = false;
            this.inhaling = false;
            this.power = null;
            this.continuePlaying = false;
            this.handled = true;
            this.controls = null;
            this.stats1 = null;
            this.stats2 = null;
        }

        internal function frame3():*
        {
            this.sfxStop = this.self.playAttackSound(1);
            this.self.setGlobalVariable("SlowCharge", null);
        }

        internal function frame16():*
        {
            this.inhaling = true;
        }

        internal function frame27():*
        {
            this.sfxStop2 = this.self.playAttackSound(4);
            this.handled = false;
            this.continuePlaying = false;
        }

        internal function frame36():*
        {
            if (this.continuePlaying)
            {
                gotoAndPlay("suckagain");
            };
        }

        internal function frame43():*
        {
            this.self.endAttack();
        }

        internal function frame44():*
        {
            this.xframe = "swallow";
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "direction":75,
                "power":50,
                "bypassNonGrabbed":true
            });
            SSF2API.stopSound(this.sfxStop);
            SSF2API.stopSound(this.sfxStop2);
        }

        internal function frame53():*
        {
            this.self.updateAttackStats({"invincible":true});
            this.self.playAttackSound(3);
            this.self.KirbyPower = this.power;
            this.self.releaseOpponent();
        }

        internal function frame63():*
        {
            this.self.updateAttackStats({"invincible":false});
            this.self.endAttack();
        }

        internal function frame64():*
        {
            this.xframe = "spit";
        }

        internal function frame68():*
        {
            this.self.playAttackSound(2);
            this.self.shootOutOpponent();
        }

        internal function frame73():*
        {
            this.self.endAttack();
        }

        internal function frame74():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

