// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmfthrow_95

package blackmage_fla
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

    public dynamic class bmfthrow_95 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;

        public function bmfthrow_95()
        {
            addFrameScript(0, this.frame1, 26, this.frame27, 36, this.frame37);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                SSF2API.playSound("bm_Aero_start1");
                SSF2API.playSound("bm_Aero_start2");
            };
        }

        internal function frame27():*
        {
            this.self.updateAttackStats({"refreshRate":50});
            this.self.updateAttackBoxStats(1, {
                "damage":3,
                "direction":25,
                "selfHitStun":1,
                "hasEffect":true
            });
            this.self.refreshAttackID();
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

