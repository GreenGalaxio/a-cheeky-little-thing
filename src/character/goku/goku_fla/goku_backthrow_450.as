// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_backthrow_450

package goku_fla
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

    public dynamic class goku_backthrow_450 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var hitBox8:MovieClip;
        public var hitBox9:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var xframe:String;

        public function goku_backthrow_450()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 6, this.frame7, 9, this.frame10, 11, this.frame12, 12, this.frame13, 15, this.frame16, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.self.swapDepthsWithGrabbedOpponent(true);
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
            this.self.swapDepthsWithGrabbedOpponent(false);
        }

        internal function frame10():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame12():*
        {
            this.self.swapDepthsWithGrabbedOpponent(true);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(1);
            this.self.swapDepthsWithGrabbedOpponent(false);
        }

        internal function frame18():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.self.swapDepthsWithGrabbedOpponent(true);
        }

        internal function frame20():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame21():*
        {
            SSF2API.shakeCamera(9);
        }

        internal function frame22():*
        {
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                this.self.playVoiceSound(1);
                this.self.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                this.self.playVoiceSound(2);
                this.self.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                this.self.playVoiceSound(3);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                this.self.playVoiceSound(4);
                this.self.setGlobalVariable("audio", 4);
            };
            this.xframe = "attack";
            this.self.playAttackSound(2);
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

