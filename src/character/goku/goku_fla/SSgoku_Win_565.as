// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.SSgoku_Win_565

package goku_fla
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

    public dynamic class SSgoku_Win_565 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function SSgoku_Win_565()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 38, this.frame39, 40, this.frame41, 52, this.frame53, 54, this.frame55, 77, this.frame78);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            SSF2API.playSound("dspecialchargeeffect");
        }

        internal function frame39():*
        {
            this.self.endAttack();
        }

        internal function frame41():*
        {
            SSF2API.playSound("dspecialchargeeffect");
        }

        internal function frame53():*
        {
            this.self.endAttack();
        }

        internal function frame55():*
        {
            SSF2API.playSound("solarflare");
        }

        internal function frame78():*
        {
            stop();
        }


    }
}//package goku_fla

