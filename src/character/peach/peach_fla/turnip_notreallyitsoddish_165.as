// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.turnip_notreallyitsoddish_165

package peach_fla
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

    public dynamic class turnip_notreallyitsoddish_165 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;

        public function turnip_notreallyitsoddish_165()
        {
            addFrameScript(0, this.frame1, 24, this.frame25);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getItem(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
        }

        internal function frame25():*
        {
            gotoAndPlay("toss");
        }


    }
}//package peach_fla

