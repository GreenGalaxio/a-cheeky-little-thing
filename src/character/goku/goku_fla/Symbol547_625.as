// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.Symbol547_625

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

    public dynamic class Symbol547_625 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;
        public var ready:*;

        public function Symbol547_625()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 6, this.frame7, 7, this.frame8, 18, this.frame19, 22, this.frame23);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.ready = false;
            };
        }

        internal function frame3():*
        {
            stop();
            this.ready = true;
        }

        internal function frame7():*
        {
            gotoAndStop("dead");
        }

        internal function frame8():*
        {
            if (!this.self.isForcedCrash())
            {
                this.self.setIntangibility(true);
            };
        }

        internal function frame19():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

