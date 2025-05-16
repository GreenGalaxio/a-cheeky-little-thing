// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_hurt_gif_81

package megaman_fla
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

    public dynamic class megaman_hurt_gif_81 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var bustCharge:*;

        public function megaman_hurt_gif_81()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 5, this.frame6, 8, this.frame9, 9, this.frame10);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "hurt1";
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                if (this.self.getGlobalVariable("bustCharge") != null)
                {
                    this.bustCharge = this.self.getGlobalVariable("bustCharge");
                };
                if (this.bustCharge != null)
                {
                    this.bustCharge.destroy();
                };
                if (this.self.isCPU())
                {
                    this.self.resetCPUControls();
                };
            };
        }

        internal function frame4():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame5():*
        {
            gotoAndStop("done1");
        }

        internal function frame6():*
        {
            this.xframe = "hurt2";
            if (this.self.getGlobalVariable("bustCharge") != null)
            {
                this.bustCharge = this.self.getGlobalVariable("bustCharge");
            };
            if (this.bustCharge != null)
            {
                this.bustCharge.destroy();
            };
            if (this.self.isCPU())
            {
                this.self.resetCPUControls();
            };
        }

        internal function frame9():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame10():*
        {
            gotoAndStop("done2");
        }


    }
}//package megaman_fla

