// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_grab_gif_80

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

    public dynamic class megaman_grab_gif_80 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var grab:Number;
        public var wp:*;
        public var player:Object;

        public function megaman_grab_gif_80()
        {
            addFrameScript(0, this.frame1, 12, this.frame13, 13, this.frame14, 14, this.frame15, 22, this.frame23);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "grab";
            this.grab = 2;
        }

        internal function frame13():*
        {
            this.self.endAttack();
        }

        internal function frame14():*
        {
            this.xframe = "grab";
            this.wp = 0;
            stop();
            if (this.self.isCPU())
            {
                this.wp = this.self.getGlobalVariable("weapon");
                this.player = this.self.getGrabbedOpponent();
                this.grab = SSF2API.random();
                if (this.grab <= 0.4)
                {
                    this.self.importCPUControls([0, 1, 32, 1]);
                }
                else
                {
                    if ((((this.grab <= 0.5) && (this.wp == 1)) && (this.player.getDamage() >= 100)))
                    {
                        this.self.importCPUControls([0, 1, 0x0800, 1, 0, 26, 64, 1]);
                    }
                    else
                    {
                        if (((this.grab <= 0.65) && ((this.wp == 4) || (this.wp == 0))))
                        {
                            this.self.importCPUControls([0, 1, 0x0400, 1, 0, 19, 64, 1]);
                        };
                    };
                };
            };
        }

        internal function frame15():*
        {
            gotoAndStop("grabbed");
        }

        internal function frame23():*
        {
            gotoAndStop("grabbed");
        }


    }
}//package megaman_fla

