// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_downsmash_throw__142

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

    public dynamic class naruto_downsmash_throw__142 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var playsound:Number;
        public var audio:Number;
        public var naruto_language:*;

        public function naruto_downsmash_throw__142()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 18, this.frame19, 20, this.frame21, 22, this.frame23, 27, this.frame28, 32, this.frame33, 33, this.frame34, 36, this.frame37);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
                this.naruto_language = this.self.getGlobalVariable("language_Select");
                this.self.attachEffect("naruto_summonClone");
                this.self.setRotation(0);
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            SSF2API.shakeCamera(9);
        }

        internal function frame21():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame23():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "power":0,
                "damage":0,
                "hitStun":20
            });
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.setYSpeed(-27);
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "power":95,
                "damage":5,
                "hitStun":2,
                "selfHitStun":2,
                "bypassNonGrabbed":false
            });
            this.self.playAttackSound(1);
        }

        internal function frame33():*
        {
            SSF2API.shakeCamera(9);
        }

        internal function frame34():*
        {
            this.self.updateAttackStats({"air_ease":0});
            this.self.resetMovement();
            this.self.playAttackSound(2);
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
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

