// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_attackup_tilt2__125

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class ichigo_attackup_tilt2__125 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;

        public function ichigo_attackup_tilt2__125()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 4, this.frame5, 5, this.frame6, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame3():*
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
            this.playsound = SSF2API.random();
            if (((this.playsound > 0) && (this.playsound <= 0.25)))
            {
                this.self.playAttackSound(1);
            };
            if (((this.playsound > 0.25) && (this.playsound <= 0.5)))
            {
                this.self.playAttackSound(2);
            };
            if (((this.playsound > 0.5) && (this.playsound <= 0.75)))
            {
                this.self.playAttackSound(3);
            };
            if (((this.playsound > 0.75) && (this.playsound <= 1)))
            {
                this.self.playAttackSound(4);
            };
        }

        internal function frame5():*
        {
            this.self.updateAttackBoxStats(1, {"direction":130});
        }

        internal function frame6():*
        {
            this.self.updateAttackBoxStats(1, {"direction":115});
            this.self.updateAttackBoxStats(2, {"direction":115});
            this.self.updateAttackBoxStats(3, {"direction":115});
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

