// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_special_down_169

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class mario_special_down_169 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var riseAmt:*;
        public var riseAmtMax:*;
        public var riseAmtIncr:*;
        public var pressed1:Boolean;
        public var pressed2:Boolean;

        public function mario_special_down_169()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 5, this.frame6, 7, this.frame8, 9, this.frame10, 11, this.frame12, 13, this.frame14, 16, this.frame17, 18, this.frame19, 20, this.frame21, 22, this.frame23, 25, this.frame26, 32, this.frame33);
        }

        public function rise():*
        {
            var _local_1:*;
            if (this.self.getGlobalVariable("canStartRise"))
            {
                _local_1 = this.self.getControls();
                if (!_local_1.BUTTON1)
                {
                    this.pressed1 = true;
                };
                if (((this.pressed1) && (_local_1.BUTTON1)))
                {
                    this.pressed2 = true;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                };
            }
            else
            {
                this.pressed1 = false;
                this.pressed2 = false;
            };
            if (this.pressed2)
            {
                this.pressed1 = false;
                this.pressed2 = false;
                this.self.updateAttackBoxStats(1, {"direction":110});
                this.self.setYSpeed(this.riseAmt);
            }
            else
            {
                this.self.updateAttackBoxStats(1, {"direction":145});
            };
        }

        public function reenableForCPU(_arg_1:*=null):void
        {
            this.self.setAttackEnabled(true, "b_down_air");
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.reenableForCPU);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.riseAmt = -6;
            this.riseAmtMax = -12;
            this.riseAmtIncr = -2;
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame3():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.rise);
        }

        internal function frame4():*
        {
            SSF2API.playSound("mario_hoo");
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame6():*
        {
            SSF2API.playSound("mario_spin");
        }

        internal function frame8():*
        {
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
        }

        internal function frame10():*
        {
            SSF2API.playSound("mario_spin");
        }

        internal function frame12():*
        {
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
        }

        internal function frame14():*
        {
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
        }

        internal function frame17():*
        {
            SSF2API.destroyTimer(this.self, this.rise);
            this.self.setGlobalVariable("canStartRise", false);
        }

        internal function frame19():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":80,
                "weightKB":0,
                "kbConstant":60,
                "damage":6,
                "direction":85
            });
            this.self.refreshAttackID();
            SSF2API.playSound("mario_ha");
            if (!this.self.isOnGround())
            {
                this.self.setYSpeed(-4);
            };
        }

        internal function frame21():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":65,
                "power":75,
                "kbConstant":120,
                "weightKB":0
            });
            this.self.refreshAttackID();
        }

        internal function frame23():*
        {
            this.self.updateAttackStats({"air_ease":0});
        }

        internal function frame26():*
        {
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame33():*
        {
            if (this.self.isCPU())
            {
                if (this.self.getCPUAction() == 3)
                {
                    this.self.setAttackEnabled(false, "b_down_air");
                    SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.reenableForCPU, {"persistent":true});
                };
            };
            this.self.endAttack();
        }


    }
}//package mario_fla

