// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_jab_23

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class chibi_jab_23 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var used:Boolean;
        public var time:Number;
        public var pressed1:Boolean;
        public var pressed2:Boolean;
        public var newStats:Object;

        public function chibi_jab_23()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 8, this.frame9, 9, this.frame10, 11, this.frame12, 18, this.frame19);
        }

        public function updateControls():*
        {
            this.controls = this.self.getControls();
        }

        public function continueCombo():*
        {
            if (((this.used) && (this.time <= 12)))
            {
                gotoAndPlay("hit2");
            };
        }

        public function checkControls():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON2)))
            {
                this.pressed2 = true;
            };
        }

        public function checkForGoToJab2():*
        {
            if (this.pressed2)
            {
                this.pressed1 = false;
                this.pressed2 = false;
                gotoAndPlay("hit2");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (SSF2API.isReady())
            {
                this.controls = this.self.getControls();
                this.used = this.self.getGlobalVariable("jab");
                this.time = this.self.getLastUsed();
                SSF2API.createTimer(this.self, 1, 39, this.updateControls, false);
                this.continueCombo();
            };
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
            this.self.setGlobalVariable("jab", true);
            SSF2API.createTimer(this.self, 1, -1, this.checkControls, false);
        }

        internal function frame5():*
        {
            SSF2API.createTimer(this.self, 1, -1, this.checkForGoToJab2);
        }

        internal function frame9():*
        {
            this.self.endAttack();
        }

        internal function frame10():*
        {
            this.newStats = {
                "direction":35,
                "power":35,
                "kbConstant":80,
                "damage":5,
                "effectSound":"brawl_kick_m"
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.refreshAttackID();
            this.self.setGlobalVariable("jab", false);
            this.self.setLastUsed("a", 0);
            SSF2API.destroyTimer(this.self, this.checkControls);
            SSF2API.destroyTimer(this.self, this.checkForGoToJab2);
        }

        internal function frame12():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

