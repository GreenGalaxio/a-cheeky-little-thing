// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.MegaBAirBlade_120

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

    public dynamic class MegaBAirBlade_120 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var xframe:String;
        public var nSpecTransition:*;

        public function MegaBAirBlade_120()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "attack";
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.nSpecTransition = this.self.getGlobalVariable("hasFired");
            };
        }

        internal function frame2():*
        {
            this.xframe = "blade2";
            this.self.setGlobalVariable("hasFired", false);
        }

        internal function frame3():*
        {
            this.xframe = "blade3";
        }

        internal function frame4():*
        {
            this.xframe = "blade4";
        }

        internal function frame5():*
        {
            this.xframe = "blade5";
        }

        internal function frame6():*
        {
            this.xframe = "blade6";
        }

        internal function frame7():*
        {
            this.xframe = "blade7";
        }

        internal function frame8():*
        {
            this.xframe = "blade8";
        }

        internal function frame9():*
        {
            this.xframe = "blade9";
        }

        internal function frame10():*
        {
            this.xframe = "blade10";
        }

        internal function frame11():*
        {
            this.xframe = "shoot";
            this.nSpecTransition = this.self.getGlobalVariable("hasFired");
            if (this.nSpecTransition)
            {
                gotoAndPlay(12);
            };
            this.self.setGlobalVariable("hasFired", true);
            this.self.fireProjectile("megaman_nitroman", 0, -20);
        }

        internal function frame12():*
        {
            this.xframe = "blade12";
        }

        internal function frame13():*
        {
            this.xframe = "blade13";
        }

        internal function frame14():*
        {
            this.xframe = "blade14";
        }

        internal function frame15():*
        {
            this.xframe = "blade15";
        }

        internal function frame16():*
        {
            this.xframe = "blade16";
        }

        internal function frame17():*
        {
            this.xframe = "blade17";
        }

        internal function frame18():*
        {
            this.xframe = "blade18";
        }

        internal function frame19():*
        {
            this.xframe = "blade19";
        }

        internal function frame20():*
        {
            this.xframe = "blade20";
            this.self.endAttack();
        }


    }
}//package megaman_fla

