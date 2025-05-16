// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_combo_35

package fox_fla
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

    public dynamic class fox_combo_35 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var hahsound:Boolean;
        public var hasHit:Boolean;
        public var pressed1:Boolean;
        public var pressed2:Boolean;
        public var time:Number;
        public var controls:Object;
        public var used:Boolean;
        public var used2:Boolean;
        public var sound:Boolean;
        public var chance:int;
        public var i:Number;

        public function fox_combo_35()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 22, this.frame23, 23, this.frame24, 26, this.frame27, 27, this.frame28, 30, this.frame31, 31, this.frame32, 33, this.frame34, 34, this.frame35, 39, this.frame40, 40, this.frame41);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.hahsound = true;
            };
            this.hasHit = false;
        }

        internal function frame2():*
        {
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.pressed1 = false;
                this.pressed2 = false;
                this.time = this.self.getLastUsed();
                this.controls = this.self.getControls();
                this.used = this.self.getGlobalVariable("jab");
                this.used2 = this.self.getGlobalVariable("jab2");
                if (((this.used) && (this.time <= 12)))
                {
                    gotoAndPlay("hit2");
                };
                if (((this.used2) && (this.time <= 10)))
                {
                    gotoAndPlay("hit3");
                };
                this.sound = true;
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
        }

        internal function frame4():*
        {
            this.self.playAttackSound(1);
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON2)))
            {
                this.pressed2 = true;
            };
            if (((this.self.isCPU()) && (this.hasHit)))
            {
                this.chance = SSF2API.random();
                if (this.chance <= 0.4)
                {
                    this.self.importCPUControls([0, 5, 16, 1]);
                };
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
            if (this.pressed2)
            {
                gotoAndPlay("hit2");
            };
            this.self.updateAttackBoxStats(1, {"damage":2});
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
            this.self.endAttack();
        }

        internal function frame9():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", true);
            this.self.setLastUsed("a", 0);
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame10():*
        {
            this.self.playAttackSound(1);
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.pressed1 = true;
            };
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {"hitStun":3});
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
            this.self.updateAttackBoxStats(1, {"damage":2});
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
                gotoAndPlay("hit3");
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
            if (this.pressed2)
            {
                gotoAndPlay("hit3");
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
            if (this.pressed2)
            {
                gotoAndPlay("hit3");
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
            if (this.pressed2)
            {
                gotoAndPlay("hit3");
            };
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }

        internal function frame17():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            this.self.setLastUsed("a", 0);
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame18():*
        {
            if (this.hahsound != false)
            {
                this.self.playVoiceSound(1);
            };
            this.hahsound = false;
            this.self.refreshAttackID();
        }

        internal function frame19():*
        {
            this.i = 0;
            while (this.i < 3)
            {
                this.self.updateAttackBoxStats(this.i, {
                    "power":0,
                    "direction":15,
                    "hitStun":3
                });
                this.i++;
            };
        }

        internal function frame20():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame23():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                gotoAndPlay("finish");
            };
            this.self.refreshAttackID();
        }

        internal function frame24():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame27():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                gotoAndPlay("finish");
            };
            this.self.refreshAttackID();
        }

        internal function frame28():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame31():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                gotoAndPlay("finish");
            };
            this.self.refreshAttackID();
        }

        internal function frame32():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame34():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame35():*
        {
            gotoAndPlay("again");
        }

        internal function frame40():*
        {
            this.self.endAttack();
        }

        internal function frame41():*
        {
            this.hasHit = true;
            gotoAndPlay("goback");
        }


    }
}//package fox_fla

