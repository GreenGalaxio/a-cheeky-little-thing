// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_run_18

package yoshi_fla
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

    public dynamic class Yoshi_run_18 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function Yoshi_run_18()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 15, this.frame16, 16, this.frame17, 23, this.frame24, 24, this.frame25, 28, this.frame29);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("jab", false);
                this.self.setGlobalVariable("jab2", false);
            };
            SSF2API.playSound("yoshi_step2");
        }

        internal function frame9():*
        {
            SSF2API.playSound("yoshi_step2");
        }

        internal function frame16():*
        {
            gotoAndPlay("run");
        }

        internal function frame17():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            SSF2API.playSound("yoshi_dash");
        }

        internal function frame24():*
        {
            gotoAndPlay("run");
        }

        internal function frame25():*
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
}//package yoshi_fla

