// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_attackforward_95

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
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

    public dynamic class ichigo_attackforward_95 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var pressed1:Boolean;
        public var pressed2:Boolean;
        public var time:Number;
        public var controls:Object;
        public var used:Boolean;
        public var used2:Boolean;

        public function ichigo_attackforward_95()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 36, this.frame37);
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
            this.used2 = this.self.getGlobalVariable("jab2");
            if (((this.used) && (this.time <= 12)))
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
                gotoAndPlay("hit2");
            };
        }

        internal function frame12():*
        {
            this.self.endAttack();
        }

        internal function frame13():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", true);
            this.self.setLastUsed("a", 0);
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame14():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.pressed1 = true;
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
            this.self.updateAttackBoxStats(1, {"direction":90});
            this.self.updateAttackBoxStats(2, {"direction":90});
            this.self.updateAttackBoxStats(3, {"direction":90});
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
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
            this.self.endAttack();
        }

        internal function frame26():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {
                "power":60,
                "direction":30,
                "damage":4,
                "hitLag":-1
            });
            this.self.updateAttackBoxStats(2, {
                "power":60,
                "direction":30,
                "damage":4,
                "hitLag":-1
            });
            this.self.updateAttackBoxStats(3, {
                "power":60,
                "direction":30,
                "damage":4,
                "hitLag":-1
            });
            this.self.playVoiceSound(1);
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

