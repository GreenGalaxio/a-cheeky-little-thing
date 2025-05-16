// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_dtilt_68

package samus_fla
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

    public dynamic class samus_dtilt_68 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox4:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var attack:*;
        public var wp:*;
        public var grab:Number;

        public function samus_dtilt_68()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 19, this.frame20);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame4():*
        {
            this.attack = 0;
            this.wp = -1;
            this.self.playAttackSound(1);
            if (this.self.isFacingRight())
            {
                this.self.attachEffect("missileExplode", {"x":50});
            }
            else
            {
                this.self.attachEffect("missileExplode", {"x":-50});
            };
            if (this.self.isCPU())
            {
                this.attack = SSF2API.random();
                this.wp = this.self.getGlobalVariable("weapon");
                if (this.self.getCPULevel() >= 7)
                {
                    if (this.attack <= 0.2)
                    {
                        this.self.importCPUControls([0, 9, 16, 1]);
                    };
                }
                else
                {
                    if (((this.attack <= 0.55) && (this.wp == 1)))
                    {
                        this.self.importCPUControls([0, 9, 64, 1]);
                    };
                };
            };
        }

        internal function frame20():*
        {
            this.grab = 2;
            if (this.self.isCPU())
            {
                this.grab = SSF2API.random();
                if (this.grab <= 0.25)
                {
                    this.self.importCPUControls([0, 1, 16, 1]);
                };
            };
            this.self.endAttack();
        }


    }
}//package samus_fla

