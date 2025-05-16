// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.sheik_jab_21

package zelda_fla
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

    public dynamic class sheik_jab_21 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var hitBox8:MovieClip;
        public var hitBox9:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var pressed1:Boolean;
        public var pressed2:Boolean;
        public var time:Number;
        public var controls:Object;
        public var used:Boolean;
        public var used2:Boolean;
        public var reachedLoop:Boolean;

        public function sheik_jab_21()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 30, this.frame31, 34, this.frame35, 37, this.frame38);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (SSF2API.isReady())
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame2():*
        {
            this.pressed1 = false;
            this.pressed2 = false;
            this.time = this.self.getLastUsed();
            this.controls = this.self.getControls();
            this.used = this.self.getGlobalVariable("jab");
            this.used2 = this.self.getGlobalVariable("jab2");
            if (((this.used) && (this.time <= 1)))
            {
                gotoAndPlay("hit2");
            };
            if (((this.used2) && (this.time <= 12)))
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.pressed1 = true;
            };
            this.self.setGlobalVariable("jab", true);
            this.self.setGlobalVariable("jab2", false);
            this.self.playAttackSound(2);
        }

        internal function frame4():*
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

        internal function frame5():*
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

        internal function frame6():*
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

        internal function frame7():*
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
            if (this.pressed2)
            {
                gotoAndPlay("hit2");
            };
        }

        internal function frame8():*
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
            if (this.pressed2)
            {
                gotoAndPlay("hit2");
            };
        }

        internal function frame9():*
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
            if (this.pressed2)
            {
                gotoAndPlay("hit2");
            };
        }

        internal function frame10():*
        {
            this.self.endAttack();
        }

        internal function frame11():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", true);
            this.self.setLastUsed("a", 0);
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "direction":70,
                "power":20,
                "kbConstant":40
            });
            this.self.updateAttackBoxStats(2, {
                "direction":70,
                "power":20,
                "kbConstant":40
            });
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame12():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.pressed1 = true;
            };
        }

        internal function frame13():*
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

        internal function frame14():*
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

        internal function frame15():*
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
            this.self.playAttackSound(2);
        }

        internal function frame16():*
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

        internal function frame17():*
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

        internal function frame18():*
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

        internal function frame19():*
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
            if (this.pressed2)
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame20():*
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
            if (this.pressed2)
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame21():*
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
            if (this.pressed2)
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame22():*
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
            if (this.pressed2)
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame23():*
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
            if (this.pressed2)
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame24():*
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
            if (this.pressed2)
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame25():*
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
            if (this.pressed2)
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }

        internal function frame27():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            this.reachedLoop = false;
            this.self.updateAttackBoxStats(1, {
                "damage":2,
                "hitStun":2,
                "selfHitStun":0,
                "direction":40,
                "power":8,
                "kbConstant":20
            });
            this.self.updateAttackBoxStats(2, {
                "damage":2,
                "hitStun":2,
                "selfHitStun":0,
                "direction":40,
                "power":8,
                "kbConstant":20
            });
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
                this.self.playVoiceSound(3);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                this.self.playVoiceSound(4);
                this.self.setGlobalVariable("audio", 4);
            };
        }

        internal function frame31():*
        {
            this.controls = this.self.getControls();
            if (((!(this.controls.BUTTON2)) && (this.reachedLoop)))
            {
                this.self.endAttack();
            };
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame35():*
        {
            this.reachedLoop = true;
            this.controls = this.self.getControls();
            if (((!(this.controls.BUTTON2)) && (this.reachedLoop)))
            {
                this.self.endAttack();
            };
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame38():*
        {
            gotoAndPlay("loop");
        }


    }
}//package zelda_fla

