// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.mmuthrow_62

package megaman_fla
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

    public dynamic class mmuthrow_62 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;

        public function mmuthrow_62()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 6, this.frame7, 8, this.frame9, 10, this.frame11, 12, this.frame13, 14, this.frame15, 16, this.frame17, 25, this.frame26);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.swapDepthsWithGrabbedOpponent(true);
            };
        }

        internal function frame4():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame7():*
        {
            this.self.refreshAttackID();
        }

        internal function frame9():*
        {
            this.self.refreshAttackID();
        }

        internal function frame11():*
        {
            this.self.refreshAttackID();
        }

        internal function frame13():*
        {
            this.self.refreshAttackID();
        }

        internal function frame15():*
        {
            this.self.refreshAttackID();
        }

        internal function frame17():*
        {
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "damage":7,
                "kbConstant":50,
                "direction":75,
                "hitLag":-1,
                "effectSound":"sw_brawl_hit_M"
            });
            this.self.updateAttackStats({"refreshRate":50});
            this.self.refreshAttackID();
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

