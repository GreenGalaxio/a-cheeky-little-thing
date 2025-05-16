// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_dthrow_64

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

    public dynamic class megaman_dthrow_64 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;

        public function megaman_dthrow_64()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 4, this.frame5, 6, this.frame7, 8, this.frame9, 10, this.frame11, 12, this.frame13, 13, this.frame14, 15, this.frame16, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame3():*
        {
            this.self.refreshAttackID();
        }

        internal function frame5():*
        {
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

        internal function frame14():*
        {
            this.self.refreshAttackID();
        }

        internal function frame16():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":4,
                "direction":50,
                "power":50,
                "kbConstant":80,
                "hitLag":-1,
                "hasEffect":true,
                "effectSound":"megaman_water3"
            });
            this.self.refreshAttackID();
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

