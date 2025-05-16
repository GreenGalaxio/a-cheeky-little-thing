// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_usmash_35

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

    public dynamic class samus_usmash_35 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xframe:String;

        public function samus_usmash_35()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 8, this.frame9, 9, this.frame10, 10, this.frame11, 12, this.frame13, 14, this.frame15, 16, this.frame17, 17, this.frame18, 18, this.frame19, 29, this.frame30);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = null;
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.playVoiceSound(1);
            };
        }

        internal function frame4():*
        {
            this.xframe = "charging";
        }

        internal function frame9():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame10():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "direction":150,
                "power":35,
                "kbConstant":50
            });
            this.self.refreshAttackID();
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "direction":200,
                "power":25
            });
            this.self.refreshAttackID();
        }

        internal function frame17():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "direction":250,
                "damage":5,
                "power":30
            });
            this.self.refreshAttackID();
        }

        internal function frame18():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "direction":80,
                "power":50,
                "kbConstant":120
            });
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "direction":80,
                "damage":6,
                "power":50,
                "kbConstant":120
            });
            this.self.refreshAttackID();
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

