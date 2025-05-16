// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_combo_20

package captainfalcon_fla
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

    public dynamic class falcon_combo_20 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var pressed1:Boolean;
        public var pressed2:Boolean;
        public var used:Boolean;
        public var used2:Boolean;
        public var self:*;
        public var time:Number;
        public var controls:Object;

        public function falcon_combo_20()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 21, this.frame22, 22, this.frame23, 26, this.frame27, 30, this.frame31, 34, this.frame35, 37, this.frame38, 38, this.frame39, 39, this.frame40);
        }

        public function checkControls(_arg_1:Boolean, _arg_2:Boolean, _arg_3:String):*
        {
            this.controls = this.self.getControls();
            if (((_arg_2) && (!(this.controls.BUTTON2))))
            {
                this.pressed1 = true;
            };
            if ((((_arg_2) && (this.pressed1)) && (this.controls.BUTTON2)))
            {
                this.pressed2 = true;
            };
            if (((this.pressed2) && (_arg_3)))
            {
                gotoAndPlay(_arg_3);
            };
        }

        internal function frame1():*
        {
            this.pressed1 = false;
            this.pressed2 = false;
            this.used = false;
            this.used2 = false;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame2():*
        {
            this.checkControls(true, false, null);
            this.time = this.self.getLastUsed();
            this.controls = this.self.getControls();
            this.used = this.self.getGlobalVariable("jab");
            this.used2 = this.self.getGlobalVariable("jab2");
            if (((this.used2) && (this.time <= 12)))
            {
                gotoAndPlay("hit3");
            };
            if (((this.used) && (this.time <= 12)))
            {
                gotoAndPlay("hit2");
            };
            this.self.playAttackSound(1);
        }

        internal function frame3():*
        {
            this.checkControls(true, false, null);
            if (((!(root == null)) && (!(parent == null))))
            {
                this.self.setGlobalVariable("jab", true);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                this.self.setGlobalVariable("jab2", false);
            };
        }

        internal function frame4():*
        {
            this.checkControls(true, true, "hit2");
        }

        internal function frame5():*
        {
            this.self.endAttack();
        }

        internal function frame6():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":2,
                "kbConstant":20,
                "power":25
            });
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", true);
            this.self.setLastUsed("a", 0);
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame7():*
        {
            this.checkControls(true, false, null);
            this.self.refreshAttackID();
        }

        internal function frame8():*
        {
            this.checkControls(true, true, null);
        }

        internal function frame9():*
        {
            this.checkControls(true, true, "hit3");
        }

        internal function frame10():*
        {
            this.checkControls(true, true, "hit3");
        }

        internal function frame11():*
        {
            this.checkControls(true, true, "hit3");
        }

        internal function frame12():*
        {
            this.checkControls(true, true, "hit3");
        }

        internal function frame13():*
        {
            this.self.endAttack();
        }

        internal function frame14():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":6,
                "power":10,
                "kbConstant":50,
                "direction":70,
                "effectSound":"brawl_punch_l"
            });
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", true);
            this.self.setLastUsed("a", 0);
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            this.self.setLastUsed("a", 0);
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame15():*
        {
            this.checkControls(true, false, null);
            this.self.updateAttackBoxStats(1, {
                "damage":6,
                "power":25,
                "kbConstant":75,
                "direction":49
            });
            this.self.setXSpeed(9, false);
        }

        internal function frame16():*
        {
            this.checkControls(true, true, null);
        }

        internal function frame17():*
        {
            this.checkControls(true, true, "hit4");
        }

        internal function frame18():*
        {
            this.checkControls(true, true, "hit4");
        }

        internal function frame19():*
        {
            this.checkControls(true, true, "hit4");
        }

        internal function frame20():*
        {
            this.checkControls(true, true, "hit4");
        }

        internal function frame22():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                gotoAndPlay("finish");
            };
            this.self.updateAttackBoxStats(1, {
                "damage":2,
                "power":0,
                "kbConstant":50,
                "direction":35,
                "effectSound":"brawl_punch_s"
            });
        }

        internal function frame23():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame27():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame31():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame35():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame38():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame39():*
        {
            gotoAndPlay("again");
        }

        internal function frame40():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

