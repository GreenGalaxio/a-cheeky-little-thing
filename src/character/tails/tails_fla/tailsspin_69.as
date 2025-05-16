// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsspin_69

package tails_fla
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

    public dynamic class tailsspin_69 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;

        public function tailsspin_69()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 22, this.frame23, 27, this.frame28);
        }

        public function goUp():void
        {
            this.self.setYSpeed(-8);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
            SSF2API.createTimer(this.self, 1, 15, this.goUp);
            SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
        }

        internal function frame23():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":5,
                "direction":110,
                "kbConstant":75
            });
            this.self.updateAttackStats({"refreshRate":30});
            this.self.refreshAttackID();
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package tails_fla

