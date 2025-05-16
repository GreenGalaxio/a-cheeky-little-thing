// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsjump_15

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

    public dynamic class tailsjump_15 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;
        public var rand:*;
        public var isFacingRight:*;

        public function tailsjump_15()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 8, this.frame9);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame2():*
        {
            this.rand = (SSF2API.random() * 100);
            this.isFacingRight = this.self.isFacingRight();
            if (this.rand < 30)
            {
                if (((this.self.getCPUForcedAction() == -1) || (this.self.getCPUForcedAction() == 5)))
                {
                    if (this.isFacingRight)
                    {
                        this.self.setCPUAttackQueue("a_air; a_air_forward; a_air_backward; a_air_up; a_air_down");
                        this.self.importCPUControls([0, 1, 320, 2]);
                    }
                    else
                    {
                        this.self.setCPUAttackQueue("a_air; a_air_forward; a_air_backward; a_air_up; a_air_down");
                        this.self.importCPUControls([0, 1, 576, 2]);
                    };
                };
            };
        }

        internal function frame9():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package tails_fla

