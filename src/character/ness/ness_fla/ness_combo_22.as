// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_combo_22

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_combo_22 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;

        public function ness_combo_22()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 9, this.frame10, 10, this.frame11, 12, this.frame13, 13, this.frame14, 20, this.frame21, 21, this.frame22, 23, this.frame24, 34, this.frame35);
        }

        public function jabCheck():void
        {
            if (this.continuePlaying == true)
            {
                SSF2API.destroyTimer(this.self, this.jabCheck);
                gotoAndPlay("jab2");
            };
        }

        public function jabCheck2():void
        {
            if (this.continuePlaying == true)
            {
                SSF2API.destroyTimer(this.self, this.jabCheck);
                gotoAndPlay("jab3");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((parent) && (SSF2API.isReady())))
            {
                this.continuePlaying = false;
                this.handled = true;
            };
        }

        internal function frame2():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
            SSF2API.createTimer(this.self, 1, 5, this.jabCheck);
        }

        internal function frame10():*
        {
            this.self.endAttack();
        }

        internal function frame11():*
        {
            this.continuePlaying = false;
            this.handled = true;
            this.self.setGlobalVariable("jab", 1);
            this.self.refreshAttackID();
        }

        internal function frame13():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.createTimer(1, 7, this.jabCheck2);
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }

        internal function frame22():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "power":40,
                "direction":40,
                "damage":5,
                "hitLag":-1,
                "kbConstant":90
            });
            this.self.updateAttackBoxStats(2, {
                "power":40,
                "direction":40,
                "damage":5,
                "hitLag":-1,
                "kbConstant":90
            });
            this.self.setGlobalVariable("jab", 0);
        }

        internal function frame24():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }


    }
}//package ness_fla

