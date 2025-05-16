// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkhandslap_45

package donkeykong_fla
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

    public dynamic class dkhandslap_45 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var controls:Object;
        public var missed:Boolean;
        public var hit:Boolean;

        public function dkhandslap_45()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 21, this.frame22);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.controls = null;
            this.missed = false;
            this.hit = false;
        }

        internal function frame4():*
        {
            this.missed = false;
            this.hit = false;
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
        }

        internal function frame6():*
        {
            this.controls = this.self.getControls();
        }

        internal function frame7():*
        {
            SSF2API.playSound("groundpound");
            this.controls = this.self.getControls();
        }

        internal function frame8():*
        {
            SSF2API.shakeCamera(3);
            this.controls = this.self.getControls();
        }

        internal function frame9():*
        {
            this.controls = this.self.getControls();
        }

        internal function frame10():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.missed = true;
            };
        }

        internal function frame11():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.missed = true;
            };
        }

        internal function frame12():*
        {
            if (((!(this.hit)) && (!(this.missed))))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame13():*
        {
            SSF2API.playSound("groundpound");
            this.controls = this.self.getControls();
        }

        internal function frame14():*
        {
            SSF2API.shakeCamera(3);
            this.controls = this.self.getControls();
        }

        internal function frame15():*
        {
            this.controls = this.self.getControls();
        }

        internal function frame16():*
        {
            this.controls = this.self.getControls();
        }

        internal function frame17():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.hit = true;
            };
        }

        internal function frame18():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.hit = true;
            };
            if (this.hit)
            {
                gotoAndPlay("redo");
            };
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package donkeykong_fla

