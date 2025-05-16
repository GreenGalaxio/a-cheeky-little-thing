// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.MegaBAirBlock_117

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class MegaBAirBlock_117 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;
        public var nSpecTransition:*;

        public function MegaBAirBlock_117()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.updateAttackStats({"allowJump":false});
                this.nSpecTransition = this.self.getGlobalVariable("hasFired");
            };
        }

        internal function frame2():*
        {
            this.xframe = "arm2";
            this.nSpecTransition = this.self.setGlobalVariable("hasFired", false);
        }

        internal function frame3():*
        {
            this.xframe = "arm3";
        }

        internal function frame4():*
        {
            this.xframe = "arm4";
        }

        internal function frame5():*
        {
            this.xframe = "arm5";
        }

        internal function frame6():*
        {
            this.xframe = "arm6";
        }

        internal function frame7():*
        {
            this.xframe = "arm_attack";
            this.nSpecTransition = this.self.getGlobalVariable("hasFired");
            if (this.nSpecTransition)
            {
                gotoAndPlay(8);
            };
            this.self.setGlobalVariable("hasFired", true);
            this.self.fireProjectile("megaman_gutsman");
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            this.xframe = "arm8";
        }

        internal function frame9():*
        {
            this.xframe = "arm9";
        }

        internal function frame10():*
        {
            this.xframe = "arm10";
        }

        internal function frame11():*
        {
            this.xframe = "arm11";
        }

        internal function frame12():*
        {
            this.xframe = "arm12";
        }

        internal function frame13():*
        {
            this.xframe = "arm13";
        }

        internal function frame14():*
        {
            this.xframe = "arm14";
            this.self.updateAttackStats({"linkFrames":false});
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame15():*
        {
            this.xframe = "arm15";
        }

        internal function frame16():*
        {
            this.xframe = "arm16";
        }

        internal function frame17():*
        {
            this.xframe = "arm17";
            this.self.endAttack();
        }


    }
}//package megaman_fla

