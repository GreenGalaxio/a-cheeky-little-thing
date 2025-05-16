// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariostun_150

package wario_fla
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

    public dynamic class wariostun_150 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function wariostun_150()
        {
            addFrameScript(0, this.frame1, 36, this.frame37);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.playSound("wariostun");
                this.self.setLastUsed("a", 18);
            };
        }

        internal function frame37():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package wario_fla

