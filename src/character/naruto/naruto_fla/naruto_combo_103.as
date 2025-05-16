// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_combo_103

package naruto_fla
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

    public dynamic class naruto_combo_103 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var naruto_language:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var time:Number;
        public var controls:Object;
        public var used:Boolean;
        public var used2:Boolean;
        public var cont:Boolean;

        public function naruto_combo_103()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 19, this.frame20, 20, this.frame21, 26, this.frame27);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
                this.naruto_language = this.self.getGlobalVariable("language_Select");
            };
        }

        internal function frame2():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.time = this.self.getLastUsed();
            this.controls = this.self.getControls();
            this.used = this.self.getGlobalVariable("jab");
            this.used2 = this.self.getGlobalVariable("jab2");
            this.cont = false;
            if (((this.used) && (this.time <= 13)))
            {
                gotoAndPlay("hit2");
            };
            if (((this.used2) && (this.time <= 13)))
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
            this.self.setGlobalVariable("jab", true);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame8():*
        {
            if (this.continuePlaying)
            {
                gotoAndPlay("hit2");
            };
        }

        internal function frame9():*
        {
            this.self.endAttack();
        }

        internal function frame10():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", true);
            this.self.setLastUsed("a", 0);
        }

        internal function frame11():*
        {
            if (this.naruto_language == "ENG")
            {
                if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                {
                    this.self.playVoiceSound(3);
                    this.self.setGlobalVariable("audio", 1);
                };
                if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                {
                    this.self.playVoiceSound(4);
                    this.self.setGlobalVariable("audio", 2);
                };
                if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                {
                    this.self.playVoiceSound(3);
                    this.self.setGlobalVariable("audio", 3);
                };
                if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
                {
                    this.self.playVoiceSound(4);
                    this.self.setGlobalVariable("audio", 4);
                };
            }
            else
            {
                if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                {
                    this.self.playVoiceSound(1);
                    this.self.setGlobalVariable("audio", 1);
                };
                if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                {
                    this.self.playVoiceSound(2);
                    this.self.setGlobalVariable("audio", 2);
                };
                if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                {
                    this.self.playVoiceSound(1);
                    this.self.setGlobalVariable("audio", 3);
                };
                if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
                {
                    this.self.playVoiceSound(2);
                    this.self.setGlobalVariable("audio", 4);
                };
            };
            this.self.refreshAttackID();
        }

        internal function frame12():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame14():*
        {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
        }

        internal function frame15():*
        {
            if (this.continuePlaying)
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame16():*
        {
            if (this.continuePlaying)
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame17():*
        {
            this.self.endAttack();
        }

        internal function frame18():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "direction":40,
                "power":29,
                "kbConstant":100,
                "damage":5
            });
            this.self.updateAttackBoxStats(2, {
                "direction":40,
                "power":29,
                "kbConstant":100,
                "damage":5
            });
            this.self.setXSpeed(5);
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame20():*
        {
            if (this.naruto_language == "ENG")
            {
                if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                {
                    this.self.playVoiceSound(3);
                    this.self.setGlobalVariable("audio", 1);
                };
                if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                {
                    this.self.playVoiceSound(4);
                    this.self.setGlobalVariable("audio", 2);
                };
                if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                {
                    this.self.playVoiceSound(3);
                    this.self.setGlobalVariable("audio", 3);
                };
                if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
                {
                    this.self.playVoiceSound(4);
                    this.self.setGlobalVariable("audio", 4);
                };
            }
            else
            {
                if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                {
                    this.self.playVoiceSound(1);
                    this.self.setGlobalVariable("audio", 1);
                };
                if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                {
                    this.self.playVoiceSound(2);
                    this.self.setGlobalVariable("audio", 2);
                };
                if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                {
                    this.self.playVoiceSound(1);
                    this.self.setGlobalVariable("audio", 3);
                };
                if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
                {
                    this.self.playVoiceSound(2);
                    this.self.setGlobalVariable("audio", 4);
                };
            };
        }

        internal function frame21():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

