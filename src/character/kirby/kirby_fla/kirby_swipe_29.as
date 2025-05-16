// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_swipe_29

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

    public dynamic class kirby_swipe_29 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var pressed2:Boolean;
        public var buttonReleased:Boolean;
        public var readyNext:Boolean;
        public var vulcan:Boolean;
        public var controls:Object;
        public var firstJab:Boolean;
        public var secondJab:Boolean;
        public var thirdJab:Boolean;
        public var time:Number;

        public function kirby_swipe_29()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 9, this.frame10, 10, this.frame11, 12, this.frame13, 14, this.frame15, 18, this.frame19, 19, this.frame20, 20, this.frame21, 23, this.frame24, 26, this.frame27, 29, this.frame30, 32, this.frame33, 36, this.frame37);
        }

        public function updateControls():*
        {
            this.controls = this.self.getControls();
        }

        public function continueCombo():*
        {
            if (((this.firstJab) && (this.time <= 12)))
            {
                gotoAndPlay("jab1");
            };
            if (((this.secondJab) && (this.time <= 11)))
            {
                gotoAndPlay("jab2");
            };
            if (((this.thirdJab) && (this.time <= 11)))
            {
                gotoAndPlay("jab3");
            };
        }

        public function checkControls():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.buttonReleased = true;
            };
            if (((this.buttonReleased) && (this.controls.BUTTON2)))
            {
                this.readyNext = true;
            };
        }

        public function checkForGoToJab2():*
        {
            if (this.readyNext)
            {
                this.buttonReleased = false;
                this.readyNext = false;
                gotoAndPlay("jab2");
            };
        }

        public function checkForGoToJab3():*
        {
            if (this.readyNext)
            {
                this.readyNext = false;
                this.pressed2 = false;
                gotoAndPlay("jab3");
            };
        }

        public function checkForVulcan():*
        {
            if (this.readyNext)
            {
                this.readyNext = false;
                gotoAndPlay("again");
            }
            else
            {
                this.self.endAttack();
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.buttonReleased = false;
                this.readyNext = false;
                this.vulcan = false;
                this.controls = this.self.getControls();
                this.firstJab = this.self.getGlobalVariable("onFirstJab");
                this.secondJab = this.self.getGlobalVariable("onSecondJab");
                this.thirdJab = this.self.getGlobalVariable("onThirdJab");
                this.time = this.self.getLastUsed();
                SSF2API.createTimer(this.self, 1, 39, this.updateControls);
                this.continueCombo();
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
            this.self.setGlobalVariable("onFirstJab", true);
            this.self.setGlobalVariable("onSecondJab", false);
            this.buttonReleased = false;
            SSF2API.createTimer(this.self, 1, 11, this.checkControls, false);
        }

        internal function frame4():*
        {
            SSF2API.createTimer(this.self, 1, 8, this.checkForGoToJab2);
        }

        internal function frame10():*
        {
            this.self.endAttack();
        }

        internal function frame11():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":70,
                "damage":3
            });
            this.self.refreshAttackID();
            this.self.setGlobalVariable("onFirstJab", false);
            this.self.setGlobalVariable("onSecondJab", true);
            this.self.setGlobalVariable("onThirdJab", false);
            this.self.setLastUsed("a", 0);
            SSF2API.destroyTimer(this.self, this.checkControls);
            SSF2API.destroyTimer(this.self, this.checkForGoToJab2);
            this.buttonReleased = false;
            SSF2API.createTimer(this.self, 1, 10, this.checkControls, false);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame15():*
        {
            SSF2API.createTimer(this.self, 1, 6, this.checkForGoToJab3);
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }

        internal function frame20():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":1,
                "direction":68,
                "power":0,
                "kbConstant":100,
                "hitStun":1
            });
            this.self.updateAttackStats({"refreshRate":5});
            this.self.refreshAttackID();
            this.self.setGlobalVariable("onFirstJab", false);
            this.self.setGlobalVariable("onSecondJab", false);
            this.self.setGlobalVariable("onThirdJab", true);
            this.self.setLastUsed("a", 0);
            SSF2API.destroyTimer(this.self, this.checkControls);
            SSF2API.destroyTimer(this.self, this.checkForGoToJab3);
            this.buttonReleased = false;
            SSF2API.createTimer(this.self, 1, 10, this.checkControls, false);
            this.self.playVoiceSound(1);
        }

        internal function frame21():*
        {
            this.self.playAttackSound(3);
            this.buttonReleased = false;
            SSF2API.createTimer(this.self, 1, 15, this.checkControls, false);
        }

        internal function frame24():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame27():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame30():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame33():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame37():*
        {
            this.checkForVulcan();
        }


    }
}//package kirby_fla

