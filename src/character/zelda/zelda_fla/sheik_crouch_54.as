// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.sheik_crouch_54

package zelda_fla
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

    public dynamic class sheik_crouch_54 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var controls:Object;

        public function sheik_crouch_54()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (SSF2API.isReady())
            {
                this.controls = this.self.getControls();
            };
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.DOWN)
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame6():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.DOWN)
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame7():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.DOWN)
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame8():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.DOWN)
            {
                gotoAndPlay("finish");
            };
            gotoAndPlay("loop");
        }


    }
}//package zelda_fla

