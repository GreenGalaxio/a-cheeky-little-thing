// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_dashattack_25

package yoshi_fla
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

    public dynamic class Yoshi_dashattack_25 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var grounded:Boolean;

        public function Yoshi_dashattack_25()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 7, this.frame8, 8, this.frame9, 10, this.frame11, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17);
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
                this.grounded = this.self.isOnGround();
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
        }

        internal function frame4():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackStats({"xSpeedDecay":-0.8});
            this.self.setXSpeed(12, false);
        }

        internal function frame5():*
        {
            this.self.updateAttackBoxStats(1, {"damage":7});
        }

        internal function frame8():*
        {
            this.self.updateAttackBoxStats(1, {"damage":5});
        }

        internal function frame9():*
        {
            this.self.updateAttackStats({"xSpeedDecay":-0.1});
        }

        internal function frame11():*
        {
            this.self.updateAttackStats({"xSpeedDecay":0});
        }

        internal function frame14():*
        {
            this.grounded = this.self.isOnGround();
            if (!this.grounded)
            {
                this.self.endAttack();
            };
            this.self.updateAttackStats({
                "canFallOff":true,
                "jumpCancelAttack":true
            });
        }

        internal function frame15():*
        {
            this.grounded = this.self.isOnGround();
            if (!this.grounded)
            {
                this.self.endAttack();
            };
        }

        internal function frame16():*
        {
            this.grounded = this.self.isOnGround();
            if (!this.grounded)
            {
                this.self.endAttack();
            };
            this.self.setXSpeed(0);
        }

        internal function frame17():*
        {
            this.grounded = this.self.isOnGround();
            if (!this.grounded)
            {
                this.self.endAttack();
            };
            this.self.endAttack();
        }


    }
}//package yoshi_fla

