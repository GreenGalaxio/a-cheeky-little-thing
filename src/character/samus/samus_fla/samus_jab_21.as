// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_jab_21

package samus_fla
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

    public dynamic class samus_jab_21 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var restart:Boolean;

        public function samus_jab_21()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 8, this.frame9, 9, this.frame10, 11, this.frame12, 13, this.frame14, 20, this.frame21);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.continuePlaying = false;
            this.handled = true;
            this.restart = false;
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setAttackEnabled(false, "a");
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame9():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
            this.self.setAttackEnabled(false);
            this.self.updateAttackBoxStats(1, {"hitLag":-1});
        }

        internal function frame10():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "power":30,
                "damage":7,
                "direction":40
            });
        }

        internal function frame12():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame14():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame21():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
        }


    }
}//package samus_fla

