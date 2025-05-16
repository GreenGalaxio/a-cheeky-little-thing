// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkgrab_61

package donkeykong_fla
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

    public dynamic class dkgrab_61 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var otherPlayer:*;
        public var xframe:String;

        public function dkgrab_61()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 29, this.frame30);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
            if ((((parent) && (this.self)) && (SSF2API.isReady())))
            {
                this.xframe = "grab";
            };
        }

        internal function frame3():*
        {
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                SSF2API.playSound("dk_grunt1", true);
                this.self.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                SSF2API.playSound("dk_grunt2", true);
                this.self.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                SSF2API.playSound("dk_grunt3", true);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                SSF2API.playSound("dk_grunt4", true);
                this.self.setGlobalVariable("audio", 4);
            };
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }

        internal function frame16():*
        {
            this.xframe = "grab";
            SSF2API.print("someone's grabbed!");
            if (this.self.getGrabbedOpponent())
            {
                this.otherPlayer = this.self.getGrabbedOpponent();
                SSF2API.print(("otherPlayer = " + this.otherPlayer));
                this.self.setGlobalVariable("opponent", this.otherPlayer);
            };
            stop();
        }

        internal function frame17():*
        {
            gotoAndStop("grabbed");
        }

        internal function frame18():*
        {
            this.xframe = "attack";
        }

        internal function frame30():*
        {
            this.gotoAndStop("grabbed");
        }


    }
}//package donkeykong_fla

