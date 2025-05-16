// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.zelda_usmash_113

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

    public dynamic class zelda_usmash_113 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;

        public function zelda_usmash_113()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 7, this.frame8, 9, this.frame10, 10, this.frame11, 12, this.frame13, 13, this.frame14, 15, this.frame16, 20, this.frame21, 22, this.frame23, 24, this.frame25, 31, this.frame32);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                this.xframe = null;
                this.self.playVoiceSound(1);
            };
        }

        internal function frame2():*
        {
            this.xframe = "charging";
        }

        internal function frame7():*
        {
            gotoAndPlay("charging");
        }

        internal function frame8():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.self.refreshAttackID();
        }

        internal function frame13():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.refreshAttackID();
        }

        internal function frame16():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame21():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.refreshAttackID();
        }

        internal function frame25():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":90,
                "damage":7,
                "power":41,
                "kbConstant":175
            });
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

