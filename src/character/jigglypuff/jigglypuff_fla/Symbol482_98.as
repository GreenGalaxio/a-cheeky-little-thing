// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.Symbol482_98

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

    public dynamic class Symbol482_98 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var camBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;

        public function Symbol482_98()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 230, this.frame231, 243, this.frame244, 316, this.frame317);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame231():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":150,
                "kbConstant":110,
                "damage":15,
                "weightKB":0,
                "hasEffect":true
            });
            this.self.updateAttackStats({"refreshRate":200});
            this.self.refreshAttackID();
            this.self.playVoiceSound(1);
        }

        internal function frame244():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame317():*
        {
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

