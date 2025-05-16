// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_run_94

package naruto_fla
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

    public dynamic class naruto_run_94 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function naruto_run_94()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 11, this.frame12, 12, this.frame13, 22, this.frame23, 23, this.frame24, 28, this.frame29);
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

        internal function frame5():*
        {
            SSF2API.playSound("naruto_footstep");
        }

        internal function frame10():*
        {
            SSF2API.playSound("naruto_footstep");
        }

        internal function frame12():*
        {
            gotoAndPlay("run");
        }

        internal function frame13():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            SSF2API.playSound("Run_start");
        }

        internal function frame23():*
        {
            gotoAndPlay("run");
        }

        internal function frame24():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            if (((((parent) && (SSF2API.isReady())) && (this.self)) && (this.self.isCPU())))
            {
                if ((((this.self.getCPUAction() < 10) && (this.self.getCPUAction() > 0)) && (this.self.getCPULevel() >= 7)))
                {
                    SSF2API.print("Crouch Cancel (Turning)");
                    if (!this.self.isFacingRight())
                    {
                        this.self.importCPUControls([0x4400, 1, 0x4100, 1]);
                    }
                    else
                    {
                        this.self.importCPUControls([0x4400, 1, 0x4200, 1]);
                    };
                    this.self.endAttack("crouch");
                };
            };
        }

        internal function frame29():*
        {
            gotoAndPlay("run");
        }


    }
}//package naruto_fla

