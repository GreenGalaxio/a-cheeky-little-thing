// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_backthrow_143

package naruto_fla
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

    public dynamic class naruto_backthrow_143 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var naruto_language:*;
        public var xframe:String;

        public function naruto_backthrow_143()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 9, this.frame10, 13, this.frame14, 16, this.frame17, 19, this.frame20, 20, this.frame21, 22, this.frame23, 25, this.frame26);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
                this.naruto_language = this.self.getGlobalVariable("language_Select");
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.self.swapDepthsWithGrabbedOpponent(true);
            };
        }

        internal function frame4():*
        {
            if (this.naruto_language == "ENG")
            {
                if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                {
                    SSF2API.playSound("ENG_naruto_grunt1", true);
                    this.self.setGlobalVariable("audio", 1);
                };
                if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                {
                    SSF2API.playSound("ENG_naruto_grunt2", true);
                    this.self.setGlobalVariable("audio", 2);
                };
                if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                {
                    SSF2API.playSound("ENG_naruto_forgot1", true);
                    this.self.setGlobalVariable("audio", 3);
                };
                if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
                {
                    SSF2API.playSound("ENG_naruto_forgot2", true);
                    this.self.setGlobalVariable("audio", 4);
                };
            }
            else
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
            };
            this.self.playAttackSound(2);
        }

        internal function frame5():*
        {
            this.self.swapDepthsWithGrabbedOpponent(false);
        }

        internal function frame10():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":9,
                "hasEffect":true,
                "effect_id":"effect_swordSlash"
            });
        }

        internal function frame14():*
        {
            SSF2API.playSound("whip");
        }

        internal function frame17():*
        {
            SSF2API.playSound("whip");
        }

        internal function frame20():*
        {
            SSF2API.playSound("whip");
            SSF2API.shakeCamera(9);
        }

        internal function frame21():*
        {
            SSF2API.playSound("sw_scratch");
        }

        internal function frame23():*
        {
            SSF2API.playSound("whip");
        }

        internal function frame26():*
        {
            this.self.playAttackSound(2);
            this.self.endAttack();
        }


    }
}//package naruto_fla

