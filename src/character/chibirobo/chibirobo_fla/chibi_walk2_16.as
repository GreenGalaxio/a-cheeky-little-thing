// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_walk2_16

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

    public dynamic class chibi_walk2_16 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;

        public function chibi_walk2_16()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 14, this.frame15);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("jab", false);
                this.self.setGlobalVariable("jab2", false);
            };
        }

        internal function frame4():*
        {
            this.playsound = SSF2API.random();
            if (((this.playsound > 0) && (this.playsound <= 0.2)))
            {
                SSF2API.playSound("chibi_AStep");
            };
            if (((this.playsound > 0.2) && (this.playsound <= 0.4)))
            {
                SSF2API.playSound("chibi_BStep");
            };
            if (((this.playsound > 0.4) && (this.playsound <= 0.6)))
            {
                SSF2API.playSound("chibi_DStep");
            };
            if (((this.playsound > 0.6) && (this.playsound <= 0.8)))
            {
                SSF2API.playSound("chibi_EStep");
            };
            if (((this.playsound > 0.8) && (this.playsound <= 1)))
            {
                SSF2API.playSound("chibi_GStep");
            };
        }

        internal function frame15():*
        {
            this.playsound = SSF2API.random();
            if (((this.playsound > 0) && (this.playsound <= 0.2)))
            {
                SSF2API.playSound("chibi_AStep");
            };
            if (((this.playsound > 0.2) && (this.playsound <= 0.4)))
            {
                SSF2API.playSound("chibi_BStep");
            };
            if (((this.playsound > 0.4) && (this.playsound <= 0.6)))
            {
                SSF2API.playSound("chibi_DStep");
            };
            if (((this.playsound > 0.6) && (this.playsound <= 0.8)))
            {
                SSF2API.playSound("chibi_EStep");
            };
            if (((this.playsound > 0.8) && (this.playsound <= 1)))
            {
                SSF2API.playSound("chibi_GStep");
            };
        }


    }
}//package chibirobo_fla

