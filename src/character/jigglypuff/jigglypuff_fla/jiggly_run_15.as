// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_run_15

package jigglypuff_fla
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

    public dynamic class jiggly_run_15 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var getTarget:Object;
        public var rand:*;

        public function jiggly_run_15()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 9, this.frame10, 10, this.frame11, 17, this.frame18, 23, this.frame24);
        }

        public function restOnReaction():void
        {
            if (((this.self.getCPUForcedAction() == -1) || (this.self.getCPUForcedAction() == 5)))
            {
                this.getTarget = this.self.getCPUTarget();
                if (((((((((((((SSF2API.random() < 0.5) && (!(this.self.getCPUTarget().getMC().currentLabel == "defend"))) && (!(this.self.getCPUTarget().getMC().currentLabel == "airdodge"))) && (!(this.self.getCPUTarget().getMC().currentLabel == "revival"))) && (!(this.self.inUpperRightWarningBounds()))) && (!(this.self.inLowerRightWarningBounds()))) && (!(this.self.inUpperLeftWarningBounds()))) && (!(this.self.inLowerLeftWarningBounds()))) && (this.getTarget.getX() < (this.self.getX() + 10))) && (this.getTarget.getX() > (this.self.getX() - 10))) && (this.getTarget.getY() < (this.self.getY() + 10))) && (this.getTarget.getY() > (this.self.getY() - 10))))
                {
                    SSF2API.print("from djump");
                    this.self.importCPUControls([1088, 1]);
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            SSF2API.playSound("jiggs_dash");
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("kirbyPeachUsed", false);
            };
            this.getTarget = null;
            if ((((((parent) && (SSF2API.isReady())) && (this.self)) && (this.self.isCPU())) && (this.self.getCPULevel() == 9)))
            {
                SSF2API.createTimer(this.self, 1, -1, this.restOnReaction);
            };
        }

        internal function frame2():*
        {
            this.rand = 0;
        }

        internal function frame3():*
        {
            if (this.self.isCPU())
            {
                this.rand = (10 * SSF2API.random());
                if (this.rand >= 5)
                {
                    this.self.importCPUControls([128, 1]);
                };
            };
        }

        internal function frame10():*
        {
            this.gotoAndPlay("run");
        }

        internal function frame11():*
        {
            SSF2API.playSound("jiggs_run1");
        }

        internal function frame18():*
        {
            SSF2API.playSound("jiggs_run2");
        }

        internal function frame24():*
        {
            this.gotoAndPlay("run");
        }


    }
}//package jigglypuff_fla

