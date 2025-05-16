// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.Chibi_Grab_63

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

    public dynamic class Chibi_Grab_63 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var pummeled:Boolean;

        public function Chibi_Grab_63()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 34, this.frame35, 35, this.frame36, 40, this.frame41, 41, this.frame42, 42, this.frame43, 47, this.frame48);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "grab";
            this.pummeled = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
            };
        }

        internal function frame8():*
        {
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }

        internal function frame36():*
        {
            this.xframe = "grab";
            if (this.pummeled)
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame41():*
        {
            this.self.swapDepthsWithGrabbedOpponent(false);
            stop();
        }

        internal function frame42():*
        {
            gotoAndStop("loop");
        }

        internal function frame43():*
        {
            this.xframe = "attack";
            this.pummeled = true;
        }

        internal function frame48():*
        {
            this.gotoAndStop("grabbed");
        }


    }
}//package chibirobo_fla

