// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_crouch_89

package fox_fla
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

    public dynamic class fox_crouch_89 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var controls:Object;

        public function fox_crouch_89()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
            };
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.DOWN)
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame4():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.DOWN)
            {
                gotoAndPlay("finish");
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
            gotoAndPlay("loop");
        }


    }
}//package fox_fla

