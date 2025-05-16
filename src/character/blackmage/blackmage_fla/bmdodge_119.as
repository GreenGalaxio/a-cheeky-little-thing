// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmdodge_119

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

    public dynamic class bmdodge_119 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function bmdodge_119()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 10, this.frame11, 12, this.frame13);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame3():*
        {
            this.self.attachEffect("bm_misstext", {
                "flip":false,
                "resize":false
            });
            this.self.setIntangibility(true);
        }

        internal function frame11():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame13():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

