// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_uthrow_52

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class chibi_uthrow_52 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;

        public function chibi_uthrow_52()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 11, this.frame12, 14, this.frame15, 16, this.frame17);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                this.self.swapDepthsWithGrabbedOpponent(true);
            };
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame12():*
        {
            this.self.refreshAttackID();
        }

        internal function frame15():*
        {
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "damage":4,
                "power":60,
                "kbConstant":50,
                "hitStun":2,
                "selfHitStun":1
            });
            this.self.updateAttackStats({"refreshRate":30});
            this.self.refreshAttackID();
            this.self.attachEffectOverlay("bubbleExplosion", {"y":-100});
        }

        internal function frame17():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

