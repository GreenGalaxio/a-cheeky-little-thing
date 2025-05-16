// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_run_15

package zamus_fla
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

    public dynamic class zamus_run_15 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;

        public function zamus_run_15()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 18, this.frame19, 19, this.frame20, 20, this.frame21, 27, this.frame28, 28, this.frame29, 32, this.frame33);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("tether", false);
                this.self.setGlobalVariable("nStoredLabel", null);
            };
        }

        internal function frame9():*
        {
            SSF2API.playSound("samus_step");
        }

        internal function frame19():*
        {
            SSF2API.playSound("samus_step");
        }

        internal function frame20():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame21():*
        {
            SSF2API.playSound("Run_start");
        }

        internal function frame28():*
        {
            gotoAndPlay("run");
        }

        internal function frame29():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            if (((((parent) && (SSF2API.isReady())) && (this.self)) && (this.self.isCPU())))
            {
                if ((((this.self.getCPUAction() < 10) && (this.self.getCPUAction() > 0)) && (this.self.getCPULevel() >= 7)))
                {
                    SSF2API.playSound("zamus_turn");
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

        internal function frame33():*
        {
            gotoAndPlay("run");
        }


    }
}//package zamus_fla

