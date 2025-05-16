// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioman_airdodge_68

package wario_fla
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

    public dynamic class warioman_airdodge_68 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function warioman_airdodge_68()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 13, this.frame14, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (SSF2API.isReady())
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            };
        }

        internal function frame3():*
        {
            this.self.setIntangibility(true);
        }

        internal function frame14():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

