// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsrun_14

package tails_fla
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

    public dynamic class tailsrun_14 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var rand:*;
        public var isCPU:*;

        public function tailsrun_14()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 13, this.frame14, 14, this.frame15, 19, this.frame20);
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
            gotoAndPlay("run");
        }

        internal function frame6():*
        {
            this.rand = (10 * SSF2API.random());
            this.isCPU = this.self.isCPU();
            if (((this.rand >= 6) && (this.isCPU)))
            {
                this.self.setCPUAttackQueue("b_down");
                this.self.endAttack();
            };
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            SSF2API.playSound("Run_start");
        }

        internal function frame14():*
        {
            gotoAndPlay("run");
        }

        internal function frame15():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame20():*
        {
            gotoAndPlay("run");
        }


    }
}//package tails_fla

