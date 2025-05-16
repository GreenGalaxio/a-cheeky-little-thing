// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_jabCombo_153

package mario_fla
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

    public dynamic class mario_jabCombo_153 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var controls:Object;
        public var used:Boolean;
        public var used2:Boolean;
        public var time:Number;
        public var pressed1:Boolean;
        public var pressed2:Boolean;
        public var newStats:Object;

        public function mario_jabCombo_153()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 7, this.frame8, 8, this.frame9, 11, this.frame12, 12, this.frame13, 13, this.frame14, 15, this.frame16, 17, this.frame18, 18, this.frame19, 29, this.frame30);
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
            if (((this.used2) && (this.time <= 12)))
            {
                gotoAndPlay("hit3");
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

        public function checkForGoToJab3():*
        {
            if (this.pressed2)
            {
                this.pressed1 = false;
                this.pressed2 = false;
                gotoAndPlay("hit3");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (SSF2API.isReady())
            {
                this.controls = this.self.getControls();
                this.used = this.self.getGlobalVariable("jab");
                this.used2 = this.self.getGlobalVariable("jab2");
                this.time = this.self.getLastUsed();
                SSF2API.createTimer(this.self, 1, 39, this.updateControls, false);
                this.continueCombo();
            };
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame3():*
        {
            SSF2API.playSound("mario_grunt2");
            this.self.setGlobalVariable("jab", true);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame4():*
        {
            this.pressed1 = false;
            this.checkControls();
        }

        internal function frame5():*
        {
            SSF2API.createTimer(this.self, 1, 6, this.checkControls, false);
        }

        internal function frame6():*
        {
            SSF2API.createTimer(this.self, 1, 5, this.checkForGoToJab2, false);
        }

        internal function frame8():*
        {
            this.self.endAttack();
        }

        internal function frame9():*
        {
            this.newStats = {
                "direction":70,
                "damage":2
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.refreshAttackID();
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", true);
            this.self.setLastUsed("a", 0);
            SSF2API.destroyTimer(this.self, this.checkControls);
            SSF2API.destroyTimer(this.self, this.checkForGoToJab2);
        }

        internal function frame12():*
        {
            SSF2API.playSound("mario_grunt2");
        }

        internal function frame13():*
        {
            this.pressed1 = false;
            this.checkControls();
        }

        internal function frame14():*
        {
            SSF2API.createTimer(this.self, 1, 6, this.checkControls, false);
        }

        internal function frame16():*
        {
            SSF2API.createTimer(this.self, 1, 6, this.checkForGoToJab3, false);
        }

        internal function frame18():*
        {
            this.self.endAttack();
        }

        internal function frame19():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            this.newStats = {
                "direction":45,
                "power":10,
                "damage":5,
                "kbConstant":100,
                "weightKB":0
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.updateAttackBoxStats(2, this.newStats);
            this.self.setLastUsed("a", 0);
            SSF2API.playSound("mario_grunt4");
            this.self.refreshAttackID();
            SSF2API.destroyTimer(this.self, this.checkControls);
            SSF2API.destroyTimer(this.self, this.checkForGoToJab3);
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

