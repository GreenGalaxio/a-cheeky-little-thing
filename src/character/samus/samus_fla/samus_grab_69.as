// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_grab_69

package samus_fla
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

    public dynamic class samus_grab_69 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var grab:Number;
        public var pummeled:Boolean;

        public function samus_grab_69()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 7, this.frame8, 46, this.frame47, 47, this.frame48, 55, this.frame56, 56, this.frame57, 64, this.frame65, 67, this.frame68, 68, this.frame69, 76, this.frame77, 77, this.frame78, 86, this.frame87, 100, this.frame101);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = "grab";
            this.grab = 2;
            this.pummeled = false;
        }

        internal function frame2():*
        {
            if (((this.self.getXSpeed() > 3) || (this.self.getXSpeed() < -3)))
            {
                this.self.setXSpeed((this.self.getXSpeed() * 1.7));
                gotoAndPlay("dashgrab");
            };
        }

        internal function frame8():*
        {
            SSF2API.playSound("samus_grab_beam");
        }

        internal function frame47():*
        {
            this.self.endAttack();
        }

        internal function frame48():*
        {
            this.xframe = "grab";
            if (this.pummeled)
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame56():*
        {
            gotoAndStop("loop");
        }

        internal function frame57():*
        {
            this.xframe = "attack";
            this.pummeled = true;
        }

        internal function frame65():*
        {
            this.gotoAndStop("grabbed");
        }

        internal function frame68():*
        {
            this.self.forceAttack("tether");
        }

        internal function frame69():*
        {
            this.xframe = "grab";
            if (this.pummeled)
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame77():*
        {
            SSF2API.playSound("samus_grab_beam");
        }

        internal function frame78():*
        {
            this.self.setXSpeed(0);
        }

        internal function frame87():*
        {
            this.self.setXSpeed(-4.3, false);
        }

        internal function frame101():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

