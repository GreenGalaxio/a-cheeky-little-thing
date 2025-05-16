// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_dthrow_69

package jigglypuff_fla
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

    public dynamic class jiggly_dthrow_69 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;

        public function jiggly_dthrow_69()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 10, this.frame11, 20, this.frame21, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame6():*
        {
            this.self.refreshAttackID();
        }

        internal function frame11():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {"damage":3});
        }

        internal function frame21():*
        {
            SSF2API.shakeCamera(10);
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":1,
                "hasEffect":true
            });
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

