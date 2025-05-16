// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_uthrow_56

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

    public dynamic class samus_uthrow_56 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;

        public function samus_uthrow_56()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 11, this.frame12, 13, this.frame14, 15, this.frame16, 17, this.frame18, 24, this.frame25);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame10():*
        {
            this.self.refreshAttackID();
        }

        internal function frame12():*
        {
            this.self.refreshAttackID();
        }

        internal function frame14():*
        {
            this.self.refreshAttackID();
        }

        internal function frame16():*
        {
            this.self.refreshAttackID();
        }

        internal function frame18():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":90,
                "damage":4,
                "kbConstant":155,
                "hasEffect":true,
                "effect_id":"effect_heavyHit"
            });
            this.self.refreshAttackID();
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

