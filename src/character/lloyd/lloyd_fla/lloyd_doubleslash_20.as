// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_doubleslash_20

package lloyd_fla
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

    public dynamic class lloyd_doubleslash_20 extends MovieClip 
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
        public var self:*;
        public var pressed1:Boolean;
        public var pressed2:Boolean;
        public var time:Number;
        public var controls:Object;
        public var used:Boolean;
        public var playsound:Number;
        public var audio:Number;

        public function lloyd_doubleslash_20()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 14, this.frame15, 16, this.frame17, 22, this.frame23);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            this.pressed1 = false;
            this.pressed2 = false;
            this.time = this.self.getLastUsed();
            this.controls = this.self.getControls();
            this.used = this.self.getGlobalVariable("jab");
            if (((this.used) && (this.time <= 15)))
            {
                gotoAndPlay("jab2");
            };
        }

        internal function frame3():*
        {
            this.self.setGlobalVariable("jab", true);
        }

        internal function frame5():*
        {
            this.self.playAttackSound(1);
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
                gotoAndPlay("jab2");
            };
        }

        internal function frame10():*
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
                gotoAndPlay("jab2");
            };
        }

        internal function frame11():*
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
                gotoAndPlay("jab2");
            };
        }

        internal function frame12():*
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
                gotoAndPlay("jab2");
            };
        }

        internal function frame13():*
        {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
            this.self.endAttack();
        }

        internal function frame15():*
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
                this.self.playVoiceSound(3);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                this.self.playVoiceSound(4);
                this.self.setGlobalVariable("audio", 4);
            };
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":5,
                "direction":40,
                "power":30,
                "kbConstant":100,
                "priority":2
            });
            this.self.updateAttackBoxStats(2, {
                "damage":5,
                "direction":40,
                "power":30,
                "kbConstant":100,
                "priority":2
            });
            this.self.setGlobalVariable("jab", false);
        }

        internal function frame17():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }


    }
}//package lloyd_fla

