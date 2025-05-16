// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_combo_135

package sonic_fla
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

    public dynamic class sonic_combo_135 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var controls:Object;
        public var used:Boolean;
        public var used2:Boolean;
        public var time:Number;
        public var playsound:Number;
        public var audio:Number;
        public var pressed1:Boolean;
        public var pressed2:Boolean;

        public function sonic_combo_135()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 6, this.frame7, 7, this.frame8, 8, this.frame9, 11, this.frame12, 12, this.frame13, 14, this.frame15, 20, this.frame21);
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
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
                SSF2API.createTimer(this.self, 1, 23, this.updateControls);
                this.continueCombo();
            };
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame3():*
        {
            this.self.setGlobalVariable("jab", true);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame4():*
        {
            SSF2API.createTimer(this.self, 1, 5, this.checkForGoToJab2);
        }

        internal function frame7():*
        {
            this.self.endAttack();
        }

        internal function frame8():*
        {
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            SSF2API.destroyTimer(this.self, this.checkForGoToJab2);
        }

        internal function frame9():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", true);
            SSF2API.createTimer(this.self, 1, 6, this.checkForGoToJab3);
        }

        internal function frame12():*
        {
            this.self.endAttack();
        }

        internal function frame13():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":3,
                "direction":45,
                "power":24,
                "kbConstant":130
            });
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            this.self.setLastUsed("a", 0);
            SSF2API.destroyTimer(this.self, this.checkForGoToJab3);
        }

        internal function frame15():*
        {
            this.self.setXSpeed(3, false);
            this.self.playVoiceSound(3);
            this.self.playAttackSound(3);
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

